// ed_tool_water()
// 水位区域状态机（wiatrak=9），o_edmain 上下文调用，含预览绘制
// 完成点（落定）处含 NET-SYNC 钩子；右键取消不产生同步
if wiatrak=9 && fofo.x<=(floor(mouse_x/32))*32 && fofo.y<=(floor(mouse_y/32))*32 {
    draw_sprite(s_waterbegin,0,fofo.x,fofo.y);
    draw_sprite_ext(s_waterend,0,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,0.5);
    draw_set_color(c_blue);draw_set_alpha(0.2)
    draw_rectangle(fofo.x,fofo.y,(floor(mouse_x/32))*32+31,(floor(mouse_y/32))*32+31,0)
    draw_set_color(c_white);draw_set_alpha(1)
}
if wiatrak=9 && mouse_check_button(mb_right) {ed_net_ops_send_delete(fofo); wiatrak=0;with(fofo)instance_destroy();}
if wiatrak=9 && mouse_check_button(mb_left) && kliknieto=0 && fofo.x<=(floor(mouse_x/32))*32 && fofo.y<=(floor(mouse_y/32))*32 {
    fofo.water_endX=floor((mouse_x)/32)*32+32
    fofo.water_endY=floor((mouse_y)/32)*32+32
    kliknieto=1
    wiatrak=0
    // NET-SYNC: 完成点——水位区域落定（water_endX/water_endY）
    ed_net_ops_send_update(fofo, 5)
}
