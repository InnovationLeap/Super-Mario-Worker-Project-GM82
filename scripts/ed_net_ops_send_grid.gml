// ed_net_ops_send_grid(gx, gy, val)
// 广播 op18 方块网格写入（放置/删除/autopair 组合砖/删除模式共用；gx,gy 为 arrayetapu 网格坐标）
if instance_exists(o_ednet) && o_ednet.net_state = 3 {
    buffer_clear(o_ednet.net_sendbuf)
    buffer_set_pos(o_ednet.net_sendbuf, 0)
    buffer_write_u8(o_ednet.net_sendbuf, 18)
    buffer_write_u8(o_ednet.net_sendbuf, o_ednet.net_myid)
    buffer_write_u32(o_ednet.net_sendbuf, argument0)
    buffer_write_u32(o_ednet.net_sendbuf, argument1)
    buffer_write_u16(o_ednet.net_sendbuf, argument2)
    with(o_ednet) {
        if net_role = 1 {
            ed_net_broadcast(net_sendbuf)
        } else {
            if net_sock_count > 0 {
                ed_net_send_to(net_socks[0], net_sendbuf)
            }
        }
    }
}
