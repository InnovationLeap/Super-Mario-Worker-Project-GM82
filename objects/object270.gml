#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed=0
dir=-1
activated=1
kill_type=0
vy_offset=-6
ball_state=0
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

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
if global.pauza=0 {

    if activated=1 {

        // y
        y+=vy_offset
        if vy_offset<8 {vy_offset+=0.5}



        // sprawdz czy moze sie w kolcozwierza zamienic

        if ball_state=0 && !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && vy_offset>0 {ball_state=1}
        if ball_state=1 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall)) {ball_state=2; y=floor(y)}
        while ball_state=2 && (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall)) {y-=1}
        if ball_state=2 && !place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y+1,obj_wall) {ball_state=3; instance_create(x-16,y-16,o_spiny); instance_destroy()}



        // chodzenie
        image_angle+=5

    }

    // uppercut i zwykla smierc
    //if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
    //if rodzajzabicia=1 {instance_destroy(); instance_create(x,y,o_kolcozwierzdead); instance_create(x,y,o_punkciornik)}
    if kill_type=3 || kill_type=4 || kill_type=5 {instance_destroy(); instance_create(x,y,o_spinydead); tmp=instance_create(x,y,o_scorepop); tmp.image_index=0;if global.sample=1 {tmp2=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)}}
    if kill_type=2 {instance_destroy(); instance_create(x,y,o_spinydead);}


    // niszcz po za ekranem
    if y>room_height[0]+64 {instance_destroy()}
}
