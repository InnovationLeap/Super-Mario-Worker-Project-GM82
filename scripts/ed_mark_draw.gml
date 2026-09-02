// ed_mark_draw(pc4, cx, cy, label)
// 在 64x64 的格子（左上角 cx,cy）内绘制 marks 图标 + 下方说明文字。
// 图标源按原 s_edmarkers 面板逐格还原，并居中于格子。
// 滚轮类（7/15）只写文字、不画图标，由现有覆盖层提供预览。
// 运输桥（19-24）：桥条用游戏内 s_platforms（滚轮换样式），方向箭头代码绘制（原 s_edmarkersmask 烘焙遮罩已废弃）。
// LEDGE(14) 用游戏内 s_ledge 绘制（滚轮变种由 global.ledge_type 驱动）。
// TYPE A(11)/TYPE B(12) 用游戏内 s_yinyang 贴图绘制，滚轮改色由 global.yinyangcolor 驱动。
// 文字使用 fnt_label（Arial Narrow Bold Italic，白字无描边，全大写），与 enemies/scenery/bonus 一致。
var _pc4, _cx, _cy, _label, _wheel, _spr, _sub, _sw, _sh, _s, _sx, _sy, _dx, _dy, _tw, _th, _ty, _l1, _l2, _i, _as, _ax, _ay, _at, _aa, _bx, _by;
_pc4 = argument0
_cx = argument1
_cy = argument2
_label = argument3
_wheel = 0
if _pc4 = 7 || _pc4 = 15 {_wheel = 1}
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
            // 顶部箭头：白色下指、尾矩形自下而上淡出（VIEW CONTROL 同款），缩放 0.6 居中于格子顶部
            _as = 0.6
            _ax = _cx + 32 - 15 * _as
            _ay = _cy - 4
            draw_set_color(c_white)
            draw_set_alpha(1)
            draw_triangle(_ax + 4 * _as, _ay + 22 * _as, _ax + 25 * _as, _ay + 22 * _as, _ax + 15 * _as, _ay + 40 * _as, 0)
            _i = 12
            while (_i <= 21)
            {
                _at = (_i - 12) / 9
                _aa = 0.15 + _at * 0.65
                draw_set_alpha(_aa)
                draw_rectangle(_ax + 8 * _as, _ay + _i * _as, _ax + 22 * _as, _ay + _i * _as + _as, 0)
                _i = _i + 1
            }
            draw_set_alpha(1)
            _spr = -2;
        } break;
        // LEVEL END：通关杠，整体向下移 48px
        case 2: {_spr = s_markersbank2; _sub = 0; _sw = 94; _sh = 286; _s = 0.15;} break;
        // SOLID
        case 3: {_spr = s_markersbank3; _sub = 0; _s = 0.8;} break;
        // PLAYER START：用 s_bigmariorun 第 1 帧（40x80 缩到 20x40 居中，靠上半部避开 cy+50 标签）
        case 4: {_spr = s_bigmariorun; _sub = 1; _sw = 40; _sh = 80; _s = 0.5;} break;
        // CHECK POINT：使用激活帧 s_checkpoint2（与 o_checkpoint 激活后一致）
        case 5: {_spr = s_checkpoint2; _sub = 0; _sw = 106; _sh = 111; _s = 0.4;} break;
        // SEALER
        case 6: {_spr = s_sealroof; _sub = 0; _s = 0.8;} break;
        // PLATFORM COLLISION
        case 8: {_spr = s_onlyyou; _sub = 0; _s = 0.8;} break;
        // MESSAGE
        case 9: {_spr = s_pointblock5; _sub = 0; _s = 0.8;} break;
        // SWITCH：使用游戏中贴图 s_pointblock6，帧 = color + 8*assist（与放置预览 o_edmain.gml:1939 一致）
        case 10: {_spr = s_pointblock6; _sub = global.yinyangcolor + 8 * global.assist; _s = 0.8;} break;
        // TYPE A：游戏内 s_yinyang，帧 = 2*color+1 + 16*assist（滚轮改色 + 辅助模式由 global 驱动）
        case 11: {_spr = s_yinyang; _sub = 2 * global.yinyangcolor + 1 + 16 * global.assist; _s = 0.8;} break;
        // TYPE B：游戏内 s_yinyang，帧 = 2*color + 16*assist
        case 12: {_spr = s_yinyang; _sub = 2 * global.yinyangcolor + 16 * global.assist; _s = 0.8;} break;
        // ICE
        case 13: {_spr = s_ice; _sub = 0; _s = 0.8;} break;
        // LEDGE：使用游戏内 s_ledge，帧 = global.ledge_type（滚轮变种由 global.ledge_type 驱动）
        case 14: {_spr = s_ledge; _sub = global.ledge_type; _s = 0.8;} break;
        // SCENE CONTROL：使用游戏内 s_bgmchange 第 2 帧（用户提供的素材）
        case 16: {_spr = s_bgmchange; _sub = 2; _s = 0.8;} break;
        // VIEW CONTROL
        case 17: {_spr = s_camerabegin; _sub = 0; _s = 0.8;} break;
        // 运输桥系列：桥条直接用游戏内 s_platforms（滚轮换样式 global.platformanime），居中于格子
        case 19: {_spr = s_platforms; _sub = global.platformanime;} break;
        case 20: {_spr = s_platforms; _sub = global.platformanime;} break;
        case 21: {_spr = s_platforms; _sub = global.platformanime;} break;
        case 22: {_spr = s_platforms; _sub = global.platformanime;} break;
        case 23: {_spr = s_platforms; _sub = global.platformanime;} break;
        case 24: {_spr = s_platforms; _sub = global.platformanime;} break;
    }
    if _spr > 0 {
        _dx = floor(_cx + 32 - _sw * _s / 2)
        _dy = floor(_cy + 32 - _sh * _s / 2)
        // 特殊偏移
        if _pc4 = 2 {_dy = _dy + 48}
        if _pc4 = 4 {_dx = _dx + 8; _dy = _dy + 32}
        if _pc4 = 5 {_dx = _dx + 12; _dy = _dy + 26}
        // 运输桥：s_platforms（origin 0,0）各帧内容尺寸不一（长桥95x16/短桥30x16/高桥120-126x32等），
        // 按帧给等效缩放与位置，复原原 66x16 逐帧手工缩小贴图 ×0.8 的视觉（不透明区域落点、尺寸一致）
        if _pc4 >= 19 && _pc4 <= 24 {
            _sx = 0.556; _sy = 0.6; _dx = _cx + 4.6; _dy = _cy + 21.2
            switch (_sub) {
                case 1:  _sx = 0.56; _sy = 0.6; _dx = _cx + 23; _dy = _cy + 21.2; break; // 短桥
                case 4:  _sx = 0.56; _sy = 0.6; _dx = _cx + 23; _dy = _cy + 21.2; break;
                case 6:  _sx = 0.56; _sy = 0.6; _dx = _cx + 23; _dy = _cy + 21.2; break;
                case 8:  _sx = 0.56; _sy = 0.6; _dx = _cx + 23; _dy = _cy + 21.2; break;
                case 10: _sx = 0.56; _sy = 0.6; _dx = _cx + 23; _dy = _cy + 21.2; break;
                case 12: _sx = 0.56; _sy = 0.6; _dx = _cx + 23; _dy = _cy + 21.2; break;
                case 14: _sx = 0.56; _sy = 0.6; _dx = _cx + 23; _dy = _cy + 21.2; break;
                case 2:  _sx = 0.387; _sy = 0.4; _dx = _cx + 7; _dy = _cy + 24.4; break; // 高桥
                case 15: _sx = 0.387; _sy = 0.4; _dx = _cx + 7.8; _dy = _cy + 24.4; break;
                case 16: _sx = 0.389; _sy = 0.4; _dx = _cx + 16.6; _dy = _cy + 24.4; break;
                case 17: _sx = 0.353; _sy = 0.4; _dx = _cx + 10.2; _dy = _cy + 24.4; break;
                case 18: _sx = 0.358; _sy = 0.4; _dx = _cx + 17.4; _dy = _cy + 24.4; break;
            }
            // SPEED 1/2/3（20-22）的桥再下移 4px
            if _pc4 = 20 || _pc4 = 21 || _pc4 = 22 {_dy = _dy + 4}
            draw_sprite_ext(_spr, _sub, _dx, _dy, _sx, _sy, 0, c_white, 1)
            _spr = -2   // 已绘制，跳过下方统一绘制
        }
        if _spr > 0 {
            draw_sprite_ext(_spr, _sub, _dx, _dy, _s, _s, 0, c_white, 1)
        }
    }
    // 运输桥方向箭头：passage 同款“三角头+尾矩形淡出”，全整数像素；四个方向由 ▼ 基准绕几何中心精确旋转（90/180°）保证形状一致
    if _pc4 >= 19 && _pc4 <= 24 {
        if _pc4 = 20 || _pc4 = 21 || _pc4 = 22 {
            // SPEED：左 ◀（14x12）+ 右 ▶（14x12），垂直居中于桥（中心 y=33）
            _ay = _cy + 27
            // ◀：三角底边 x8 (y2-13) 尖 (0,7)，尾矩形 x9-13 y4-11，向左淡出（0.80→0.15）
            _ax = _cx + 2
            draw_set_color(c_white)
            draw_set_alpha(1)
            draw_triangle(_ax + 8, _ay + 2, _ax + 8, _ay + 13, _ax + 0, _ay + 7, 0)
            _i = 0
            while (_i <= 5) {
                _at = _i / 5
                _aa = 0.80 - _at * 0.65
                draw_set_alpha(_aa)
                draw_rectangle(_ax + 8 + _i, _ay + 4, _ax + 9 + _i, _ay + 12, 0)
                _i = _i + 1
            }
            // ▶：三角底边 x5 (y2-13) 尖 (13,7)，尾矩形 x0-4 y4-11，向右淡出（0.15→0.80）
            _ax = _cx + 48
            draw_set_alpha(1)
            draw_triangle(_ax + 5, _ay + 2, _ax + 5, _ay + 13, _ax + 13, _ay + 7, 0)
            _i = 0
            while (_i <= 5) {
                _at = _i / 5
                _aa = 0.15 + _at * 0.65
                draw_set_alpha(_aa)
                draw_rectangle(_ax + 0 + _i, _ay + 4, _ax + 1 + _i, _ay + 12, 0)
                _i = _i + 1
            }
        } else if _pc4 = 24 {
            // CONTINUOUS 上：桥下方 ▲▲▲（12x14，▼ 旋转180°：三角底边 y9 (x1-12) 尖 (6,1)，尾 x3-10 y10-14）
            _i = 0
            while (_i < 3) {
                _ax = _cx + 11 + _i * 15
                _ay = _cy + 32
                draw_set_color(c_white)
                draw_set_alpha(1)
                draw_triangle(_ax + 1, _ay + 9, _ax + 12, _ay + 9, _ax + 6, _ay + 1, 0)
                _bx = 0
                while (_bx <= 5) {
                    _at = _bx / 5
                    _aa = 0.80 - _at * 0.65
                    draw_set_alpha(_aa)
                    draw_rectangle(_ax + 3, _ay + 9 + _bx, _ax + 11, _ay + 10 + _bx, 0)
                    _bx = _bx + 1
                }
                _i = _i + 1
            }
        } else {
            // FALLING ON STEP / CONTINUOUS 下：桥上方 ▼▼▼（12x14，基准：三角底边 y5 (x0-11) 尖 (6,13)，尾 x2-9 y0-4）
            _i = 0
            while (_i < 3) {
                _ax = _cx + 11 + _i * 15
                _ay = _cy + 4
                draw_set_color(c_white)
                draw_set_alpha(1)
                draw_triangle(_ax + 0, _ay + 5, _ax + 11, _ay + 5, _ax + 6, _ay + 13, 0)
                _bx = 0
                while (_bx <= 4) {
                    _at = _bx / 4
                    _aa = 0.15 + _at * 0.65
                    draw_set_alpha(_aa)
                    draw_rectangle(_ax + 2, _ay + _bx, _ax + 10, _ay + _bx + 1, 0)
                    _bx = _bx + 1
                }
                _i = _i + 1
            }
        }
        draw_set_alpha(1)
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
