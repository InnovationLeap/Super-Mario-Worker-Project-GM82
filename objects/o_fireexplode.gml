#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=0.5
image_yscale=0.5

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

image_xscale-=0.05
image_yscale-=0.05
image_alpha-=0.05
if image_alpha<=0 {instance_destroy()}


}
