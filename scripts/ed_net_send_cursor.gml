// ed_net_send_cursor(buf, x, y)
// 发送鼠标位置（世界坐标）（在 o_ednet 上下文调用）
// 3+ 人：opcode 后带 source_id（u8 net_myid）
if net_state = 3 {
    buffer_clear(argument0)
    buffer_set_pos(argument0, 0)
    buffer_write_u8(argument0, 4)
    buffer_write_u8(argument0, net_myid)
    buffer_write_u32(argument0, argument1)
    buffer_write_u32(argument0, argument2)
    if net_role = 1 {
        ed_net_broadcast(argument0)
    } else {
        if net_sock_count > 0 {
            ed_net_send_to(net_socks[0], argument0)
        }
    }
}
