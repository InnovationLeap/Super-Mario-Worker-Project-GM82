#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grav=0
state=0

image_speed=0
dir=-1
activated=1
kill_type=0
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok
x+=16
y+=16




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

    image_index=o_preview.coral_preview

    //if energia<=-100000 && rodzajzabicia=0 {instance_destroy(); }
    // niszcz po za ekranem
    if y>room_height+64 {instance_destroy()}
}
