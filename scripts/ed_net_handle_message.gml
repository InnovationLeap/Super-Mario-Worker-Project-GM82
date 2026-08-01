// ed_net_handle_message(sock, buf)
// 解析并处理一条收到的消息（在 o_ednet 上下文调用）
// 3+ 人架构：房主 = 中继。所有上行消息（除 op1/2/240）带 u8 source_id；
// 房主收到后：应用 + 转发给其他客户端（op16-21/23 不重放给来源）；客户端收到后仅应用。
var _op, _ver, _nm, _sid, _txt, _disp, _src, _mx, _my, _i, _j, _found;
buffer_set_pos(argument1, 0)
_op = buffer_read_u8(argument1)
// debug_log('[net] recv opcode ' + string(_op))  // 光标消息每帧到达，双 debug 实例同写 debug_log.txt 会冲突，已注释
_src = 0
// 注意：op16-21/23 的 source_id 由各 ed_net_ops_apply_* 自行读取（统一在负载最前），
// handle_message 不重复读；仅 op3/4/112（无独立 apply 脚本）在此读取 source_id
if _op = 3 || _op = 4 || _op = 112 {
    _src = buffer_read_u8(argument1)
}
if _op = 1 {
    // 客户端→房主 握手
    _ver = buffer_read_u16(argument1)
    _nm = ed_net_read_str(argument1)
    debug_log('[net] hello: ver=' + string(_ver) + ' name=' + string(_nm))
    if net_role = 1 {
        if _ver != net_ver {
            ed_net_add_line('[Version mismatch, disconnected]')
            ed_net_players_leave_by_sock(argument0)
            exit
        }
        _sid = ed_net_players_add(argument0, _nm, 0)
        if _sid = 0 {
            exit
        }
        net_state = 3
        ed_net_add_line('[Player joined: ' + _nm + ' (id ' + string(_sid) + ')]')
        // 单播握手应答 + 全量关卡 + 设置给新玩家
        ed_net_send_hello_ack(net_sendbuf, _sid, net_my_name, argument0)
        ed_net_ops_send_file(argument0)
        ed_net_ops_send_settings()
    } else {
        // 客户端模式收到 hello（不应发生，忽略）
        debug_log('[net] unexpected hello on client')
    }
}
if _op = 2 {
    // 房主→客户端 握手应答
    _sid = buffer_read_u32(argument1)
    _nm = ed_net_read_str(argument1)
    debug_log('[net] hello_ack: id=' + string(_sid) + ' host=' + string(_nm))
    net_myid = _sid
    net_peer_name = _nm
    net_state = 3
    ed_net_add_line('[Connected to host: ' + _nm + ']')
}
if _op = 3 {
    // 名字更新（带 source_id）
    _nm = ed_net_read_str(argument1)
    debug_log('[net] rename: ' + string(_nm))
    if net_role = 1 {
        // 房主：更新玩家表 + 转发给其他客户端
        _i = 0
        while _i < net_pl_count {
            if net_pl_sock[_i] = argument0 {
                net_pl_name[_i] = _nm
            }
            _i += 1
        }
        ed_net_broadcast_except(argument0, argument1)
        ed_net_add_line('[Player renamed: ' + string(_nm) + ']')
    } else {
        _i = 0
        while _i < net_pl_count {
            if net_pl_id[_i] = _src {
                net_pl_name[_i] = _nm
            }
            _i += 1
        }
        ed_net_add_line('[Player renamed: ' + string(_nm) + ']')
    }
}
if _op = 4 {
    // 光标（带 source_id）
    _mx = buffer_read_u32(argument1)
    _my = buffer_read_u32(argument1)
    if _mx > 2147483647 {
        _mx -= 4294967296
    }
    if _my > 2147483647 {
        _my -= 4294967296
    }
    if net_role = 1 {
        // 房主：更新玩家表 + 转发给其他客户端
        _i = 0
        while _i < net_pl_count {
            if net_pl_sock[_i] = argument0 {
                net_pl_mx[_i] = _mx
                net_pl_my[_i] = _my
                net_pl_time[_i] = get_timer()
            }
            _i += 1
        }
        ed_net_broadcast_except(argument0, argument1)
    } else {
        // 客户端：按 source_id 更新玩家表
        _i = 0
        while _i < net_pl_count {
            if net_pl_id[_i] = _src {
                net_pl_mx[_i] = _mx
                net_pl_my[_i] = _my
                net_pl_time[_i] = get_timer()
            }
            _i += 1
        }
    }
}
if _op = 5 {
    // 房主→客户端：玩家加入广播
    _sid = buffer_read_u32(argument1)
    _nm = ed_net_read_str(argument1)
    debug_log('[net] player join: id=' + string(_sid) + ' name=' + string(_nm))
    if net_pl_count < 8 {
        net_pl_id[net_pl_count] = _sid
        net_pl_sock[net_pl_count] = -1
        net_pl_name[net_pl_count] = _nm
        net_pl_mx[net_pl_count] = 0
        net_pl_my[net_pl_count] = 0
        net_pl_time[net_pl_count] = -1
        net_pl_count += 1
    }
    ed_net_add_line('[Player joined: ' + _nm + ' (id ' + string(_sid) + ')]')
}
if _op = 6 {
    // 房主→客户端：玩家离开广播
    _sid = buffer_read_u32(argument1)
    debug_log('[net] player leave: id=' + string(_sid))
    _i = 0
    while _i < net_pl_count {
        if net_pl_id[_i] = _sid {
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
    ed_net_add_line('[Player left: id ' + string(_sid) + ']')
}
if _op = 112 {
    // 聊天（带 source_id；内嵌 sid u32 保留）
    _sid = buffer_read_u32(argument1)
    _txt = ed_net_read_str(argument1)
    debug_log('[net] chat from ' + string(_sid) + ': ' + string(_txt))
    if net_role = 1 {
        ed_net_broadcast_except(argument0, argument1)
    }
    if _sid = net_myid {
        _disp = net_my_name
    } else {
        _disp = net_peer_name
        _i = 0
        while _i < net_pl_count {
            if net_pl_id[_i] = _sid {
                _disp = net_pl_name[_i]
            }
            _i += 1
        }
    }
    ed_net_add_line(string(_disp) + ': ' + string(_txt))
}
if _op = 16 {
    if net_role = 1 {
        ed_net_broadcast_except(argument0, argument1)
    }
    ed_net_ops_apply_create(argument1)
    debug_log('[net] op16 create applied')
}
if _op = 17 {
    if net_role = 1 {
        ed_net_broadcast_except(argument0, argument1)
    }
    ed_net_ops_apply_delete(argument1)
    debug_log('[net] op17 delete applied')
}
if _op = 18 {
    if net_role = 1 {
        ed_net_broadcast_except(argument0, argument1)
    }
    ed_net_ops_apply_grid(argument1)
    debug_log('[net] op18 grid applied')
}
if _op = 19 {
    if net_role = 1 {
        ed_net_broadcast_except(argument0, argument1)
    }
    ed_net_ops_apply_update(argument1)
    debug_log('[net] op19 update applied')
}
if _op = 20 {
    if net_role = 1 {
        ed_net_broadcast_except(argument0, argument1)
    }
    ed_net_ops_apply_settings(argument1)
    debug_log('[net] op20 settings applied')
}
if _op = 21 {
    _disp = buffer_read_u32(argument1)
    _txt = buffer_read_u32(argument1)
    _sid = buffer_read_u32(argument1)
    _nm = buffer_read_u32(argument1)
    if _sid > 2147483647 {
        _sid -= 4294967296
    }
    if _nm > 2147483647 {
        _nm -= 4294967296
    }
    if net_role = 1 {
        ed_net_broadcast_except(argument0, argument1)
    }
    debug_log('[net] op21 resize w=' + string(_disp) + ' h=' + string(_txt) + ' tx=' + string(_sid) + ' ty=' + string(_nm))
    with(o_edmain) {
        ed_resize_level(_disp, _txt, _sid, _nm)
    }
    ed_net_rebuild_ids()
}
if _op = 23 {
    if net_role = 1 {
        // 房主一般不会收到 op23（握手时单播给新玩家）；若收到则转发
        ed_net_broadcast_except(argument0, argument1)
    }
    ed_net_ops_apply_file(argument1)
    debug_log('[net] op23 file applied')
}
if _op = 240 {
    // 断开通知：房主仅移除该玩家；客户端整体断开
    debug_log('[net] goodbye received')
    if net_role = 1 {
        ed_net_players_leave_by_sock(argument0)
    } else {
        ed_net_add_line('[Peer disconnected]')
        ed_net_cleanup()
    }
}
