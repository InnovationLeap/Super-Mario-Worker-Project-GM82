#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite177,0,x,y,image_xscale,image_yscale,0,c_white,image_alpha)
draw_set_blend_mode(bm_normal)

image_xscale=image_xscale/1.05
image_yscale=image_yscale/1.05
image_alpha=image_alpha/1.05

if image_alpha<=0.01 {instance_destroy()}
