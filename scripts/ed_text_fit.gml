/// ed_text_fit(cx, cy, txt, target_w, col, orad)
/// 以「目标宽度 target_w」反推字号缩放，把一行文字按中心 (cx, cy) 居中绘制。
/// 用途：面板上原先烤在底图里的文字改成代码绘制后，仍与原来的字宽/占位一致
/// （换字体、改文案都不用重新量坐标）。需先用 draw_set_font(fnt_label)。
/// 返回实际使用的缩放，供调用方复用。
var _t, _s, _w, _h;
_t = argument2
if string_width(_t) <= 0 {return 0}
_s = argument3 / string_width(_t)
_w = string_width(_t) * _s
_h = string_height(_t) * _s
draw_set_halign(fa_left)
draw_set_valign(fa_top)
ed_text_shadow(argument0 - _w / 2, argument1 - _h / 2, _t, _s, argument4, argument5)
return _s
