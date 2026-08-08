// ed_tool_camera()
// 镜头控制区域状态机（wiatrak=8），o_edmain 上下文调用，含预览绘制
// 完成点（落定）处含 NET-SYNC 钩子；右键取消不产生同步
if tool_mode=8 && tmp2.x<=(floor(mouse_x/32))*32 && tmp2.y<=(floor(mouse_y/32))*32 {
    draw_sprite(s_camerabegin,0,tmp2.x,tmp2.y);
    draw_sprite_ext(s_cameraend,0,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,0.5);
    draw_set_color(make_color_rgb(173,16,0))
    draw_rectangle(tmp2.x,tmp2.y,(floor(mouse_x/32))*32+31,(floor(mouse_y/32))*32+31,1)
}
if tool_mode=8 && mouse_check_button(mb_right) {ed_net_ops_send_delete(tmp2); tool_mode=0;with(tmp2)instance_destroy();}
if tool_mode=8 && mouse_check_button(mb_left) && clicked=0 && tmp2.x<=(floor(mouse_x/32))*32 && tmp2.y<=(floor(mouse_y/32))*32 && floor((mouse_x-tmp2.x)/32)>=19 && floor((mouse_y-tmp2.y)/32)>=14 {
    tmp2.camera_endX=floor((mouse_x)/32)*32+32
    tmp2.camera_endY=floor((mouse_y)/32)*32+32
    clicked=1
    tool_mode=0
    // NET-SYNC: 完成点——镜头区域落定（camera_endX/camera_endY）
    ed_net_ops_send_update(tmp2, 4)
}
