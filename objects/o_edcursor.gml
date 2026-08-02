#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 联机对端光标绘制（独立对象，depth 在联机面板之上）
// 3+ 人：遍历玩家表绘制所有对端光标（颜色按 sid 轮换）；收不到光标消息时停在最后位置
var _i, _f;
if instance_exists(o_edmain) && instance_exists(o_ednet) {
    _i = 0
    while _i < o_ednet.net_pl_count {
        if o_ednet.net_pl_time[_i] > 0 {
            // 帧 = (sid+1) mod 8（sid：房主=0 客户1=1 客户2=2...）：0红 1绿 2黄 3蓝 4紫 5青 6橙 7白
            // 颜色按玩家 sid 固定，所有人看同一玩家同色；白色参与轮换，本地不再强制白色
            _f = (o_ednet.net_pl_id[_i] + 1) mod 8
            draw_set_blend_mode(bm_subtract)
            draw_sprite_ext(s_edcursormaskmulti, 0, o_ednet.net_pl_mx[_i] + 16, o_ednet.net_pl_my[_i], 1, 1, -45, c_white, 1)
            draw_set_blend_mode(bm_normal)
            draw_sprite_ext(s_edcursormulti, _f, o_ednet.net_pl_mx[_i] + 16, o_ednet.net_pl_my[_i], 1, 1, -45, c_white, 1)
            // 名字用 fw_draw_text（屏幕坐标）：世界坐标 - view 偏移，避免镜头滚动时名字错位
            draw_set_color(c_white)
            if o_ednet.net_font > 0 {
                fw_draw_set_font(o_ednet.net_font)
            }
            fw_draw_text(o_ednet.net_pl_mx[_i] - view_xview[0] + 30, o_ednet.net_pl_my[_i] - view_yview[0] + 6, string(o_ednet.net_pl_id[_i]) + ':' + o_ednet.net_pl_name[_i])
        }
        _i += 1
    }
    // 本地光标（仅联机连接后显示，带自己的名字；颜色按自己 sid 分配，与他人看到的一致）
    if o_ednet.net_state = 3 {
        _f = (o_ednet.net_myid + 1) mod 8
        // 模仿者模式：锤子光标已跟随鼠标（o_imi），不画本地光标，仅保留右侧名字
        if o_edmain.costawia3 <> 42 {
            draw_set_blend_mode(bm_subtract)
            draw_sprite_ext(s_edcursormaskmulti, 0, mouse_x, mouse_y, 1, 1, -45, c_white, 1)
            draw_set_blend_mode(bm_normal)
            draw_sprite_ext(s_edcursormulti, _f, mouse_x, mouse_y, 1, 1, -45, c_white, 1)
        }
        draw_set_color(c_white)
        if o_ednet.net_font > 0 {
            fw_draw_set_font(o_ednet.net_font)
        }
        fw_draw_text(mouse_x - view_xview[0] + 30, mouse_y - view_yview[0] + 6, o_ednet.net_my_name)
    }
}
