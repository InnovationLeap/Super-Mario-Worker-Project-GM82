#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ladowanie=1+random(0.1)
strzal=0

if global.layerord=0||global.layerord=1{depth=0}
if global.layerord=2{depth=-21}

// 发光位置微调
light_x = 16;
light_y = 16;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if global.pauza=0 && global.etappokonany=0 {

if x<view_xview[0]+720 && x>view_xview[0]-80 && !(x<=o_marker.x && x>o_marker.x-75-32) && !(x>=o_marker.x && x<o_marker.x+75) {strzal+=ladowanie}

if strzal>200  {instance_create(x+16,y+16,o_cannoni) ; strzal=0;ladowanie=1+random(0.1)
if global.sample=1 && y<view_yview[0]+480 && y>view_yview[0]-32 {fofo=sound_play(snd_shoot);sound_volume(snd_shoot,global.glosnosc)}}

}
