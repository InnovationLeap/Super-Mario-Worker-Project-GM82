#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed=0
activated=1
kill_type=0
state=-round(random(100))
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

//dabusi=1

shell_proof=1

// 发光位置微调
light_x = 0;
light_y = 8;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.level_complete=0 {

    if activated=1 {
        // chodzenie
        image_index+=0.1

        if state<100 {state+=1}
        if state>=100 && state<150 {state+=1; y+=1}
        if state>=150 && state<300 {state+=1}
        if state=300 && x>o_marker.x && x-64>o_marker.x {state=301}
        if state=300 && x<o_marker.x && x+64<o_marker.x {state=301}
        if state>=301 && state<351 {state+=1; y-=1}
        if state=351 {state=0}
    }
    // uppercut i zwykla smierc
    //if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
    //if rodzajzabicia=1 {instance_destroy();instance_create(x,y,o_punkciornik)}
/*
if rodzajzabicia=5 {instance_destroy();lolo=instance_create(x,y,o_punkciornik); lolo.image_index=0;if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}
*/
    if kill_type=2 {instance_destroy();}

}
