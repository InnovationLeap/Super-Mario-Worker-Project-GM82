#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grawitacja=0
sekwencja=0
energia=0
image_speed=0
kierunek=-1
aktywowany=0
rodzajzabicia=0
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok


// 发光位置微调
/*light_x = 0;
light_y = 0;
light_radius = 1;*/

light_create = false;
fofolight = noone;
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
        if x>=o_marker.x {kierunek=-1}
        }
    }

if aktywowany=1 {
if (!global.newsmooth){
// spadanie
if sekwencja=0 && !place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,o_pointblock) {sekwencja=1}
if sekwencja=1 {grawitacja+=0.5; y+=grawitacja}
if sekwencja=1 && (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,o_pointblock)) && !place_meeting(x,y,o_uppercut) {grawitacja=0; sekwencja=2;}
while sekwencja=2 && (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1}
if (!place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock)) {sekwencja=0}

// chodzenie
if kierunek=-1 && (!place_meeting(x-1,y,obj_wall) || !place_meeting(x-1,y,o_pointblock)) {x-=1;}
if kierunek=1 && (!place_meeting(x+1,y,obj_wall) || !place_meeting(x+1,y,o_pointblock)) {x+=1;}
if place_meeting(x+1,y,obj_wall) || place_meeting(x-1,y,obj_wall) || place_meeting(x+1,y,o_pointblock) || place_meeting(x-1,y,o_pointblock) || place_meeting(x-1,y,o_shyguy) || place_meeting(x+1,y,o_shyguy){kierunek=kierunek*-1}
image_index+=0.1
}
else{
basic_movement(1,0.1,0,0);
}
}

// uppercut i zwykla smierc
if rodzajzabicia=1 {instance_destroy(); instance_create(x,y+10,o_goombadead); instance_create(x,y,o_punkciornik)}
if rodzajzabicia=2 {instance_destroy(); instance_create(x,y,o_goombadead2);}
if rodzajzabicia=5 || rodzajzabicia=4 || rodzajzabicia=3 {instance_destroy(); instance_create(x,y,o_goombadead2); lolo=instance_create(x,y,o_punkciornik); lolo.image_index=0;if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}  }

if place_meeting(x+1,y,o_goomba)

// niszcz po za ekranem
if y>room_height[0]+64 {instance_destroy()}
}

// light
if (!light_create) {
    fofolight = instance_create(0, 0, o_lightgoomba);
    light_create = true;
}

if (instance_exists(fofolight)) {
    if (instance_exists(self)) {
        fofolight.x = x;
        fofolight.y = y;
    } else {
        fofolight.x = -1000;
        fofolight.y = -1000;
        fofolight.destroy = true;
    }
}
