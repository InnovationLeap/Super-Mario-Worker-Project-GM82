#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir=-1
ixor=0
vy_offset=-10
wysokosc=round(random(2))*32
iyus=0
image_speed=0


hp=1
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

zarabia=0 // zmienna informujaca muszle czy mozna zarabiac zycia

stomp_proof=1

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
if global.pauza=0 && global.level_complete=0 {

    if dir=1 {dir=2; ixor=4}
    if dir=-1 {dir=-2; ixor=-4; image_xscale=-1}


    if y>(iyus-wysokosc) {y-=2}
    if y<(iyus-wysokosc) {y+=2}
    x+=ixor

    image_index+=0.2
    // niszcz po za ekranem
    if y>room_height || x<view_xview[0]-300 || x>view_xview[0]+940 {instance_destroy()}


}
