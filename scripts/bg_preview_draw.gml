// bg_preview_draw(bgid, dx, dy, dw, dh)
// 把一个背景「一整屏」的画面画进矩形 (dx,dy,dw,dh)，返回画出的图层数（0 = 该 id 未收录）。
// 数据来自 background_table_init 的图层表，几何规则与 background_show 完全一致，只有三处差别：
//   1) 房间尺寸固定按 640x480 算（面板格子就是「一个标准屏幕」，与关卡实际高度无关）；
//   2) 镜头取景取 bg_preview_init 的 global.bg_pv_camy（默认 0，见该脚本说明）；
//   3) alpha = -1（随水面淡入淡出）在预览里按 1 处理，云漂移按 0。
// 绘制用 draw_background_part_ext：逐瓦片与视口求交，只画相交的那块，天然裁在格子内。
var _id, _first, _cnt, _r, _lay, _spr, _pw, _ph, _xs, _ys, _tw, _th, _vx, _vy, _vti, _al, _camx, _camy, _cw, _ch, _sxs, _sys, _i, _j, _j0, _j1, _tx, _ty, _ax0, _ay0, _ax1, _ay1, _u0, _v0, _u1, _v1, _px0, _py0, _px1, _py1, _drawn;
if !variable_global_exists('bg_table_ready') {background_table_init()}
if global.bg_table_ready <> 1 {background_table_init()}
// 惰性初始化必须用「值判断」：GM8 里凡是被代码引用过的 global 一开始就存在（值为 0），
// 只判 variable_global_exists 会永远为真、初始化一次都不跑（背景表那行是同样道理的双保险）。
if !variable_global_exists('bg_pv_ready') {bg_preview_init()}
if global.bg_pv_ready <> 1 {bg_preview_init()}

_id = argument0
_drawn = 0
if _id < 0 {return 0}
if _id > 79 {return 0}

_camx = 0
_camy = global.bg_pv_camy[_id]
_cw = argument3
_ch = argument4
_sxs = _cw / 640
_sys = _ch / 480

// 底色：图层没铺到的地方在游戏里也是黑的。
// 先铺再查表：万一 palette 里填了没进表的编号，格子是黑底而不是透出编辑器画面。
draw_set_color(c_black)
draw_set_alpha(1)
draw_rectangle(argument1, argument2, argument1 + _cw - 1, argument2 + _ch - 1, false)
if global.bg_count[_id] = 0 {
    draw_set_color(c_white)
    return 0
}

_first = global.bg_first[_id]
_cnt = global.bg_count[_id]
for (_r = _first; _r < _first + _cnt; _r += 1) {
    _lay = global.bg_l[_r]
    _spr = global.bg_spr[_r]
    _vti = global.bg_vti[_r]
    _al = global.bg_al[_r]
    if _al = -1 {_al = 1}
    // 坟地（33）内容层：跟随本次抽到的地貌变体，面板里看到的和进关卡后一致
    if _id = 33 && _lay = 1 {
        if variable_global_exists('bg_grave_pick') {
            if global.bg_grave_pick = 2 {_spr = background_grave2}
            if global.bg_grave_pick = 3 {_spr = background_grave3}
        }
    }
    // 缩放：房间固定 480 高 → sc=1（480/480）与 sc=4（(480+480)/960）都等于 1
    _xs = 1
    _ys = 1
    if global.bg_sc[_r] = 2 {_ys = 480}
    if global.bg_sc[_r] = 3 {_xs = 640; _ys = 480}
    // 层在视口里的位置（xm=1 才吃视差系数，其余钉在视口上，与 background_show 同义）
    _vx = global.bg_pk[_r]
    if global.bg_xm[_r] = 1 {_vx = _camx - _camx * global.bg_pk[_r]}
    if global.bg_ym[_r] = 0 {_vy = global.bg_yv[_r] - _camy}
    if global.bg_ym[_r] = 1 {_vy = (480 - global.bg_yv[_r]) - _camy}
    if global.bg_ym[_r] = 2 {_vy = global.bg_yv[_r]}
    // 背景28 层1 的 y 依赖自身运行时缩放（照抄 background_show 的特判）
    if _id = 28 && _lay = 1 {_vy = (480 - 320 * _ys) - _camy}
    _pw = background_get_width(_spr)
    _ph = background_get_height(_spr)
    if _pw > 0 && _ph > 0 {
        _tw = _pw * _xs
        _th = _ph * _ys
        // 纵向瓦片范围：纵向平铺时从盖住视口顶端的那一片起，不纵向平铺时只画 vy 这一片
        if _vti {
            _j0 = floor((0 - _vy) / _th)
            _j1 = _j0
            while (_vy + (_j1 + 1) * _th < 480) {_j1 += 1}
        } else {
            _j0 = 0
            _j1 = 0
        }
        _i = floor((0 - _vx) / _tw)
        while (_vx + _i * _tw < 640) {
            _tx = _vx + _i * _tw
            if _tx + _tw > 0 {
                for (_j = _j0; _j <= _j1; _j += 1) {
                    _ty = _vy + _j * _th
                    if _ty + _th > 0 && _ty < 480 {
                        // 瓦片与视口求交
                        _ax0 = max(0, _tx)
                        _ay0 = max(0, _ty)
                        _ax1 = min(640, _tx + _tw)
                        _ay1 = min(480, _ty + _th)
                        if _ax1 > _ax0 && _ay1 > _ay0 {
                            // 源矩形取整（只有被缩放的层才可能落在非整数上）
                            _u0 = floor((_ax0 - _tx) * _pw / _tw)
                            _v0 = floor((_ay0 - _ty) * _ph / _th)
                            _u1 = ceil((_ax1 - _tx) * _pw / _tw)
                            _v1 = ceil((_ay1 - _ty) * _ph / _th)
                            if _u0 < 0 {_u0 = 0}
                            if _v0 < 0 {_v0 = 0}
                            if _u1 > _pw {_u1 = _pw}
                            if _v1 > _ph {_v1 = _ph}
                            if _u1 > _u0 && _v1 > _v0 {
                                // 目标矩形由源矩形反推，保证「视口 → 格子」的映射不串位
                                _px0 = argument1 + (_tx + _u0 * _tw / _pw) * _sxs
                                _py0 = argument2 + (_ty + _v0 * _th / _ph) * _sys
                                _px1 = argument1 + (_tx + _u1 * _tw / _pw) * _sxs
                                _py1 = argument2 + (_ty + _v1 * _th / _ph) * _sys
                                draw_background_part_ext(_spr, _u0, _v0, _u1 - _u0, _v1 - _v0, _px0, _py0, (_px1 - _px0) / (_u1 - _u0), (_py1 - _py0) / (_v1 - _v0), c_white, _al)
                            }
                        }
                    }
                }
            }
            _i += 1
        }
    }
    _drawn += 1
}

draw_set_color(c_white)
draw_set_alpha(1)
return _drawn
