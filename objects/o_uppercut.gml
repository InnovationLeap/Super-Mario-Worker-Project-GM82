#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
life=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {
    life+=1
    if life>5 {instance_destroy()}
}

if instance_place(x,y,o_goomba) {
    tmp=instance_place(x,y,o_goomba)
    tmp.kill_type=5 //顶
}
