// ed_tool_camera()
// 镜头控制区域状态机（wiatrak=8），o_edmain 上下文调用，含预览绘制
// 完成点（落定）处含 NET-SYNC 钩子；右键取消不产生同步
if wiatrak=8 && fofo.x<=(floor(mouse_x/32))*32 && fofo.y<=(floor(mouse_y/32))*32{
    draw_sprite(s_camerabegin,0,fofo.x,fofo.y);
    draw_sprite_ext(s_cameraend,0,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,0.5);
    draw_set_color(make_color_rgb(173,16,0))
    draw_rectangle(fofo.x,fofo.y,(floor(mouse_x/32))*32+31,(floor(mouse_y/32))*32+31,1)
}
if wiatrak=8 && mouse_check_button(mb_right) {wiatrak=0;with(fofo)instance_destroy();}
if wiatrak=8 && mouse_check_button(mb_left) && kliknieto=0 && fofo.x<=(floor(mouse_x/32))*32 && fofo.y<=(floor(mouse_y/32))*32 && floor((mouse_x-fofo.x)/32)>=19 && floor((mouse_y-fofo.y)/32)>=14
    {
    fofo.camera_endX=floor((mouse_x)/32)*32+32
    fofo.camera_endY=floor((mouse_y)/32)*32+32
    kliknieto=1
    wiatrak=0
    // NET-SYNC: 完成点——镜头区域落定（camera_endX/camera_endY）
    }
