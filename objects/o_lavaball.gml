#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grav=0
state=0
hp=1
image_speed=0
dir=-1
activated=1
kill_type=0
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

vy_offset=0
starty=y

zarabia=1 // zmienna informujaca muszle czy mozna zarabiac zycia

stomp_proof=1

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

    if state=0 {state=1; vy_offset=-10}
    if state=1 {vy_offset+=0.25; y+=vy_offset}
    if vy_offset<0 image_yscale=1
    if vy_offset>0 image_yscale=-1
    if state=1 && y>starty && vy_offset>0 {state=2; vy_offset=0; y=-2000; instance_create(x,starty+16,o_firerico)}
    if state>=2 && state<200 {state+=1}
    if state=200 {state=0; y=starty}

    image_index=o_preview.huoqiu

}
