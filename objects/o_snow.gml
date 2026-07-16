#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Init
angle = 180 + 70 + random(10) - random(10);
v = 4 + random(3);
if global.fallingstars = 3 { v *= 1.2; }
w = 2 + irandom(3);

//dir = irandom(2) * 2 - 1; // -1 or 1

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

//image_angle += w * dir
image_angle += w

// 越界销毁
if y > view_yview[0] + 480 + 128 {
    instance_destroy();
}

// 碰撞
if (place_meeting(x, y, obj_wall) || place_meeting(x, y, obj_halfground) ||
place_meeting(x, y, obj_wall) || place_meeting(x, y, o_pointblock) )
{
    instance_create(x, y - 2, o_snowdrop);
    instance_destroy();
}

// 雪即将进入水面的时候淡出销毁
if y > global.poziomwody - 48 {
    image_alpha -= 0.2;
    if image_alpha <= 0 { instance_destroy(); }
}

// 防止意外的水面越界情况，强制销毁
if y > global.poziomwody + 64 {
    instance_destroy();
}

scr_pos_x_end = view_xview[0] + 320;
scr_pos_y_end = view_yview[0] + 240;

// 水管传送与马里奥引力过大时，雨滴直接瞬移马里奥1帧的运动变化位置
if abs(scr_pos_x_end - scr_pos_x_start) > 128 { with (o_rain) x += (scr_pos_x_end - scr_pos_x_start); }
if abs(scr_pos_y_end - scr_pos_y_start) > 128 { with (o_rain) y += (scr_pos_y_end - scr_pos_y_start); }

scr_pos_x_start = scr_pos_x_end;
scr_pos_y_start = scr_pos_y_end;
