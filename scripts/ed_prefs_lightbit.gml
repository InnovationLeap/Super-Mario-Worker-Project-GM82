// ed_prefs_lightbit(bitpos, label, y, hh)
// 渲染+交互一个 lightobject 位开关（global.lightobject 字符串第 bitpos 个字符）。
// y = 标签行（命中区 y-10），hh = 命中区高（Player Invincible Star 是 10，其余 20）。
var _bit, _label, _y, _hh, _ch;
_bit = argument0
_label = argument1
_y = argument2
_hh = argument3
_ch = string_copy(global.lightobject, _bit, 1)
draw_text(view_xview[0]+40, view_yview[0]+_y, string_upper(_label))
draw_set_halign(fa_right)
if _ch = '1' {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+_y,string_upper('yes'))}
if _ch = '0' {draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+_y,string_upper('no'))}
draw_set_halign(fa_left)
draw_set_color(c_white)
if ed_hit(40, _y-10, 190, _hh) && clicked = 0 {
    draw_prefs_highlight(view_xview[0]+40, view_yview[0]+_y-10, 1.4, 0.8, 0.2);
    if mouse_check_button(mb_left) {
        clicked = 1
        if _ch = '0' {global.lightobject = string_replace_char(global.lightobject, _bit, '1');}
        else {global.lightobject = string_replace_char(global.lightobject, _bit, '0');}
        ed_net_ops_send_settings('Light Object')
    }
}
