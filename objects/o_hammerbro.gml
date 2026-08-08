#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir=-1
ixor=0
vy_offset=-10


killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok



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
if global.pauza=0 && global.level_complete=0 {

    if dir=1 {dir=2; ixor=4}
    if dir=-1 {dir=-2; ixor=-4}

    y+=vy_offset
    x+=ixor
    vy_offset+=0.5
    image_angle+=10


    // niszcz po za ekranem
    if y>room_height {instance_destroy()}


}
