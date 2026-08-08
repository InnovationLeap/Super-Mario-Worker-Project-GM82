#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vy_offset=-random(2)
krecialek=random(20)-random(20)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {

    y+=vy_offset
    vy_offset+=0.5
    x+=ixor


    if y>view_yview[0]+500 {instance_destroy()}
    image_angle+=krecialek






}
