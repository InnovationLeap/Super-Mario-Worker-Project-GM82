#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Init
angle = 180 + 70 + random(30) - random(30);
v = 4 + random(3);
if global.fallingstars = 3 { v *= 1.2; }
w = 2 + irandom(3);

// angle/v 出生后不变，预计算速度分量，避免每帧重复三角函数调用
vx = cos(degtorad(angle)) * v;
vy = -sin(degtorad(angle)) * v;

//dir = irandom(2) * 2 - 1; // -1 or 1

#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

x += vx;
y += vy;
//image_angle += w * dir
image_angle += w

// 越界销毁
if y > view_yview[0] + 480 + 128 {
    instance_destroy();
}

// 流星即将进入水面的时候淡出销毁
if y > global.water_level - 64 {
    image_alpha -= 0.2;
    if image_alpha <= 0 { instance_destroy(); }
}

// 防止意外的水面越界情况，强制销毁
if y > global.water_level + 64 {
    instance_destroy();
}
