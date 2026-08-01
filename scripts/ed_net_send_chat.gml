// ed_net_send_chat(buf, text)
// 发送聊天消息并在本地记录（在 o_ednet 上下文调用）
if net_state = 3 {
    buffer_clear(argument0)
    buffer_set_pos(argument0, 0)
    buffer_write_u8(argument0, 112)
    buffer_write_u32(argument0, net_myid)
    ed_net_write_str(argument0, argument1)
    socket_write_message(net_sock, argument0)
    socket_send(net_sock)
    ed_net_add_line(string(net_my_name) + ': ' + string(argument1))
}
