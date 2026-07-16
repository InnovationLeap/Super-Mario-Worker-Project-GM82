#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grawitacja=0
sekwencja=0

image_speed=0
kierunek=-1
aktywowany=1
rodzajzabicia=0

sekwencjashot=0
sekwencjaskok=0
wbloczku=0
chodzonko=0
chodzonko2=0
angrymode=0
angrymodetimer=0
sekwencjashot2=random(0.2)
prepare_time=irandom_range(50,85)
shoot_time=irandom_range(50,60)
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

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
if global.pauza=0 && global.etappokonany=0 {

if aktywowany=1{
// spadanie i skakanie
  if sekwencja=0 {sekwencjaskok+=1}
  if sekwencjaskok>100 {sekwencjaskok=0; sekwencja=1; grawitacja=-12; y-=10}
  if sekwencja=0 && !place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,o_pointblock) {sekwencja=1}
  if sekwencja=1 {grawitacja+=0.5; y+=grawitacja}
  if sekwencja=1 && wbloczku=0 && grawitacja<0 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {wbloczku=1}
  if sekwencja=1 && wbloczku=1 && grawitacja>0 && !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {wbloczku=0}
  if sekwencja=1 && ( (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,o_pointblock)) ) && ( (place_meeting(x+1,y,obj_halfground) || place_meeting(x+1,y,obj_wall) || place_meeting(x+1,y,o_pointblock)) )&& ( (place_meeting(x-1,y,obj_halfground) || place_meeting(x-1,y,obj_wall) || place_meeting(x-1,y,o_pointblock)) )&& wbloczku=0 {grawitacja=0; sekwencja=2}
  while sekwencja=2 &&( (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) ) {y-=1 }
  if sekwencja=2 && !(place_meeting(x,y,obj_halfground)) && !(place_meeting(x,y,obj_wall)) && !(place_meeting(x,y,o_pointblock)) {sekwencja=0 }
}

if !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {
if x>o_marker.x {image_xscale=-1}
if x<o_marker.x {image_xscale=1}

if x<view_xview[0]+740 && x>view_xview[0]-100 && y>view_yview[0]-64 && y<view_yview[0]+480+64 sekwencjashot+=1+sekwencjashot2
if sekwencjashot<=prepare_time {sprite_index=s_firesis}
if sekwencjashot>prepare_time {sprite_index=s_firesisfire}
if sekwencjashot>prepare_time+shoot_time {sekwencjashot=0; lolo=instance_create(x,y+8,o_fff); lolo.kierunek=image_xscale;sound_play(snd_fire);prepare_time=irandom_range(50,85);shoot_time=irandom_range(50,60);}



// chodzenie
if angrymode=1
    {
    if kierunek=-1 {if !place_meeting(x-2,y,obj_wall) && !place_meeting(x-2,y,o_pointblock) {x-=2;}}
    if kierunek=1 {if !place_meeting(x+2,y,obj_wall) && !place_meeting(x+2,y,o_pointblock) {x+=2;}}
    if x>o_marker.x {kierunek=-1}
    if x<o_marker.x {kierunek=1}
    }
if chodzonko=0 && chodzonko2=0 {chodzonko=10+round(random(150)); chodzonko2=chodzonko}
if chodzonko>0 {if !place_meeting(x+1,y,obj_wall) {x+=1;}; chodzonko-=1}
if chodzonko=0 && chodzonko2>0 {if !place_meeting(x-1,y,obj_wall) {x-=1;}; chodzonko2-=1}


if angrymode=0 {angrymodetimer+=1}
if angrymodetimer>2500 {angrymode=0}

if (place_meeting(x+1,y,obj_wall) || place_meeting(x-1,y,obj_wall) || place_meeting(x-1,y,o_pointblock) || place_meeting(x+1,y,o_pointblock)) && wbloczku=0 {kierunek=kierunek*-1}
image_index+=0.1
}


// uppercut i zwykla smierc
//if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
if rodzajzabicia=1 {instance_destroy(); instance_create(x,y,o_FSdead); instance_create(x,y,o_punkciornik)}
if rodzajzabicia=5 || rodzajzabicia=4 || rodzajzabicia=3 {instance_destroy(); instance_create(x,y,o_FSdead); lolo=instance_create(x,y,o_punkciornik); lolo.image_index=0;if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}
if rodzajzabicia=2 {instance_destroy(); instance_create(x,y,o_FSdead);}



// niszcz po za ekranem
if y>room_height[0]+64 {instance_destroy()}
}
