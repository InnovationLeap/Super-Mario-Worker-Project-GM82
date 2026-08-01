#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 联机对端光标绘制（独立对象，depth 在联机面板之上）
// 收不到光标消息时停在最后位置（仅断开时 cleanup 置 -1 后消失）
if instance_exists(o_edmain) && instance_exists(o_ednet) {
    if o_ednet.net_peer_cursor_time > 0 {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_edcursormask, 0, o_ednet.net_peer_mx + 16, o_ednet.net_peer_my, 1, 1, 0, c_white, 1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_edcursor, 0, o_ednet.net_peer_mx + 16, o_ednet.net_peer_my, 1, 1, 0, c_red, 1)
        draw_set_color(c_white)
        if o_ednet.net_font > 0 {
            fw_draw_set_font(o_ednet.net_font)
        }
        fw_draw_text(o_ednet.net_peer_mx + 30, o_ednet.net_peer_my + 6, o_ednet.net_peer_name)
    }
}
