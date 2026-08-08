#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grav=0
state=0
//energia=1
image_speed=0.3
dir=-1
activated=1
kill_type=0
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

if global.rotodisclay=0 {depth=0}
if global.rotodisclay=1 {
    if global.layerord=0 {depth=-22}
    if global.layerord=1 {depth=-20}
    if global.layerord=2 {depth=-21}
}

stomp_proof=1

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
//
