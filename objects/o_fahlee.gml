#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grav=0
state=0

image_speed=0
dir=-1
activated=0
kill_type=0
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

shell_proof=1

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
if global.pauza=0 && global.level_complete=0 {

    if activated=0 {
        if x>view_xview[0]-100 && x<view_xview[0]+740 && y>view_yview[0]-100 && y<view_yview[0]+580 {
            activated=1
            if x<o_marker.x {dir=1}
            if x>=o_marker.x {dir=-1;image_xscale=-1}
        }
    }

    if activated=1 {
        if (!global.newsmooth) {
            // spadanie
            if state=0 && !place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,o_pointblock) {state=1}
            if state=1 {grav+=0.5; y+=grav}
            // ceiling check (after gravity, at y-1, blue-koopa style)
            if grav<0 && (place_meeting(x,y-1,obj_wall)||place_meeting(x,y-1,obj_static)||place_meeting(x,y-1,o_pointblock)||place_meeting(x,y-1,o_pointblock2)||place_meeting(x,y-1,o_breakblock)) {
                grav=0
                while place_meeting(x,y,obj_wall)||place_meeting(x,y,obj_static)||place_meeting(x,y,o_pointblock)||place_meeting(x,y,o_pointblock2)||place_meeting(x,y,o_breakblock) {y+=1}
            }
            if state=1 && grav>=0 && (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,o_pointblock)) && !place_meeting(x,y,o_uppercut) {grav=0; state=2;}
            while state=2 && (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,o_pointblock)) {y-=1}
            if (!place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock)) {state=0}

            // chodzenie
            if dir=-1 && (!place_meeting(x-1,y,obj_wall) || !place_meeting(x-1,y,o_pointblock)) {x-=1;image_xscale=-1}
            if dir=1 && (!place_meeting(x+1,y,obj_wall) || !place_meeting(x+1,y,o_pointblock)) {x+=1;image_xscale=1}
            if place_meeting(x+1,y,obj_wall)|| place_meeting(x+1,y,o_pointblock) {dir=-1;x-=1}
            if place_meeting(x-1,y,obj_wall)|| place_meeting(x-1,y,o_pointblock) {dir=1;x+=1}
            image_index+=0.1
        } else {
            // inline basic_movement with blue-koopa style ceiling protection
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
                // ceiling check (after gravity, at y-1 = one pixel above new position)
                if grav<0 && (place_meeting(x,y-1,obj_wall)||place_meeting(x,y-1,obj_static)||place_meeting(x,y-1,o_pointblock)||place_meeting(x,y-1,o_pointblock2)||place_meeting(x,y-1,o_breakblock)) {
                    grav=0
                    while place_meeting(x,y,obj_wall)||place_meeting(x,y,obj_static)||place_meeting(x,y,o_pointblock)||place_meeting(x,y,o_pointblock2)||place_meeting(x,y,o_breakblock) {y+=1}
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
            // walking (mirrors basic_movement with argument3=1 for flip)
            if dir=1 {
                if (place_meeting(x+1,y,obj_wall)|| place_meeting(x+1,y,o_pointblock)) {dir=-1;x-=1;image_xscale=-1} else {
                    x+=1;
                }
            } else {
                if (place_meeting(x-1,y,obj_wall)|| place_meeting(x-1,y,o_pointblock)) {dir=1;x+=1;image_xscale=1} else {
                    x-=1;
                }
            }
            image_index+=0.1
        }
    }
    // uppercut i zwykla smierc
    //if rodzajzabicia=1 {instance_destroy(); instance_create(x,y,o_fahdead); instance_create(x,y,o_punkciornik)}
    // tail bounce handled directly in raccoon_tail_hit_check (no rodzajzabicia)
    if kill_type=5 {instance_destroy(); instance_create(x,y,o_fahleedead); tmp=instance_create(x,y,o_scorepop); tmp.image_index=0;if global.sample=1 {tmp2=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)}}
    if kill_type=2 {instance_destroy(); instance_create(x,y,o_fahleedead);}




    // niszcz po za ekranem
    if y>room_height[0]+64 {instance_destroy()}
}
