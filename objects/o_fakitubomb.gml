#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed=0
kierunek=-1
aktywowany=1
rodzajzabicia=0
iyor=-6
bombowo=0
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

dasini=1

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

if aktywowany=1{

// y
y+=iyor
if iyor<8 {iyor+=0.5}



// sprawdz czy moze sie w kolcozwierza zamienic

if bombowo=0 && !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && iyor>0 {bombowo=1}
if bombowo=1 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall)) {bombowo=2; y=floor(y)}
while bombowo=2 && (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall)) {y-=1}
if bombowo=2 && !place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y+1,obj_wall) {bombowo=3; instance_create(x,y,o_fahlee); instance_destroy()}



// chodzenie
image_angle+=5

}

// uppercut i zwykla smierc
//if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
//if rodzajzabicia=1 {instance_destroy(); instance_create(x,y,o_kolcozwierzdead); instance_create(x,y,o_punkciornik)}
if rodzajzabicia=5 {instance_destroy(); instance_create(x,y,o_fahdead); lolo=instance_create(x,y,o_punkciornik); lolo.image_index=0;if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}
if rodzajzabicia=2 {instance_destroy(); instance_create(x,y,o_fahdead);}


// niszcz po za ekranem
if y>room_height[0]+64 {instance_destroy()}
}
