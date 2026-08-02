// ed_net_cleanup()
// 清理所有 socket/listener 并复位会话状态（在 o_ednet 上下文调用）
var _i;
// debug_log('[net] cleanup: state=' + string(net_state) + ' socks=' + string(net_sock_count) + ' listener=' + string(net_listener))
_i = 0
while _i < net_sock_count {
    if net_socks[_i] >= 0 {
        if socket_exists(net_socks[_i]) {
            socket_destroy(net_socks[_i])
        }
        net_socks[_i] = -1
    }
    _i += 1
}
net_sock_count = 0
if net_listener >= 0 {
    if listener_exists(net_listener) {
        listener_destroy(net_listener)
    }
    net_listener = -1
}
net_state = 0
net_role = 0
net_myid = 0
net_pl_count = 0
net_peer_name = ''
net_peer_addr = ''
net_peer_cursor_time = -1
// 清理 op23 半截接收文件
if net_file_fid >= 0 {
    file_bin_close(net_file_fid)
    net_file_fid = -1
}
if net_file_path <> '' {
    if file_exists(net_file_path) {
        file_delete(net_file_path)
    }
    if file_exists(filename_change_ext(net_file_path, '.smwlx')) {
        file_delete(filename_change_ext(net_file_path, '.smwlx'))
    }
    net_file_path = ''
}
net_file_total = 0
net_file_got = 0
// 清理测关编辑队列（重建空 buffer 供下次会话使用）
_i = 0
while _i < 6 {
    buffer_destroy(net_q[_i])
    net_q[_i] = buffer_create()
    _i += 1
}
net_q_pending = 0
