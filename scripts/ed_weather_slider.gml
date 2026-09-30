// ed_weather_slider(_id, _label, _y, _max, _mode, _netkey)
// 天气档位滑条：绘制「标签 + 数值 + 轨道滑块」，鼠标左键按住轨道左右拖动即可改档位。
// 背景选择页的天气页（全局设置）与场景控制元件 o_bgmchange 的天气设置（暂存到元件）共用本脚本，
// 两个入口的排版与操作手感完全一致。
//   _id    : 1..7 = rainy / fallingstars / snowy / thunder / windy / darkness / brightness
//   _label : 左侧标签文字（脚本内做大写处理，排版与改动前一致）
//   _y     : 行基线（相对视图原点，与原来 draw_text(view_xview[0]+40, view_yview[0]+_y) 一致）
//   _max   : 最大档位（取值 0.._max）
//   _mode  : 直接传 o_edmain.setting_mode；=6 表示正在设置场景控制元件（读写 marker_*），
//            其余情况是全局设置（读写 global.*，拖拽松手后广播设置包）
//   _netkey: _mode<>6 时广播用的描述文字（如 'Rainy'）
// 需要调用方实例（o_edmain）提供两个拖拽状态变量：
//   weather_slider_drag    -1=空闲，否则是正在拖拽的滑条 _id
//   weather_slider_changed  1=本次拖拽改过值，松手时提交（广播设置包）
// 配色：描边取天气类别文字的深蓝（txt_mariofonts 字形描边众数约 12,12,119）；
//   已选段（左，轨道左端 → 滑块中心）= 淡蓝；未选段（右）= 灰；刻度各自一侧用加深色。
// 立体感：每层矩形都按「同一矩形往右下再画一层深色」做投影（先画影子再压本体，只露右下一条），
//   受光面（轨道上沿/左沿）补一条半透明白高光，滑块投影比轨道略重，看起来是浮在轨道上的。
//   阴影/高光靠 draw_set_alpha 做半透明，画前显式 draw_set_blend_mode(bm_normal) 防止被上层 UI 留在 bm_add。
// 字体 cyferkimario 的原点是 (7,10)，字形以绘制点为中心（同 HUD 金币图标与数字对齐的做法），
// 所以轨道与标签行共用同一条 y 基线；轨道左端 260 避开最宽标签（FALLING STARS LEVEL 字形到约 249），
// 右端 374 避开 x=405 处右对齐的档位数字（数字字形约从 386 起；投影再往右 2px 也不会碰到）。
var _id, _label, _y, _max, _mode, _netkey, _name, _val, _vx, _vy, _trx, _trw, _ty, _mx, _my, _hover, _step, _nx, _i, _tx, _kx;
var _col_on, _col_off, _tick_on, _tick_off, _col_line, _shadow_a;
_id = argument0
_label = argument1
_y = argument2
_max = argument3
_mode = argument4
_netkey = argument5
if _max < 1 { _max = 1 }

// 变量名映射：全局设置为 rainy..brightness，场景控制元件为 marker_rainy..marker_brightness。
// 两者都是全局变量（GM8 没法传变量引用，只能按名字读写），用法与 ed_keyrow 的 variable_global_* 相同。
switch (_id) {
    case 1: _name = 'rainy'; break;
    case 2: _name = 'fallingstars'; break;
    case 3: _name = 'snowy'; break;
    case 4: _name = 'thunder'; break;
    case 5: _name = 'windy'; break;
    case 6: _name = 'darkness'; break;
    case 7: _name = 'brightness'; break;
    default: _name = 'rainy'; break;
}
if _mode = 6 { _name = 'marker_' + _name }
if !variable_global_exists(_name) { variable_global_set(_name, 0) }
_val = variable_global_get(_name)

// 轨道几何（相对视图原点）与配色
_vx = view_xview[0]
_vy = view_yview[0]
_trx = 260
_trw = 114
_ty = _y
_step = _trw / _max
_mx = mouse_x - _vx
_my = mouse_y - _vy
_hover = (_mx > _trx - 8) && (_mx < _trx + _trw + 6) && (_my > _ty - 9) && (_my < _ty + 9)
_col_line = make_color_rgb(20,20,128)   // 轨道/滑块描边（与字形描边同色）
_col_on = make_color_rgb(152,190,238)   // 已选段：淡蓝
_col_off = make_color_rgb(150,150,150)  // 未选段：灰
_tick_on = make_color_rgb(92,132,196)   // 淡蓝段上的刻线
_tick_off = make_color_rgb(102,102,102) // 灰段上的刻线
_shadow_a = 0.32                        // 投影透明度（滑块另加一点）

// 交互：左键在轨道上按下 → 立即跳到按下位置对应的档位并进入拖拽；
//       按住期间跟随鼠标 x 连续改档位；松手提交一次（全局设置广播设置包，元件模式由 BACK 统一写入）
if weather_slider_drag = -1 {
    if _hover && clicked = 0 && mouse_check_button_pressed(mb_left) {
        weather_slider_drag = _id
        clicked = 1
    }
}
if weather_slider_drag = _id {
    if mouse_check_button(mb_left) {
        _nx = round((_mx - _trx) / _step)
        _nx = max(0, min(_max, _nx))
        if _nx <> _val {
            _val = _nx
            variable_global_set(_name, _val)
            weather_slider_changed = 1
        }
    } else {
        weather_slider_drag = -1
        if weather_slider_changed = 1 {
            weather_slider_changed = 0
            if _mode <> 6 { ed_net_ops_send_settings(_netkey) }
        }
    }
}

// 标签 + 档位数值（排版与改动前一致；不做鼠标悬停高亮）
draw_set_color(c_white)
draw_text(_vx + 40, _vy + _y, string_upper(_label))
draw_set_halign(fa_right)
draw_text(_vx + 405, _vy + _y, string(_val))
draw_set_halign(fa_left)

// ---------- 轨道 ----------
// ① 投影层：同一矩形往右下偏 2px（先画，被本体压住大部分，只露右下一条）
draw_set_blend_mode(bm_normal)
draw_set_alpha(_shadow_a)
draw_set_color(c_black)
draw_rectangle(_vx + _trx + 1, _vy + _ty - 4, _vx + _trx + _trw + 3, _vy + _ty + 8, false)
draw_set_alpha(1)
// ② 本体：深蓝 1px 描边 + 灰底（未选段）
draw_set_color(_col_line)
draw_rectangle(_vx + _trx - 1, _vy + _ty - 6, _vx + _trx + _trw + 1, _vy + _ty + 6, false)
draw_set_color(_col_off)
draw_rectangle(_vx + _trx, _vy + _ty - 5, _vx + _trx + _trw, _vy + _ty + 5, false)
// ③ 滑块中心先算出来：已选段的填充范围与刻度颜色都要用它
_kx = _trx + _trw * (_val / _max)
if _val <= 0 { _kx = _trx }
if _val >= _max { _kx = _trx + _trw }
// ④ 已选段：轨道左端 → 滑块中心填淡蓝
if _kx > _trx {
    draw_set_color(_col_on)
    draw_rectangle(_vx + _trx, _vy + _ty - 5, _vx + _kx, _vy + _ty + 5, false)
}
// ⑤ 受光面高光：轨道上沿与左沿各一条半透明白线（配合右下投影形成立体感）
draw_set_alpha(0.38)
draw_set_color(c_white)
draw_line(_vx + _trx, _vy + _ty - 5, _vx + _trx + _trw, _vy + _ty - 5)
draw_line(_vx + _trx, _vy + _ty - 5, _vx + _trx, _vy + _ty + 5)
draw_set_alpha(1)
// ⑥ 档位刻度：各自一侧用加深色（首末两根与轨道描边重合，跳过）
for (_i = 0; _i <= _max; _i += 1) {
    _tx = _trx + _step * _i
    if _tx > _trx && _tx < _trx + _trw {
        if _tx <= _kx { draw_set_color(_tick_on) } else { draw_set_color(_tick_off) }
        draw_line(_vx + _tx, _vy + _ty - 5, _vx + _tx, _vy + _ty + 5)
    }
}

// ---------- 滑块（比轨道高一圈，投影比轨道略重，看着是浮在上面的） ----------
draw_set_alpha(_shadow_a + 0.12)
draw_set_color(c_black)
draw_rectangle(_vx + _kx - 3, _vy + _ty - 7, _vx + _kx + 7, _vy + _ty + 11, false)
draw_set_alpha(1)
draw_set_color(c_white)
draw_rectangle(_vx + _kx - 5, _vy + _ty - 9, _vx + _kx + 5, _vy + _ty + 9, false)
draw_set_color(_col_line)
draw_rectangle(_vx + _kx - 3, _vy + _ty - 7, _vx + _kx + 3, _vy + _ty + 7, false)
// 滑块受光面：白圈上沿再压一条高光，蓝芯看着是圆的/凸的
draw_set_alpha(0.5)
draw_set_color(c_white)
draw_line(_vx + _kx - 2, _vy + _ty - 6, _vx + _kx + 2, _vy + _ty - 6)
draw_set_alpha(1)
