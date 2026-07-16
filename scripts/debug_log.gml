// debug_log: 仅在 debug_mode 下弹出消息框并追加到 debug_log.txt
// argument0 = 完整消息字符串
if debug_mode
{
    show_message(argument0)
    var _f; _f = file_text_open_append(working_directory + "\debug_log.txt")
    file_text_write_string(_f, argument0)
    file_text_writeln(_f)
    file_text_close(_f)
}