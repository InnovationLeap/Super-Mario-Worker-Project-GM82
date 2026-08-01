#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 联机对端光标绘制（独立对象，depth 在联机面板之上）
// 3+ 人：遍历玩家表绘制所有对端光标（颜色按 sid 区分）；收不到光标消息时停在最后位置
var _i, _col;
if instance_exists(o_edmain) && instance_exists(o_ednet) {
    _i = 0
    while _i < o_ednet.net_pl_count {
        if o_ednet.net_pl_time[_i] > 0 {
            // 颜色按 sid 轮换（红/绿/黄/蓝/紫/青/橙/粉）
            _col = c_red
            if o_ednet.net_pl_id[_i] mod 8 = 1 { _col = c_green }
            if o_ednet.net_pl_id[_i] mod 8 = 2 { _col = c_yellow }
            if o_ednet.net_pl_id[_i] mod 8 = 3 { _col = c_blue }
            if o_ednet.net_pl_id[_i] mod 8 = 4 { _col = c_purple }
            if o_ednet.net_pl_id[_i] mod 8 = 5 { _col = c_aqua }
            if o_ednet.net_pl_id[_i] mod 8 = 6 { _col = c_orange }
            if o_ednet.net_pl_id[_i] mod 8 = 7 { _col = c_fuchsia }
            draw_set_blend_mode(bm_subtract)
            draw_sprite_ext(s_edcursormask, 0, o_ednet.net_pl_mx[_i] + 16, o_ednet.net_pl_my[_i], 1, 1, -45, c_white, 1)
            draw_set_blend_mode(bm_normal)
            draw_sprite_ext(s_edcursor, 0, o_ednet.net_pl_mx[_i] + 16, o_ednet.net_pl_my[_i], 1, 1, -45, _col, 1)
            // 名字用 fw_draw_text（屏幕坐标）：世界坐标 - view 偏移，避免镜头滚动时名字错位
            draw_set_color(c_white)
            if o_ednet.net_font > 0 {
                fw_draw_set_font(o_ednet.net_font)
            }
            fw_draw_text(o_ednet.net_pl_mx[_i] - view_xview[0] + 30, o_ednet.net_pl_my[_i] - view_yview[0] + 6, string(o_ednet.net_pl_id[_i]) + ':' + o_ednet.net_pl_name[_i])
        }
        _i += 1
    }
}
