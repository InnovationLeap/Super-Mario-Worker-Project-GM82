#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
pos_x_r = irandom_range(64, 640 - 64);
pos_y_r = -16;
angle = irandom(120) - 60;
alpha = 1;
scale = (80 + irandom(70) ) / 100.0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alpha -= 0.062;
if (alpha < 0) {
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_add);
draw_sprite_ext(s_thunder, f, view_xport[0] + pos_x_r, view_yport[0] + pos_y_r, scale, scale, angle, c_white, alpha);
draw_set_blend_mode(bm_normal);
f = min(7, f + 1);
