#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grav=0
state=0
hp=0
image_speed=0
dir=-1
activated=0
kill_type=0
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok
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
            if x>=o_marker.x {dir=-1}
        }
    }

    if activated=1 {

        if instance_place(x,y-2,o_marker) { //马里奥站在shyguy上
            tmp=instance_place(x,y-2,o_marker)
            tmp.winduje=id
            if tmp.winduje=id && global.rodzajmaria<>5 {
                with(tmp) {
                    if state=0 && !instance_place(x,y+1,obj_wall) && !instance_place(x,y+1,o_pointblock) && instance_place(x,y+1,o_shyguy) && slide=0 {
                        f_inst=instance_place(x,y+1,o_shyguy)
                        if f_inst.dir=-1 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 {x-=1;wxspeed=-1}
                        if f_inst.dir=1  && !instance_place(x-2,y,obj_wall) && !instance_place(x-2,y,o_pointblock) && x>16 {x+=1;wxspeed=1}
                    }
                }
            }
        }
        // spadanie
        if state=0 && !place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,o_pointblock) {state=1}
        if state=1 {
            grav+=0.5;
            if instance_place(x,y-2,o_marker) { //马里奥站在shyguy上
                tmp=instance_place(x,y-2,o_marker)
                tmp.winduje=id
                if tmp.winduje=id && global.rodzajmaria<>5 {
                    with(tmp) {
                        if state=0 && !instance_place(x,y+1,obj_wall) && !instance_place(x,y+1,o_pointblock) && instance_place(x,y+1,o_shyguy) && slide=0 {
                            f_inst=instance_place(x,y+1,o_shyguy)
                            y+=f_inst.grav;shift_speed=f_inst.grav
                        }
                    }
                }
            }
            y+=grav
        }
        if state=1 && (place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,o_pointblock)) {grav=0; state=2;}
        while state=2 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1}
        if (!place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock)) {state=0}

        // chodzenie
        if dir=-1 && (!place_meeting(x-1,y,obj_wall) || !place_meeting(x-1,y,o_pointblock)) {x-=1;}
        if dir=1 && (!place_meeting(x+1,y,obj_wall) || !place_meeting(x+1,y,o_pointblock)) {x+=1;}
        if place_meeting(x+1,y,obj_wall) || place_meeting(x-1,y,obj_wall) || place_meeting(x+1,y,o_pointblock) || place_meeting(x-1,y,o_pointblock) || place_meeting(x-1,y,o_shyguy) || place_meeting(x+1,y,o_shyguy) {dir=dir*-1}
        image_index+=0.1

    }

    // uppercut i zwykla smierc
    if kill_type=1 {instance_destroy(); instance_create(x,y+10,o_goombadead); instance_create(x,y,o_scorepop)}
    if kill_type=2 {instance_destroy(); instance_create(x,y,o_goombadead2);}
    if kill_type=5 || kill_type=4 || kill_type=3 {instance_destroy(); instance_create(x,y,o_goombadead2); tmp=instance_create(x,y,o_scorepop); tmp.image_index=0;if global.sample=1 {tmp2=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)} }

    if instance_place(x+1,y,o_goomba) {
        tmp=instance_place(x+1,y,o_goomba)
        with(tmp) {dir*=-1}
        dir*=-1
    }

    if instance_place(x-1,y,o_goomba) {
        tmp=instance_place(x-1,y,o_goomba)
        with(tmp) {dir*=-1}
        dir*=-1
    }

    // niszcz po za ekranem
    if y>room_height[0]+64 {instance_destroy()}
}
