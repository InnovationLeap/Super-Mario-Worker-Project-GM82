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
net_sock = -1
net_listener = -1
net_myid = 0
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
// op23 文件传输接收状态（net_file_fid 为哨兵：>=0 表示正在接收）
net_file_total = 0
net_file_got = 0
net_file_fid = -1
net_file_path = ''
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _st;
ed_net_init()
if net_font < 0 {
    net_font = fw_add_font_from_file(".\Fonts\message.ttf", 10.1, false, false, true)
}
if net_sock >= 0 {
    if socket_exists(net_sock) {
        socket_receive(net_sock)
        while socket_read_message(net_sock, net_recvbuf) {
            ed_net_handle_message(net_sock, net_recvbuf)
        }
        socket_send(net_sock)
        _st = socket_get_state(net_sock)
        if _st != net_last_state {
            net_last_state = _st
            debug_log('[net] sock=' + string(net_sock) + ' state=' + string(_st) + ' (net_state=' + string(net_state) + ', role=' + string(net_role) + ')')
        }
        if _st = tcp_connected {
            if net_state = 2 && net_role = 0 {
                net_state = 3
                debug_log('[net] connected, sending hello')
                ed_net_send_hello(net_sendbuf, net_my_name)
            }
        }
        if _st = tcp_closed || _st = tcp_error {
            if net_state > 0 {
                ed_net_add_line('[Disconnected]')
                debug_log('[net] disconnected: state=' + string(_st))
            } else {
                debug_log('[net] connect failed: state=' + string(_st))
                net_last_err = 'Connect failed (state ' + string(_st) + ')'
            }
            ed_net_cleanup()
        }
    } else {
        debug_log('[net] socket gone: ' + string(net_sock))
        ed_net_cleanup()
    }
}
if net_listener >= 0 {
    if listener_exists(net_listener) {
        if listener_pending(net_listener) && net_sock < 0 {
            net_sock = socket_create()
            listener_accept(net_listener, net_sock)
            debug_log('[net] accept: sock=' + string(net_sock) + ' state=' + string(socket_get_state(net_sock)))
        }
    } else {
        debug_log('[net] listener gone: ' + string(net_listener))
        net_listener = -1
    }
}
if net_state = 3 {
    ed_net_send_cursor(net_sendbuf, mouse_x, mouse_y)
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
if instance_exists(o_edmain) {
    if panel_open = 1 {
        _vx = view_xview[0]
        _vy = view_yview[0]
        draw_set_alpha(0.85)
        draw_set_color(c_black)
        draw_rectangle(_vx+172, _vy+96, _vx+628, _vy+383, 0)
        draw_set_alpha(1)
        draw_set_color(c_white)
        draw_rectangle(_vx+172, _vy+96, _vx+628, _vy+383, 1)
        draw_set_font(testfont)
        draw_set_color(c_white)
        draw_text(_vx+192, _vy+106, 'Networking')
        if net_state = 0 {
            _st = 'Not connected'
        }
        if net_state = 1 {
            _st = 'Hosting, waiting for players...'
        }
        if net_state = 2 && net_role = 0 {
            _st = 'Connecting...'
        }
        if net_state = 2 && net_role = 1 {
            _st = 'Waiting for handshake...'
        }
        if net_state = 3 && net_role = 1 {
            _st = 'Host, connected: ' + net_peer_name
        }
        if net_state = 3 && net_role = 0 {
            _st = 'Connected to: ' + net_peer_name
        }
        if net_state = 0 && net_last_err <> '' {
            _st = net_last_err
        }
        fw_draw_set_font(net_font)
        fw_draw_text(_vx+192, _vy+128, _st)
        fw_draw_set_font(net_font)
        fw_draw_text(_vx+192, _vy+148, 'Player: ' + string(net_my_name))
        _bx = 436
        _by = 148
        _bw = 62
        _bh = 22
        draw_rectangle(_vx+_bx, _vy+_by, _vx+_bx+_bw, _vy+_by+_bh, 1)
        _btn = 0
        if mouse_x > _vx+_bx && mouse_x < _vx+_bx+_bw && mouse_y > _vy+_by && mouse_y < _vy+_by+_bh {
            _btn = 1
        }
        if _btn = 1 {
            draw_set_color(c_yellow)
        } else {
            draw_set_color(c_white)
        }
        draw_text(_vx+_bx+8, _vy+_by+3, 'Rename')
        if mouse_check_button_pressed(mb_left) && mouse_x > _vx+_bx && mouse_x < _vx+_bx+_bw && mouse_y > _vy+_by && mouse_y < _vy+_by+_bh {
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
        _bx = 192
        _by = 176
        _bw = 82
        _bh = 22
        _btn = 0
        draw_rectangle(_vx+_bx, _vy+_by, _vx+_bx+_bw, _vy+_by+_bh, 1)
        if mouse_x > _vx+_bx && mouse_x < _vx+_bx+_bw && mouse_y > _vy+_by && mouse_y < _vy+_by+_bh {
            _btn = 1
        }
        if _btn = 1 && net_state > 0 {
            draw_set_color(c_gray)
        } else {
            draw_set_color(c_yellow)
        }
        draw_text(_vx+_bx+8, _vy+_by+3, 'Host Local')
        if net_state = 0 && mouse_check_button_pressed(mb_left) && mouse_x > _vx+_bx && mouse_x < _vx+_bx+_bw && mouse_y > _vy+_by && mouse_y < _vy+_by+_bh {
            ed_net_host(1)
        }
        _bx = 280
        _bw = 82
        draw_rectangle(_vx+_bx, _vy+_by, _vx+_bx+_bw, _vy+_by+_bh, 1)
        _btn = 0
        if mouse_x > _vx+_bx && mouse_x < _vx+_bx+_bw && mouse_y > _vy+_by && mouse_y < _vy+_by+_bh {
            _btn = 1
        }
        if _btn = 1 && net_state > 0 {
            draw_set_color(c_gray)
        } else {
            draw_set_color(c_yellow)
        }
        draw_text(_vx+_bx+8, _vy+_by+3, 'Host LAN')
        if net_state = 0 && mouse_check_button_pressed(mb_left) && mouse_x > _vx+_bx && mouse_x < _vx+_bx+_bw && mouse_y > _vy+_by && mouse_y < _vy+_by+_bh {
            ed_net_host(0)
        }
        _bx = 368
        _bw = 62
        draw_rectangle(_vx+_bx, _vy+_by, _vx+_bx+_bw, _vy+_by+_bh, 1)
        _btn = 0
        if mouse_x > _vx+_bx && mouse_x < _vx+_bx+_bw && mouse_y > _vy+_by && mouse_y < _vy+_by+_bh {
            _btn = 1
        }
        if _btn = 1 && net_state > 0 {
            draw_set_color(c_gray)
        } else {
            draw_set_color(c_yellow)
        }
        draw_text(_vx+_bx+8, _vy+_by+3, 'Join')
        if net_state = 0 && mouse_check_button_pressed(mb_left) && mouse_x > _vx+_bx && mouse_x < _vx+_bx+_bw && mouse_y > _vy+_by && mouse_y < _vy+_by+_bh {
            _input = get_string('Enter host IP (IP:port, e.g. frp-bar.com:41621):', '127.0.0.1')
            if string_length(string(_input)) > 0 {
                ed_net_join(string(_input))
            }
        }
        _bx = 436
        _bw = 62
        draw_rectangle(_vx+_bx, _vy+_by, _vx+_bx+_bw, _vy+_by+_bh, 1)
        _btn = 0
        if mouse_x > _vx+_bx && mouse_x < _vx+_bx+_bw && mouse_y > _vy+_by && mouse_y < _vy+_by+_bh {
            _btn = 1
        }
        if _btn = 1 && net_state = 0 {
            draw_set_color(c_gray)
        } else {
            draw_set_color(c_yellow)
        }
        draw_text(_vx+_bx+8, _vy+_by+3, 'Leave')
        if net_state > 0 && mouse_check_button_pressed(mb_left) && mouse_x > _vx+_bx && mouse_x < _vx+_bx+_bw && mouse_y > _vy+_by && mouse_y < _vy+_by+_bh {
            if net_state = 3 {
                ed_net_send_goodbye(net_sendbuf, '')
            }
            ed_net_cleanup()
            net_last_err = ''
            ed_net_add_line('[Disconnected]')
        }
        _by = 204
        _bx = 192
        _bw = 150
        draw_rectangle(_vx+_bx, _vy+_by, _vx+_bx+_bw, _vy+_by+_bh, 1)
        _btn = 0
        if mouse_x > _vx+_bx && mouse_x < _vx+_bx+_bw && mouse_y > _vy+_by && mouse_y < _vy+_by+_bh {
            _btn = 1
        }
        if _btn = 1 && net_state != 3 {
            draw_set_color(c_gray)
        } else {
            draw_set_color(c_yellow)
        }
        draw_text(_vx+_bx+8, _vy+_by+3, 'Send')
        if net_state = 3 && mouse_check_button_pressed(mb_left) && mouse_x > _vx+_bx && mouse_x < _vx+_bx+_bw && mouse_y > _vy+_by && mouse_y < _vy+_by+_bh {
            _input = get_string('Enter message:', '')
            if string_length(string(_input)) > 0 {
                ed_net_send_chat(net_sendbuf, string(_input))
            }
        }
        _bx = 348
        draw_rectangle(_vx+_bx, _vy+_by, _vx+_bx+_bw, _vy+_by+_bh, 1)
        _btn = 0
        if mouse_x > _vx+_bx && mouse_x < _vx+_bx+_bw && mouse_y > _vy+_by && mouse_y < _vy+_by+_bh {
            _btn = 1
        }
        if _btn = 1 {
            draw_set_color(c_yellow)
        } else {
            draw_set_color(c_white)
        }
        draw_text(_vx+_bx+8, _vy+_by+3, 'Close')
        if mouse_check_button_pressed(mb_left) && mouse_x > _vx+_bx && mouse_x < _vx+_bx+_bw && mouse_y > _vy+_by && mouse_y < _vy+_by+_bh {
            panel_open = 0
            o_edmain.czywybieranieback = 0
        }
        draw_set_color(c_white)
        draw_line(_vx+192, _vy+238, _vx+628, _vy+238)
        fw_draw_set_font(net_font)
        _my = 248
        _mi = ds_list_size(net_chat) - 1
        while _mi >= 0 && _my < 380 {
            _line = ds_list_find_value(net_chat, _mi)
            if fw_string_width(_line) > 240 {
                while fw_string_width(_line) > 240 && string_length(_line) > 1 {
                    _line = string_copy(_line, 1, string_length(_line) - 1)
                }
                _line += '...'
            }
            fw_draw_text(_vx+192, _vy+_my, _line)
            _my += 16
            _mi -= 1
        }
    }
}
