#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=0
drink=0
lockon=0
target=0
deltax=0
deltay=0
cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check_pressed(global.key_select){lockon=1;}

if lockon=1{
    switch(o_edmain.drinkability){
        case 2:target = instance_position(mouse_x,mouse_y,o_edenemyblock);
               if !target{
                   temp_target = instance_position(mouse_x,mouse_y,o_range_end)
                   if temp_target{
                       if temp_target.costawia = 2 { target = temp_target; target.activated = 1}
                   }
               }
               break;
        case 3:target = instance_position(mouse_x,mouse_y,o_edsceneriesblock);break;
        case 4:if(o_edmain.costawia4=1){
                   target = instance_position(mouse_x,mouse_y,o_edpassage);
               }
               else{
                   target = instance_position(mouse_x,mouse_y,o_edmarkerblock);
                   if !target{
                       temp_target = instance_position(mouse_x,mouse_y,o_range_end)
                       if temp_target{
                           if temp_target.costawia = 4 { target = temp_target; target.activated = 1}
                       }
                   }
               }
               break;
        case 5:target = instance_position(mouse_x,mouse_y,o_edbonusesblock);break;
    }

    if target{lockon=2}
    else{
        with(o_edpassage){
        if other.lockon=1{
            if mouse_x>=exitx && mouse_x<exitx+32 && mouse_y>=exity && mouse_y<exity+32{
                other.target = id
                other.lockon = 3;
            }
        }
        }
    }
    if lockon=1{lockon=0}
}

if lockon=2{
    visible=1;
    x = target.x
    y = target.y
    if keyboard_check(vk_up) || keyboard_check(vk_down) || keyboard_check(vk_left) || keyboard_check(vk_right)
    {drink+=1}


    if drink<=10{
        if keyboard_check_pressed(vk_up){target.y-=1;y-=1;with(target){if(coto=32)water_endY-=1;if(coto=34)camera_endY-=1;if(coto=40 || coto=41)fishendY-=1;}}
        if keyboard_check_pressed(vk_down){target.y+=1;y+=1;with(target){if(coto=32)water_endY+=1;if(coto=34)camera_endY+=1;if(coto=40 || coto=41)fishendY+=1;}}
        if keyboard_check_pressed(vk_left){target.x-=1;x-=1;with(target){if(coto=32)water_endX-=1;if(coto=34)camera_endX-=1;if(coto=40 || coto=41)fishendX-=1;}}
        if keyboard_check_pressed(vk_right){target.x+=1;x+=1;with(target){if(coto=32)water_endX+=1;if(coto=34)camera_endX+=1;if(coto=40 || coto=41)fishendX+=1;}}
        if keyboard_check_pressed(ord('R')){target.y-=16;y-=16;with(target){if(coto=32)water_endY-=16;if(coto=34)camera_endY-=16;if(coto=40 || coto=41)fishendY-=16;}}
        if keyboard_check_pressed(ord('F')){target.y+=16;y+=16;with(target){if(coto=32)water_endY+=16;if(coto=34)camera_endY+=16;if(coto=40 || coto=41)fishendY+=16;}}
        if keyboard_check_pressed(ord('D')){target.x-=16;x-=16;with(target){if(coto=32)water_endX-=16;if(coto=34)camera_endX-=16;if(coto=40 || coto=41)fishendX-=16;}}
        if keyboard_check_pressed(ord('G')){target.x+=16;x+=16;with(target){if(coto=32)water_endX+=16;if(coto=34)camera_endX+=16;if(coto=40 || coto=41)fishendX+=16;}}
    }
    if drink>10{
        if keyboard_check(vk_up){target.y-=1;y-=1;with(target){if(coto=32)water_endY-=1;if(coto=34)camera_endY-=1;if(coto=40 || coto=41)fishendY-=1;}}
        if keyboard_check(vk_down){target.y+=1;y+=1;with(target){if(coto=32)water_endY+=1;if(coto=34)camera_endY+=1;if(coto=40 || coto=41)fishendY+=1;}}
        if keyboard_check(vk_left){target.x-=1;x-=1;with(target){if(coto=32)water_endX-=1;if(coto=34)camera_endX-=1;if(coto=40 || coto=41)fishendX-=1;}}
        if keyboard_check(vk_right){target.x+=1;x+=1;with(target){if(coto=32)water_endX+=1;if(coto=34)camera_endX+=1;if(coto=40 || coto=41)fishendX+=1;}}
    }

    if !keyboard_check(vk_up) && !keyboard_check(vk_down) && !keyboard_check(vk_left) && !keyboard_check(vk_right)
    {drink=0}
}

if lockon=3{
    visible=1;
    x = target.exitx
    y = target.exity
    if keyboard_check(vk_up) || keyboard_check(vk_down) || keyboard_check(vk_left) || keyboard_check(vk_right)
    {drink+=1}
    if drink<=10{
        if keyboard_check_pressed(vk_up){target.exity-=1;y-=1;}
        if keyboard_check_pressed(vk_down){target.exity+=1;y+=1;}
        if keyboard_check_pressed(vk_left){target.exitx-=1;x-=1;}
        if keyboard_check_pressed(vk_right){target.exitx+=1;x+=1;}
        if keyboard_check_pressed(ord('R')){target.exity-=16;y-=16;}
        if keyboard_check_pressed(ord('F')){target.exity+=16;y+=16;}
        if keyboard_check_pressed(ord('D')){target.exitx-=16;x-=16;}
        if keyboard_check_pressed(ord('G')){target.exitx+=16;x+=16;}
    }
    if drink>10{
        if keyboard_check(vk_up){target.exity-=1;y-=1;}
        if keyboard_check(vk_down){target.exity+=1;y+=1;}
        if keyboard_check(vk_left){target.exitx-=1;x-=1;}
        if keyboard_check(vk_right){target.exitx+=1;x+=1;}
    }
    if !keyboard_check(vk_up) && !keyboard_check(vk_down) && !keyboard_check(vk_left) && !keyboard_check(vk_right)
    {drink=0}
}

if keyboard_check_released(global.key_select){lockon=0;target=0;visible=0;/*check_double=true;sixteen=false*/}

/*if check_double && !keyboard_check(global.key_select){
    timer +=1 ;
}

if  timer>3 { timer=0; check_double=false }

if check_double && keyboard_check(global.key_select) && lockon>=2{
    timer = 0;
    sixteen = true;
    check_double = false;
}*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(s_acc,0,x,y)
draw_set_color(c_white)
draw_set_font(cyferkimario)
if lockon>=2{
    draw_set_halign(fa_right)
    draw_text(view_xview[0]+640,view_yview[0]+468,'('+string(x)+','+string(y)+')')
    draw_set_halign(fa_left)
    deltax=x mod 32
    deltay=y mod 32
    if deltax>16 {deltax-=32}
    if deltay>16 {deltay-=32}
    if deltax>0 && deltay>0 {draw_text(view_xview[0]+16,view_yview[0]+468,'(+'+string(deltax)+',+'+string(deltay)+')')}
    if deltax>0 && deltay<=0 {draw_text(view_xview[0]+16,view_yview[0]+468,'(+'+string(deltax)+','+string(deltay)+')')}
    if deltax<=0 && deltay>0 {draw_text(view_xview[0]+16,view_yview[0]+468,'('+string(deltax)+',+'+string(deltay)+')')}
    if deltax<=0 && deltay<=0 {draw_text(view_xview[0]+16,view_yview[0]+468,'('+string(deltax)+','+string(deltay)+')')}
}
