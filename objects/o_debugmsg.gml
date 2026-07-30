#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _mi, _mt;
if (variable_global_exists("debug_msg_list") == false) {
    global.debug_msg_list = ds_list_create();
}
depth = -1999999999;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _mi, _entry, _pipe, _timer, _msg;
if (keyboard_check_pressed(vk_f11)) {
    if (variable_global_exists("debug_msg_list") == false) {
        global.debug_msg_list = ds_list_create();
    }
    ds_list_add(global.debug_msg_list, "180|测试: F11 于 " + string(current_time));
}
if (variable_global_exists("debug_msg_list")) {
    _mi = 0;
    while (_mi < ds_list_size(global.debug_msg_list)) {
        _entry = ds_list_find_value(global.debug_msg_list, _mi);
        _pipe = string_pos("|", _entry);
        if (_pipe > 0) {
            _timer = real(string_copy(_entry, 1, _pipe - 1));
            _timer -= 1;
            if (_timer <= 0) {
                ds_list_delete(global.debug_msg_list, _mi);
            } else {
                _msg = string_copy(_entry, _pipe + 1, string_length(_entry) - _pipe);
                ds_list_replace(global.debug_msg_list, _mi, string(_timer) + "|" + _msg);
                _mi += 1;
            }
        } else {
            _mi += 1;
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _mi, _my, _entry, _pipe, _msg, _timer, _alpha, _vx, _vy;
if (variable_global_exists("debug_msg_list")) {
    _my = 30;
    _mi = 0;
    while (_mi < ds_list_size(global.debug_msg_list)) {
        _entry = ds_list_find_value(global.debug_msg_list, _mi);
        _pipe = string_pos("|", _entry);
        if (_pipe > 0) {
            _msg = string_copy(_entry, _pipe + 1, string_length(_entry) - _pipe);
            _timer = real(string_copy(_entry, 1, _pipe - 1));
            if (_timer < 30) {
                _alpha = _timer / 30;
            } else {
                _alpha = 1;
            }
        } else {
            _msg = _entry;
            _alpha = 1;
        }
        _vx = view_xview[0] + 8;
        _vy = view_yview[0] + _my;
        draw_set_alpha(_alpha);
        draw_set_color(c_black);
        draw_text(_vx + 1, _vy + 1, _msg);
        draw_set_color(c_white);
        draw_text(_vx, _vy, _msg);
        draw_set_alpha(1);
        _mi += 1;
        _my += 20;
    }
}
