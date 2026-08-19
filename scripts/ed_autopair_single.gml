/// ed_autopair_single(frame, value)
/// 单个自动配对按钮（帧 8 类，check=17/18）。命中设置 autopair=value，选中高亮。
/// 需在 self=o_edmain 上下文调用。
var _f, _v;
_f = argument0
_v = argument1
draw_sprite_ext(s_autopair2, _f, view_xview[0]+224+66*1, view_yview[0]+416, 1, 1, 0, c_white, 1)
if abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && clicked=0 && mouse_check_button(mb_left) {autopair = _v}
if autopair = _v {draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1)}
