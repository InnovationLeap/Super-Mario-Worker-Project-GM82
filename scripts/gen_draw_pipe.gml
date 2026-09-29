// gen_draw_pipe(px, py, dir, alpha, tier)
// 程序化绘制"水管生成器"外观（无外部素材）：外框 + 管体 + 内壁 + 方向侧管口 + 方向箭头
// px,py = 32x32 格的左上角；dir: 0右 1上 2左 3下；alpha: 透明度；tier: 档位 1-5（配色取自 gen_tier_info）
// v6.0（用户要求）：档位复活并绑定间隔/害羞半径——水管**整体按档位上色**（紫/红/黄/绿/蓝），
//   编辑器中不看角标也能一眼分辨档位；面板图标与新建预览用默认档位 3（黄）。
var _c_body, _c_in, _c_dark, _c_arrow;
draw_set_alpha(argument3);
_c_body = gen_tier_info(argument4, 2);
_c_in = gen_tier_info(argument4, 3);
_c_dark = gen_tier_info(argument4, 4);
_c_arrow = gen_tier_info(argument4, 5);
// 外框
draw_set_color(_c_dark);
draw_rectangle(argument0 + 1, argument1 + 1, argument0 + 30, argument1 + 30, 0);
// 管体
draw_set_color(_c_body);
draw_rectangle(argument0 + 3, argument1 + 3, argument0 + 28, argument1 + 28, 0);
// 内壁
draw_set_color(_c_in);
draw_rectangle(argument0 + 6, argument1 + 6, argument0 + 25, argument1 + 25, 0);
// 管口（方向侧深色带）
draw_set_color(_c_dark);
if argument2 = 1 { draw_rectangle(argument0 + 3, argument1 + 3, argument0 + 28, argument1 + 9, 0) }
if argument2 = 3 { draw_rectangle(argument0 + 3, argument1 + 22, argument0 + 28, argument1 + 28, 0) }
if argument2 = 2 { draw_rectangle(argument0 + 3, argument1 + 3, argument0 + 9, argument1 + 28, 0) }
if argument2 = 0 { draw_rectangle(argument0 + 22, argument1 + 3, argument0 + 28, argument1 + 28, 0) }
// 方向箭头（档位浅色）
draw_set_color(_c_arrow);
if argument2 = 0 { draw_triangle(argument0 + 11, argument1 + 16, argument0 + 21, argument1 + 10, argument0 + 21, argument1 + 22, 0) }
if argument2 = 1 { draw_triangle(argument0 + 16, argument1 + 11, argument0 + 10, argument1 + 21, argument0 + 22, argument1 + 21, 0) }
if argument2 = 2 { draw_triangle(argument0 + 21, argument1 + 16, argument0 + 11, argument1 + 10, argument0 + 11, argument1 + 22, 0) }
if argument2 = 3 { draw_triangle(argument0 + 16, argument1 + 21, argument0 + 10, argument1 + 11, argument0 + 22, argument1 + 11, 0) }
draw_set_alpha(1);
draw_set_color(c_white);
return 0;
