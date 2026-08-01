// ed_net_ops_request_full(buf)
// 客户端→房主：请求全量重同步（op24）（o_ednet 上下文调用）
// 触发场景：测关返回编辑器、op23 待重载标记后，客户端请求房主重发全量关卡
if net_state = 3 && net_role = 0 {
    buffer_clear(argument0)
    buffer_set_pos(argument0, 0)
    buffer_write_u8(argument0, 24)
    if net_sock_count > 0 {
        ed_net_send_to(net_socks[0], argument0)
    }
    ed_net_trace('S24 full reload requested')
}
