// gen_draw_pipe(px, py, dir, alpha, arg4, arg5)
// 程序化绘制"水管生成器"外观（无外部素材）：外框 + 管体 + 内壁 + 方向侧管口 + 方向箭头
// px,py = 32x32 格的左上角；dir: 0右 1上 2左 3下；alpha: 透明度
// 注：v5.0 起档位（tier）退役——原 argument3/argument5 的"档位点"点阵保留但不再使用，调用处传 0,0
//     （参数数量保持不变，避免旧调用点因参数错位误用；后续若换正式贴图可整体替换本脚本）
var _t, _i;
draw_set_alpha(argument4);
// 外框
draw_set_color(make_color_rgb(38, 38, 48));
draw_rectangle(argument0 + 1, argument1 + 1, argument0 + 30, argument1 + 30, 0);
// 管体
draw_set_color(make_color_rgb(154, 156, 166));
draw_rectangle(argument0 + 3, argument1 + 3, argument0 + 28, argument1 + 28, 0);
// 内壁
draw_set_color(make_color_rgb(96, 98, 110));
draw_rectangle(argument0 + 6, argument1 + 6, argument0 + 25, argument1 + 25, 0);
// 管口（方向侧深色带）
draw_set_color(make_color_rgb(30, 30, 38));
if argument2 = 1 { draw_rectangle(argument0 + 3, argument1 + 3, argument0 + 28, argument1 + 9, 0) }
if argument2 = 3 { draw_rectangle(argument0 + 3, argument1 + 22, argument0 + 28, argument1 + 28, 0) }
if argument2 = 2 { draw_rectangle(argument0 + 3, argument1 + 3, argument0 + 9, argument1 + 28, 0) }
if argument2 = 0 { draw_rectangle(argument0 + 22, argument1 + 3, argument0 + 28, argument1 + 28, 0) }
// 方向箭头（亮黄）
draw_set_color(make_color_rgb(255, 236, 120));
if argument2 = 0 { draw_triangle(argument0 + 11, argument1 + 16, argument0 + 21, argument1 + 10, argument0 + 21, argument1 + 22, 0) }
if argument2 = 1 { draw_triangle(argument0 + 16, argument1 + 11, argument0 + 10, argument1 + 21, argument0 + 22, argument1 + 21, 0) }
if argument2 = 2 { draw_triangle(argument0 + 21, argument1 + 16, argument0 + 11, argument1 + 10, argument0 + 11, argument1 + 22, 0) }
if argument2 = 3 { draw_triangle(argument0 + 16, argument1 + 21, argument0 + 10, argument1 + 11, argument0 + 22, argument1 + 11, 0) }
// 档位点（编辑器用；右下角 1~4 个白点）
if argument5 = 1 {
    _t = argument3;
    if _t < 1 { _t = 1 }
    if _t > 4 { _t = 4 }
    draw_set_color(c_white);
    _i = 1;
    while (_i <= _t) {
        draw_rectangle(argument0 + 19 + _i * 2, argument1 + 26, argument0 + 20 + _i * 2, argument1 + 27, 0);
        _i += 1;
    }
}
draw_set_alpha(1);
draw_set_color(c_white);
return 0;
