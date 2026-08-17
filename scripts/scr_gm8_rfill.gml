// scr_gm8_rfill(qx1,qy1,qx2,qy2,r) — 圆角矩形填充（用当前颜色/alpha）
var qx1, qy1, qx2, qy2, r;
qx1 = argument0
qy1 = argument1
qx2 = argument2
qy2 = argument3
r = argument4
draw_rectangle(qx1 + r, qy1, qx2 - r, qy2, false)
draw_rectangle(qx1, qy1 + r, qx2, qy2 - r, false)
draw_circle(qx1 + r, qy1 + r, r, false)
draw_circle(qx2 - r, qy1 + r, r, false)
draw_circle(qx1 + r, qy2 - r, r, false)
draw_circle(qx2 - r, qy2 - r, r, false)
