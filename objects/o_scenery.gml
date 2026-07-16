#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x+=16
y+=32

block_index=0

flag_light = false;

// 景物绘制代码请移步 o_assist 的 step 事件

// 景物的发光位置微调在 step 中专门设置、光照半径比例在各个对应object中微调
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !flag_light {
    flag_light = true;
    switch (image_index) {
        case 5: if string_copy(global.lightobject, 4, 1) = '1' {instance_create(x, y - 48, o_lightnighttree);} break;
        case 11: if string_copy(global.lightobject, 5, 1) = '1' {instance_create(x, y - 64, o_lightbignighttree);} break;
        case 13: if string_copy(global.lightobject, 6, 1) = '1' {instance_create(x, y - 40, o_lightbrightlight);} break;
        case 17: if string_copy(global.lightobject, 7, 1) = '1' {instance_create(x + 48, y + 48, o_lightpotrait);} break;
        case 34: if string_copy(global.lightobject, 8, 1) = '1' {instance_create(x, y - 16, o_lightlavafall);} break;
        case 37: if string_copy(global.lightobject, 9, 1) = '1' {instance_create(x, y - 16, o_lightrotocenter);} break;
    }
}
