/// ed_bg_chrome_part(px, py, pw, ph)
/// 按「页面坐标」从三段面板底图（s_edbg_top / s_edbg_mid / s_edbg_bot）里取一块原样重画。
/// 用途：格子内容是放大绘制的，边缘可能外溢 1px 压住 1px 黑框；用这个把黑框连着
/// 原图里那几像素立体阴影一起盖回来 —— 边框位置与像素和原图完全一致，不做任何美化重绘。
/// 跨段时自动切片（第 1 段 y 0..31、第 2 段 32..383、第 3 段 384..479）。
var _x, _y, _w, _h, _cut;
_x = argument0
_y = argument1
_w = argument2
_h = argument3

if _y < 32 {
    _cut = min(_y + _h, 32) - _y
    if _cut > 0 {
        draw_sprite_part(s_edbg_top, 0, _x, _y, _w, _cut, view_xview[0] + _x, view_yview[0] + _y)
        _y += _cut
        _h -= _cut
    }
}
if _h > 0 && _y < 384 {
    _cut = min(_y + _h, 384) - _y
    if _cut > 0 {
        draw_sprite_part(s_edbg_mid, 0, _x, _y - 32, _w, _cut, view_xview[0] + _x, view_yview[0] + _y)
        _y += _cut
        _h -= _cut
    }
}
if _h > 0 {
    draw_sprite_part(s_edbg_bot, 0, _x, _y - 384, _w, _h, view_xview[0] + _x, view_yview[0] + _y)
}
