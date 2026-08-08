#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grav=0
state=0
//if hardshell=0 {energia=0}
//else {energia=23333333333}
image_speed=0
dir=1
activated=0
kill_type=0
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok
shell_kind=0
hurt_delay=10
setonce=0
offset=0
single=0
tail_kicked=0
is_flipped=0

// 发光位置微调
light_x = 0;
light_y = 0;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !setonce {
    if shell_kind=4 {sprite_index=s_spinyshell;hardshell=0;shell_proof=1} else if hardshell=1 {sprite_index=s_buzzyshell;shell_proof=1} else {
        switch(shell_kind) {
        case 0: sprite_index=s_troopashell;break;
        case 1: sprite_index=s_trooparedshell;break;
        case 2: sprite_index=s_troopablueshell;break;
        case 3: sprite_index=s_troopashellgold;break;
        }
    }
    if(offset) {x+=16;y+=18;offset=0}
    setonce=1
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//静止龟壳
if global.pauza=0 && global.level_complete=0 {
    // is_flipped drives image_yscale (upside-down state)
    if is_flipped=1 {image_yscale=-1} else {image_yscale=1}
    if hurt_delay>0 {hurt_delay-=1}
    if activated=0 {
        if x>view_xview[0]-100 && x<view_xview[0]+740 && y>view_yview[0]-100 && y<view_yview[0]+580 {
            activated=1
        }
    }
    if activated=1 {
        // tail attack: kicked shell physics
        if tail_kicked=1 {
            // horizontal movement (speed 1.1)
            if dir=1 {
                if !place_meeting(x+1.1,y,obj_wall) && !place_meeting(x+1.1,y,o_pointblock) {x+=1.1} else {dir=-1}
            } else {
                if !place_meeting(x-1.1,y,obj_wall) && !place_meeting(x-1.1,y,o_pointblock) {x-=1.1} else {dir=1}
            }
            // gravity
            grav+=0.5; y+=grav
            // ceiling: if moving up and inside a block, push down out of it
            if grav<0 {
                while place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock) || place_meeting(x,y,obj_waall) || place_meeting(x,y,o_breakblock) || place_meeting(x,y,o_pointblock2) || place_meeting(x,y,obj_static) {y+=1; grav=0}
            }
            // landing: stop kick, revert to normal static shell
            if grav>0 {
                if place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,o_pointblock) {
                    grav=0; tail_kicked=0
                    while place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock) {y-=1}
                }
            }
            // static shell: no animation even when kicked
        } else {
            // normal static shell physics
            if state=0 {
                if !place_meeting(x,y+1,o_pointblock) {
                    if !place_meeting(x,y+1,obj_halfground) {
                        if !place_meeting(x,y+1,obj_wall) {
                            state=1;
                        }
                    }
                }
            }

            if state=1 {
                grav+=0.5; y+=grav
                // ceiling: if moving up and inside a block, push down out of it
                if grav<0 {
                    while place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock) || place_meeting(x,y,obj_waall) || place_meeting(x,y,o_breakblock) || place_meeting(x,y,o_pointblock2) || place_meeting(x,y,obj_static) {y+=1; grav=0}
                }
                if !place_meeting(x,y,o_uppercut) {
                    if (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,o_pointblock)) {
                        grav=0; state=2;
                    }
                }
            }

            while state=2 {
                if (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {
                    y-=1;
                } else {state=0;}
            }

        }
    }

    // uppercut i zwykla smierc
    if hardshell=0 {
        //if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
        if kill_type=6 {tmp2=instance_create(x,y,o_troopashell); tmp2.dir=dir; tmp2.shell_kind=shell_kind; tmp2.is_flipped=is_flipped; if shell_kind=1 {tmp2.sprite_index=s_trooparedshell}; if shell_kind=2{tmp2.sprite_index=s_troopablueshell}; if shell_kind=3{tmp2.sprite_index=s_troopashellgold}; if shell_kind=4{tmp2.sprite_index=s_spinyshell};instance_destroy();}
        if kill_type=2 {tmp=instance_create(x,y,o_troopadead);tmp.shell_kind=shell_kind; if shell_kind=1 {tmp.sprite_index=s_trooparedshell} ; if shell_kind=2{tmp.sprite_index=s_troopablueshell} ; if shell_kind=3{tmp.sprite_index=s_troopashellgold} ; if shell_kind=4{tmp.sprite_index=s_spinyshelldead};instance_destroy();}
        if kill_type=1 {tmp2=instance_create(x,y,o_troopashell); tmp2.dir=dir; tmp2.shell_kind=shell_kind;tmp2.single=single; tmp2.is_flipped=is_flipped; if shell_kind=1 {tmp2.sprite_index=s_trooparedshell}; if shell_kind=2{tmp2.sprite_index=s_troopablueshell}; if shell_kind=3{tmp2.sprite_index=s_troopashellgold}; if shell_kind=4{tmp2.sprite_index=s_spinyshell};instance_destroy();}
        if kill_type=3 || kill_type=4 || kill_type=5 {
            instance_destroy();
            shell_inst2=instance_create(x,y,o_troopadead);
            shell_inst2.shell_kind=shell_kind
            shell_inst2.dir=dir
            if shell_kind=1 {shell_inst2.sprite_index=s_trooparedshell}; if shell_kind=2{shell_inst2.sprite_index=s_troopablueshell}; if shell_kind=3{shell_inst2.sprite_index=s_troopashellgold}; if shell_kind=4{shell_inst2.sprite_index=s_spinyshelldead}
            tmp=instance_create(x,y,o_scorepop);
            tmp.image_index=0
            if global.sample=1 {tmp2=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)}
        }
    } else {
        //if place_meeting(x,y,o_uppercut) {energia-=23333333333333333; rodzajzabicia=0}//顶

        if kill_type=1 {
            instance_destroy();
            tmp=instance_create(x,y,o_troopashell);
            tmp.hardshell=1
            tmp.shell_proof=1
            tmp.sprite_index=s_buzzyshell;
            tmp.dir=dir;
            tmp.single = single;
            tmp.is_flipped=is_flipped;
            tmp.shell_kind=shell_kind;
    /*instance_create(x,y,o_punkciornik)*/
        }

        if kill_type=6 {
            instance_destroy();
            tmp=instance_create(x,y,o_troopashell);
            tmp.hardshell=1
            tmp.shell_proof=1
            tmp.sprite_index=s_buzzyshell;
            tmp.dir=dir;
            tmp.is_flipped=is_flipped;
            tmp.shell_kind=shell_kind;
        }

        if kill_type=5 {
            instance_destroy();
            tmp2=instance_create(x,y,o_troopadead);
            if shell_kind=4 {tmp2.sprite_index=s_spinyshelldead} else {tmp2.sprite_index=s_buzzyshell}
            tmp=instance_create(x,y,o_scorepop);
            tmp.image_index=0;
            if global.sample=1 {
                tmp2=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)
            }
        }//顶

        if kill_type=2 {
            instance_destroy();
            tmp=instance_create(x,y,o_troopadead);
            if shell_kind=4 {tmp.sprite_index=s_spinyshelldead} else {tmp.sprite_index=s_buzzyshell}}//龟壳
    }




    // niszcz po za ekranem
    if y>room_height[0]+64 {instance_destroy()}
}
