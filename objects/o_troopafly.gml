#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed=0
dir=-1
activated=0
kill_type=0
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok



// 发光位置微调
light_x = 0;
light_y = -4;
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
            // chodzenie

            if dir=-1 && !place_meeting(x-1,y,obj_wall) && !place_meeting(x-1,y,o_pointblock) {x-=1; image_xscale=-1}
            if dir=1 && !place_meeting(x+1,y,obj_wall) && !place_meeting(x+1,y,o_pointblock) {x+=1; image_xscale=1}
            if place_meeting(x+1,y,obj_wall) || place_meeting(x-1,y,obj_wall) || place_meeting(x+1,y,o_pointblock) || place_meeting(x-1,y,o_pointblock) {dir=dir*-1}
            image_index+=0.1
        } else {
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
    //if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
    if kill_type=1 {instance_destroy(); instance_create(x,y,o_troopa);instance_create(x,y,o_scorepop)}
    if kill_type=7 {instance_destroy(); tmp=instance_create(x,y-1,o_troopashell2); tmp.tail_kicked=1; tmp.is_flipped=1; tmp.grav=-11; tmp.dir=dir; instance_create(x,y,o_scorepop)}
    if kill_type=3 || kill_type=4 || kill_type=5 {instance_destroy(); instance_create(x,y,o_troopadead); tmp=instance_create(x,y,o_scorepop); tmp.image_index=0;if global.sample=1 {tmp2=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)}}
    if kill_type=2 {instance_destroy(); instance_create(x,y,o_troopadead);}

}
