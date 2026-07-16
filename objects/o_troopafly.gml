#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed=0
kierunek=-1
aktywowany=0
rodzajzabicia=0
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok



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
if global.pauza=0 && global.etappokonany=0 {

if aktywowany=0
    {
        if x>view_xview[0]-100 && x<view_xview[0]+740 && y>view_yview[0]-100 && y<view_yview[0]+580
        {
        aktywowany=1
        if x<o_marker.x {kierunek=1}
        if x>=o_marker.x {kierunek=-1;image_xscale=-1}
        }
    }

if aktywowany=1{

if (!global.newsmooth){
// chodzenie

if kierunek=-1 && !place_meeting(x-1,y,obj_wall) && !place_meeting(x-1,y,o_pointblock) {x-=1; image_xscale=-1}
if kierunek=1 && !place_meeting(x+1,y,obj_wall) && !place_meeting(x+1,y,o_pointblock) {x+=1; image_xscale=1}
if place_meeting(x+1,y,obj_wall) || place_meeting(x-1,y,obj_wall) || place_meeting(x+1,y,o_pointblock) || place_meeting(x-1,y,o_pointblock) {kierunek=kierunek*-1}
image_index+=0.1
}
else{
if kierunek=1{
    if (place_meeting(x+1,y,obj_wall)|| place_meeting(x+1,y,o_pointblock)) {kierunek=-1;x-=1;image_xscale=-1}
    else{
        x+=1;
    }
}
else{
    if (place_meeting(x-1,y,obj_wall)|| place_meeting(x-1,y,o_pointblock)) {kierunek=1;x+=1;image_xscale=1}
    else{
        x-=1;
    }
}

image_index+=0.1
}
}

// uppercut i zwykla smierc
//if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
if rodzajzabicia=1 {instance_destroy(); instance_create(x,y,o_troopa);instance_create(x,y,o_punkciornik)}
if rodzajzabicia=3 || rodzajzabicia=4 || rodzajzabicia=5 {instance_destroy(); instance_create(x,y,o_troopadead); lolo=instance_create(x,y,o_punkciornik); lolo.image_index=0;if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}
if rodzajzabicia=2 {instance_destroy(); instance_create(x,y,o_troopadead);}

}
