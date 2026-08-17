// scr_gm8_button(qbx,qby,qbw,qbh,label,focus,prog)
// GM82 风格按钮：深灰底 + 1px 斜边（左上亮 / 右下暗绿）+ 奶油白等宽字 + 投影
// 焦点 = 紧贴外沿 1px 白框
// prog(可选,0..1) = 长按确认进度，>0 时按钮内从左向右填充绿色，作为视觉反馈
// 颜色来自 global.col_btn_*（在 o_pausemenu Create 中设定）
// 注意：GM8 无 argument_count()，未传的第7参数默认 0，故直接读 argument6 即可。
var qbx, qby, qbr, qbb, qbw, qbh, lab, foc, prog;
qbx = argument0
qby = argument1
qbw = argument2
qbh = argument3
lab = argument4
foc = argument5
prog = argument6
qbr = qbx + qbw - 1
qbb = qby + qbh - 1
// 1px 外斜边：左上亮 / 右下暗绿
draw_set_color(global.col_btn_hi)
draw_line(qbx, qby, qbr, qby)
draw_line(qbx, qby + 1, qbx, qbb - 1)
draw_set_color(global.col_btn_lo)
draw_line(qbx, qbb, qbr, qbb)
draw_line(qbr, qby, qbr, qbb - 1)
// 内部深灰底
draw_set_color(global.col_body)
draw_rectangle(qbx + 1, qby + 1, qbr - 1, qbb - 1, false)
// 长按进度填充（左→右，限制在按钮内）
if prog > 0 {
    draw_set_color(global.col_btn_in)
    draw_rectangle(qbx + 2, qby + 2, qbx + 2 + (qbw - 4) * prog, qbb - 2, false)
}
// 内部左上第二道绿斜边
draw_set_color(global.col_btn_in)
draw_line(qbx + 1, qby + 1, qbr - 1, qby + 1)
draw_line(qbx + 1, qby + 2, qbx + 1, qbb - 2)
// 等宽奶油字 + 1px 投影
draw_set_font(fnt_gm8_msg)
draw_set_halign(fa_center)
draw_set_color(global.col_btn_sh)
draw_text(qbx + qbw / 2 + 1, qby + 2 + 1, lab)
draw_set_color(global.col_btn_tx)
draw_text(qbx + qbw / 2, qby + 2, lab)
draw_set_halign(fa_left)
draw_set_font(-1)
// 焦点 = 紧贴外沿 1px 白框
if (foc = 1) {
    draw_set_color(global.col_focus)
    draw_rectangle(qbx - 1, qby - 1, qbr + 1, qbb + 1, true)
}
