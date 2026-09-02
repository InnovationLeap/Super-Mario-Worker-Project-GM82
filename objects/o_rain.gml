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
// angle/v 出生后不变，预计算速度分量，避免每帧重复三角函数调用
vx = cos(degtorad(angle)) * v;
vy = -sin(degtorad(angle)) * v;
r = irandom(99);
alpha_rate = 50;
if r < alpha_rate { image_alpha = 0.2; }

// 镜头瞬移信号首帧不应用（出生位置已基于当前视口），下一帧起跟随 o_weather 的全局信号
rain_shift_armed = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

x += vx;
y += vy;

// 风等级影响
x -= global.windy * 2.6;
y += global.windy * 0.8;

// 越界销毁
if y > view_yview[0] + 480 + 128 {
    instance_destroy();
}

// 透明的后景雨滴不参与碰撞。
// GM8 无短路求值：原来一行里的 3 次 place_meeting 每帧都会全部执行，
// 改为嵌套 if 后后景雨滴（约一半）完全跳过碰撞，前景雨滴命中即停。
if r >= alpha_rate {
    if place_meeting(x, y, obj_wall) {
        instance_create(x, y - 8, o_raindrop);
        instance_destroy();
    } else if place_meeting(x, y, obj_halfground) {
        instance_create(x, y - 8, o_raindrop);
        instance_destroy();
    } else if place_meeting(x, y, o_pointblock) {
        instance_create(x, y - 8, o_raindrop);
        instance_destroy();
    }
}

// 雨滴入水销毁，包括后景雨滴
if y > global.water_level {
    instance_destroy();
}

// 水管传送与马里奥引力过大时，跟随 o_weather 统一计算的镜头瞬移信号（每帧至多位移一次）
if rain_shift_armed = 1 {
    x += global.rain_shift_x;
    y += global.rain_shift_y;
}
rain_shift_armed = 1
