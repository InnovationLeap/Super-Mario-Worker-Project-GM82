#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
kierunek=-1
ixor=0
iyor=-10
wysokosc=round(random(2))*32
iyus=0
image_speed=0


energia=1
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

zarabia=0 // zmienna informujaca muszle czy mozna zarabiac zycia

dabusi=1

// 发光位置微调
light_x = 0;
light_y = -16;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.etappokonany=0 {

if kierunek=1 {kierunek=2; ixor=4}
if kierunek=-1 {kierunek=-2; ixor=-4; image_xscale=-1}


if y>(iyus-wysokosc) {y-=2}
if y<(iyus-wysokosc) {y+=2}
x+=ixor

image_index+=0.2
// niszcz po za ekranem
if y>room_height || x<view_xview[0]-300 || x>view_xview[0]+940 {instance_destroy()}


}
