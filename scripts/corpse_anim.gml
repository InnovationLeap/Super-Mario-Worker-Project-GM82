// corpse_anim(rotate, flip) - 敌人尸体通用动画（旋转/镜像/缓落/出屏销毁）
// argument0: 1=带旋转, 0=不旋转
// argument1: 1=垂直镜像(image_yscale=-1), 0=不镜像
// 要求：调用对象需自带 iyor 变量（初始 -8 或 0）
if argument0=1 && image_angle>-180 {image_angle-=10}
if argument1=1 {image_yscale=-1}
if vy_offset<10 {vy_offset+=0.5}
y+=vy_offset
if y>view_yview[0]+700 {instance_destroy()}
