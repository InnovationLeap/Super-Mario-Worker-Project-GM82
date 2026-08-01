// ed_net_send_hello(buf, name)
// 客户端→房主：握手（在 o_ednet 上下文调用，客户端仅 net_socks[0]）
buffer_clear(argument0)
buffer_set_pos(argument0, 0)
buffer_write_u8(argument0, 1)
buffer_write_u16(argument0, net_ver)
ed_net_write_str(argument0, argument1)
if net_sock_count > 0 {
    ed_net_send_to(net_socks[0], argument0)
}
