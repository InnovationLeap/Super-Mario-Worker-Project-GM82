#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed=0
if x>o_marker.x{kierunek=-1}
if x<=o_marker.x {kierunek=1}
aktywowany=1
rodzajzabicia=0
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok


license=1

if global.layerord=0||global.layerord=1{depth=1}
if global.layerord=2{depth=-20}

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
// chodzenie
if kierunek=-1 {x-=3; image_xscale=-1}
if kierunek=1 {x+=3; image_xscale=1}

}

// uppercut i zwykla smierc攻击判定
if rodzajzabicia=1 {instance_destroy(); instance_create(x,y,o_cannonidead); instance_create(x,y,o_punkciornik)}
if rodzajzabicia=2 {instance_destroy(); instance_create(x,y,o_cannonidead);}


if y>room_height[0]+64 {instance_destroy()}
if x<view_xview[0]-1000 {instance_destroy()}
if x>view_xview[0]+1640 {instance_destroy()}
}
