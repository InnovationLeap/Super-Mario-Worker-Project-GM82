/// ed_bgm_page()
/// BGM 选择面板：绘制 + 交互（o_edmain 的 bg_selecting=100 分支整体迁入本脚本）。
/// 条目/页签数据来自 bgm_palette_data（区域+编号+文字三位一体），
/// 第 7 页（自定义音乐）每帧由 bgm_custom_rebuild 按 global.customMusicFile* 重建。
/// 文字用 GM8 内置 draw_text 绘制（fnt_label 缩放 + 半透明黑阴影，
/// 与 ed_mark_draw / ed_scenery_draw 等分类标签同款，见 ed_text_shadow），
/// 替代原 s_edscenario2 烤入图像文字。
/// 须在 o_edmain 上下文中调用（使用 bgmpage/bgm_select/bgm_play/listscroll 等实例变量）。
var _i, _x, _y, _w, _h, _txt, _ls, _lt, _lb, _lo, _pg, _pt;
global.musicon = 0

draw_sprite(s_edscenario2, 0, view_xview[0], view_yview[0])

draw_set_font(fnt_label)
_ls = 10 / font_get_size(fnt_label)   // 曲目条目：与分类标签同字号
_lt = 10 / font_get_size(fnt_label)     // 系列页签
_lb = 10 / font_get_size(fnt_label)    // 按钮
_lo = 1                                // 描边半径像素（8 方向偏移描边，2 = 2px 粗描边）

// ---------- 右侧系列页签（数据驱动，当前页黄色高亮） ----------
_i = 0
while _i < global.bgm_tab_n {
    _x = global.bgm_tab_x[_i]
    _y = global.bgm_tab_y[_i]
    _w = global.bgm_tab_w[_i]
    _h = global.bgm_tab_h[_i]
    _txt = string_upper(global.bgm_tab_txt[_i])
    if ed_hit(_x, _y, _w, _h) {
        draw_prefs_highlight(view_xview[0] + _x, view_yview[0] + _y, 1.3, 0.8, 0.2)
        if mouse_check_button(mb_left) {
            bgmpage = global.bgm_tab_page[_i]
        }
    }
    if bgmpage = global.bgm_tab_page[_i] {
        ed_text_shadow(view_xview[0] + _x + _w / 2 - string_width(_txt) * _lt / 2, view_yview[0] + _y, _txt, _lt, c_yellow, _lo)
    } else {
        ed_text_shadow(view_xview[0] + _x + _w / 2 - string_width(_txt) * _lt / 2, view_yview[0] + _y, _txt, _lt, c_white, _lo)
    }
    _i += 1
}
_txt = 'SELECT MUSIC SERIES'
ed_text_shadow(view_xview[0] + 460 + 150 / 2 - string_width(_txt) * _lt / 2, view_yview[0] + 76, _txt, _lt, c_white, _lo)

// ---------- BGM 条目（当前页，悬停试听） ----------
bgm_prev = 0
bgm_select = 0
if bgmpage = 7 {
    bgm_custom_rebuild()
}
_i = 0
while _i < global.bgm_e_n[bgmpage] {
    _x = global.bgm_e_x[bgmpage, _i]
    _y = global.bgm_e_y[bgmpage, _i]
    _w = global.bgm_e_w[bgmpage, _i]
    _h = global.bgm_e_h[bgmpage, _i]
    _txt = string_upper(global.bgm_e_txt[bgmpage, _i])
    if global.bgm_e_center[bgmpage] = 1 {
        ed_text_shadow(view_xview[0] + _x + _w / 2 - string_width(_txt) * _ls / 2, view_yview[0] + _y + global.bgm_e_dy[bgmpage], _txt, _ls, c_white, _lo)
    } else {
        ed_text_shadow(view_xview[0] + _x, view_yview[0] + _y + global.bgm_e_dy[bgmpage], _txt, _ls, c_white, _lo)
    }
    if ed_hit(_x, _y, _w, _h) {
        draw_prefs_highlight(view_xview[0] + _x, view_yview[0] + _y, 1.3 * _w / 150, 0.8, 0.2)
        bgm_select = global.bgm_e_id[bgmpage, _i]
    }
    _i += 1
}

// ---------- 自定义音乐页：页码 / 翻页 / 刷新（纵向排列） ----------
if bgmpage = 7 {
    _pg = listscroll / 10 + 1
    _pt = (global.customMusicTotal + 9) div 10
    if _pt < 1 {
        _pt = 1
    }
    _txt = 'PAGE ' + string(_pg) + ' / ' + string(_pt)
    ed_text_shadow(view_xview[0] + 20, view_yview[0] + 378, _txt, _ls, c_white, _lo)
    // NEXT
    ed_text_shadow(view_xview[0] + 20, view_yview[0] + 398, 'NEXT', _ls, c_white, _lo)
    if ed_hit(20, 398, 90, 16) {
        draw_prefs_highlight(view_xview[0] + 20, view_yview[0] + 398, 1.3 * 90 / 150, 0.8, 0.2)
        if mouse_check_button_pressed(mb_left) && listscroll < global.customMusicTotal - 10 {
            listscroll += 10
        }
    }
    // PREV
    ed_text_shadow(view_xview[0] + 20, view_yview[0] + 418, 'PREV', _ls, c_white, _lo)
    if ed_hit(20, 418, 90, 16) {
        draw_prefs_highlight(view_xview[0] + 20, view_yview[0] + 418, 1.3 * 90 / 150, 0.8, 0.2)
        if mouse_check_button_pressed(mb_left) && listscroll > 0 {
            listscroll -= 10
        }
    }
    // REFRESH
    ed_text_shadow(view_xview[0] + 20, view_yview[0] + 438, 'REFRESH', _ls, c_white, _lo)
    if ed_hit(20, 438, 90, 16) {
        draw_prefs_highlight(view_xview[0] + 20, view_yview[0] + 438, 1.3 * 90 / 150, 0.8, 0.2)
        // 点击后刷新音乐列表
        if mouse_check_button_pressed(mb_left) {
            music_list_update()
            show_message('Custom music list refreshed.')
            listscroll = 0
        }
    }
}

// ---------- 无音乐 / 返回 ----------
if ed_hit(462, 420, 60, 30) {
    draw_prefs_highlight(view_xview[0] + 462, view_yview[0] + 420, 0.6, 1.3, 0.2)
    bgm_select = 600  //600对应无音乐
}
_txt = 'NO MUSIC'
ed_text_shadow(view_xview[0] + 492 - string_width(_txt) * _lb / 2, view_yview[0] + 427, _txt, _lb, c_white, _lo)

if ed_hit(550, 420, 60, 30) {
    draw_prefs_highlight(view_xview[0] + 550, view_yview[0] + 420, 0.5, 1.3, 0.2)
    quitbgmselect = 1
} else {
    quitbgmselect = 0
}
_txt = 'BACK'
ed_text_shadow(view_xview[0] + 580 - string_width(_txt) * _lb / 2, view_yview[0] + 427, _txt, _lb, c_white, _lo)

// ---------- 试听 / 确认 / 退出（沿用原面板逻辑） ----------
bgm_prev = bgm_select
if bgm_select = 0 {
    bgm_prev = 0
}
if bgm_play <> bgm_prev && bgm_prev > 0 {
    bgm_play = bgm_prev
    ed_play_bgm(bgm_play)
}
if mouse_check_button(mb_left) && quitbgmselect = 1 {
    if setting_mode > 0 {
        setting_mode -= 1
    }
    bg_selecting = 0
    mm_stop_all_ext()
}
if mouse_check_button(mb_left) && quitbgmselect = 0 && clicked = 0 && bgm_select > 0 {
    if setting_mode = 2 {
        marker_inst.bgm = string(bgm_play)
        ed_net_ops_send_update(marker_inst, 6)
        setting_mode = 3 - 3 * resetting
        resetting = 0
        marker_inst.setonce2 = 0
        costaiwa4 = 16
    } else {
        global.bgm_id = bgm_play
        if global.preview = -1 {
            global.local_muzyka = bgm_play
        }
        ed_net_ops_send_settings('BGM = ' + string(bgm_play))
    }
    bg_selecting = 0
    clicked = 1
    mm_stop_all_ext()
}
if bgm_select = 0 {
    mm_stop_all_ext()
    bgm_prev = 0
    bgm_play = 0
}
