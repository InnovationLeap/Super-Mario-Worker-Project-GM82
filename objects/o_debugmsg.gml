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
// 绘制字体用 fw 库的 testfont（welcome 房间加载的 message.ttf）；GM8 原生无法加载 TTF，详见 AGENTS.md
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _mi, _entry, _pipe, _timer, _msg;
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
var _mi, _my, _entry, _pipe, _msg, _timer, _vx, _vy;
if (variable_global_exists("debug_msg_list")) {
    _my = 30;
    _mi = 0;
    while (_mi < ds_list_size(global.debug_msg_list)) {
        _entry = ds_list_find_value(global.debug_msg_list, _mi);
        _pipe = string_pos("|", _entry);
        if (_pipe > 0) {
            _msg = string_copy(_entry, _pipe + 1, string_length(_entry) - _pipe);
            _timer = real(string_copy(_entry, 1, _pipe - 1));
        } else {
            _msg = _entry;
            _timer = 999;
        }
        _vx = 8;
        _vy = _my;
        // 最旧消息（列表头部）剩余寿命 <30 帧时向上滑出屏幕：
        // fw 文本不支持透明度渲染，用位移代替 alpha 淡化
        if (_mi = 0 && _timer < 30) {
            _vy = _vy - (30 - _timer) * 2;
        }
        // testfont 是 fw 库字体 ID（welcome 房间 fw_add_font_from_file 加载的 message.ttf），
        // 必须用 fw_draw_set_font + fw_draw_text 配套绘制
        fw_draw_set_font(testfont)
        draw_set_color(c_white);
        fw_draw_text(_vx, _vy, _msg);
        _mi += 1;
        _my += 20;
    }
}
