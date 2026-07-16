#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Init
angle = 180 + 70 - global.windy * 7.0;
v = 8 + random(6);
if global.rainy = 5 { v *= 1.6; }
image_angle = angle + 180
r = irandom(99);
alpha_rate = 50;
if r < alpha_rate { image_alpha = 0.2; }

// Screen Position
scr_pos_x_end = view_xview[0] + 320;
scr_pos_y_end = view_yview[0] + 240;
scr_pos_x_start = view_xview[0] + 320;
scr_pos_y_start = view_yview[0] + 240;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

x += cos(degtorad(angle)) * v;
y -= sin(degtorad(angle)) * v;

// 风等级影响
x -= global.windy * 2.6;
y += global.windy * 0.8;

// 越界销毁
if y > view_yview[0] + 480 + 128 {
    instance_destroy();
}

// 透明的后景雨滴不参与碰撞
if r >= alpha_rate &&
(place_meeting(x, y, obj_wall) || place_meeting(x, y, obj_halfground) ||
place_meeting(x, y, obj_wall) || place_meeting(x, y, o_pointblock) )
{
    instance_create(x, y - 8, o_raindrop);
    instance_destroy();
}

// 雨滴入水销毁，包括后景雨滴
if y > global.poziomwody
{
    instance_destroy();
}

scr_pos_x_end = view_xview[0] + 320;
scr_pos_y_end = view_yview[0] + 240;

// 水管传送与马里奥引力过大时，雨滴直接瞬移马里奥1帧的运动变化位置
if abs(scr_pos_x_end - scr_pos_x_start) > 128 { with (o_rain) x += (scr_pos_x_end - scr_pos_x_start); }
if abs(scr_pos_y_end - scr_pos_y_start) > 128 { with (o_rain) y += (scr_pos_y_end - scr_pos_y_start); }

scr_pos_x_start = scr_pos_x_end;
scr_pos_y_start = scr_pos_y_end;
