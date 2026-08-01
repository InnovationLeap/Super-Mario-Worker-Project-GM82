// ed_net_send_cursor(buf, x, y)
// 发送鼠标位置（世界坐标）（在 o_ednet 上下文调用）
if net_state = 3 {
    buffer_clear(argument0)
    buffer_set_pos(argument0, 0)
    buffer_write_u8(argument0, 4)
    buffer_write_u32(argument0, argument1)
    buffer_write_u32(argument0, argument2)
    socket_write_message(net_sock, argument0)
    socket_send(net_sock)
}
