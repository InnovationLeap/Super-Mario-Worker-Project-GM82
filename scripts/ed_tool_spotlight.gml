// ed_tool_spotlight()
// 探照灯状态机（wiatrak=1/2/10/11），o_edmain 上下文调用，含预览绘制与参数调整
// 完成点（test2=2 落定）处含 NET-SYNC 钩子；右键取消不产生同步
if wiatrak=1 {draw_sprite(s_wiatrak,0,(floor(mouse_x/32))*32+16,(floor(mouse_y/32))*32+16)}
if wiatrak=1 && mouse_check_button(mb_left) && kliknieto=0 && (global.fotel<>(floor(mouse_x/32))*32 || global.fotel2<>(floor(mouse_y/32))*32)
    {
    wiatrak=2;
    fofo.rotor[1]=point_distance(fofo.x+16,fofo.y+16,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16)
    fofo.rotoa[1]=point_direction(fofo.x+16,fofo.y+16,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16)
    kliknieto=1
    fofo.test2=1
    }
if wiatrak=2{
    //滚轮调整旋转速度（按住 select 键微调 0.01）
    if mouse_wheel_up() {
    if(!keyboard_check(global.key_select))global.agspeed+=1;else{global.agspeed+=0.01}
    if global.agspeed<=0{global.agspeed=global.agspeed+360}
    if global.agspeed>360{global.agspeed=global.agspeed-360}
    fofo.additional3=global.agspeed
    }
    if mouse_wheel_down() {
    if(!keyboard_check(global.key_select))global.agspeed-=1;else{global.agspeed-=0.01}
    if global.agspeed<=0{global.agspeed=global.agspeed+360}
    if global.agspeed>360{global.agspeed=global.agspeed-360}
    fofo.additional3=global.agspeed
    }
      if global.agspeed<0 {global.EDtest+=360+global.agspeed}
      else{global.EDtest+=global.agspeed}
      }
//花瓣探照灯：左键确认速度，进入最大半径设置
if wiatrak=2 && fofo.is_petal && mouse_check_button(mb_left) && kliknieto=0
    {
    wiatrak=10
    global.petal_max_promien=fofo.rotomr[1]
    global.petal_promien_szybkosc=fofo.rotors[1]
    kliknieto=1
    }
//花瓣探照灯：鼠标点击设置最大半径（网格吸附）
if wiatrak=10{
    draw_sprite(s_wiatrak,0,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16)
    draw_set_color(c_red)
    draw_line(fofo.x+16,fofo.y+16,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16)
    draw_set_alpha(0.3)
    draw_circle(fofo.x+16,fofo.y+16,point_distance(fofo.x+16,fofo.y+16,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16),0)
    draw_set_alpha(1)
    draw_set_font(cyferkimario)
    draw_set_color(c_white)
    draw_text(fofo.x,fofo.y-20,"max半径:"+string(point_distance(fofo.x+16,fofo.y+16,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16)))
       if mouse_check_button(mb_left) && kliknieto=0
           {
           fofo.rotomr[1]=point_distance(fofo.x+16,fofo.y+16,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16)
           global.petal_max_promien=fofo.rotomr[1]
           fofo.petal_preview=fofo.rotor[1];if fofo.rotors[1]<0{fofo.petal_preview_dir=-1}else{fofo.petal_preview_dir=1};fofo.petal_dir_got_preview=0
           fofo.trail_count=0
           global.EDtest=0
           wiatrak=11
           kliknieto=1
           }
    if mouse_check_button(mb_right) {wiatrak=0;with(fofo)instance_destroy();}
    }
//花瓣探照灯：鼠标滚轮设置半径变化速度
 if wiatrak=11{
     draw_set_font(cyferkimario)
     draw_set_color(c_white)
     draw_text(fofo.x,fofo.y-20,"半径变化速度:"+string(fofo.rotors[1]))
     if global.agspeed<0 {global.EDtest+=360+global.agspeed}
     else{global.EDtest+=global.agspeed}
      if mouse_wheel_up() {
         fofo.rotors[1]+=1
          if fofo.rotors[1]>99{fofo.rotors[1]=99}
         global.petal_promien_szybkosc=fofo.rotors[1]
fofo.petal_preview=fofo.rotor[1];if fofo.rotors[1]<0{fofo.petal_preview_dir=-1}else{fofo.petal_preview_dir=1};fofo.petal_dir_got_preview=0
          fofo.trail_count=0
          global.EDtest=0
          }
      if mouse_wheel_down() {
          fofo.rotors[1]-=1
           if fofo.rotors[1]<-99{fofo.rotors[1]=-99}
          global.petal_promien_szybkosc=fofo.rotors[1]
          fofo.petal_preview=fofo.rotor[1];if fofo.rotors[1]<0{fofo.petal_preview_dir=-1}else{fofo.petal_preview_dir=1};fofo.petal_dir_got_preview=0
         fofo.trail_count=0
         global.EDtest=0
         }
    if mouse_check_button(mb_left) && kliknieto=0
        {
        fofo.test2=2
        wiatrak=0
        kliknieto=1
        // NET-SYNC: 完成点——花瓣探照灯落定（rotor/rotoa/rotomr/rotors/additional3/is_petal）
        }
    if mouse_check_button(mb_right) {wiatrak=0;with(fofo)instance_destroy();}
    }
//普通探照灯：左键确认落定
if wiatrak=2 && mouse_check_button(mb_left) && kliknieto=0
    {
    wiatrak=0
    fofo.test2=2
    kliknieto=1
    // NET-SYNC: 完成点——普通探照灯落定（rotor/rotoa/additional3）
    }
