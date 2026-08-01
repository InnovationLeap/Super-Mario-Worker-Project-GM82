// ed_net_trace(msg)
// 联机调试：仅 debug_mode 下追加到 net_trace_<myid>.txt（按 net_myid 分文件，双实例不竞争写同一文件）
if debug_mode {
    var _f, _sfx;
    _sfx = '0'
    if instance_exists(o_ednet) {
        _sfx = string(o_ednet.net_myid)
    }
    _f = file_text_open_append(working_directory + '\net_trace_' + _sfx + '.txt')
    file_text_write_string(_f, argument0)
    file_text_writeln(_f)
    file_text_close(_f)
}
