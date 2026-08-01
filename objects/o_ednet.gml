#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 联机会话对象（persistent，由 welcome 房间创建）
net_state = 0
// net_state: 0=未连接 1=建房中 2=连接中(未握手) 3=已连接(握手完成)
net_role = 0
// net_role: 0=客户端 1=房主
// 3+ 人改造：socket 数组化。房主持有 net_socks[0..count-1]，客户端仅用 net_socks[0]
net_socks[0] = -1
net_sock_count = 0
net_listener = -1
net_myid = 0
// 玩家表（按 sid 索引，net_players 容量 8）
net_pl_count = 0
net_pl_id[0] = 0
net_pl_sock[0] = -1
net_pl_name[0] = ''
net_pl_mx[0] = 0
net_pl_my[0] = 0
net_pl_time[0] = -1
// 兼容旧字段（客户端单对端时仍可用）
net_peer_name = ''
net_peer_addr = ''
net_my_name = 'Player'
net_last_err = ''
panel_open = 0
net_ver = 1
net_font = -1
net_chat = ds_list_create()
if net_chat < 1 {
    net_chat = ds_list_create()
}
net_sendbuf = buffer_create()
net_recvbuf = buffer_create()
// op23 文件传输接收状态（net_file_fid 为哨兵：>=0 表示正在接收；net_file_active 为接收屏障）
net_file_total = 0
net_file_got = 0
net_file_fid = -1
net_file_path = ''
net_file_active = 0
net_pending_reload = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _st, _i, _s;
ed_net_init()
if net_font < 0 {
    net_font = fw_add_font_from_file(".\Fonts\message.ttf", 13, false, false, true)
}
// 3+ 人改造：逐 socket 轮询收发（客户端只有 net_socks[0]）
_i = 0
while _i < net_sock_count {
    _s = net_socks[_i]
    if _s >= 0 {
        if socket_exists(_s) {
            socket_receive(_s)
            while socket_read_message(_s, net_recvbuf) {
                ed_net_handle_message(_s, net_recvbuf)
            }
            socket_send(_s)
            _st = socket_get_state(_s)
            if _st != net_last_state {
                net_last_state = _st
                debug_log('[net] sock=' + string(_s) + ' state=' + string(_st) + ' (net_state=' + string(net_state) + ', role=' + string(net_role) + ')')
            }
            if _st = tcp_connected {
                if net_state = 2 && net_role = 0 {
                    net_state = 3
                    debug_log('[net] connected, sending hello')
                    ed_net_send_hello(net_sendbuf, net_my_name)
                }
            }
            if _st = tcp_closed || _st = tcp_error {
                if net_role = 1 {
                    // 房主：仅移除该玩家，不断开整体
                    ed_net_players_leave_by_sock(_s)
                } else {
                    if net_state > 0 {
                        ed_net_add_line('[Disconnected]')
                        debug_log('[net] disconnected: state=' + string(_st))
                    } else {
                        debug_log('[net] connect failed: state=' + string(_st))
                        net_last_err = 'Connect failed (state ' + string(_st) + ')'
                    }
                    ed_net_cleanup()
                }
            }
        } else {
            debug_log('[net] socket gone: ' + string(_s))
            if net_role = 1 {
                ed_net_players_leave_by_sock(_s)
            } else {
                ed_net_cleanup()
            }
        }
    }
    _i += 1
}
// 房主：listener 持续 accept（不再限制单连接）
if net_listener >= 0 {
    if listener_exists(net_listener) {
        while listener_pending(net_listener) && net_sock_count < 8 {
            _s = socket_create()
            listener_accept(net_listener, _s)
            debug_log('[net] accept: sock=' + string(_s) + ' state=' + string(socket_get_state(_s)))
            net_socks[net_sock_count] = _s
            net_sock_count += 1
            ed_net_add_line('[Player connecting...]')
        }
    } else {
        debug_log('[net] listener gone: ' + string(net_listener))
        net_listener = -1
    }
}
// 光标发送：房主（net_role=1，net_myid 恒为 0）始终发；客户端需握手完成（net_myid>0）才发
if net_state = 3 && (net_role = 1 || net_myid > 0) {
    ed_net_send_cursor(net_sendbuf, mouse_x, mouse_y)
}
// 待重载标记：测关中收到 op23 → 回编辑器后请求全量重同步
if net_pending_reload = 1 && net_state = 3 && net_role = 0 {
    if instance_exists(o_edmain) {
        net_pending_reload = 0
        ed_net_ops_request_full(net_sendbuf)
    }
}
if keyboard_check_pressed(global.key_ed_cancel) && panel_open = 1 {
    panel_open = 0
    if instance_exists(o_edmain) {
        o_edmain.czywybieranieback = 0
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _vx, _vy, _mi, _my, _line, _st, _bx, _by, _bw, _bh, _btn, _input;
var _m, _x1, _y1, _x2, _y2, _ww, _wh, _bn, _btn_x, _btn_y, _label, _bw2, _hover, _can, _maxw, _peer, _btn_labels;
var _row_y, _lab_x, _btn_x2, _btn_y2, _i;
if instance_exists(o_edmain) {
    if panel_open = 1 {
        _m = 16
        _vx = view_xview[0]
        _vy = view_yview[0]
        _ww = view_wview[0]
        _wh = view_hview[0]
        _x1 = _vx + _m
        _y1 = _vy + _m
        _x2 = _vx + _ww - _m
        _y2 = _vy + _wh - _m
        // 背景：纯黑填充 + 双线白框（终端粗框感）
        draw_set_alpha(0.92)
        draw_set_color(c_black)
        draw_rectangle(_x1, _y1, _x2, _y2, 0)
        draw_set_alpha(1)
        draw_set_color(c_white)
        draw_rectangle(_x1, _y1, _x2, _y2, 1)
        draw_rectangle(_x1 + 1, _y1 + 1, _x2 - 1, _y2 - 1, 1)
        // 标题栏（居中，fw y+18 修正基线偏移）+ 分隔线
        fw_draw_set_font(net_font)
        draw_set_color(c_white)
        fw_draw_text(_x1 + (_x2 - _x1 - fw_string_width('NETWORK CONSOLE')) / 2, _y1 + 26, 'NETWORK CONSOLE')
        draw_line(_x1 + 4, _y1 + 34, _x2 - 4, _y1 + 34)
        // 状态文本
        if net_state = 0 {
            _st = 'NOT CONNECTED'
        }
        if net_state = 1 {
            _st = 'HOSTING, WAITING FOR PLAYERS...'
        }
        if net_state = 2 && net_role = 0 {
            _st = 'CONNECTING...'
        }
        if net_state = 2 && net_role = 1 {
            _st = 'WAITING FOR HANDSHAKE...'
        }
        if net_state = 3 && net_role = 1 {
            _st = 'HOST, PLAYERS: ' + string(net_pl_count + 1)
        }
        if net_state = 3 && net_role = 0 {
            _st = 'CONNECTED TO: ' + net_peer_name
        }
        if net_state = 0 && net_last_err <> '' {
            _st = 'ERROR: ' + net_last_err
        }
        // 状态区（fw y+18 修正基线偏移）
        _peer = net_peer_name
        if _peer = '' {
            _peer = '--'
        }
        fw_draw_set_font(net_font)
        draw_set_color(c_white)
        fw_draw_text(_x1 + 12, _y1 + 56, '[STATE]  ' + _st)
        fw_draw_text(_x1 + 12, _y1 + 76, '[PLAYER] ' + net_my_name)
        // 3+ 人：玩家列表（第一行显示在线数，后续每行一个玩家）
        _peer = '[PEER]   ' + string(net_pl_count + 1) + ' ONLINE'
        _i = 0
        while _i < net_pl_count {
            _peer += '  ' + string(net_pl_id[_i]) + ':' + net_pl_name[_i]
            _i += 1
        }
        fw_draw_text(_x1 + 12, _y1 + 96, _peer)
        draw_line(_x1 + 4, _y1 + 110, _x2 - 4, _y1 + 110)
        // RENAME 按钮（PLAYER 行右侧，右对齐）
        _btn_x = _x2 - 12 - (fw_string_width('RENAME') + 16)
        _btn_y = _y1 + 58
        _bw2 = fw_string_width('RENAME') + 16
        _hover = mouse_x > _btn_x && mouse_x < _btn_x + _bw2 && mouse_y > _btn_y && mouse_y < _btn_y + 22
        draw_set_color(c_black)
        draw_rectangle(_btn_x, _btn_y, _btn_x + _bw2, _btn_y + 22, 0)
        draw_set_color(c_white)
        draw_rectangle(_btn_x, _btn_y, _btn_x + _bw2, _btn_y + 22, 1)
        if _hover {
            draw_set_color(c_white)
            draw_rectangle(_btn_x, _btn_y, _btn_x + _bw2, _btn_y + 22, 0)
            draw_set_color(c_black)
        }
        fw_draw_set_font(net_font)
        fw_draw_text(_btn_x + 8, _btn_y + 22, 'RENAME')
        if _hover && mouse_check_button_pressed(mb_left) {
            _input = get_string('Your name:', net_my_name)
            if string_length(string(_input)) > 24 {
                _input = string_copy(string(_input), 1, 24)
            }
            if string_length(string(_input)) > 0 && string(_input) != net_my_name {
                net_my_name = string(_input)
                if net_state = 3 {
                    ed_net_send_name(net_sendbuf, net_my_name)
                }
                ed_net_add_line('[You are now: ' + net_my_name + ']')
            }
        }
        // 按钮区：分组矩形方框按钮（默认黑底白框白字；hover 反色白底黑字；不可用灰框）
        // 组1: HOST: [HOST LOCAL][HOST LAN]  SESSION: [JOIN][LEAVE]
        // 组2: CHAT: [SEND A MESSAGE][CLOSE]
        _btn_labels[0] = 'HOST LOCAL'
        _btn_labels[1] = 'HOST LAN'
        _btn_labels[2] = 'JOIN'
        _btn_labels[3] = 'LEAVE'
        _btn_labels[4] = 'SEND A MESSAGE'
        _btn_labels[5] = 'CLOSE'
        _row_y = _y1 + 140
        _lab_x = _x1 + 12
        // 组1 行（HOST / SESSION）
        fw_draw_set_font(net_font)
        draw_set_color(c_white)
        fw_draw_text(_lab_x, _row_y + 22, 'HOST:')
        _btn_x2 = _lab_x + fw_string_width('HOST:') + 12
        _btn_y2 = _row_y
        _bn = 0
        while _bn < 2 {
            _label = _btn_labels[_bn]
            _bw2 = fw_string_width(_label) + 16
            if _bn = 0 {
                _bw2 += 4
            }
            _hover = mouse_x > _btn_x2 && mouse_x < _btn_x2 + _bw2 && mouse_y > _btn_y2 && mouse_y < _btn_y2 + 22
            _can = 0
            if _bn = 0 && net_state = 0 {
                _can = 1
            }
            if _bn = 1 && net_state = 0 {
                _can = 1
            }
            if _can = 0 {
                draw_set_color(c_black)
                draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 0)
                draw_set_color(c_gray)
                draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 1)
                fw_draw_set_font(net_font)
                fw_draw_text(_btn_x2 + 8, _btn_y2 + 22, _label)
            } else {
                if _hover {
                    draw_set_color(c_white)
                    draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 0)
                    draw_set_color(c_black)
                    fw_draw_set_font(net_font)
                    fw_draw_text(_btn_x2 + 8, _btn_y2 + 22, _label)
                } else {
                    draw_set_color(c_black)
                    draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 0)
                    draw_set_color(c_white)
                    draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 1)
                    fw_draw_set_font(net_font)
                    fw_draw_text(_btn_x2 + 8, _btn_y2 + 22, _label)
                }
                if _hover && mouse_check_button_pressed(mb_left) {
                    if _bn = 0 {
                        ed_net_host(1)
                    }
                    if _bn = 1 {
                        ed_net_host(0)
                    }
                }
            }
            _btn_x2 += _bw2 + 8
            _bn += 1
        }
        // SESSION 小标题 + 组1 后半（JOIN/LEAVE）
        _lab_x = _btn_x2 + 12
        fw_draw_set_font(net_font)
        draw_set_color(c_white)
        fw_draw_text(_lab_x, _row_y + 22, 'SESSION:')
        _btn_x2 = _lab_x + fw_string_width('SESSION:') + 12
        _bn = 2
        while _bn < 4 {
            _label = _btn_labels[_bn]
            _bw2 = fw_string_width(_label) + 16
            _hover = mouse_x > _btn_x2 && mouse_x < _btn_x2 + _bw2 && mouse_y > _btn_y2 && mouse_y < _btn_y2 + 22
            _can = 0
            if _bn = 2 && net_state = 0 {
                _can = 1
            }
            if _bn = 3 && net_state > 0 {
                _can = 1
            }
            if _can = 0 {
                draw_set_color(c_black)
                draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 0)
                draw_set_color(c_gray)
                draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 1)
                fw_draw_set_font(net_font)
                fw_draw_text(_btn_x2 + 8, _btn_y2 + 22, _label)
            } else {
                if _hover {
                    draw_set_color(c_white)
                    draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 0)
                    draw_set_color(c_black)
                    fw_draw_set_font(net_font)
                    fw_draw_text(_btn_x2 + 8, _btn_y2 + 22, _label)
                } else {
                    draw_set_color(c_black)
                    draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 0)
                    draw_set_color(c_white)
                    draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 1)
                    fw_draw_set_font(net_font)
                    fw_draw_text(_btn_x2 + 8, _btn_y2 + 22, _label)
                }
                if _hover && mouse_check_button_pressed(mb_left) {
                    if _bn = 2 {
                        _input = get_string('Enter host IP (IP:port, e.g. frp-bar.com:41621):', '127.0.0.1')
                        if string_length(string(_input)) > 0 {
                            ed_net_join(string(_input))
                        }
                    }
                    if _bn = 3 {
                        if net_state = 3 {
                            // 3+ 人：房主广播 goodbye 给所有客户端；客户端单发
                            if net_role = 1 {
                                buffer_clear(net_sendbuf)
                                buffer_set_pos(net_sendbuf, 0)
                                buffer_write_u8(net_sendbuf, 240)
                                ed_net_broadcast(net_sendbuf)
                            } else {
                                ed_net_send_goodbye(net_sendbuf, '')
                            }
                        }
                        ed_net_cleanup()
                        net_last_err = ''
                        ed_net_add_line('[Disconnected]')
                    }
                }
            }
            _btn_x2 += _bw2 + 8
            _bn += 1
        }
        // 组2 行（CHAT / CLOSE）
        _row_y = _y1 + 176
        _lab_x = _x1 + 12
        fw_draw_set_font(net_font)
        draw_set_color(c_white)
        fw_draw_text(_lab_x, _row_y + 22, 'CHAT:')
        _btn_x2 = _lab_x + fw_string_width('CHAT:') + 12
        _btn_y2 = _row_y
        _bn = 4
        while _bn < 6 {
            _label = _btn_labels[_bn]
            _bw2 = fw_string_width(_label) + 16
            if _bn = 4 {
                _bw2 += 8
            }
            _hover = mouse_x > _btn_x2 && mouse_x < _btn_x2 + _bw2 && mouse_y > _btn_y2 && mouse_y < _btn_y2 + 22
            _can = 0
            if _bn = 4 {
                _can = 1
            }
            if _bn = 5 {
                _can = 1
            }
            if _can = 0 {
                draw_set_color(c_black)
                draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 0)
                draw_set_color(c_gray)
                draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 1)
                fw_draw_set_font(net_font)
                fw_draw_text(_btn_x2 + 8, _btn_y2 + 22, _label)
            } else {
                if _hover {
                    draw_set_color(c_white)
                    draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 0)
                    draw_set_color(c_black)
                    fw_draw_set_font(net_font)
                    fw_draw_text(_btn_x2 + 8, _btn_y2 + 22, _label)
                } else {
                    draw_set_color(c_black)
                    draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 0)
                    draw_set_color(c_white)
                    draw_rectangle(_btn_x2, _btn_y2, _btn_x2 + _bw2, _btn_y2 + 22, 1)
                    fw_draw_set_font(net_font)
                    fw_draw_text(_btn_x2 + 8, _btn_y2 + 22, _label)
                }
                if _hover && mouse_check_button_pressed(mb_left) {
                    if _bn = 4 {
                        _input = get_string('Enter message:', '')
                        if string_length(string(_input)) > 0 {
                            if net_state = 3 {
                                ed_net_send_chat(net_sendbuf, string(_input))
                            } else {
                                ed_net_add_line('[Not connected, message not sent]')
                            }
                        }
                    }
                    if _bn = 5 {
                        panel_open = 0
                        o_edmain.czywybieranieback = 0
                    }
                }
            }
            _btn_x2 += _bw2 + 8
            _bn += 1
        }
        draw_line(_x1 + 4, _y1 + 210, _x2 - 4, _y1 + 210)
        // 日志区：从底部向上滚动显示最近消息 + 底部闪烁光标
        fw_draw_set_font(net_font)
        _maxw = _x2 - _x1 - 24
        _my = _y2 - 10
        _mi = ds_list_size(net_chat) - 1
        while _mi >= 0 && _my > _y1 + 230 {
            _line = ds_list_find_value(net_chat, _mi)
            while fw_string_width(_line) > _maxw && string_length(_line) > 1 {
                _line = string_copy(_line, 1, string_length(_line) - 1)
            }
            fw_draw_set_font(net_font)
            draw_set_color(c_white)
            fw_draw_text(_x1 + 12, _my + 4, _line)
            _my -= 18
            _mi -= 1
        }
        if (current_time div 400) mod 2 = 0 {
            draw_set_color(c_white)
            draw_rectangle(_x1 + 12, _my - 16, _x1 + 22, _my - 2, 1)
        }
    }
}
