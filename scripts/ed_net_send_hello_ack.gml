// ed_net_send_hello_ack(buf, peer_id, host_name, sock)
// 房主→客户端：握手应答（在 o_ednet 上下文调用）
// 3+ 人：sock 参数指定目标客户端（argument3，可选；缺省 = 单播 net_socks[0]）
buffer_clear(argument0)
buffer_set_pos(argument0, 0)
buffer_write_u8(argument0, 2)
buffer_write_u32(argument0, argument1)
ed_net_write_str(argument0, argument2)
if argument_count > 3 {
    ed_net_send_to(argument3, argument0)
} else {
    if net_sock_count > 0 {
        ed_net_send_to(net_socks[0], argument0)
    }
}
