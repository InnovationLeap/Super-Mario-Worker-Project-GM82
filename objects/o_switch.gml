#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
color=0
setup=0
podbity = 0
avoid2=0

sekwencja=0;
setonce=0;

// 发光位置微调
light_x = 16;
light_y = 16;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x, y, o_thwompdetector) {
    podbity = 1;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*if setup=0{
    image_index = color
    setup=1
}*/

if podbity=1 && setonce=0{
    instance_create(x,y-32,o_uppercut)
    global.yinyang_status[color]*=-1;
    with(o_yinyang){
        if (color = other.color){
            if floor(pre_index/2)=pre_index/2 {pre_index+=1;}
            else{pre_index-=1;}
            if !overlapped{image_index=pre_index}
        }
    }
    if(global.advswitch){
    switch(color){
        case 0: switch(global.lava){
                    case 0: global.lava=1;break;
                    case 1: global.lava=0;break;
                }break;
        case 1: with(o_point){
                    fofo=instance_create(x,y,o_pointblock);
                    fofo.bonus=20;
                    fofo.avoid_change = 1;
                    instance_destroy();
                }
                with(o_pointblock){
                    if(bonus=20 && !avoid_change){
                        instance_create(x,y,o_point);
                        instance_destroy();
                    }
                }
                with(o_pointblock){avoid_change=0;}
                break;

        case 2: with(o_troopashell){
                    rodzajzabicia=6;
                    lolox.avoid_change=1
                }
                with(o_troopashell2){
                    if(!avoid_change){
                        rodzajzabicia=6;
                    }
                }
                with(o_troopashell2){avoid_change=0;}
                break;

        case 3: with(o_windas){
                    if(abs(kierunek)=1){kierunek*=-1;}
                    else{colspeed*=-1;}
                    switch(type mod 6){
                        case 4: type+=1;break;
                        case 5: type-=1;break;
                    }
                }
                break;

        case 4: if(global.poziomwody<1000000 && avoid2=0){
                    global.water_height_record2 = global.poziomwody
                    global.poziomwody=1000000
                }
                else{global.poziomwody=global.water_height_record2;avoid2=1}
                break;

        case 5: with(o_wiatrak){szybkosc*=-1};break;

        case 6: //0
                switch(global.lava){
                    case 0: global.lava=1;break;
                    case 1: global.lava=0;break;
                }
                //1
                with(o_point){
                    fofo=instance_create(x,y,o_pointblock);
                    fofo.bonus=20;
                    fofo.avoid_change = 1;
                    instance_destroy();
                }
                with(o_pointblock){
                    if(bonus=20 && !avoid_change){
                        instance_create(x,y,o_point);
                        instance_destroy();
                    }
                }
                with(o_pointblock){avoid_change=0;}
                //2
                with(o_troopashell){
                    rodzajzabicia=6;
                    lolox.avoid_change=1
                }
                with(o_troopashell2){
                    if(!avoid_change){
                        rodzajzabicia=6;
                    }
                }
                with(o_troopashell2){avoid_change=0;}
                //3
                with(o_windas){
                    if(abs(kierunek)=1){kierunek*=-1;}
                    else{colspeed*=-1;}
                    switch(type mod 6){
                        case 4: type+=1;break;
                        case 5: type-=1;break;
                    }
                }
                //4
                if(global.poziomwody<1000000 && avoid2=0){
                    global.water_height_record2 = global.poziomwody
                    global.poziomwody=1000000
                }
                else{global.poziomwody=global.water_height_record2;avoid2=1}
                //5
                with(o_wiatrak){szybkosc*=-1}
                break;

        case 7: for(i=0;i<6;i+=1){
                        global.yinyang_status[i]*=-1;
                }
                with(o_yinyang){
                    if(color<6){
                        if floor(pre_index/2)=pre_index/2 {pre_index+=1;}
                        else{pre_index-=1;}
                        if !overlapped{image_index=pre_index}
                    }
                }break;
    }
    }
    if global.beep{
        fofo=sound_play(snd_switch);
        sound_volume(snd_switch,global.glosnosc)
    }
    //podbity=0
    setonce=1
}
avoid2=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if podbity=0{
    if !global.assist || o_assist.ani_count<20{
        draw_sprite(s_pointblock6,color+8*global.assist,x,y)
    }
    if global.assist && o_assist.ani_count>=20{
        draw_sprite(s_pointblock7,color+8*global.assist,x,y);
    }
}
else{
    if sekwencja<10 {draw_sprite_ext(s_pointblock7,color+8*global.assist,x,y-sekwencja*2,1,1,0,c_white,1); sekwencja+=1; }
    if sekwencja>=10 && sekwencja<20 {draw_sprite_ext(s_pointblock7,color+8*global.assist,x,y-40+sekwencja*2,1,1,0,c_white,1); sekwencja+=1; }
    if sekwencja=20 {podbity=0;sekwencja=0;setonce=0}
}
