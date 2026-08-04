// ed_tool_goldfly()
// 金飞龟状态机（wiatrak=3/4），o_edmain 上下文调用，含预览绘制与数量调整
// 完成点（test2=2 落定）处含 NET-SYNC 钩子
if wiatrak=3 {draw_sprite(s_troopagoldfly,0,(floor(mouse_x/32))*32+16,(floor(mouse_y/32))*32+16);}//draw_text(fofo.x+4,fofo.y+4,global.agspeed)
if wiatrak=3 && mouse_check_button(mb_left) && kliknieto=0 && (global.fotel<>(floor(mouse_x/32))*32 || global.fotel2<>(floor(mouse_y/32))*32) {
    wiatrak=4;
    fofo.rotor[1]=point_distance(fofo.x+16,fofo.y+16,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16)
    fofo.rotoa[1]=point_direction(fofo.x+16,fofo.y+16,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16)
    kliknieto=1
    fofo.test2=1
    global.EDtest = 0
}
if wiatrak=4 {
    //滚轮调整绕飞数量（1-360）
    if mouse_wheel_up() {global.goldcount+=1;
        if global.goldcount<=0 {global.goldcount=1}
        if global.goldcount>360 {global.goldcount=360}
        fofo.additional3=global.goldcount
    }
    if mouse_wheel_down() {global.goldcount-=1;
        if global.goldcount<=0 {global.goldcount=1}
        if global.goldcount>360 {global.goldcount=360}
        fofo.additional3=global.goldcount
    }
}
//左键确认落定
if wiatrak=4 && mouse_check_button(mb_left) && kliknieto=0 {
    wiatrak=0
    fofo.test2=2
    kliknieto=1
    // NET-SYNC: 完成点——金飞龟落定（rotoord/rotor/rota/rotoc/rotod 全轨道）
    ed_net_ops_send_update(fofo, 8)
}
