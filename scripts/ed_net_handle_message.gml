// ed_net_handle_message(sock, buf)
// 解析并处理一条收到的消息（在 o_ednet 上下文调用）
// 3+ 人架构：房主 = 中继。所有上行消息（除 op1/2/240）带 u8 source_id；
// 房主收到后：应用 + 转发给其他客户端（op16-21/23 不重放给来源）；客户端收到后仅应用。
var _op, _ver, _nm, _sid, _txt, _disp, _src, _mx, _my, _i, _j, _found, _ed_alive;
buffer_set_pos(argument1, 0)
_op = buffer_read_u8(argument1)
// NET-SYNC: 测关中不 live-apply（Play 房实例集不可靠，返回时会丢），只入队由 ed_net_replay_pending 在编辑器重放
_ed_alive = instance_exists(o_edmain)
if variable_global_exists('testmode') {
    if global.testmode = 1 {
        _ed_alive = false
    }
}
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
    // debug_log('[net] hello: ver=' + string(_ver) + ' name=' + string(_nm))
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
        // 3+ 人：向新玩家单播已有玩家列表（含房主 id=0 自身），客户端据此建光标表
        buffer_clear(net_sendbuf)
        buffer_set_pos(net_sendbuf, 0)
        buffer_write_u8(net_sendbuf, 5)
        buffer_write_u8(net_sendbuf, 0)
        buffer_write_u32(net_sendbuf, 0)
        ed_net_write_str(net_sendbuf, net_my_name)
        ed_net_send_to(argument0, net_sendbuf)
        _i = 0
        while _i < net_pl_count {
            if net_pl_sock[_i] <> argument0 {
                buffer_clear(net_sendbuf)
                buffer_set_pos(net_sendbuf, 0)
                buffer_write_u8(net_sendbuf, 5)
                buffer_write_u8(net_sendbuf, 0)
                buffer_write_u32(net_sendbuf, net_pl_id[_i])
                ed_net_write_str(net_sendbuf, net_pl_name[_i])
                ed_net_send_to(argument0, net_sendbuf)
            }
            _i += 1
        }
    } else {
        // 客户端模式收到 hello（不应发生，忽略）
        // debug_log('[net] unexpected hello on client')
    }
}
if _op = 2 {
    // 房主→客户端 握手应答
    _sid = buffer_read_u32(argument1)
    _nm = ed_net_read_str(argument1)
    // debug_log('[net] hello_ack: id=' + string(_sid) + ' host=' + string(_nm))
    net_myid = _sid
    net_peer_name = _nm
    net_state = 3
    ed_net_add_line('[Connected to host: ' + _nm + ']')
    // 3+ 人：隐式把房主（id=0）加入玩家表（客户端据此显示房主光标）
    if net_pl_count < 8 {
        net_pl_id[net_pl_count] = 0
        net_pl_sock[net_pl_count] = -1
        net_pl_name[net_pl_count] = _nm
        net_pl_mx[net_pl_count] = 0
        net_pl_my[net_pl_count] = 0
        net_pl_time[net_pl_count] = -1
        net_pl_count += 1
    }
}
if _op = 3 {
    // 名字更新（带 source_id）
    _nm = ed_net_read_str(argument1)
    // debug_log('[net] rename: ' + string(_nm))
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
        // 房主：按 source_id 更新玩家表（3+ 人防御：不依赖 sock 匹配）+ 转发给其他客户端
        _found = 0
        _i = 0
        while _i < net_pl_count {
            if net_pl_id[_i] = _src {
                net_pl_mx[_i] = _mx
                net_pl_my[_i] = _my
                net_pl_time[_i] = get_timer()
                _found = 1
            }
            _i += 1
        }
        if _found = 0 && net_pl_count < 8 && _src > 0 {
            // 防御：无条目时按 source_id 自动补（name 未知占位）；_src=0 无效（未握手/房主占位）不入表
            net_pl_id[net_pl_count] = _src
            net_pl_sock[net_pl_count] = -1
            net_pl_name[net_pl_count] = 'P' + string(_src)
            net_pl_mx[net_pl_count] = _mx
            net_pl_my[net_pl_count] = _my
            net_pl_time[net_pl_count] = get_timer()
            net_pl_count += 1
        }
        ed_net_broadcast_except(argument0, argument1)
    } else {
        // 客户端：按 source_id 更新玩家表；无条目自动补
        _found = 0
        _i = 0
        while _i < net_pl_count {
            if net_pl_id[_i] = _src {
                net_pl_mx[_i] = _mx
                net_pl_my[_i] = _my
                net_pl_time[_i] = get_timer()
                _found = 1
            }
            _i += 1
        }
        if _found = 0 && net_pl_count < 8 && _src > 0 {
            net_pl_id[net_pl_count] = _src
            net_pl_sock[net_pl_count] = -1
            net_pl_name[net_pl_count] = 'P' + string(_src)
            net_pl_mx[net_pl_count] = _mx
            net_pl_my[net_pl_count] = _my
            net_pl_time[net_pl_count] = get_timer()
            net_pl_count += 1
        }
    }
}
if _op = 5 {
    // 房主→客户端：玩家加入广播
    _sid = buffer_read_u32(argument1)
    _nm = ed_net_read_str(argument1)
    ed_net_notify('[Player joined: ' + _nm + ' (id ' + string(_sid) + ')]')
    // 去重：若 sid 已在玩家表（如房主 id=0 经 op2 隐式加入、或重复广播），跳过
    _found = 0
    _i = 0
    while _i < net_pl_count {
        if net_pl_id[_i] = _sid {
            _found = 1
        }
        _i += 1
    }
    if _found = 0 && net_pl_count < 8 {
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
    ed_net_notify('[Player left: id ' + string(_sid) + ']')
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
    // mp msg 上屏 + 面板控制台：名字: 内容
    ed_net_notify(string(_disp) + ': ' + string(_txt))
    ed_net_add_line(string(_disp) + ': ' + string(_txt))
}
if _op = 16 {
    // 屏障：客户端正在接收 op23 全量文件时，丢弃增量（防旧操作应用到新关卡）
    if net_role = 0 && net_file_active = 1 {
        exit
    }
    if net_role = 1 {
        ed_net_broadcast_except(argument0, argument1)
    }
    // NET-SYNC: 测关中 o_edmain 存活则照常应用；否则房主入队待返回重放（客户端测关中静默丢弃，回编辑器后 op24 拉全量）
    if _ed_alive {
        ed_net_ops_apply_create(argument1)
    } else {
        if net_role = 1 {
            ed_net_queue(16, argument1)
        }
    }
}
if _op = 17 {
    if net_role = 0 && net_file_active = 1 {
        exit
    }
    if net_role = 1 {
        ed_net_broadcast_except(argument0, argument1)
    }
    if _ed_alive {
        ed_net_ops_apply_delete(argument1)
    } else {
        if net_role = 1 {
            ed_net_queue(17, argument1)
        }
    }
}
if _op = 18 {
    if net_role = 0 && net_file_active = 1 {
        exit
    }
    if net_role = 1 {
        ed_net_broadcast_except(argument0, argument1)
    }
    if _ed_alive {
        ed_net_ops_apply_grid(argument1)
    } else {
        if net_role = 1 {
            ed_net_queue(18, argument1)
        }
    }
}
if _op = 19 {
    if net_role = 0 && net_file_active = 1 {
        exit
    }
    if net_role = 1 {
        ed_net_broadcast_except(argument0, argument1)
    }
    if _ed_alive {
        ed_net_ops_apply_update(argument1)
    } else {
        if net_role = 1 {
            ed_net_queue(19, argument1)
        }
    }
}
if _op = 20 {
    if net_role = 0 && net_file_active = 1 {
        exit
    }
    if net_role = 1 {
        ed_net_broadcast_except(argument0, argument1)
    }
    if _ed_alive {
        ed_net_ops_apply_settings(argument1)
    } else {
        if net_role = 1 {
            ed_net_queue(20, argument1)
        }
    }
}
if _op = 21 {
    if net_role = 0 && net_file_active = 1 {
        exit
    }
    // 注意：op21 无独立 apply 脚本，此处自行读取负载（含 source_id 跳过，与 send_resize 格式一致）
    buffer_read_u8(argument1)
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
    // debug_log('[net] op21 resize w=' + string(_disp) + ' h=' + string(_txt) + ' tx=' + string(_sid) + ' ty=' + string(_nm))
    if _ed_alive {
        with(o_edmain) {
            ed_resize_level(_disp, _txt, _sid, _nm)
        }
        ed_net_rebuild_ids()
    } else {
        if net_role = 1 {
            ed_net_queue(21, argument1)
        }
    }
}
if _op = 23 {
    if net_role = 1 {
        // 房主一般不会收到 op23（握手时单播给新玩家）；若收到则转发
        ed_net_broadcast_except(argument0, argument1)
    }
    ed_net_ops_apply_file(argument1)
}
if _op = 24 {
    // 客户端→房主：请求全量重同步（测关返回/待重载后触发）
    // debug_log('[net] op24 full reload requested')
    if net_role = 1 {
        ed_net_ops_send_file(argument0)
        ed_net_ops_send_settings()
    }
}
if _op = 240 {
    // 断开通知：房主仅移除该玩家；客户端整体断开
    // debug_log('[net] goodbye received')
    if net_role = 1 {
        ed_net_players_leave_by_sock(argument0)
    } else {
        ed_net_add_line('[Peer disconnected]')
        ed_net_cleanup()
    }
}
