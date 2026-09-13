// gen_payload_draw(cx, cy, cat, code, param, scale)
// 在 (cx,cy) 居中绘制生成物图标（编辑器生成器实例/预览用），不改变画笔颜色之外的状态
var _spr, _sub, _s, _w, _h, _ox, _oy;
_s = argument5;
if _s <= 0 { _s = 1 }
_spr = gen_payload_sprite(argument2, argument3, argument4, 0);
_sub = gen_payload_sprite(argument2, argument3, argument4, 1);
if _spr = -1 { return 0 }
if !sprite_exists(_spr) { return 0 }
draw_set_color(c_white);
draw_set_alpha(1);
_w = sprite_get_width(_spr);
_h = sprite_get_height(_spr);
_ox = sprite_get_xoffset(_spr);
_oy = sprite_get_yoffset(_spr);
draw_sprite_ext(_spr, _sub, argument0 - (_w / 2 - _ox) * _s, argument1 - (_h / 2 - _oy) * _s, _s, _s, 0, c_white, 1);
return 0;
