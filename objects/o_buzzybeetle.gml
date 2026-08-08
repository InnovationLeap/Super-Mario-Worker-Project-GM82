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
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
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
            if x>=o_marker.x {dir=-1;image_xscale=-1;}
        }
    }

    if activated=1 {
        if (!global.newsmooth) {
            // spadanie
            if state=0 && !place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,o_pointblock) {state=1}
            if state=1 {grav+=0.5; y+=grav}
            if state=1 && (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,o_pointblock)) && !place_meeting(x,y,o_uppercut) {grav=0; state=2;}
            while state=2 && (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1}
            if (!place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock)) {state=0}

            // chodzenie
            if dir=-1 && (!place_meeting(x-1,y,obj_wall) || !place_meeting(x-1,y,o_pointblock)) {x-=1;image_xscale=-1}
            if dir=1 && (!place_meeting(x+1,y,obj_wall) || !place_meeting(x+1,y,o_pointblock)) {x+=1;image_xscale=1}
            if (place_meeting(x+1,y,obj_wall) || place_meeting(x+1,y,o_pointblock)) && dir=1 {dir=-1}
            if (place_meeting(x-1,y,obj_wall) || place_meeting(x-1,y,o_pointblock)) && dir=-1 {dir=1}
            image_index+=0.1
        } else {
            basic_movement(1,0.1,0,1);
        }
    }

    // uppercut i zwykla smierc
    //if place_meeting(x,y,o_uppercut) {energia-=23333333333333333; rodzajzabicia=0}//顶

    if kill_type=1 {
        instance_destroy();
        tmp=instance_create(x,y-0.5,o_troopashell2);
        tmp.sprite_index=s_buzzyshell;
        tmp.hardshell=1
        tmp.dir=dir;
        tmp.shell_proof=1
        //lolo.energia=23333333333
        instance_create(x,y,o_scorepop)}

    if kill_type=7 {
        instance_destroy();
        tmp=instance_create(x,y-0.5,o_troopashell2);
        tmp.sprite_index=s_buzzyshell;
        tmp.hardshell=1
        tmp.dir=dir;
        tmp.shell_proof=1
        tmp.tail_kicked=1
        tmp.is_flipped=1
        tmp.grav=-11
        instance_create(x,y,o_scorepop)}

    if kill_type=5 {
        instance_destroy();
        tmp2=instance_create(x,y,o_troopadead);
        tmp2.sprite_index=s_buzzyshell
        tmp=instance_create(x,y,o_scorepop);
        tmp.image_index=0;
        if global.sample=1 {tmp2=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)}}//顶

    if kill_type=2 {
        instance_destroy();
        tmp=instance_create(x,y,o_troopadead);
        tmp.sprite_index=s_buzzyshell}//龟壳




    // niszcz po za ekranem
    if y>room_height[0]+64 {instance_destroy()}
}
