#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed=0
aktywowany=1
rodzajzabicia=0
sekwencja=-round(random(100))
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

//dabusi=1

dasini=1

// 发光位置微调
light_x = 0;
light_y = 24;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.etappokonany=0 {

if aktywowany=1{
// chodzenie
image_index+=0.1

if sekwencja<100 {sekwencja+=1}
if sekwencja>=100 && sekwencja<150 {sekwencja+=1; y-=1}
if sekwencja>=150 && sekwencja<300 {sekwencja+=1}
if sekwencja=300 && x>o_marker.x && x-64>o_marker.x {sekwencja=301}
if sekwencja=300 && x<o_marker.x && x+64<o_marker.x {sekwencja=301}
if sekwencja>=301 && sekwencja<351 {sekwencja+=1; y+=1}
if sekwencja=351 {sekwencja=0}
}
// uppercut i zwykla smierc
//if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
//if energia<0 && rodzajzabicia=1 {instance_destroy();instance_create(x,y,o_punkciornik)}
/*
if rodzajzabicia=5 {instance_destroy();lolo=instance_create(x,y,o_punkciornik); lolo.image_index=0;if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}
*/
if rodzajzabicia=2 {instance_destroy();}

}
