// ed_scenery_draw(coto, cx, cy, label)
// 在 64x64 的格子（左上角 cx,cy）内绘制景物图标 + 下方说明文字。
// 图标取自 s_sceneriesbank（coto-1），带专用动画帧的景物用其独立精灵。
// 文字使用 fnt_label（Arial Narrow Bold Italic，白字无描边，全大写），与原面板一致。
var _coto, _cx, _cy, _label, _spr, _sub, _ox, _oy, _ccx, _ccy, _s, _dx, _dy, _skip_icon;
var _tw, _th, _ty, _l1, _l2, _i;
_coto = argument0
_cx = argument1
_cy = argument2
_label = argument3
// imitater(coto=42) 图标由面板专属逻辑绘制，这里只画文字，不画图标
_skip_icon = 0
if _coto = 42 {_skip_icon = 1}
_spr = s_sceneriesbank
_sub = 0
_ox = 142; _oy = 208; _s = 0.8; _ccx = 154; _ccy = 213;
switch (_coto) {
    case 1: {_spr=s_cloudscenery; _sub=0; _ox=46; _oy=49; _ccx=46.0; _ccy=25.5; _s=0.742;} break;
    case 2: {_spr=s_grass; _sub=0; _ox=32; _oy=31; _ccx=30.5; _ccy=16.5; _s=0.839;} break;
    case 7: {_spr=s_clouddark; _sub=0; _ox=46; _oy=49; _ccx=46.0; _ccy=25.5; _s=0.742;} break;
    case 8: {_spr=s_grassdark; _sub=0; _ox=32; _oy=33; _ccx=31.5; _ccy=18.5; _s=0.839;} break;
    case 13: {_spr=s_cloud2; _sub=0; _ox=32; _oy=47; _ccx=32.0; _ccy=23.0; _s=0.742;} break;
    case 14: {_spr=s_light; _sub=0; _ox=26; _oy=64; _ccx=26.0; _ccy=26.0; _s=0.83;} break;
    case 22: {_spr=s_grassaunt; _sub=0; _ox=32; _oy=29; _ccx=30.5; _ccy=14.5; _s=0.839;} break;
    case 25: {_spr=s_freefuck; _sub=0; _ox=32; _oy=29; _ccx=30.5; _ccy=14.5; _s=0.839;} break;
    case 31: {_spr=s_grassdesert; _sub=0; _ox=32; _oy=31; _ccx=30.5; _ccy=16.5; _s=0.839;} break;
    case 34: {_spr=s_clouddesert; _sub=0; _ox=32; _oy=47; _ccx=32.0; _ccy=23.5; _s=0.742;} break;
    case 35: {_spr=s_lavafall; _sub=0; _ox=32; _oy=32; _ccx=32.5; _ccy=15.5; _s=0.963;} break;
    case 37: {_spr=s_cloudgrey; _sub=0; _ox=32; _oy=47; _ccx=32.0; _ccy=23.0; _s=0.742;} break;
    case 38: {_spr=s_rotocenter; _sub=0; _ox=14; _oy=30; _ccx=14.0; _ccy=13.5; _s=1.0;} break;
    case 39: {_spr=s_corala; _sub=0; _ox=15; _oy=160; _ccx=14.0; _ccy=79.5; _s=0.325;} break;
    case 40: {_spr=s_coralb; _sub=0; _ox=15; _oy=160; _ccx=13.5; _ccy=79.5; _s=0.325;} break;
    case 41: {_spr=s_coralc; _sub=0; _ox=15; _oy=160; _ccx=13.5; _ccy=79.5; _s=0.325;} break;
    case 1: {_spr=s_sceneriesbank; _sub=0; _ox=142; _oy=208; _ccx=154.0; _ccy=213.5; _s=0.742;} break;
    case 2: {_spr=s_sceneriesbank; _sub=1; _ox=142; _oy=208; _ccx=157.5; _ccy=224.5; _s=0.839;} break;
    case 3: {_spr=s_sceneriesbank; _sub=2; _ox=142; _oy=208; _ccx=158.0; _ccy=209.5; _s=0.565;} break;
    case 4: {_spr=s_sceneriesbank; _sub=3; _ox=142; _oy=208; _ccx=159.0; _ccy=193.5; _s=0.565;} break;
    case 5: {_spr=s_sceneriesbank; _sub=4; _ox=142; _oy=208; _ccx=158.5; _ccy=223.5; _s=0.366;} break;
    case 6: {_spr=s_sceneriesbank; _sub=5; _ox=142; _oy=208; _ccx=158.0; _ccy=209.5; _s=0.867;} break;
    case 7: {_spr=s_sceneriesbank; _sub=6; _ox=142; _oy=208; _ccx=154.0; _ccy=213.5; _s=0.742;} break;
    case 8: {_spr=s_sceneriesbank; _sub=7; _ox=142; _oy=208; _ccx=157.5; _ccy=224.5; _s=0.839;} break;
    case 9: {_spr=s_sceneriesbank; _sub=8; _ox=142; _oy=208; _ccx=158.0; _ccy=209.5; _s=0.565;} break;
    case 10: {_spr=s_sceneriesbank; _sub=9; _ox=142; _oy=208; _ccx=159.0; _ccy=193.5; _s=0.565;} break;
    case 11: {_spr=s_sceneriesbank; _sub=10; _ox=142; _oy=208; _ccx=158.5; _ccy=223.5; _s=0.366;} break;
    case 12: {_spr=s_sceneriesbank; _sub=11; _ox=142; _oy=208; _ccx=159.0; _ccy=193.5; _s=0.565;} break;
    case 13: {_spr=s_sceneriesbank; _sub=12; _ox=142; _oy=208; _ccx=154.0; _ccy=213.5; _s=0.742;} break;
    case 14: {_spr=s_sceneriesbank; _sub=13; _ox=142; _oy=208; _ccx=158.0; _ccy=201.0; _s=0.85;} break;
    case 15: {_spr=s_sceneriesbank; _sub=14; _ox=142; _oy=208; _ccx=157.5; _ccy=198.0; _s=1.0;} break;
    case 16: {_spr=s_sceneriesbank; _sub=15; _ox=142; _oy=208; _ccx=159.0; _ccy=191.5; _s=0.278;} break;
    case 17: {_spr=s_sceneriesbank; _sub=16; _ox=142; _oy=208; _ccx=159.0; _ccy=191.5; _s=0.148;} break;
    case 18: {_spr=s_sceneriesbank; _sub=17; _ox=142; _oy=208; _ccx=206.5; _ccy=287.5; _s=0.325;} break;
    case 19: {_spr=s_sceneriesbank; _sub=18; _ox=142; _oy=208; _ccx=158.5; _ccy=223.5; _s=0.65;} break;
    case 20: {_spr=s_sceneriesbank; _sub=19; _ox=142; _oy=208; _ccx=158.5; _ccy=223.5; _s=0.65;} break;
    case 21: {_spr=s_sceneriesbank; _sub=20; _ox=142; _oy=208; _ccx=158.5; _ccy=223.5; _s=0.65;} break;
    case 22: {_spr=s_sceneriesbank; _sub=21; _ox=142; _oy=208; _ccx=157.5; _ccy=224.5; _s=0.839;} break;
    case 23: {_spr=s_sceneriesbank; _sub=22; _ox=142; _oy=208; _ccx=158.0; _ccy=209.5; _s=0.565;} break;
    case 24: {_spr=s_sceneriesbank; _sub=23; _ox=142; _oy=208; _ccx=159.0; _ccy=193.5; _s=0.565;} break;
    case 25: {_spr=s_sceneriesbank; _sub=24; _ox=142; _oy=208; _ccx=157.5; _ccy=224.5; _s=0.839;} break;
    case 26: {_spr=s_sceneriesbank; _sub=25; _ox=142; _oy=208; _ccx=158.0; _ccy=209.5; _s=0.565;} break;
    case 27: {_spr=s_sceneriesbank; _sub=26; _ox=142; _oy=208; _ccx=159.0; _ccy=193.5; _s=0.565;} break;
    case 28: {_spr=s_sceneriesbank; _sub=27; _ox=142; _oy=208; _ccx=158.5; _ccy=223.5; _s=0.361;} break;
    case 29: {_spr=s_sceneriesbank; _sub=28; _ox=142; _oy=208; _ccx=160.5; _ccy=192.0; _s=0.271;} break;
    case 30: {_spr=s_sceneriesbank; _sub=29; _ox=142; _oy=208; _ccx=159.5; _ccy=197.0; _s=0.152;} break;
    case 31: {_spr=s_sceneriesbank; _sub=30; _ox=142; _oy=208; _ccx=157.5; _ccy=224.5; _s=0.839;} break;
    case 32: {_spr=s_sceneriesbank; _sub=31; _ox=142; _oy=208; _ccx=158.0; _ccy=209.5; _s=0.565;} break;
    case 33: {_spr=s_sceneriesbank; _sub=32; _ox=142; _oy=208; _ccx=159.0; _ccy=193.5; _s=0.565;} break;
    case 34: {_spr=s_sceneriesbank; _sub=33; _ox=142; _oy=208; _ccx=154.0; _ccy=213.5; _s=0.742;} break;
    case 35: {_spr=s_sceneriesbank; _sub=34; _ox=142; _oy=208; _ccx=158.5; _ccy=223.5; _s=0.963;} break;
    case 36: {_spr=s_sceneriesbank; _sub=35; _ox=142; _oy=208; _ccx=158.5; _ccy=231.5; _s=0.377;} break;
    case 37: {_spr=s_sceneriesbank; _sub=36; _ox=142; _oy=208; _ccx=154.0; _ccy=213.5; _s=0.742;} break;
    case 38: {_spr=s_sceneriesbank; _sub=37; _ox=142; _oy=208; _ccx=158.0; _ccy=223.5; _s=1.0;} break;
    case 39: {_spr=s_sceneriesbank; _sub=38; _ox=142; _oy=208; _ccx=157.0; _ccy=159.5; _s=0.325;} break;
    case 40: {_spr=s_sceneriesbank; _sub=39; _ox=142; _oy=208; _ccx=156.5; _ccy=159.5; _s=0.325;} break;
    case 41: {_spr=s_sceneriesbank; _sub=40; _ox=142; _oy=208; _ccx=156.5; _ccy=159.5; _s=0.325;} break;
}
// 居中绘制图标：使内容中心对齐格子中心（imitater 跳过图标绘制）
_dx = _cx + 32 + (_ox - _ccx) * _s
_dy = _cy + 32 + (_oy - _ccy) * _s
if _skip_icon = 0 {
    draw_sprite_ext(_spr, _sub, _dx, _dy, _s, _s, 0, c_white, 1)
}
// 下方说明文字：仅 imitater（_skip_icon=1）保留文字，其余景物不绘制文字
// 大号字体渲染后再整体缩放，避免小号位图发虚。白字无描边，全大写，至多两行
// _ls 由字体资源 size 自动推算，保持约 7.2px 目标字号；想调清晰度只改 fonts/fnt_label.txt 的 size 即可
if _label != '' && _skip_icon = 1 {
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