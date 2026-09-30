/// ed_bg_page()
/// 背景选择主页面（bg_selecting=1 且 backgroundpage<>100）整页绘制 + 交互。
/// 页面构成：
///   底图三段 s_edbg_top / s_edbg_mid / s_edbg_bot —— 从 s_edscenario 帧 0~2 抠出的共用底图，
///     12 个格子已挖空、烤字已抹掉（素材与抠图脚本见 tools/edbg_page_extract.py）；
///   12 个格子 —— 按 background_table_init 的图层数据实时渲染（bg_preview_draw），
///     以后重排背景图，面板自动跟着变，不用再 P 图；
///   角标 —— 视差斜标 / 编号 / COMING SOON（数据见 bg_preview_init）；
///   文字 —— 标题、水位提示、WEATHER / BACK 按钮字，全部代码绘制（ed_text_fit 对齐原字宽）。
/// 须在 o_edmain 上下文中调用（读写 backgroundpage / backselect / wahaha / clicked / setting_mode 等）。
var _p, _r, _c, _i, _idx, _id, _x, _y, _lo, _back, _frame;
// 角标数据（视差 / 取景 / 编号）先确保就绪：GM8 的 global 被引用即存在且为 0，
// 只判 variable_global_exists 不会触发初始化，必须判值。
if !variable_global_exists('bg_pv_ready') {bg_preview_init()}
if global.bg_pv_ready <> 1 {bg_preview_init()}
_lo = 1
_frame = make_color_rgb(9, 13, 33)    // 12 格统一黑框色（取自原图边框主色）
_p = o_edmain.backgroundpage
if _p < 0 {_p = 0}
if _p > 2 {_p = 0}

// ---------------- 底图三段（y = 0 / 32 / 384） ----------------
draw_sprite(s_edbg_top, 0, view_xview[0], view_yview[0])
draw_sprite(s_edbg_mid, 0, view_xview[0], view_yview[0] + 32)
draw_sprite(s_edbg_bot, 0, view_xview[0], view_yview[0] + 384)

// ---------------- 翻页箭头（第 1/2/3 页） ----------------
if ed_hit(67, 422, 32, 32) {
    draw_sprite_ext(s_left, 0, view_xview[0] + 83, view_yview[0] + 438, 1, 1, 0, c_yellow, 1)
} else {
    draw_sprite_ext(s_left, 0, view_xview[0] + 83, view_yview[0] + 438, 1, 1, 0, c_white, 1)
}
if ed_hit(131, 422, 32, 32) {
    draw_sprite_ext(s_right, 0, view_xview[0] + 147, view_yview[0] + 438, 1, 1, 0, c_yellow, 1)
} else {
    draw_sprite_ext(s_right, 0, view_xview[0] + 147, view_yview[0] + 438, 1, 1, 0, c_white, 1)
}
if mouse_check_button(mb_left) && wahaha = 0 {
    if ed_hit(67, 422, 32, 32) {if _p > 0 {o_edmain.backgroundpage = _p - 1; wahaha = 1}}
    if ed_hit(131, 422, 32, 32) {if _p < 2 {o_edmain.backgroundpage = _p + 1; wahaha = 1}}
}

// ---------------- WEATHER 按钮（setting_mode=4 时不可用，与原来一致） ----------------
if ed_hit(462, 420, 60, 30) && setting_mode <> 4 {
    draw_prefs_highlight(view_xview[0] + 462, view_yview[0] + 420, 0.6, 1.3, 0.2)
    if mouse_check_button(mb_left) && wahaha = 0 {o_edmain.backgroundpage = 100; wahaha = 1}
}

// 变量 wahaha 用于检测鼠标是否已经点击，松开后恢复
if wahaha = 1 && !mouse_check_button(mb_left) {wahaha = 0}

// ---------------- 12 个格子：实时背景 + 角标 + 悬停 ----------------
draw_set_font(fnt_label)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_alpha(1)
backselect = 0
for (_r = 0; _r < 3; _r += 1) {
    for (_c = 0; _c < 4; _c += 1) {
        _idx = _r * 4 + _c
        _id = global.background_palette[_p, _idx]
        _x = 28 + _c * 143   // 格子内容（不含 1px 黑框）；列步距实测 143（原图列框 27/170/313/456）
        _y = 32 + _r * 120   // 行步距实测 120（原图行框 31/151/271、下框 135/255/375）
        // 每格先铺黑底：COMING SOON 空槽位本来就是一整块黑，
        // 同时也挡住实时背景没铺满时透出来的编辑器画面。
        // （格子右下那 3px 立体阴影是原图自带的，不做额外加深，保持原版观感）
        draw_set_color(c_black)
        draw_set_alpha(1)
        draw_rectangle(view_xview[0] + _x, view_yview[0] + _y, view_xview[0] + _x + 137, view_yview[0] + _y + 102, false)
        if _id > 0 {
            bg_preview_draw(_id, view_xview[0] + _x, view_yview[0] + _y, 138, 103)
            // 角标：视差斜标。原图是两行白字（PARALLAX / INCLUDED!）顺时针 43°，
            // 已离线烤成 s_edbg_paralax（原点在正中），这里直接贴；位置按原图实测字心 (67, 58)。
            if global.bg_pv_paralax[_id] = 1 {
                draw_set_color(c_white)
                draw_set_alpha(1)
                draw_sprite(s_edbg_paralax, 0, view_xview[0] + _x + 67, view_yview[0] + _y + 54)
            }
            // 角标：编号（10 / 14 这两个和 1 / 11 长得一样）
            if global.bg_pv_num[_id] = 1 {
                ed_text_fit(view_xview[0] + _x + 124, view_yview[0] + _y + 11, string(_id), 15, c_white, _lo)
            }
        } else {
            // 空槽位：以后往 background_palette_data 里填了编号，这里自动变成预览
            ed_text_fit(view_xview[0] + _x + 69, view_yview[0] + _y + 38, 'COMING', 56, c_white, _lo)
            ed_text_fit(view_xview[0] + _x + 69, view_yview[0] + _y + 69, 'SOON!', 42, c_white, _lo)
        }
        // 12 格统一 1px 黑框：原图各边深浅不一、行 1/2 的上边原本没有线，
        // 这里四边一律补成同色黑框（同时盖掉背景放大绘制可能外溢的 1px）。
        draw_set_color(_frame)
        draw_set_alpha(1)
        draw_rectangle(view_xview[0] + _x - 1, view_yview[0] + _y - 1, view_xview[0] + _x + 138, view_yview[0] + _y + 103, true)
        draw_set_color(c_white)
        if ed_hit(27 + _c * 143, 32 + _r * 120, 139, 103) {
            if _id > 0 {
                draw_prefs_highlight(view_xview[0] + 27 + _c * 143, view_yview[0] + 32 + _r * 120 + 32, 1.2, 4, 0.2)
                backselect = _id
            }
        }
    }
}

// ---------------- 文字（原先烤在底图里，现由代码绘制） ----------------
// 目标宽度 = 原烤字的像素宽度，保证换字体后占位不变
ed_text_fit(view_xview[0] + 323, view_yview[0] + 13, 'PLEASE SELECT BACKDROP SET FOR YOUR LEVEL.', 268, c_white, _lo)
ed_text_fit(view_xview[0] + 330, view_yview[0] + 402, 'TO CHANGE THE WATER HEIGHT PLEASE USE BUTTONS:', 302, c_white, _lo)
ed_text_fit(view_xview[0] + 489, view_yview[0] + 433, 'WEATHER', 54, c_white, _lo)
ed_text_fit(view_xview[0] + 561, view_yview[0] + 433, 'BACK', 29, c_white, _lo)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)
draw_set_alpha(1)

// ---------------- BACK：退回编辑器 ----------------
_back = 0
if ed_hit(530, 420, 60, 30) && wahaha = 0 {
    draw_prefs_highlight(view_xview[0] + 530, view_yview[0] + 420, 0.5, 1.3, 0.2)
    _back = 1
}
quitbgpselect = _back
if mouse_check_button(mb_left) && wahaha = 0 && _back = 1 {
    if setting_mode > 0 {setting_mode -= 1}
    bg_selecting = 0
    backselect = 0
    quitbgpselect = 0
}

// ---------------- 选中背景（悬停到哪格就选中哪格） ----------------
if mouse_check_button(mb_left) && quitbgpselect = 0 && clicked = 0 && backselect > 0 {
    if setting_mode = 4 {
        marker_inst.bgp = backselect
        ed_net_ops_send_update(marker_inst, 6)
        setting_mode = 5 - 5 * resetting
        resetting = 0
        marker_inst.setonce2 = 0
        costaiwa4 = 16
    } else {
        global.background = backselect
        if global.preview = -1 {global.local_background = backselect}
        ed_net_ops_send_settings('BGP = ' + string(backselect))
    }
    bg_selecting = 0
    clicked = 1
}
