// ed_tool_spotlight()
// 探照灯状态机（wiatrak=1/2/10/11），o_edmain 上下文调用，含预览绘制与参数调整
// 完成点（test2=2 落定）处含 NET-SYNC 钩子；右键取消不产生同步
if tool_mode=1 {draw_sprite(s_roto,0,(floor(mouse_x/32))*32+16,(floor(mouse_y/32))*32+16)}
if tool_mode=1 && mouse_check_button(mb_left) && clicked=0 && (global.fotel<>(floor(mouse_x/32))*32 || global.fotel2<>(floor(mouse_y/32))*32) {
    tool_mode=2;
    tmp2.rotor[1]=point_distance(tmp2.x+16,tmp2.y+16,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16)
    tmp2.rotoa[1]=point_direction(tmp2.x+16,tmp2.y+16,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16)
    clicked=1
    tmp2.test2=1
}
if tool_mode=2 {
    //滚轮调整旋转速度（按住 select 键微调 0.01）
    if mouse_wheel_up() {
        if(!keyboard_check(global.key_select))global.agspeed+=1;else {global.agspeed+=0.01}
        if global.agspeed<=0 {global.agspeed=global.agspeed+360}
        if global.agspeed>360 {global.agspeed=global.agspeed-360}
        tmp2.additional3=global.agspeed
    }
    if mouse_wheel_down() {
        if(!keyboard_check(global.key_select))global.agspeed-=1;else {global.agspeed-=0.01}
        if global.agspeed<=0 {global.agspeed=global.agspeed+360}
        if global.agspeed>360 {global.agspeed=global.agspeed-360}
        tmp2.additional3=global.agspeed
    }
    if global.agspeed<0 {global.EDtest+=360+global.agspeed} else {global.EDtest+=global.agspeed}
}
//花瓣探照灯：左键确认速度，进入最大半径设置
if tool_mode=2 && tmp2.is_petal && mouse_check_button(mb_left) && clicked=0 {
    tool_mode=10
    global.petal_max_promien=tmp2.rotomr[1]
    global.petal_promien_szybkosc=tmp2.rotors[1]
    clicked=1
}
//花瓣探照灯：鼠标点击设置最大半径（网格吸附）
if tool_mode=10 {
    draw_sprite(s_roto,0,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16)
    draw_set_color(c_red)
    draw_line(tmp2.x+16,tmp2.y+16,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16)
    draw_set_alpha(0.3)
    draw_circle(tmp2.x+16,tmp2.y+16,point_distance(tmp2.x+16,tmp2.y+16,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16),0)
    draw_set_alpha(1)
    draw_set_font(cyferkimario)
    draw_set_color(c_white)
    draw_text(tmp2.x,tmp2.y-20,"max半径:"+string(point_distance(tmp2.x+16,tmp2.y+16,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16)))
    if mouse_check_button(mb_left) && clicked=0 {
        tmp2.rotomr[1]=point_distance(tmp2.x+16,tmp2.y+16,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16)
        global.petal_max_promien=tmp2.rotomr[1]
        tmp2.petal_preview=tmp2.rotor[1];if tmp2.rotors[1]<0 {tmp2.petal_preview_dir=-1} else {tmp2.petal_preview_dir=1};tmp2.petal_dir_got_preview=0
        tmp2.trail_count=0
        global.EDtest=0
        tool_mode=11
        clicked=1
    }
    if mouse_check_button(mb_right) {ed_net_ops_send_delete(tmp2); tool_mode=0;with(tmp2)instance_destroy();}
}
//花瓣探照灯：鼠标滚轮设置半径变化速度
if tool_mode=11 {
    draw_set_font(cyferkimario)
    draw_set_color(c_white)
    draw_text(tmp2.x,tmp2.y-20,"半径变化速度:"+string(tmp2.rotors[1]))
    if global.agspeed<0 {global.EDtest+=360+global.agspeed} else {global.EDtest+=global.agspeed}
    if mouse_wheel_up() {
        tmp2.rotors[1]+=1
        if tmp2.rotors[1]>99 {tmp2.rotors[1]=99}
        global.petal_promien_szybkosc=tmp2.rotors[1]
        tmp2.petal_preview=tmp2.rotor[1];if tmp2.rotors[1]<0 {tmp2.petal_preview_dir=-1} else {tmp2.petal_preview_dir=1};tmp2.petal_dir_got_preview=0
        tmp2.trail_count=0
        global.EDtest=0
    }
    if mouse_wheel_down() {
        tmp2.rotors[1]-=1
        if tmp2.rotors[1]<-99 {tmp2.rotors[1]=-99}
        global.petal_promien_szybkosc=tmp2.rotors[1]
        tmp2.petal_preview=tmp2.rotor[1];if tmp2.rotors[1]<0 {tmp2.petal_preview_dir=-1} else {tmp2.petal_preview_dir=1};tmp2.petal_dir_got_preview=0
        tmp2.trail_count=0
        global.EDtest=0
    }
    if mouse_check_button(mb_left) && clicked=0 {
        tmp2.test2=2
        tool_mode=0
        clicked=1
        // NET-SYNC: 完成点——花瓣探照灯落定（rotor/rotoa/rotomr/rotors/additional3/is_petal）
        ed_net_ops_send_update(tmp2, 1)
    }
    if mouse_check_button(mb_right) {ed_net_ops_send_delete(tmp2); tool_mode=0;with(tmp2)instance_destroy();}
}
//普通探照灯：左键确认落定
if tool_mode=2 && mouse_check_button(mb_left) && clicked=0 {
    tool_mode=0
    tmp2.test2=2
    clicked=1
    // NET-SYNC: 完成点——普通探照灯落定（rotor/rotoa/additional3）
    ed_net_ops_send_update(tmp2, 1)
}
