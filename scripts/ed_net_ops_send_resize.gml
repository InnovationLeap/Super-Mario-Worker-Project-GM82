// ed_net_ops_send_resize(w, h, tx, ty)
// 关卡尺寸调整广播（op21）：远端收到后执行同样的 ed_resize_level 流程
// w/h=新尺寸 tiles，tx/ty=平移 tiles（可为负，+1000000 偏移保证 u32 安全）
if instance_exists(o_ednet) && o_ednet.net_state = 3 {
    buffer_clear(o_ednet.net_sendbuf)
    buffer_set_pos(o_ednet.net_sendbuf, 0)
    buffer_write_u8(o_ednet.net_sendbuf, 21)
    buffer_write_u32(o_ednet.net_sendbuf, argument0)
    buffer_write_u32(o_ednet.net_sendbuf, argument1)
    buffer_write_u32(o_ednet.net_sendbuf, argument2 + 1000000)
    buffer_write_u32(o_ednet.net_sendbuf, argument3 + 1000000)
    socket_write_message(o_ednet.net_sock, o_ednet.net_sendbuf)
    socket_send(o_ednet.net_sock)
    ed_net_trace('S21 resize w=' + string(argument0) + ' h=' + string(argument1) + ' tx=' + string(argument2) + ' ty=' + string(argument3))
}
