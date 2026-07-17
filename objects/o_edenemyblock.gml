#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !variable_local_exists('coto'){
coto=0

additional1=32
additional2=0
additional3=1
additional4=0}
cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0) // 定义字体
deltax=0
deltay=0
test=0
test2=0
test3=0

rotoord=1
rotor[1]=32
rotoa[1]=0
rotos[1]=1
is_petal=0
rotomr[1]=200
rotors[1]=1
petal_preview=0
petal_preview_dir=1
petal_dir_got_preview=0
trail_count=0
trail_max=2000

imweitiao=0
drink=0
picked = false

shell_type = 0
spike_type = 0

end_mark = 0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
 //用coto确定显示什么敌人

 //常规显示
if coto !=20 &&coto !=40 &&coto !=41 && coto !=43 && coto !=17 && coto !=22 && coto !=37 && (global.objectoffset=1||(coto!=7 && coto!=9 && coto!=45 && coto!=47)){
draw_sprite(s_enemiesbank,coto-1,x+16,y+32)
draw_set_color(c_white)
draw_set_font(cyferkimario)}
//倒向食人花绘制绿
if global.objectoffset=0 && coto=7{
draw_sprite(s_enemiesbank,coto-1,x+16,y+32+18)
draw_set_color(c_white)
draw_set_font(cyferkimario)
}
//倒向食人花绘制红
if global.objectoffset=0 && coto=9{
draw_sprite(s_enemiesbank,coto-1,x+16,y+32+19)
draw_set_color(c_white)
draw_set_font(cyferkimario)
}
//倒向食人花绘制蓝
if global.objectoffset=0 && coto=45{
draw_sprite(s_enemiesbank,coto-1,x+16,y+32+19)
draw_set_color(c_white)
draw_set_font(cyferkimario)
}
//倒向食人花绘制灰
if global.objectoffset=0 && coto=47{
draw_sprite(s_enemiesbank,coto-1,x+16,y+32+19)
draw_set_color(c_white)
draw_set_font(cyferkimario)
}
//右边这句是弃置代码，被弄成注释了 if o_edmain.costawia<>0 && o_edmain.kliknieto=0 && mouse_x>0 && mouse_y>0 && o_edmain.wiatrak=0 {draw_text(x,y,coto)}
//探照灯大法好！！！！
//WSW: 以下为杀人代码，请做好心理准备(das除外)
if coto=20{
    //rotoord表示重叠探照灯中的序号，越小，越在下方图层
    if rotoord<=1{
         rotostr=""
          if is_petal{
              rotostr=rotostr+"edit:radius="+string(floor(rotor[1]))+";angle="+string(floor(rotoa[1]))+";speed="+string((rotos[1]))+";max_radius="+string(rotomr[1])+";radius_speed="+string(rotors[1])+"|"
              rotostr=rotostr+"add a new roto-disc..."
              draw_sprite(s_enemiesbank,coto-1,x+16,y+32)
              draw_set_font(cyferkimario)
              draw_set_color(c_white)
              draw_text(x+4,y+4,rotos[rotoord])
              draw_set_color(c_red)
              draw_circle(x+16,y+16,rotomr[rotoord],true)
              draw_set_color(c_white)
              draw_text(x+4,y+20,"mr:"+string(rotomr[rotoord])+" rs:"+string(rotors[rotoord]))
          } else {
              rotostr=rotostr+"edit:radius="+string(floor(rotor[1]))+";angle="+string(floor(rotoa[1]))+";speed="+string((rotos[1]))+"|"
              rotostr=rotostr+"add a new roto-disc..."
              draw_sprite(s_enemiesbank,coto-1,x+16,y+32)
              draw_set_font(cyferkimario)
              draw_set_color(c_white)
              draw_text(x+4,y+4,rotos[rotoord])
          }
    }
    else{
         var i,j,k;
         rotostr="";k=0
         if is_petal{
             repeat(rotoord){k+=1;rotostr=rotostr+"edit no."+string(k)+":radius="+string(floor(rotor[k]))+";angle="+string(floor(rotoa[k]))+";speed="+string((rotos[k]))+";max_radius="+string(rotomr[k])+";radius_speed="+string(rotors[k])+"|"}
         } else {
             repeat(rotoord){k+=1;rotostr=rotostr+"edit no."+string(k)+":radius="+string(floor(rotor[k]))+";angle="+string(floor(rotoa[k]))+";speed="+string((rotos[k]))+"|"}
         }
         rotostr=rotostr+"add a new roto-disc...|delete a roto-disc..."
         draw_sprite(s_enemiesbank,coto-1,x+16,y+32)
         draw_set_color(c_white)
         draw_set_font(cyferkimario)
         var m;m=1
         {for (j=1;j<=rotoord-1;j+=1)
         draw_sprite(s_wiatrak,0,x+16+rotor[j]*sin(degtorad(rotoa[j]+90)),y+16+rotor[j]*cos(degtorad(rotoa[j]+90)))
         }
         i=1;{do{
             draw_circle(x+16,y+16,rotor[i],true)
              if is_petal{
                  draw_set_alpha(0.3)
                  draw_set_color(c_red)
                  draw_circle(x+16,y+16,rotomr[i],true)
                  draw_set_alpha(1)
                  draw_set_color(c_white)
              }
         i+=1}until(i>=rotoord)}
         var k;{for(k=1;k<rotoord;k+=1)if rotos[k]!=rotos[k+1]{m=0}}
         if m=1{draw_text(x+4,y+4,rotos[rotoord])}
         draw_text(x+24,y+24,"X"+string(rotoord))
         if test2=2&& mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 &&keyboard_check(global.key_submenu)&& global.picking = false{
         var rotomenu;
         rotomenu=show_menu(rotostr,-1)
          if rotomenu<rotoord&&rotomenu>=0{
             var ratio,angle,agspeed,agmr,agrs;
             ratio=get_integer('Set the radius.',rotor[rotomenu+1])
             angle=get_integer('Set the angle.',rotoa[rotomenu+1])
             agspeed=max(0,real(get_string('Set the speed.',string(rotos[rotomenu+1]))))
             rotor[rotomenu+1]=floor(min(ratio,6000))
             rotoa[rotomenu+1]=floor(min(angle,360))
             rotos[rotomenu+1]=(min(agspeed,360))
             if is_petal{
                 agmr=get_integer('Set the max radius.',rotomr[rotomenu+1])
                 agrs=max(0,real(get_string('Set the radius speed.',string(rotors[rotomenu+1]))))
                 rotomr[rotomenu+1]=floor(min(agmr,6000))
                 rotors[rotomenu+1]=(min(agrs,360))
             }}
          if rotomenu=rotoord{
             rotoord+=1
             var ratio,angle,agspeed,agmr,agrs;
             ratio=get_integer('Set the radius of the new roto-disc.',32)
             angle=get_integer('Set the angle of the new roto-disc.',0)
             agspeed=max(0,real(get_string('Set the speed of the new roto-disc.','1')))
             rotor[rotoord]=floor(min(ratio,6000))
             rotoa[rotoord]=floor(min(angle,360))
             rotos[rotoord]=(min(agspeed,360))
             if is_petal{
                 agmr=get_integer('Set the max radius of the new roto-disc.',200)
                 agrs=max(0,real(get_string('Set the radius speed of the new roto-disc.','1')))
                 rotomr[rotoord]=floor(min(agmr,6000))
                 rotors[rotoord]=(min(agrs,360))
             }
          }
          if rotomenu>rotoord{
          var i,j;
          j=get_integer('Set the number of the roto-disc you want to delete.(0 stands for not deleting)',0)
          if j>0 && j <=rotoord{
              for(i=1;i<=rotoord-1;i+=1){
                  if i>=j{rotor[i]=rotor[i+1];rotoa[i]=rotoa[i+1];rotos[i]=rotos[i+1];if is_petal{rotomr[i]=rotomr[i+1];rotors[i]=rotors[i+1]}}
              }
              rotor[rotoord]=32;rotoa[rotoord]=0;rotos[rotoord]=1;if is_petal{rotomr[rotoord]=200;rotors[rotoord]=1};rotoord-=1
          }
          }
         }
    }

    draw_circle(x+16,y+16,rotor[rotoord],true)

    if test2=2 && mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 && keyboard_check(global.key_submenu) && global.picking = false{
         var rotomenu;
         rotomenu=show_menu(rotostr,-1)
          if rotomenu=0{
            var ratio,angle,agspeed,agmr,agrs;
             ratio=get_integer('Set the radius.',rotor[rotomenu+1])
             angle=get_integer('Set the angle.',rotoa[rotomenu+1])
             agspeed=max(0,real(get_string('Set the speed.',string(rotos[rotomenu+1]))))
             rotor[rotomenu+1]=floor(min(ratio,6000))
             rotoa[rotomenu+1]=floor(min(angle,360))
             rotos[rotomenu+1]=(min(agspeed,360))
             if is_petal{
                 agmr=get_integer('Set the max radius.',rotomr[rotomenu+1])
                 agrs=max(0,real(get_string('Set the radius speed.',string(rotors[rotomenu+1]))))
                 rotomr[rotomenu+1]=floor(min(agmr,6000))
                 rotors[rotomenu+1]=(min(agrs,360))
             }
          }
          if rotomenu=1{
             rotoord+=1
             var ratio,angle,agspeed,agmr,agrs;
             ratio=get_integer('Set the radius of the new roto-disc.',32)
             angle=get_integer('Set the angle of the new roto-disc.',0)
             agspeed=max(0,real(get_string('Set the speed of the new roto-disc.','1')))
             rotor[rotoord]=floor(min(ratio,6000))
             rotoa[rotoord]=floor(min(angle,360))
             rotos[rotoord]=(min(agspeed,360))
             if is_petal{
                 agmr=get_integer('Set the max radius of the new roto-disc.',200)
                 agrs=max(0,real(get_string('Set the radius speed of the new roto-disc.','1')))
                 rotomr[rotoord]=floor(min(agmr,6000))
                 rotors[rotoord]=(min(agrs,360))
             }
          }
     }

     if test2=1{  //放置灯的阶段叫做test2=1（确定半径及初始角度）
         rotos[rotoord]=global.agspeed
         draw_set_font(cyferkimario)
         if !(is_petal && o_edmain.wiatrak=11){
             draw_set_color(c_white)
             draw_circle(x+16,y+16,test3,1)
             if test3<rotor[rotoord] {test3+=1}
             if test3>=rotor[rotoord] {test3=0}
         }
          if is_petal && o_edmain.wiatrak=11{
              if !petal_dir_got_preview {
                  if rotors[rotoord]<0 {petal_preview_dir=-1}
                  petal_dir_got_preview=1
              }
              petal_preview+=abs(rotors[rotoord])*petal_preview_dir
              if petal_preview>rotomr[rotoord] {petal_preview=rotomr[rotoord]-(petal_preview-rotomr[rotoord]);petal_preview_dir=-1}
              if petal_preview<0 {petal_preview=-petal_preview;petal_preview_dir=1}
             var sx,sy;
             sx=x+16+petal_preview*sin(degtorad(rotoa[rotoord]+90+global.EDtest))
             sy=y+16+petal_preview*cos(degtorad(rotoa[rotoord]+90+global.EDtest))
             if trail_count<trail_max{
                 trail_x[trail_count]=sx
                 trail_y[trail_count]=sy
                 trail_count+=1
             }
               if trail_count>1{
                   var ti;
                   for(ti=0;ti<trail_count-1;ti+=1){
                       draw_set_color(c_red)
                       draw_line(trail_x[ti],trail_y[ti],trail_x[ti+1],trail_y[ti+1])
                   }
               }
              draw_set_color(c_red)
             draw_circle(x+16,y+16,petal_preview,true)
             draw_sprite(s_wiatrak,floor(testani) mod 26,sx,sy)
         } else {
             if !(is_petal && o_edmain.wiatrak=10){
                 draw_sprite(s_wiatrak,floor(testani) mod 26,x+16+rotor[rotoord]*sin(degtorad(rotoa[rotoord]+90+global.EDtest)),y+16+rotor[rotoord]*cos(degtorad(rotoa[rotoord]+90+global.EDtest)))
             }
         }
         testani+=0.2
         if !(is_petal && o_edmain.wiatrak=11){
             draw_circle(x+16,y+16,rotor[rotoord],true)
         }
         if is_petal{
             if !(o_edmain.wiatrak=11){
                 draw_set_alpha(0.3)
                 draw_set_color(c_red)
                 draw_circle(x+16,y+16,rotomr[rotoord],true)
                 draw_set_alpha(1)
             }
             draw_set_color(c_white)
             draw_text(x+4,y+20,"mr:"+string(rotomr[rotoord])+" rs:"+string(rotors[rotoord]))
         }
        if keyboard_check(global.key_submenu)&& global.picking = false{
        var ratio,angle,agmr,agrs;
        ratio=get_integer('Set the radius.',rotor[rotoord])
        angle=get_integer('Set the angle.',rotoa[rotoord])
        agspeed=max(0,real(get_string('Set the speed.',string(rotos[rotoord]))))
        rotor[rotoord]=floor(min(ratio,6000))
        rotoa[rotoord]=floor(min(angle,360))
        rotos[rotoord]=(min(agspeed,360))
        if is_petal{
            agmr=get_integer('Set the max radius.',rotomr[rotoord])
            agrs=max(0,real(get_string('Set the radius speed.',string(rotors[rotoord]))))
            rotomr[rotoord]=floor(min(agmr,6000))
            rotors[rotoord]=(min(agrs,360))
        }
        o_edmain.wiatrak=0
        test2=2
        o_edmain.kliknieto=1
        }
    }

     if test2=2{
          draw_set_color(c_white)
          draw_circle(x+16,y+16,rotor[rotoord],true)
          if is_petal{
              draw_set_alpha(0.3)
              draw_set_alpha(0.3)
              draw_set_color(c_red)
              draw_circle(x+16,y+16,rotomr[rotoord],true)
              draw_set_alpha(1)
              draw_set_alpha(1)
              draw_set_color(c_white)
              draw_text(x+4,y+20,"mr:"+string(rotomr[rotoord])+" rs:"+string(rotors[rotoord]))
          }
          draw_sprite(s_wiatrak,0,x+16+rotor[rotoord]*sin(degtorad(rotoa[rotoord]+90)),y+16+rotor[rotoord]*cos(degtorad(rotoa[rotoord]+90)))
         draw_set_font(cyferkimario)
    }

    /*pick begin*/
    if test2=2 && mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 && keyboard_check_pressed(global.key_pick) && o_edmain.costawia2 = 20 && global.picking = false
    {
        if global.sample=1 {lololo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}
        global.picking = true
        picked = true
    }
    if picked=true && o_edmain.costawia2 = 20{
        x = floor((mouse_x)/32)*32
        y = floor((mouse_y)/32)*32
        if keyboard_check_released(global.key_pick)
        {
            global.picking=false
            picked=false
            if global.sample=1 {lololo=sound_play(snd_fire);sound_volume(snd_fire,global.glosnosc)}
        }
    }
    if o_edmain.costawia2 <>20 {picked=false}
    /*pick end*/
}

if coto=39 {
      if rotoord<=1{
         rotoctr=""
         rotoctr=rotoctr+"edit:radius="+string(floor(rotor[1]))+";angle="+string(floor(rotoa[1]))+";count="+string(floor(rotoc[1]))+"|"
         rotoctr=rotoctr+"add a new gold koopa paratroopa..."
         draw_set_color(c_white)
         draw_sprite(s_enemiesbank,coto-1,x+16,y+32)
         draw_text(x+4,y+4,rotoc[rotoord])}
      else{
      var i,j,k;
      rotoctr="";k=0
      repeat(rotoord){k+=1;rotoctr=rotoctr+"edit no."+string(k)+":radius="+string(floor(rotor[k]))+";angle="+string(floor(rotoa[k]))+";count="+string(floor(rotoc[k]))+"|"}
      rotoctr=rotoctr+"add a new gold koopa paratroopa...|delete a gold koopa paratroopa..."
      draw_sprite(s_enemiesbank,coto-1,x+16,y+32)
      draw_set_color(c_white)
      draw_set_font(cyferkimario)
         var m;m=1
         {for (j=1;j<=rotoord-1;j+=1)
            for (m=0; m<rotoc[j]; m+=1) {
               draw_sprite(s_troopagoldfly,1,x+16+(rotor[j])*sin(degtorad(rotoa[j]+90+(360/rotoc[j])*m)),y+16+(rotor[j])*cos(degtorad(rotoa[j]+90+(360/rotoc[j])*m)))
            }
         }
         i=1;{do{draw_circle(x+16,y+16,rotor[i],true);i+=1}until(i>=rotoord)}
         var k;{for(k=1;k<rotoord;k+=1)if rotoc[k]!=rotoc[k+1]{m=0}}
         if m=1{draw_text(x+4,y+4,rotoc[rotoord])}
         draw_text(x+24,y+24,"X"+string(rotoord))
         if test2=2&& mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 &&keyboard_check(global.key_submenu) && global.picking = false{
         var rotomenu;
         rotomenu=show_menu(rotoctr,-1)
         if rotomenu<rotoord&&rotomenu>=0{
            var ratio,angle;
            ratio=get_integer('Set the radius.',rotor[rotomenu+1])
            angle=get_integer('Set the angle.',rotoa[rotomenu+1])
            agcount=get_integer('Set the count.',rotoc[rotomenu+1])
            agdir=get_integer('Set the direction.(0=Anti-Clockwise, 1=Clockwise)',rotod[rotomenu+1])
            rotor[rotomenu+1]=floor(min(ratio,6000))
            rotoa[rotomenu+1]=floor(min(angle,360))
            rotoc[rotomenu+1]=floor(min(agcount,360))
            rotod[rotomenu+1]=floor(min(max(agdir,0),1))}
         if rotomenu=rotoord{
            rotoord+=1
            var ratio,angle;
            ratio=get_integer('Set the radius.',150)
            angle=get_integer('Set the angle.',0)
            agcount=get_integer('Set the count.',1)
            agdir=get_integer('Set the direction.(0=Anti-Clockwise, 1=Clockwise)',1)
            rotor[rotomenu+1]=floor(min(ratio,6000))
            rotoa[rotomenu+1]=floor(min(angle,360))
            rotoc[rotomenu+1]=floor(min(agcount,360))
            rotod[rotomenu+1]=floor(min(max(agdir,0),1))}
         if rotomenu>rotoord{var i,j;
         j=get_integer('Set the number of the gold koopa paratroopa you want to delete.(0 stands for not deleting)',0)
         if j>0 && j <=rotoord{{for(i=1;i<=rotoord-1;i+=1)
         if i>=j{rotor[i]=rotor[i+1];rotoa[i]=rotoa[i+1];rotoc[i]=rotoc[i+1];rotod[i]=rotod[i+1]}}
         rotor[rotoord]=32;rotoa[rotoord]=0;rotoc[rotoord]=1;rotod[rotoord]=1;rotoord-=1}}}}
         draw_circle(x+16,y+16,rotor[rotoord],true)
         if test2=2&& mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 &&keyboard_check(global.key_submenu)&& global.picking = false{
         var rotomenu;
         rotomenu=show_menu(rotoctr,-1)
         if rotomenu=0{
            var ratio,angle;
            ratio=get_integer('Set the radius.',rotor[rotomenu+1])
            angle=get_integer('Set the angle.',rotoa[rotomenu+1])
            agcount=get_integer('Set the count.',rotoc[rotomenu+1])
            agdir=get_integer('Set the direction.(0=Anti-Clockwise, 1=Clockwise)',rotod[rotomenu+1])
            rotor[rotoord]=floor(min(ratio,6000))
            rotoa[rotoord]=floor(min(angle,360))
            rotoc[rotoord]=floor(min(agcount,360))
            rotod[rotoord]=floor(min(max(agdir,0),1))}
         if rotomenu=1{
            rotoord+=1
            var ratio,angle;
            ratio=get_integer('Set the radius of the new gold koopa paratroopa.',150)
            angle=get_integer('Set the angle of the new gold koopa paratroopa.',0)
            agcount=get_integer('Set the count of the new gold koopa paratroopa.',1)
            agdir=get_integer('Set the direction of the new gold koopa paratroopa.(0=Anti-Clockwise, 1=Clockwise)',1)
            rotor[rotoord]=floor(min(ratio,6000))
            rotoa[rotoord]=floor(min(angle,360))
            rotoc[rotoord]=floor(min(agcount,360))
            rotod[rotoord]=floor(min(max(agdir,0),1))}}

    if test2=1
            {
            rotoc[rotoord]=global.goldcount
            draw_circle(x+16,y+16,test3,1)
            draw_set_color(c_white)
            draw_set_font(cyferkimario)
            if test3<rotor[rotoord] {test3+=1}
            if test3>=rotor[rotoord] {test3=0}
            if mouse_x > view_xview[0]+320 { rotod[rotoord]=1 } else { rotod[rotoord]=0 }
            for (i=0; i<rotoc[rotoord]; i+=1) {
               draw_sprite(s_troopagoldfly,floor(testani) mod 2,x+16+(rotor[rotoord])*sin(degtorad(rotoa[rotoord]+90+(360/rotoc[rotoord])*i+global.EDtest)),y+16+(rotor[rotoord])*cos(degtorad(rotoa[rotoord]+90+(360/rotoc[rotoord])*i+global.EDtest)))
            }
            testani+=0.08
            if rotor[rotoord] <= 150 {
            global.EDtest-=(rotod[rotoord]*2-1)
            } else { global.EDtest-=(rotod[rotoord]*2-1)*(150/rotor[rotoord]) }
            draw_circle(x+16,y+16,rotor[rotoord],true)
            if keyboard_check(global.key_submenu) && global.picking = false{var ratio,angle;
            ratio=get_integer('Set the radius.',rotor[rotoord])
            angle=get_integer('Set the angle.',rotoa[rotoord])
            agcount=get_integer('Set the count.',rotoc[rotoord])
            agdir=get_integer('Set the direction.(0=Anti-Clockwise, 1=Clockwise)',rotod[rotoord])
            rotor[rotoord]=floor(min(ratio,6000))
            rotoa[rotoord]=floor(min(angle,360))
            rotoc[rotoord]=floor(min(agcount,360))
            rotod[rotoord]=floor(min(max(agdir,0),1))
            o_edmain.wiatrak=0
            test2=2
            o_edmain.kliknieto=1
/*if mouse_check_button(mb_left) {
            o_edmain.wiatrak=0
            test2=2
            o_edmain.kliknieto=1
}*/

            }
            }

    if test2=2
       {
         draw_circle(x+16,y+16,rotor[rotoord],true)
            for (i=0; i<rotoc[rotoord]; i+=1) {
               draw_sprite(s_troopagoldfly,1,x+16+(rotor[rotoord])*sin(degtorad(rotoa[rotoord]+90+(360/rotoc[rotoord])*i)),y+16+(rotor[rotoord])*cos(degtorad(rotoa[rotoord]+90+(360/rotoc[rotoord])*i)))
}
         draw_set_color(c_white)
         draw_set_font(cyferkimario)

       }

}

if coto=35
{
    if test2=1
    {
        if mouse_y < y
        {
            draw_line(x+16,y,x+16,floor((mouse_y)/32)*32)
            draw_sprite_ext(s_enemiesbank,34,x+16,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)
            jumph=y-(floor((mouse_y)/32)*32)
            if keyboard_check(global.key_submenu)&& global.picking = false
            {
                var height;
                height=get_integer('Set the height.',96)
                jumph=max(1,height)
                jumph=min(jumph,999)
                o_edmain.wiatrak=0
                test2=2
                o_edmain.kliknieto=1
            }
        }
    }
    if test2=2
    {
    // 摆好后指向跳乌龟并按下shift时修改高度
        if test2=2&& mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 &&keyboard_check(global.key_submenu) && global.picking = false
        {
                var height;
                height=get_integer('Set the height.',jumph)
                jumph=max(1,height)
                jumph=min(jumph,999)
                o_edmain.wiatrak=0
                test2=2
                o_edmain.kliknieto=1
        }
        draw_line(x+16,y,x+16,y-jumph)
        draw_sprite_ext(s_enemiesbank,34,x+16,y-jumph+32,1,1,0,c_white,0.5)
    }
}

if coto=40 && test2=2//游鱼
{
    if !end_mark{//create end_mark
        fofo_end = instance_create(fishendX,fishendY,o_range_end)
        fofo_end.start = id
        fofo_end.costawia = 2
        fofo_end.label = "fish"
        end_mark = 1
    }

    if fishendY<y{fishendY=y}
    if fishendX>=x{
        draw_sprite_ext(s_swimfishbegin,type,x,y,1,1,0,c_white,1)
        draw_sprite_ext(s_swimfishend,type,fishendX,fishendY,1,1,0,c_white,1)
        if type<2{draw_set_color(make_color_rgb(173,16,0))}else{draw_set_color(make_color_rgb(40,173,0))}
        draw_rectangle(x,y,fishendX+31,fishendY+31,1)
        draw_sprite(s_fishlabel,type,max(min(fishendX,view_xview),x),max(min(fishendY,view_yview),y-16))
    }else{
        draw_sprite_ext(s_swimfishbegin,type,x+31,y,-1,1,0,c_white,1)
        draw_sprite_ext(s_swimfishend,type,fishendX+31,fishendY,-1,1,0,c_white,1)
        if type<2{draw_set_color(make_color_rgb(173,16,0))}else{draw_set_color(make_color_rgb(40,173,0))}
        draw_rectangle(fishendX,y,x+31,fishendY+31,1)
        draw_sprite(s_fishlabel,type,max(min(x,view_xview),fishendX),max(min(fishendY,view_yview),y-16))
    }
    draw_set_color(c_white)
    // 摆好后指向鱼并按下shift时修改样式
    if (mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32)||(mouse_x>fishendX && mouse_x<fishendX+32 && mouse_y>fishendY && mouse_y<fishendY+32) &&keyboard_check(global.key_submenu) && global.picking = false
    {
        var menustr, fishmenu;
        menustr='Red Cheep Cheep(level 1)|Red Cheep Cheep(level 2)|Green Cheep Cheep'
        fishmenu=show_menu(menustr,-1)
        if fishmenu != -1{type=fishmenu}
    }
    //削除鱼的终点
    if mouse_x>=fishendX&&mouse_x<fishendX+32&&mouse_y>=fishendY&&mouse_y<fishendY+32&&mouse_x>0&&mouse_y>0&&mouse_check_button(mb_right)
    && o_edmain.wiatrak=0 && o_edmain.menujesie=0 && o_edmain.wlaczonaopcja=0 && (o_edmain.costawia2=40 || global.deletemode=1){instance_destroy()}
}
if coto=41 && test2=2//飞鱼
{
    if !end_mark{//create end_mark
        fofo_end = instance_create(fishendX,fishendY,o_range_end)
        fofo_end.start = id
        fofo_end.costawia = 2
        fofo_end.label = "fish"
        end_mark = 1
    }
    if fishendY<y{fishendY=y}
    if fishendX>=x{
        draw_sprite_ext(s_flyfishbegin,type,x+1,y,1,1,0,c_white,1)
        draw_sprite_ext(s_flyfishend,type,fishendX+1,fishendY,1,1,0,c_white,1)
        if type<2{draw_set_color(make_color_rgb(173,16,0))}else{draw_set_color(make_color_rgb(0,85,173))}
        draw_rectangle(x,y,fishendX+31,fishendY+31,1)
        draw_sprite(s_fishlabel,type+3,max(min(fishendX,view_xview),x),max(min(fishendY,view_yview),y-16))
    }else{
        draw_sprite_ext(s_flyfishbegin,type,x+32,y,-1,1,0,c_white,1)
        draw_sprite_ext(s_flyfishend,type,fishendX+32,fishendY,-1,1,0,c_white,1)
        if type<2{draw_set_color(make_color_rgb(173,16,0))}else{draw_set_color(make_color_rgb(0,85,173))}
        draw_rectangle(fishendX,y,x+31,fishendY+31,1)
        draw_sprite(s_fishlabel,type+3,max(min(x,view_xview),fishendX),max(min(fishendY,view_yview),y-16))
    }
    draw_set_color(c_white)
    // 摆好后指向鱼并按下shift时修改样式
    if (mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32)||(mouse_x>fishendX && mouse_x<fishendX+32 && mouse_y>fishendY && mouse_y<fishendY+32) &&keyboard_check(global.key_submenu) && global.picking = false
    {
        var menustr, fishmenu;
        menustr='Red Cheep Cheep(level 1)|Red Cheep Cheep(level 2)|Blue Cheep Cheep'
        fishmenu=show_menu(menustr,-1)
        if fishmenu != -1{type=fishmenu}
    }
    //削除鱼的终点
    if mouse_x>=fishendX&&mouse_x<fishendX+32&&mouse_y>=fishendY&&mouse_y<fishendY+32&&mouse_x>0&&mouse_y>0&&mouse_check_button(mb_right)
    && o_edmain.wiatrak=0 && o_edmain.menujesie=0 && o_edmain.wlaczonaopcja=0 && (o_edmain.costawia2=41 || global.deletemode=1){instance_destroy()}
}

if coto=43{
    draw_shell(shell_type,0);
}
if coto=17 || coto=22 || coto=37{
    draw_spike(coto,spike_type,0);
}
/*for (i=0;i<rotoord;i+=1) {
  if string_length(rotor[i]) > 3 { rotor[i]=real_length(rotor[i],3) }
  if string_length(rotoa[i]) > 3 { rotoa[i]=real_length(rotoa[i],3) }
  if string_length(rotos[i]) > 3 { rotos[i]=real_length(rotos[i],3) }
  if string_length(rotoc[i]) > 3 { rotoc[i]=real_length(rotoc[i],3) }
  if rotoc[i]>360 {rotoc[i]=360}
  if rotoc[i]<=0 {rotoc[i]=1}
  if string_length(rotod[i]) > 1 { rotod[i]=real_length(rotod[i],1) }
  if rotod[i]<0 {rotod[i]=0}
  if rotod[i]>1 {rotod[i]=1}
}*/

//uabf mwjq
//if string_length(string(rotor[rotoord]))>3 {rotor[rotoord]=floor(rotor[rotoord])}
//if string_length(string(rotos[rotoord]))>3 {rotos[rotoord]=floor(rotos[rotoord])}
//if string_length(string(rotoa[rotoord]))>3 {rotoa[rotoord]=floor(rotoa[rotoord])}


/*if x=o_acc.x && y=o_acc.y && o_acc.visible=1 && o_edmain.drinkability=2 {
draw_set_color(c_white)
draw_set_font(cyferkimario)
draw_text(view_xview[0]+530,view_yview[0]+468,'('+string(x)+','+string(y)+')')
deltax=x mod 32
deltay=y mod 32
if deltax>16 {deltax-=32}
if deltay>16 {deltay-=32}
if deltax>0 && deltay>0 {draw_text(view_xview[0]+16,view_yview[0]+468,'(+'+string(deltax)+',+'+string(deltay)+')')}
if deltax>0 && deltay<=0 {draw_text(view_xview[0]+16,view_yview[0]+468,'(+'+string(deltax)+','+string(deltay)+')')}
if deltax<=0 && deltay>0 {draw_text(view_xview[0]+16,view_yview[0]+468,'('+string(deltax)+',+'+string(deltay)+')')}
if deltax<=0 && deltay<=0 {draw_text(view_xview[0]+16,view_yview[0]+468,'('+string(deltax)+','+string(deltay)+')')}
}
if fishendX=o_acc.x && fishendY=o_acc.y && o_acc.visible=1 && o_edmain.drinkability=2 {
draw_set_color(c_white)
draw_set_font(cyferkimario)
draw_text(view_xview[0]+530,view_yview[0]+468,'('+string(fishendX)+','+string(fishendY)+')')
deltax=fishendX mod 32
deltay=fishendY mod 32
if deltax>16 {deltax-=32}
if deltay>16 {deltay-=32}
if deltax>0 && deltay>0 {draw_text(view_xview[0]+16,view_yview[0]+468,'(+'+string(deltax)+',+'+string(deltay)+')')}
if deltax>0 && deltay<=0 {draw_text(view_xview[0]+16,view_yview[0]+468,'(+'+string(deltax)+','+string(deltay)+')')}
if deltax<=0 && deltay>0 {draw_text(view_xview[0]+16,view_yview[0]+468,'('+string(deltax)+',+'+string(deltay)+')')}
if deltax<=0 && deltay<=0 {draw_text(view_xview[0]+16,view_yview[0]+468,'('+string(deltax)+','+string(deltay)+')')}
}*/
