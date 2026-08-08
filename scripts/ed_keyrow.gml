// ed_keyrow(id, label, y, global_name, ini_name)
// 单行按键重映射 UI：绘制标签与当前键值，点击进入监听，松键后写入 global 与 KeyConfig ini。
// 依赖调用方上下文（o_edititle 实例）中的 setkey/kliknieto/keydetect/keydetect2/ed_hit。
var _id, _label, _y, _gname, _iname;
var _disp;
_id = argument0
_label = argument1
_y = argument2
_gname = argument3
_iname = argument4
if keydetect = _id { _disp = 'press a key...' } else { _disp = setkey[variable_global_get(_gname)] }
draw_set_color(c_white)
draw_text(view_xview[0] + 40, view_yview[0] + _y, string_upper(_label))
draw_set_halign(fa_right)
draw_text(view_xview[0] + 405, view_yview[0] + _y, string_upper(_disp))
draw_set_halign(fa_left)
if ed_hit(40, _y - 10, 220, 20) && clicked = 0 {
    draw_prefs_highlight(view_xview[0] + 40, view_yview[0] + _y - 10, 1.4, 0.8, 0.2);
    if mouse_check_button(mb_left) { keydetect = _id; keydetect2 = 1 }
}
if keydetect = _id && keyboard_check_released(vk_anykey) && (keyboard_lastkey != 0 && keyboard_lastkey <= 222) {
    variable_global_set(_gname, keyboard_lastkey)
    ini_write_real('KeyConfig', _iname, keyboard_lastkey)
    keydetect = 0
}
