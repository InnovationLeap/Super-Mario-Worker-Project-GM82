#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
focus_yes = 1
menu_delay = 3
// 长按确认状态机（与弹窗解耦，见 scr_hold_confirm）
hc_t = 0
hc_progress = 0
hold_need = 50
// ===== GM82 对话框像素级配色（取自对比图右边真·GM82）=====
// 绿系 187,189,186 / 142,165,130 / 143,154,183 是 GM8 3D 斜面手柄色
// （对话框外框与按钮共用同一套 bevel：左上亮灰绿 / 右下蓝灰），并非纯绿外框。
col_title    = make_color_rgb(243,243,243)   // 外壳/标题栏浅灰
col_title_tx = make_color_rgb(128,128,128)   // 标题文字灰
col_body     = make_color_rgb(64,64,64)      // 主体深炭灰
col_msg      = make_color_rgb(254,254,246)   // 正文奶油白
col_msg_sh   = make_color_rgb(40,40,40)      // 文字投影
col_btn_hi   = make_color_rgb(187,189,186)   // 按钮/手柄 左上亮边（浅灰绿）
col_btn_lo   = make_color_rgb(143,154,183)   // 按钮/手柄 右下暗边（蓝灰，实测 GM82）
col_btn_in   = make_color_rgb(142,165,130)   // 按钮内 左上绿边
col_btn_tx   = make_color_rgb(254,254,246)   // 按钮文字奶油白
col_btn_sh   = make_color_rgb(40,40,40)      // 按钮文字投影
col_focus    = make_color_rgb(255,255,255)   // 焦点白框
// 暴露给 scr_gm8_button 用的 global 手柄色
global.col_btn_hi = col_btn_hi
global.col_btn_lo = col_btn_lo
global.col_btn_in = col_btn_in
global.col_btn_tx = col_btn_tx
global.col_btn_sh = col_btn_sh
global.col_body   = col_body
global.col_focus  = col_focus
// 布局规格（游戏 px，截图 200%DPI 已 ÷2，实测校准自 GM82 真框）
dlg_r   = 7
title_h = 25
pad_x   = 28
txt_y0  = 12
line_h  = 20
btn_w   = 64
btn_h   = 20
btn_mx  = 7
btn_bm  = 17
if global.testmode = 0 { msg = 'Do you REALLY want to quit the level and go back to title screen???' }
else                   { msg = 'Do you REALLY want to quit the level and go back to edit screen???' }
// 贪心换行（与 GM82 同宽 434 处断行）
draw_set_font(fnt_gm8_msg)
line_n = 0
cur = ''
rest = msg
maxw = 434
while (string_length(rest) > 0) {
    qsp = string_pos(' ', rest)
    if (qsp = 0) { word = rest; rest = '' } else { word = string_copy(rest, 1, qsp - 1); rest = string_copy(rest, qsp + 1, string_length(rest)) }
    test = cur
    if (cur != '') { test = test + ' ' }
    test = test + word
    if (string_width(test) <= maxw) || (cur = '') { cur = test } else { line_arr[line_n] = cur; line_n = line_n + 1; cur = word }
}
line_arr[line_n] = cur
line_n = line_n + 1
qlw = 0
for (i = 0; i < line_n; i += 1) { if (string_width(line_arr[i]) > qlw) { qlw = string_width(line_arr[i]) } }
qdw = qlw + pad_x * 2
if (qdw < 240) { qdw = 240 }
qdh = txt_y0 + line_n * line_h + 15 + btn_h + btn_bm
yes_x = btn_mx
no_x  = qdw - btn_mx - btn_w
btn_y = qdh - btn_bm - btn_h
draw_set_font(-1)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var qax, qay;

qax = floor(view_xview[0] + (640 - qdw) / 2)
qay = floor(view_yview[0] + (480 - qdh) / 2)
if menu_delay > 0 { menu_delay -= 1 }
if global.escowanie = 1 && !keyboard_check(vk_escape) { global.escowanie = 0 }
if menu_delay = 0 {
    if keyboard_check_pressed(vk_escape) { UserPause_End() }
    if keyboard_check_pressed(vk_left)  { focus_yes = 1 - focus_yes }
    if keyboard_check_pressed(vk_right) { focus_yes = 1 - focus_yes }
    if keyboard_check_pressed(vk_up)    { focus_yes = 1 - focus_yes }
    if keyboard_check_pressed(vk_down)  { focus_yes = 1 - focus_yes }
    // No 仍瞬发退出（不受长按约束）
    if focus_yes = 0 {
        if keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) { UserPause_End() }
    }
    if mouse_check_button_pressed(mb_left) {
        if (mouse_x > qax + no_x) && (mouse_x < qax + no_x + btn_w) && (mouse_y > qay + btn_y) && (mouse_y < qay + btn_y + btn_h) { UserPause_End() }
    }
    // Yes 触发：Play(testmode=0) 需长按防误触；Edit(testmode=1) 反复测试需瞬发
    if global.testmode = 1 {
        // Edit：瞬发退出（Enter/Space 在 Yes 上，或点击 Yes 按钮）
        if focus_yes = 1 {
            if keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) { UserPause_Quit() }
        }
        if mouse_check_button_pressed(mb_left) {
            if (mouse_x > qax + yes_x) && (mouse_x < qax + yes_x + btn_w) && (mouse_y > qay + btn_y) && (mouse_y < qay + btn_y + btn_h) { UserPause_Quit() }
        }
        hc_progress = 0
    } else {
        // Play：长按确认（仅焦点在 Yes 时累计；Enter 按住 或 鼠标按住 Yes 按钮）
        yes_hover = (mouse_x > qax + yes_x) && (mouse_x < qax + yes_x + btn_w) && (mouse_y > qay + btn_y) && (mouse_y < qay + btn_y + btn_h)
        yes_held = (focus_yes = 1) && (keyboard_check(vk_enter) || (yes_hover && mouse_check_button(mb_left)))
        hc_progress = scr_hold_confirm(yes_held, hold_need)
        if (hc_progress >= 1) { UserPause_Quit() }
    }
    if (mouse_x > qax + yes_x) && (mouse_x < qax + yes_x + btn_w) && (mouse_y > qay + btn_y) && (mouse_y < qay + btn_y + btn_h) { focus_yes = 1 }
    if (mouse_x > qax + no_x)  && (mouse_x < qax + no_x  + btn_w) && (mouse_y > qay + btn_y) && (mouse_y < qay + btn_y + btn_h) { focus_yes = 0 }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var qax, qay, i;

qax = floor(view_xview[0] + (640 - qdw) / 2)
qay = floor(view_yview[0] + (480 - qdh) / 2)
// 冻结帧（拉伸铺满整个视图，避免视图缩放/滚动导致房间灰白背景透出）
if global.pausesprite >= 0 { draw_sprite_stretched(global.pausesprite, 0, view_xview[0], view_yview[0], view_wview[0], view_hview[0]) }
// 柔和投影（右下偏移，两层近似 GM82）
draw_set_color(c_black)
draw_set_alpha(0.12)
scr_gm8_rfill(qax + 7, qay + 7, qax + qdw + 7, qay + qdh + 7, dlg_r + 1)
draw_set_alpha(0.22)
scr_gm8_rfill(qax + 4, qay + 4, qax + qdw + 4, qay + qdh + 4, dlg_r)
draw_set_alpha(1)
// 浅灰外壳(含标题栏) -> 深灰主体内缩1px，自然留下浅灰外框
draw_set_color(col_title)
scr_gm8_rfill(qax, qay, qax + qdw, qay + qdh, dlg_r)
draw_set_color(col_body)
scr_gm8_rfill(qax + 1, qay + 1, qax + qdw - 1, qay + qdh - 1, dlg_r - 1)
// 不绘制 Windows 风格外框斜面与标题栏文字/✕
// 正文左对齐 + 1px 投影
draw_set_font(fnt_gm8_msg)
for (i = 0; i < line_n; i += 1) {
    draw_set_color(col_msg_sh)
    draw_text(qax + pad_x + 1, qay + txt_y0 + i * line_h + 1, line_arr[i])
    draw_set_color(col_msg)
    draw_text(qax + pad_x,     qay + txt_y0 + i * line_h,     line_arr[i])
}
draw_set_valign(fa_top)
// 按钮：Yes 贴左 / No 贴右；Yes 传长按进度(0..1)做内部填充反馈
scr_gm8_button(qax + yes_x, qay + btn_y, btn_w, btn_h, 'Yes', focus_yes, hc_progress)
scr_gm8_button(qax + no_x,  qay + btn_y, btn_w, btn_h, 'No', 1 - focus_yes)
draw_set_halign(fa_left)
