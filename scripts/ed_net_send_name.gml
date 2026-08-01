// ed_net_send_name(buf, name)
// 发送名字更新（在 o_ednet 上下文调用）
if net_state = 3 {
    buffer_clear(argument0)
    buffer_set_pos(argument0, 0)
    buffer_write_u8(argument0, 3)
    ed_net_write_str(argument0, argument1)
    socket_write_message(net_sock, argument0)
    socket_send(net_sock)
}
