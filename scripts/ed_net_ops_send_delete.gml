// ed_net_ops_send_delete(inst)
// 在删除完成点广播 op17 删除消息并清理本地 netid 登记（实例须在销毁前传入）
// netid 未定义(=0)表示该实例从未同步过（创建于未连接期间），跳过发送
var _netid;
_netid = 0
if instance_exists(argument0) {
    with(argument0) {
        // GM8 访问未定义实例变量返回 0；variable_local_exists 只查 var 局部变量，对 netid 实例变量恒 false，不可用
        _netid = netid
    }
    if _netid <> 0 {
        ed_net_inst_unregister(_netid)
        if instance_exists(o_ednet) && o_ednet.net_state = 3 {
            buffer_clear(o_ednet.net_sendbuf)
            buffer_set_pos(o_ednet.net_sendbuf, 0)
            buffer_write_u8(o_ednet.net_sendbuf, 17)
            buffer_write_u8(o_ednet.net_sendbuf, o_ednet.net_myid)
            buffer_write_u32(o_ednet.net_sendbuf, _netid)
            with(o_ednet) {
                if net_role = 1 {
                    ed_net_broadcast(net_sendbuf)
                } else {
                    if net_sock_count > 0 {
                        ed_net_send_to(net_socks[0], net_sendbuf)
                    }
                }
            }
            ed_net_trace('S17 netid=' + string(_netid))
        }
    } else {
        ed_net_trace('S17 SKIP netid=0')
    }
}
