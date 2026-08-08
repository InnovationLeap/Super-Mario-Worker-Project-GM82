// ed_tool_fish()
// 游鱼区域状态机（wiatrak=6），o_edmain 上下文调用，含预览绘制
// 完成点（test2=2 落定）处含 NET-SYNC 钩子；右键取消不产生同步
//预览区域显示
if tool_mode=6 && tmp2.x<=(floor(mouse_x/32))*32 && tmp2.y<=(floor(mouse_y/32))*32 {
    draw_sprite(s_swimfishbegin,0,tmp2.x,tmp2.y);
    draw_sprite_ext(s_swimfishend,0,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,0.5);
    draw_set_color(make_color_rgb(173,16,0))
    draw_rectangle(tmp2.x,tmp2.y,(floor(mouse_x/32))*32+31,(floor(mouse_y/32))*32+31,1)
}
if tool_mode=6 && tmp2.x>(floor(mouse_x/32))*32 && tmp2.y<=(floor(mouse_y/32))*32 {
    draw_sprite_ext(s_swimfishbegin,0,tmp2.x+32,tmp2.y,-1,1,0,c_white,1);
    draw_sprite_ext(s_swimfishend,0,(floor(mouse_x/32))*32+32,(floor(mouse_y/32))*32,-1,1,0,c_white,0.5);
    draw_set_color(make_color_rgb(173,16,0))
    draw_rectangle((floor(mouse_x/32))*32,tmp2.y,tmp2.x+31,(floor(mouse_y/32))*32+31,1)
}
//无效区域
if tool_mode=6 && tmp2.x<=(floor(mouse_x/32))*32 && tmp2.y>(floor(mouse_y/32))*32 {
    draw_sprite(s_fishdisabled,0,tmp2.x,tmp2.y);
    draw_sprite_ext(s_fishdisabled,1,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,0.5);
}
if tool_mode=6 && tmp2.x>(floor(mouse_x/32))*32 && tmp2.y>(floor(mouse_y/32))*32 {
    draw_sprite_ext(s_fishdisabled,0,tmp2.x+32,tmp2.y,-1,1,0,c_white,1);
    draw_sprite_ext(s_fishdisabled,1,(floor(mouse_x/32))*32+32,(floor(mouse_y/32))*32,-1,1,0,c_white,0.5);
}
//取消
if tool_mode=6 && mouse_check_button(mb_right) {tool_mode=0}
//放置
if tool_mode=6 && mouse_check_button(mb_left) && clicked=0 && tmp2.y<=(floor(mouse_y/32))*32 {
    tmp2.fishendX=floor((mouse_x)/32)*32
    tmp2.fishendY=floor((mouse_y)/32)*32
    tmp2.test2=2
    clicked=1
    tool_mode=0
    // NET-SYNC: 完成点——鱼区域落定（fishendX/fishendY）
    ed_net_ops_send_update(tmp2, 3)
}
if tool_mode=6 && mouse_check_button(mb_left) && mouse_y >= tmp2.y && clicked=0 {
    tool_mode=0
    tmp2.test2=2
    clicked=1
    // NET-SYNC: 完成点——鱼区域落定（兜底）
    ed_net_ops_send_update(tmp2, 3)
}
