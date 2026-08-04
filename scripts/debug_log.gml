// debug_log: 仅在 debug_mode 下添加消息到屏幕显示（3秒消失）并追加到 debug_log.txt
// argument0 = 完整消息字符串
if debug_mode {
    if (variable_global_exists("debug_msg_list") == false) {
        global.debug_msg_list = ds_list_create();
    }
    ds_list_add(global.debug_msg_list, "180|" + argument0);
    var _f; _f = file_text_open_append(working_directory + "\debug_log.txt")
    file_text_write_string(_f, argument0)
    file_text_writeln(_f)
    file_text_close(_f)
}
