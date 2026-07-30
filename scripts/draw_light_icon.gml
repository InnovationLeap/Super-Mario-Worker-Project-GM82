/// draw_light_icon(col, row, bit)
/// 根据 global.lightobject 的指定位绘制灯光图标。
/// col: 编辑器网格中的列索引 (0~5)
/// row: 编辑器网格中的行索引 (0~3)
/// bit: global.lightobject 字符串中的位索引 (1-based)
/// 图标位置 = (view_xview[0]+206+64*col, view_yview[0]+110+64*row)
/// 激活时 alpha=1，未激活时 alpha=0.3
var _alpha;
if (string_copy(global.lightobject, argument2, 1) = '1') { _alpha = 1; } else { _alpha = 0.3; }
draw_sprite_ext(s_setlight, 0, view_xview[0]+206+64*argument0, view_yview[0]+110+64*argument1, 1, 1, 0, c_white, _alpha);
