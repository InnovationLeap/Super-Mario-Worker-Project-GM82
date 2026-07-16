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




angle=0
aspeed=0.03
ys=y

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

if x < o_marker.x { image_xscale = 1 } else { image_xscale = -1 }
image_index+=0.1

y=ys+50*cos(angle)
angle += aspeed

// uppercut i zwykla smierc
//if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
if rodzajzabicia=1 {instance_destroy(); instance_create(x,y,o_troopared);instance_create(x,y,o_punkciornik)}
if rodzajzabicia=3 || rodzajzabicia=4 || rodzajzabicia=5 {instance_destroy(); redduj=instance_create(x,y,o_troopadead); lolo=instance_create(x,y,o_punkciornik); lolo.image_index=0;redduj.sprite_index=s_trooparedshell; redduj.czerwona=czerwona;if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}
if rodzajzabicia=2 {instance_destroy(); redduj=instance_create(x,y,o_troopadead);redduj.sprite_index=s_trooparedshell; redduj.czerwona=czerwona}

}
