// ed_net_send_goodbye(buf[, reason])
// 发送断开通知（在 o_ednet 上下文调用，客户端仅 net_socks[0]）
if net_sock_count > 0 {
    if socket_exists(net_socks[0]) {
        buffer_clear(argument0)
        buffer_set_pos(argument0, 0)
        buffer_write_u8(argument0, 240)
        if argument_count > 1 {
            ed_net_write_str(argument0, argument1)
        }
        ed_net_send_to(net_socks[0], argument0)
    }
}
