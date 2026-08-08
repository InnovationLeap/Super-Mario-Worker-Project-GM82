#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_place(x,y,o_marker) {
    tmp=instance_create(x,y,o_pointblock2)
    tmp.bonus=bonus
    instance_destroy()
}
