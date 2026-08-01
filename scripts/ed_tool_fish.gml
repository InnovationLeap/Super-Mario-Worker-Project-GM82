// ed_tool_fish()
// 游鱼区域状态机（wiatrak=6），o_edmain 上下文调用，含预览绘制
// 完成点（test2=2 落定）处含 NET-SYNC 钩子；右键取消不产生同步
//预览区域显示
if wiatrak=6 && fofo.x<=(floor(mouse_x/32))*32 && fofo.y<=(floor(mouse_y/32))*32{
    draw_sprite(s_swimfishbegin,0,fofo.x,fofo.y);
    draw_sprite_ext(s_swimfishend,0,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,0.5);
    draw_set_color(make_color_rgb(173,16,0))
    draw_rectangle(fofo.x,fofo.y,(floor(mouse_x/32))*32+31,(floor(mouse_y/32))*32+31,1)
}
if wiatrak=6 && fofo.x>(floor(mouse_x/32))*32 && fofo.y<=(floor(mouse_y/32))*32{
    draw_sprite_ext(s_swimfishbegin,0,fofo.x+32,fofo.y,-1,1,0,c_white,1);
    draw_sprite_ext(s_swimfishend,0,(floor(mouse_x/32))*32+32,(floor(mouse_y/32))*32,-1,1,0,c_white,0.5);
    draw_set_color(make_color_rgb(173,16,0))
    draw_rectangle((floor(mouse_x/32))*32,fofo.y,fofo.x+31,(floor(mouse_y/32))*32+31,1)
}
//无效区域
if wiatrak=6 && fofo.x<=(floor(mouse_x/32))*32 && fofo.y>(floor(mouse_y/32))*32{
    draw_sprite(s_fishdisabled,0,fofo.x,fofo.y);
    draw_sprite_ext(s_fishdisabled,1,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,0.5);
}
if wiatrak=6 && fofo.x>(floor(mouse_x/32))*32 && fofo.y>(floor(mouse_y/32))*32{
    draw_sprite_ext(s_fishdisabled,0,fofo.x+32,fofo.y,-1,1,0,c_white,1);
    draw_sprite_ext(s_fishdisabled,1,(floor(mouse_x/32))*32+32,(floor(mouse_y/32))*32,-1,1,0,c_white,0.5);
}
//取消
if wiatrak=6 && mouse_check_button(mb_right) {wiatrak=0}
//放置
if wiatrak=6 && mouse_check_button(mb_left) && kliknieto=0 && fofo.y<=(floor(mouse_y/32))*32
    {
    fofo.fishendX=floor((mouse_x)/32)*32
    fofo.fishendY=floor((mouse_y)/32)*32
    fofo.test2=2
    kliknieto=1
    wiatrak=0
    // NET-SYNC: 完成点——鱼区域落定（fishendX/fishendY）
    }
if wiatrak=6 && mouse_check_button(mb_left) && mouse_y >= fofo.y && kliknieto=0
    {
    wiatrak=0
    fofo.test2=2
    kliknieto=1
    // NET-SYNC: 完成点——鱼区域落定（兜底）
    }
