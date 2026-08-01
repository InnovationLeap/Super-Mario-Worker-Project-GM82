// ed_net_send_goodbye(buf[, reason])
// 发送断开通知（在 o_ednet 上下文调用）
if net_sock >= 0 {
    if socket_exists(net_sock) {
        buffer_clear(argument0)
        buffer_set_pos(argument0, 0)
        buffer_write_u8(argument0, 240)
        if argument_count > 1 {
            ed_net_write_str(argument0, argument1)
        }
        socket_write_message(net_sock, argument0)
        socket_send(net_sock)
    }
}
