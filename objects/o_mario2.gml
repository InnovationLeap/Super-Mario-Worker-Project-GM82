#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

    draw_set_blend_mode(bm_add)
    draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,0,c_white,1)
    draw_set_blend_mode(bm_normal)
