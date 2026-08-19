/// ed_autopair_row(frame_base, value_base, last_clicked)
/// 画一行 3 个自动配对选项按钮（s_autopair2 帧 frame_base..+2，x=224+66*(1..3)，y=416）。
/// 点击设置 autopair = value_base..+2；第 3 个按钮命中时按 last_clicked 决定是否置 clicked=1（原 1/3 分支有）。
/// 当前选中值画 s_autopairbutton 高亮。需在 self=o_edmain 上下文调用。
var _fb, _vb, _lc, _i;
_fb = argument0
_vb = argument1
_lc = argument2
_i = 0
while (_i < 3) {
    draw_sprite_ext(s_autopair2, _fb + _i, view_xview[0]+224+66*(_i+1), view_yview[0]+416, 1, 1, 0, c_white, 1)
    if abs(view_xview[0]+224+66*(_i+1)-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && clicked=0 && mouse_check_button(mb_left) {
        autopair = _vb + _i
        if _i = 2 && _lc = 1 {clicked = 1}
    }
    if autopair = _vb + _i {draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*(_i+1),view_yview[0]+416,1,1,0,c_white,1)}
    _i = _i + 1
}
