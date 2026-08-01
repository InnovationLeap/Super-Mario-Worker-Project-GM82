// ed_net_send_hello(buf, name)
// 客户端→房主：握手（在 o_ednet 上下文调用）
buffer_clear(argument0)
buffer_set_pos(argument0, 0)
buffer_write_u8(argument0, 1)
buffer_write_u16(argument0, net_ver)
ed_net_write_str(argument0, argument1)
socket_write_message(net_sock, argument0)
socket_send(net_sock)
