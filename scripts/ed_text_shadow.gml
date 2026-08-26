/// ed_text_shadow(x, y, txt, scale, col, orad)
/// GM8 内置文字描边绘制（多方向偏移法）：
/// 先以相同字号向 8 个方向各偏移 orad 像素画半透明黑文字形成描边，
/// 最后在原位置画不透明主文字。同字号保证字距完全一致，不会错位。
/// orad = 描边半径像素（1 ≈ 1px 描边；传 0 则无描边）。
/// 描边单层 alpha 见下方 OA：8 层偏移会在重叠处叠加变深（约 OA→1-(1-OA)^3），
/// 想要描边更实就调大 OA，更淡就调小。
/// 需先 draw_set_font(fnt_label)；scale = 目标字号 / font_get_size(fnt_label)。
/// string_width/string_height 亦须在该字体下取值后再乘 scale 做居中。
var _x, _y, _t, _s, _c, _r, _oa;
_x = argument0
_y = argument1
_t = argument2
_s = argument3
_c = argument4
_r = argument5
_oa = 0.2                           // 描边单层透明度（8 层叠加后约 0.2~0.5，主文字不受影响）
draw_set_color(c_black)
draw_set_alpha(_oa)
draw_text_transformed(_x + _r, _y, _t, _s, _s, 0)
draw_text_transformed(_x - _r, _y, _t, _s, _s, 0)
draw_text_transformed(_x, _y + _r, _t, _s, _s, 0)
draw_text_transformed(_x, _y - _r, _t, _s, _s, 0)
draw_text_transformed(_x + _r, _y + _r, _t, _s, _s, 0)
draw_text_transformed(_x - _r, _y + _r, _t, _s, _s, 0)
draw_text_transformed(_x + _r, _y - _r, _t, _s, _s, 0)
draw_text_transformed(_x - _r, _y - _r, _t, _s, _s, 0)
draw_set_alpha(1)
draw_set_color(_c)
draw_text_transformed(_x, _y, _t, _s, _s, 0)
