#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
light_x = 0;
light_y = 16;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x = view_xview[0] + 320;
if (global.lava == 0) {
    y = -9999;
} else {
    y = global.poziomwody;
}
