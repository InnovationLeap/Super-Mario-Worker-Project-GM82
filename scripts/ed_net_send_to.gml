// ed_net_send_to(sock, buf)
// 单播：发送 buffer 内容到指定 socket（o_ednet 上下文调用）
if argument0 >= 0 {
    if socket_exists(argument0) {
        socket_write_message(argument0, argument1)
        socket_send(argument0)
    }
}
