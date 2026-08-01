// ed_net_cleanup()
// 清理 socket/listener 并复位会话状态（在 o_ednet 上下文调用）
debug_log('[net] cleanup: state=' + string(net_state) + ' sock=' + string(net_sock) + ' listener=' + string(net_listener))
if net_sock >= 0 {
    if socket_exists(net_sock) {
        socket_destroy(net_sock)
    }
    net_sock = -1
}
if net_listener >= 0 {
    if listener_exists(net_listener) {
        listener_destroy(net_listener)
    }
    net_listener = -1
}
net_state = 0
net_role = 0
net_myid = 0
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
