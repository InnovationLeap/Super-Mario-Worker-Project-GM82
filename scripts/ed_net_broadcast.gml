// ed_net_broadcast(buf)
// 房主广播：发送 buffer 内容到全部客户端 socket（o_ednet 上下文调用）
var _i;
_i = 0
while _i < net_sock_count {
    if net_socks[_i] >= 0 {
        if socket_exists(net_socks[_i]) {
            socket_write_message(net_socks[_i], argument0)
            socket_send(net_socks[_i])
        }
    }
    _i += 1
}
