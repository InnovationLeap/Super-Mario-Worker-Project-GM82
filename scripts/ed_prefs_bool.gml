// ed_prefs_bool(id, label, y, netkey, invert [, v1_text, v0_text, v1_color, v0_color])
// 渲染+交互一个布尔设置项（prefs 面板）。id 决定读写哪个 global（GM8 无法传变量引用）。
// y = 标签绘制行（命中区自动 y-10，高亮自动 (40, y-10)，与原文一致）。invert=1 颜色反转（0=紫 yes / 1=红 no）。
// 可选参数用于特化项还原重构前的显示文字：v1_text/v0_text = 值为 1/0 时右侧文字（默认 yes/no），
// v1_color/v0_color = 对应文字颜色（默认按 invert 取紫/红）。
var _id, _label, _y, _netkey, _invert, _val, _v1text, _v0text, _v1col, _v0col;
_id = argument0
_label = argument1
_y = argument2
_netkey = argument3
_invert = argument4
_val = 0
_v1text = 'yes'
_v0text = 'no'
if _invert = 0 {
    _v1col = make_color_rgb(168,160,248);
    _v0col = make_color_rgb(248,136,112)
} else {
    _v1col = make_color_rgb(248,136,112);
    _v0col = make_color_rgb(168,160,248)
}
if argument_count > 5 {_v1text = argument5}
if argument_count > 6 {_v0text = argument6}
if argument_count > 7 {_v1col = argument7}
if argument_count > 8 {_v0col = argument8}
switch (_id) {
    case 1: _val = global.modifiedmov; break;
    case 2: _val = global.rotodisclay; break;
    case 3: _val = global.lava; break;
    case 4: _val = global.auto; break;
    case 5: _val = global.advswitch; break;
    case 6: _val = global.fast_retry; break;
    case 7: _val = global.MFbeet; break;
    case 8: _val = global.celeste; break;
    case 9: _val = global.pipeout; break;
    case 10: _val = global.fastpass; break;
    case 11: _val = global.huddisplay; break;
    case 12: _val = global.stunblock; break;
    case 13: _val = global.topdeath; break;
}
draw_text(view_xview[0]+40, view_yview[0]+_y, string_upper(_label))
draw_set_halign(fa_right)
if _val = 1 {draw_set_color(_v1col);draw_text(view_xview[0]+405,view_yview[0]+_y,string_upper(_v1text))}
if _val = 0 {draw_set_color(_v0col);draw_text(view_xview[0]+405,view_yview[0]+_y,string_upper(_v0text))}
draw_set_halign(fa_left)
draw_set_color(c_white)
if ed_hit(40, _y-10, 190, 20) && clicked = 0 {
    draw_prefs_highlight(view_xview[0]+40, view_yview[0]+_y-10, 1.4, 0.8, 0.2);
    if mouse_check_button(mb_left) {
        switch (_id) {
            case 1: global.modifiedmov=1-global.modifiedmov; break;
            case 2: global.rotodisclay=1-global.rotodisclay; break;
            case 3: global.lava=1-global.lava; break;
            case 4: global.auto=1-global.auto; break;
            case 5: global.advswitch=1-global.advswitch; break;
            case 6: global.fast_retry=1-global.fast_retry; break;
            case 7: global.MFbeet=1-global.MFbeet; break;
            case 8: global.celeste=1-global.celeste; break;
            case 9: global.pipeout=1-global.pipeout; break;
            case 10: global.fastpass=1-global.fastpass; break;
            case 11: global.huddisplay=1-global.huddisplay; break;
            case 12: global.stunblock=1-global.stunblock; break;
            case 13: global.topdeath=1-global.topdeath; break;
        }
        clicked = 1
        ed_net_ops_send_settings(_netkey)
    }
}
