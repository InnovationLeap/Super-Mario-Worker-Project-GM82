// ed_net_players_leave_by_sock(sock)
// 房主：指定 socket 断开/失效时移除对应玩家（o_ednet 上下文调用）
// 1) 从 net_players 移除（按 sock 匹配）并广播 op6 给其他客户端
// 2) 销毁 socket 并从 net_socks 移除（数组左移）
var _i, _j, _sid, _gone;
_sid = 0
_gone = 0
_i = 0
while _i < net_pl_count {
    if net_pl_sock[_i] = argument0 {
        _sid = net_pl_id[_i]
        _gone = 1
        _j = _i
        while _j < net_pl_count - 1 {
            net_pl_id[_j] = net_pl_id[_j + 1]
            net_pl_sock[_j] = net_pl_sock[_j + 1]
            net_pl_name[_j] = net_pl_name[_j + 1]
            net_pl_mx[_j] = net_pl_mx[_j + 1]
            net_pl_my[_j] = net_pl_my[_j + 1]
            net_pl_time[_j] = net_pl_time[_j + 1]
            _j += 1
        }
        net_pl_count -= 1
        _i = net_pl_count
    }
    _i += 1
}
if _gone = 1 {
    // 广播 op6 玩家离开（含 source_id=0 房主占位，接收端以负载 sid 为准）
    buffer_clear(net_sendbuf)
    buffer_set_pos(net_sendbuf, 0)
    buffer_write_u8(net_sendbuf, 6)
    buffer_write_u8(net_sendbuf, 0)
    buffer_write_u32(net_sendbuf, _sid)
    ed_net_broadcast_except(argument0, net_sendbuf)
    ed_net_add_line('[Player left: id=' + string(_sid) + ']')
    ed_net_notify('[Player left: id=' + string(_sid) + ']')
}
// 从 net_socks 移除（数组左移）
_i = 0
while _i < net_sock_count {
    if net_socks[_i] = argument0 {
        if socket_exists(argument0) {
            socket_destroy(argument0)
        }
        _j = _i
        while _j < net_sock_count - 1 {
            net_socks[_j] = net_socks[_j + 1]
            _j += 1
        }
        net_socks[net_sock_count - 1] = -1
        net_sock_count -= 1
        _i = net_sock_count
    }
    _i += 1
}
