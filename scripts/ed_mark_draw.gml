// ed_mark_draw(pc4, cx, cy, label)
// 在 64x64 的格子（左上角 cx,cy）内绘制 marks 图标 + 下方说明文字。
// 图标源按原 s_edmarkers 面板逐格还原，并居中于格子。
// 滚轮类（7/15/19-24）只写文字、不画图标，由现有覆盖层提供预览。
// LEDGE(14) 用游戏内 s_ledge 绘制（滚轮变种由 global.ledge_type 驱动）。
// TYPE A(11)/TYPE B(12) 用游戏内 s_yinyang 贴图绘制，滚轮改色由 global.yinyangcolor 驱动。
// 文字使用 fnt_label（Arial Narrow Bold Italic，白字无描边，全大写），与 enemies/scenery/bonus 一致。
var _pc4, _cx, _cy, _label, _wheel, _spr, _sub, _sw, _sh, _s, _dx, _dy, _tw, _th, _ty, _l1, _l2, _i;
_pc4 = argument0
_cx = argument1
_cy = argument2
_label = argument3
_wheel = 0
if _pc4 = 7 || _pc4 = 15 || (_pc4 >= 19 && _pc4 <= 24) {_wheel = 1}
if _wheel = 0 {
    _spr = -1
    _sub = 0
    _sw = 32
    _sh = 32
    _s = 1
    switch (_pc4) {
        // PASSAGE：用 s_blocks 005/006/007/008 拼一个 2x2 水管，整体缩到约 35px 并居中于格子
        case 1: {
            _s = 0.55
            _sw = 32; _sh = 32
            _dx = floor(_cx + 32 - 16 * _s - 16 * _s)
            _dy = floor(_cy + 32 - 16 * _s - 16 * _s)
            draw_sprite_ext(s_blocks, 5, _dx, _dy, _s, _s, 0, c_white, 1)
            draw_sprite_ext(s_blocks, 6, _dx + 32 * _s, _dy, _s, _s, 0, c_white, 1)
            draw_sprite_ext(s_blocks, 7, _dx, _dy + 32 * _s, _s, _s, 0, c_white, 1)
            draw_sprite_ext(s_blocks, 8, _dx + 32 * _s, _dy + 32 * _s, _s, _s, 0, c_white, 1)
            _spr = -2;
        } break;
        // LEVEL END：通关杠，整体向下移 48px
        case 2: {_spr = s_markersbank2; _sub = 0; _sw = 94; _sh = 286; _s = 0.15;} break;
        // SOLID
        case 3: {_spr = s_markersbank3; _sub = 0;} break;
        // PLAYER START
        case 4: {_spr = s_markersbank4; _sub = 0;} break;
        // CHECK POINT：使用激活帧 s_checkpoint2（与 o_checkpoint 激活后一致）
        case 5: {_spr = s_checkpoint2; _sub = 0; _sw = 106; _sh = 111; _s = 0.4;} break;
        // SEALER
        case 6: {_spr = s_sealroof; _sub = 0;} break;
        // PLATFORM COLLISION
        case 8: {_spr = s_onlyyou; _sub = 0;} break;
        // MESSAGE
        case 9: {_spr = s_pointblock5; _sub = 0;} break;
        // SWITCH：使用游戏中贴图 s_pointblock6，帧 = color + 8*assist（与放置预览 o_edmain.gml:1939 一致）
        case 10: {_spr = s_pointblock6; _sub = global.yinyangcolor + 8 * global.assist;} break;
        // TYPE A：游戏内 s_yinyang，帧 = 2*color+1 + 16*assist（滚轮改色 + 辅助模式由 global 驱动）
        case 11: {_spr = s_yinyang; _sub = 2 * global.yinyangcolor + 1 + 16 * global.assist;} break;
        // TYPE B：游戏内 s_yinyang，帧 = 2*color + 16*assist
        case 12: {_spr = s_yinyang; _sub = 2 * global.yinyangcolor + 16 * global.assist;} break;
        // ICE
        case 13: {_spr = s_ice; _sub = 0;} break;
        // LEDGE：使用游戏内 s_ledge，帧 = global.ledge_type（滚轮变种由 global.ledge_type 驱动）
        case 14: {_spr = s_ledge; _sub = global.ledge_type;} break;
        // SCENE CONTROL：使用游戏内 s_bgmchange 第 2 帧（用户提供的素材）
        case 16: {_spr = s_bgmchange; _sub = 2;} break;
        // VIEW CONTROL
        case 17: {_spr = s_camerabegin; _sub = 0;} break;
    }
    if _spr > 0 {
        _dx = floor(_cx + 32 - _sw * _s / 2)
        _dy = floor(_cy + 32 - _sh * _s / 2)
        // 特殊偏移
        if _pc4 = 2 {_dy = _dy + 48}
        if _pc4 = 5 {_dx = _dx + 12; _dy = _dy + 26}
        draw_sprite_ext(_spr, _sub, _dx, _dy, _s, _s, 0, c_white, 1)
    }
}
// 下方说明文字：大号字体渲染后再整体缩放，避免小号位图发虚。白字无描边，全大写，至多两行
// _ls 由字体资源 size 自动推算，保持约 7.2px 目标字号；想调清晰度只改 fonts/fnt_label.txt 的 size 即可
if _label != '' {
    draw_set_font(fnt_label)
    _ls = 7.2 / font_get_size(fnt_label)
    _tw = string_width(_label) * _ls
    _th = string_height(_label) * _ls
    _l1 = _label; _l2 = '';
    if _tw > 70 {
        _i = string_pos(' ', _label)
        if _i > 0 {_l1 = string_copy(_label, 1, _i - 1); _l2 = string_copy(_label, _i + 1, string_length(_label) - _i)}
    }
    _ty = _cy + 50
    // 半透明黑色阴影：文字右下偏移 1px 先画一次，增强可读性
    draw_set_color(c_black)
    draw_set_alpha(0.5)
    draw_text_transformed(_cx + 32 - string_width(_l1) * _ls / 2 + 1, _ty + 1, _l1, _ls, _ls, 0)
    if _l2 != '' {draw_text_transformed(_cx + 32 - string_width(_l2) * _ls / 2 + 1, _ty + _th + 1, _l2, _ls, _ls, 0)}
    // 白字（无描边），alpha=1
    draw_set_alpha(1)
    draw_set_color(c_white)
    draw_text_transformed(_cx + 32 - string_width(_l1) * _ls / 2, _ty, _l1, _ls, _ls, 0)
    if _l2 != '' {draw_text_transformed(_cx + 32 - string_width(_l2) * _ls / 2, _ty + _th, _l2, _ls, _ls, 0)}
}
