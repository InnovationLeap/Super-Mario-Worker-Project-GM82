// ed_net_handle_message(sock, buf)
// 解析并处理一条收到的消息（在 o_ednet 上下文调用）
var _op, _ver, _nm, _sid, _txt, _disp;
buffer_set_pos(argument1, 0)
_op = buffer_read_u8(argument1)
// debug_log('[net] recv opcode ' + string(_op))  // 光标消息每帧到达，双 debug 实例同写 debug_log.txt 会冲突，已注释
if _op = 1 {
    _ver = buffer_read_u16(argument1)
    _nm = ed_net_read_str(argument1)
    debug_log('[net] hello: ver=' + string(_ver) + ' name=' + string(_nm))
    if _ver != net_ver {
        ed_net_add_line('[Version mismatch, disconnected]')
        ed_net_cleanup()
        exit
    }
    net_peer_name = _nm
    net_state = 3
    ed_net_add_line('[Player joined: ' + _nm + ']')
    ed_net_send_hello_ack(net_sendbuf, 1, net_my_name)
}
if _op = 2 {
    _sid = buffer_read_u32(argument1)
    _nm = ed_net_read_str(argument1)
    debug_log('[net] hello_ack: id=' + string(_sid) + ' host=' + string(_nm))
    net_myid = _sid
    net_peer_name = _nm
    net_state = 3
    ed_net_add_line('[Connected to host: ' + _nm + ']')
}
if _op = 3 {
    _nm = ed_net_read_str(argument1)
    debug_log('[net] rename: ' + string(_nm))
    net_peer_name = _nm
    ed_net_add_line('[Player renamed: ' + string(_nm) + ']')
}
if _op = 4 {
    net_peer_mx = buffer_read_u32(argument1)
    net_peer_my = buffer_read_u32(argument1)
    if net_peer_mx > 2147483647 {
        net_peer_mx -= 4294967296
    }
    if net_peer_my > 2147483647 {
        net_peer_my -= 4294967296
    }
    net_peer_cursor_time = get_timer()
}
if _op = 112 {
    _sid = buffer_read_u32(argument1)
    _txt = ed_net_read_str(argument1)
    debug_log('[net] chat from ' + string(_sid) + ': ' + string(_txt))
    if _sid = net_myid {
        _disp = net_my_name
    } else {
        _disp = net_peer_name
    }
    ed_net_add_line(string(_disp) + ': ' + string(_txt))
}
if _op = 240 {
    debug_log('[net] goodbye received')
    ed_net_add_line('[Peer disconnected]')
    ed_net_cleanup()
}
