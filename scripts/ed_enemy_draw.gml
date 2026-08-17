// ed_enemy_draw.gml
// 在编辑器敌人选择面板的某个 64x64 格子里，用游戏内真实敌人精灵绘制图标。
// 调用：ed_enemy_draw(enemy_id, cell_left, cell_top)
//   enemy_id  ：1-48（对应 wiki 代码 001-048）
//   cell_left ：格子左上角 x（已含 view_xview 偏移）
//   cell_top  ：格子左上角 y（已含 view_yview 偏移）
// 图标按原比例缩放，限制在 56x56 区域内居中。
// 注：GM8.2 无 asset_get_index，直接用精灵常量（编译期解析）。

var _id, _cx, _cy, _spr, _bank, _subimg, _tint, _w, _h, _ox, _oy, _s, _dx, _dy, _small, _ww, _wh, _oy2, _dy2, _hh, _i, _t, _r, _g, _b;
_id = argument0;
_cx = argument1;
_cy = argument2;
_spr = -1;
_bank = false;
_subimg = 0;
_tint = c_white;   // 默认不变色；跟踪炮台染成粉红

// id → 敌人精灵常量（第一帧作为图标，特殊 id 用子图）
switch (_id) {
case 1:  _spr = s_goomba;          break;
case 2:  _spr = s_troopa;          _subimg = 1; break; // 绿龟用另一帧走路动画
case 3:  _spr = s_troopared;       _subimg = 1; break; // 红龟用另一帧
case 4:  _spr = s_troopafly;       _subimg = 1; break; // 绿飞龟用另一帧
case 5:  _spr = s_spiny;           break;
case 6:  _spr = s_piranha;         _subimg = 1; break; // 食人花-绿 用另一帧
case 7:  _spr = s_piranha2;        _subimg = 1; break; // 食人花 用另一帧
case 8:  _spr = s_piranha3;        _subimg = 1; break; // 食人花 用另一帧
case 9:  _spr = s_piranha4;        _subimg = 1; break; // 食人花 用另一帧
case 10: _spr = s_lakitu;          break;
case 11: _spr = s_cannon;          break; // 正向炮台（普通，原色）
case 12: _spr = s_fish1;           break;
case 13: _spr = s_fish2;           break;
case 14: _spr = s_fish3;           break;
case 15: _spr = s_fish4;           break;
case 16: _spr = s_bonusdead;       break;
// 以下为滚轮滑动控制变种的「特殊物品」，面板里不绘制图标：
//   17 扎地食人花 / 20 探照灯 / 22 刺(MW) / 37 刺(MF) / 42 探照灯(静止) / 43 龟壳
// 它们的变种预览由 o_edmain 里单独的 mask 绘制负责（page0）。
case 17: return 0; // 扎地食人花
case 18: _spr = s_lava;            break;
// 锤子龟：本体左偏，右侧绘制三个不同角度的锤子（最下方半透明）
case 19:
    draw_sprite_ext(s_hammerbro, 1, _cx + 24, _cy + 32, 0.8, 0.8, 0, c_white, 1);
    draw_sprite_ext(s_hammer, 0, _cx + 46, _cy + 18, 0.5, 0.5,  45, c_white, 1.0);
    draw_sprite_ext(s_hammer, 0, _cx + 52, _cy + 34, 0.5, 0.5,   0, c_white, 0.7);
    draw_sprite_ext(s_hammer, 0, _cx + 46, _cy + 50, 0.5, 0.5, -45, c_white, 0.4);
    return 0;
case 20: return 0; // 探照灯
case 21: _spr = s_lavaball;        break;
case 22: return 0; // 刺(MW)
case 23: _spr = sprite157;         break; // thwomp
case 24: _spr = s_bowser;          break;
case 25: _spr = s_fahlee;          break;
case 26: _spr = s_cannon;          _tint = make_color_rgb(255, 192, 203); break; // 追踪炮台（正）- 粉红
// 火球龟：本体左移，右侧绘制两个火球（下方半透明）
case 27:
    draw_sprite_ext(s_firesis, 1, _cx + 22, _cy + 32, 0.8, 0.8, 0, c_white, 1);
    draw_sprite_ext(s_fireball, 0, _cx + 38, _cy + 38, 0.8, 0.8,  20, c_white, 1.0);
    draw_sprite_ext(s_fireball, 0, _cx + 48, _cy + 46, 0.7, 0.7, -20, c_white, 1.0);
    return 0;
case 28: _spr = s_lavabottom;      break;
case 29: _spr = s_cannonflip;      break; // 翻转炮台（普通，原色）
case 30: _spr = s_cannonflip;      _tint = make_color_rgb(255, 192, 203); break; // 追踪翻转炮台（倒）- 粉红
case 31: _spr = s_boo;             break;
case 32: _spr = s_buzzybeetle;     break;
case 33: _spr = s_troopaflyred;   _subimg = 1; break; // 红飞龟用另一帧
case 34: _spr = s_troopablue;      _subimg = 1; break; // 蓝龟用另一帧
case 35: _spr = s_troopabluefly;   _subimg = 1; break; // 蓝飞龟用另一帧
case 36: _spr = s_elecoral;        _subimg = 1; break; // 电珊瑚用发电那一帧
case 37: return 0; // 刺(MF)
case 38: _spr = s_troopagold;      _subimg = 1; break; // 黄/金龟用另一帧
case 39: _spr = s_troopagoldfly;   _subimg = 1; break; // 金/黄飞龟用另一帧
// id 40/41 为区域图标,直接组合绘制(水面/天空背景 + bank 红鱼),不走统一缩放
// 游鱼区域：渐变水 + 填实浪尖 + 三鱼残影轨迹（下潜动势）
case 40:
    // 残影1（最淡）→ 残影2 → 正常鱼，逐格下移形成轨迹
    _hh = 40;
    for (_i = 0; _i < _hh; _i += 1) {
        _t = _i / (_hh - 1);
        _r = 120 + (85 - 120) * _t;
        _g = 145 + (105 - 145) * _t;
        _b = 180 + (140 - 180) * _t;
        draw_set_color(make_color_rgb(floor(_r), floor(_g), floor(_b)));
        draw_line(_cx + 10, _cy + 16 + _i, _cx + 54, _cy + 16 + _i);
    }
    draw_set_color(make_color_rgb(120, 145, 180));
    draw_rectangle(_cx + 14, _cy + 18, _cx + 52, _cy + 15, false);
    _wh = sprite_get_height(s_waterlittle);
    _oy2 = sprite_get_yoffset(s_waterlittle);
    _dy2 = _cy + 18 - _wh + _oy2;
    draw_sprite_ext(s_waterlittle, 0, _cx + 10, _dy2 - 2,  1.4, 1, 0, c_white, 1);
    draw_sprite_ext(s_fish1, 0, _cx + 28, _cy + 31, 0.9, 0.9, 0, c_white, 0.25);
    draw_sprite_ext(s_fish1, 0, _cx + 34, _cy + 34, 0.9, 0.9, 0, c_white, 0.5);
    draw_sprite_ext(s_fish1, 0, _cx + 40, _cy + 37, 0.9, 0.9, 0, c_white, 0.8);
    return 0;

// 飞鱼区域：底部渐变水 + 三鱼残影轨迹（跃出动势）
case 41:
    _hh = 16;
    for (_i = 0; _i < _hh; _i += 1) {
        _t = _i / (_hh - 1);
        _r = 105 + (55 - 105) * _t;
        _g = 160 + (105 - 160) * _t;
        _b = 220 + (175 - 220) * _t;
        draw_set_color(make_color_rgb(floor(_r), floor(_g), floor(_b)));
        draw_line(_cx + 12, _cy + 42 + _i, _cx + 52, _cy + 42 + _i);
    }
    draw_set_color(make_color_rgb(105, 160, 220));
    draw_rectangle(_cx + 12, _cy + 44, _cx + 54, _cy + 41, false);
    _wh = sprite_get_height(s_waterlittle);
    _oy2 = sprite_get_yoffset(s_waterlittle);
    _dy2 = _cy + 44 - _wh + _oy2;
    draw_sprite_ext(s_waterlittle, 0, _cx + 12, _dy2 - 2,  1.28, 1, 0, c_white, 1);
    // 空中两残影（左上拖尾）+ 正常鱼压水面
    draw_sprite_ext(s_fish1, 0, _cx + 24, _cy + 25, 0.9,  0.9,  0, c_white, 0.25);
    draw_sprite_ext(s_fish1, 0, _cx + 29, _cy + 21, 0.9,  0.9,  0, c_white, 0.5);
    draw_sprite_ext(s_fish1, 0, _cx + 32, _cy + 19, 0.95, 0.95, 0, c_white, 1);
    return 0;
case 42: _spr = s_rotostill;       break; // 静止探照灯（只有一种，需绘制）
case 43: return 0; // 龟壳

case 44: _spr = s_piraniablue;    _subimg = 1; break; // 倒食人花-蓝 用另一帧
case 45: _spr = s_piraniablue2;   _subimg = 1; break; // 倒食人花 用另一帧
case 46: _spr = s_piraniagrey;    _subimg = 1; break; // 倒食人花-灰 用另一帧
case 47: _spr = s_piraniagrey2;   _subimg = 1; break; // 倒食人花 用另一帧
case 48: _spr = s_fakitu;          break;
default: _spr = s_enemiesbank; _bank = true; break; // 兜底用旧 bank 帧
}

// bank 帧号 = id-1，bank 单帧已做成适合格子的预览尺寸
if (_bank) {
    draw_sprite(_spr, _id - 1, _cx + 32, _cy + 32);
    return 0;
}

if (_spr < 0 || !sprite_exists(_spr)) {
    // 映射的精灵不存在时，回退用旧 bank 的对应预览帧
    draw_sprite(s_enemiesbank, _id - 1, _cx + 32, _cy + 32);
    return 0;
}

// 缩放：由 enemy_panel_tuner.html 导出的每 id 面板缩放（_panel_scale），
// 不再用 56/48 适配逻辑，直接按原始精灵尺寸 × _panel_scale 绘制（当前全部 0.8）。
// 数据来源：enemy_panel_tuner.html 导出的 scale 表。
// 未列出的 id（17/20/22/37/43 为 return 0 不绘制；default 走 bank）不在此表。
_panel_scale = 0.8;   // 默认兜底
switch (_id) {
case 1:  _panel_scale = 0.8; break;
case 2:  _panel_scale = 0.8; break;
case 3:  _panel_scale = 0.8; break;
case 4:  _panel_scale = 0.8; break;
case 5:  _panel_scale = 0.8; break;
case 6:  _panel_scale = 0.8; break;
case 7:  _panel_scale = 0.8; break;
case 8:  _panel_scale = 0.8; break;
case 9:  _panel_scale = 0.8; break;
case 10: _panel_scale = 0.8; break;
case 11: _panel_scale = 0.8; break;
case 12: _panel_scale = 0.8; break;
case 13: _panel_scale = 0.8; break;
case 14: _panel_scale = 0.8; break;
case 15: _panel_scale = 0.8; break;
case 16: _panel_scale = 0.8; break;
case 18: _panel_scale = 0.8; break;
case 19: _panel_scale = 0.8; break;
case 21: _panel_scale = 0.8; break;
case 23: _panel_scale = 0.8; break;
case 24: _panel_scale = 0.8; break;
case 25: _panel_scale = 0.8; break;
case 26: _panel_scale = 0.8; break;
case 27: _panel_scale = 0.8; break;
case 28: _panel_scale = 0.8; break;
case 29: _panel_scale = 0.8; break;
case 30: _panel_scale = 0.8; break;
case 31: _panel_scale = 0.8; break;
case 32: _panel_scale = 0.8; break;
case 33: _panel_scale = 0.8; break;
case 34: _panel_scale = 0.8; break;
case 35: _panel_scale = 0.8; break;
case 36: _panel_scale = 0.8; break;
case 38: _panel_scale = 0.8; break;
case 39: _panel_scale = 0.8; break;
case 40: _panel_scale = 0.8; break;
case 41: _panel_scale = 0.8; break;
case 42: _panel_scale = 0.8; break;
case 44: _panel_scale = 0.8; break;
case 45: _panel_scale = 0.8; break;
case 46: _panel_scale = 0.8; break;
case 47: _panel_scale = 0.8; break;
case 48: _panel_scale = 0.8; break;
}
_w = sprite_get_width(_spr);
_h = sprite_get_height(_spr);
_s = _panel_scale;
if (_s > 1) { _s = 1; }

// 居中：抵消精灵 origin 偏移，使视觉中心落在格子中心
_ox = sprite_get_xoffset(_spr);
_oy = sprite_get_yoffset(_spr);
_dx = (_cx + 32) - (_w / 2 - _ox) * _s;
_dy = (_cy + 32) - (_h / 2 - _oy) * _s;

draw_sprite_ext(_spr, _subimg, _dx, _dy, _s, _s, 0, _tint, 1);
return 0;
