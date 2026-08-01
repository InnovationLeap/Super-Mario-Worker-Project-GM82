// ed_net_players_add(sock, name, sid)
// 房主：新玩家握手完成后登记进玩家表并广播 op5 给其他客户端（o_ednet 上下文调用）
// 返回分配到的 sid；若已满返回 0
var _i, _j, _found;
if net_pl_count >= 8 {
    ed_net_add_line('[Room full (max 8)]')
    return 0
}
if argument2 = 0 {
    // 自动分配：房主 id=0，客户端从 1 开始递增
    _i = 1
    while _i < 65536 {
        _found = 0
        _j = 0
        while _j < net_pl_count {
            if net_pl_id[_j] = _i {
                _found = 1
            }
            _j += 1
        }
        if _found = 0 {
            break
        }
        _i += 1
    }
} else {
    _i = argument2
}
net_pl_id[net_pl_count] = _i
net_pl_sock[net_pl_count] = argument0
net_pl_name[net_pl_count] = argument1
net_pl_mx[net_pl_count] = 0
net_pl_my[net_pl_count] = 0
net_pl_time[net_pl_count] = -1
net_pl_count += 1
// 广播 op5 玩家加入给其他客户端（排除新玩家自身）
buffer_clear(net_sendbuf)
buffer_set_pos(net_sendbuf, 0)
buffer_write_u8(net_sendbuf, 5)
buffer_write_u8(net_sendbuf, 0)
buffer_write_u32(net_sendbuf, _i)
ed_net_write_str(net_sendbuf, argument1)
ed_net_broadcast_except(argument0, net_sendbuf)
debug_log('[net] player added: id=' + string(_i) + ' sock=' + string(argument0) + ' name=' + string(argument1))
return _i
