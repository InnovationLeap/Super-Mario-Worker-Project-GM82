// ed_hit(x, y, w, h)
// 判断鼠标是否落在以视图原点 (view_xview[0], view_yview[0]) 为基准的矩形区域内。
// 采用 rect 语义：参数 x,y 为矩形左上角相对视图的偏移量，w,h 为宽与高。
// 对应 Draw_0 中 "view_xview[0]+N" / "view_yview[0]+N" 的写法：
//   x  = view_xview[0]+N 中的 N
//   y  = view_yview[0]+M 中的 M
//   w  = 右边界偏移 - 左边界偏移
//   h  = 下边界偏移 - 上边界偏移
// 本脚本不做任何面板/状态门控，也不读写任何对象变量，仅做纯几何判断：
//   (mouse_x - view_xview[0]) 在 (x, x+w) 之间
//   (mouse_y - view_yview[0]) 在 (y, y+h) 之间
var mx, my;
mx = mouse_x - view_xview[0];
my = mouse_y - view_yview[0];
return (mx > argument0) && (mx < argument0 + argument2) && (my > argument1) && (my < argument1 + argument3);
