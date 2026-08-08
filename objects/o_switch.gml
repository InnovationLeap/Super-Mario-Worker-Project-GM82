#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
color=0
setup=0
bumped = 0
avoid2=0

state=0;
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
    bumped = 1;
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

if bumped=1 && setonce=0 {
    instance_create(x,y-32,o_uppercut)
    global.yinyang_status[color]*=-1;
    with(o_yinyang) {
        if (color = other.color) {
            if floor(pre_index/2)=pre_index/2 {pre_index+=1;} else {pre_index-=1;}
            if !overlapped {image_index=pre_index}
        }
    }
    if(global.advswitch) {
        switch(color) {
        case 0: switch(global.lava) {
        case 0: global.lava=1;break;
        case 1: global.lava=0;break;
        }break;
        case 1: with(o_point) {
                tmp2=instance_create(x,y,o_pointblock);
                tmp2.bonus=20;
                tmp2.avoid_change = 1;
                instance_destroy();
        }
            with(o_pointblock) {
                if(bonus=20 && !avoid_change) {
                    instance_create(x,y,o_point);
                    instance_destroy();
                }
            }
            with(o_pointblock) {avoid_change=0;}
            break;

        case 2: with(o_troopashell) {
                kill_type=6;
                tmp6.avoid_change=1
        }
            with(o_troopashell2) {
                if(!avoid_change) {
                    kill_type=6;
                }
            }
            with(o_troopashell2) {avoid_change=0;}
            break;

        case 3: with(o_windas) {
                if(abs(dir)=1) {dir*=-1;} else {colspeed*=-1;}
                switch(type mod 6) {
                case 4: type+=1;break;
                case 5: type-=1;break;
                }
        }
            break;

        case 4: if(global.water_level<1000000 && avoid2=0) {
                global.water_height_record2 = global.water_level
                global.water_level=1000000
        } else {global.water_level=global.water_height_record2;avoid2=1}
            break;

        case 5: with(o_roto) {hspd*=-1};break;

        case 6: //0
            switch(global.lava) {
            case 0: global.lava=1;break;
            case 1: global.lava=0;break;
            }
            //1
            with(o_point) {
                tmp2=instance_create(x,y,o_pointblock);
                tmp2.bonus=20;
                tmp2.avoid_change = 1;
                instance_destroy();
            }
            with(o_pointblock) {
                if(bonus=20 && !avoid_change) {
                    instance_create(x,y,o_point);
                    instance_destroy();
                }
            }
            with(o_pointblock) {avoid_change=0;}
            //2
            with(o_troopashell) {
                kill_type=6;
                tmp6.avoid_change=1
            }
            with(o_troopashell2) {
                if(!avoid_change) {
                    kill_type=6;
                }
            }
            with(o_troopashell2) {avoid_change=0;}
            //3
            with(o_windas) {
                if(abs(dir)=1) {dir*=-1;} else {colspeed*=-1;}
                switch(type mod 6) {
                case 4: type+=1;break;
                case 5: type-=1;break;
                }
            }
            //4
            if(global.water_level<1000000 && avoid2=0) {
                global.water_height_record2 = global.water_level
                global.water_level=1000000
            } else {global.water_level=global.water_height_record2;avoid2=1}
            //5
            with(o_roto) {hspd*=-1}
            break;

        case 7: for(i=0;i<6;i+=1) {
                global.yinyang_status[i]*=-1;
        }
            with(o_yinyang) {
                if(color<6) {
                    if floor(pre_index/2)=pre_index/2 {pre_index+=1;} else {pre_index-=1;}
                    if !overlapped {image_index=pre_index}
                }
            }break;
        }
    }
    if global.beep {
        tmp2=sound_play(snd_switch);
        sound_volume(snd_switch,global.game_volume)
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
if bumped=0 {
    if !global.assist || o_assist.ani_count<20 {
        draw_sprite(s_pointblock6,color+8*global.assist,x,y)
    }
    if global.assist && o_assist.ani_count>=20 {
        draw_sprite(s_pointblock7,color+8*global.assist,x,y);
    }
} else {
    if state<10 {draw_sprite_ext(s_pointblock7,color+8*global.assist,x,y-state*2,1,1,0,c_white,1); state+=1; }
    if state>=10 && state<20 {draw_sprite_ext(s_pointblock7,color+8*global.assist,x,y-40+state*2,1,1,0,c_white,1); state+=1; }
    if state=20 {bumped=0;state=0;setonce=0}
}
