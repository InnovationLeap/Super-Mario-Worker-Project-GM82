// ed_net_send_name(buf, name)
// 发送名字更新（在 o_ednet 上下文调用）
// 3+ 人：opcode 后带 source_id（u8 net_myid）；房主转发时原样广播
if net_state = 3 {
    buffer_clear(argument0)
    buffer_set_pos(argument0, 0)
    buffer_write_u8(argument0, 3)
    buffer_write_u8(argument0, net_myid)
    ed_net_write_str(argument0, argument1)
    if net_role = 1 {
        ed_net_broadcast(argument0)
    } else {
        if net_sock_count > 0 {
            ed_net_send_to(net_socks[0], argument0)
        }
    }
}
