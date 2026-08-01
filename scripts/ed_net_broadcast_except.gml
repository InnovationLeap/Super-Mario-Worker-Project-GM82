// ed_net_broadcast_except(src_sock, buf)
// 房主广播（排除来源 socket）：发送 buffer 内容到除 src_sock 外全部客户端（o_ednet 上下文调用）
// 用于：客户端发起的增量编辑/光标/聊天，房主转发给其他客户端（不重放给来源）
var _i;
_i = 0
while _i < net_sock_count {
    if net_socks[_i] >= 0 && net_socks[_i] != argument0 {
        if socket_exists(net_socks[_i]) {
            socket_write_message(net_socks[_i], argument1)
            socket_send(net_socks[_i])
        }
    }
    _i += 1
}
