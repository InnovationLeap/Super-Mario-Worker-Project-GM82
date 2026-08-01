// ed_net_init()
// 确保 o_ednet 会话变量就位（幂等，可重复调用）
// 哨兵：net_sendbuf（buffer id >= 1；未定义/无效时为 0）
with(o_ednet) {
    if net_sendbuf < 1 {
        net_state = 0
        net_role = 0
        net_sock = -1
        net_listener = -1
        net_myid = 0
        net_peer_name = ''
        net_peer_addr = ''
        net_my_name = 'Player'
        net_last_err = ''
        net_last_state = -1
        net_font = -1
        net_peer_mx = 0
        net_peer_my = 0
        net_peer_cursor_time = -1
        panel_open = 0
        net_ver = 1
        net_chat = ds_list_create()
        net_sendbuf = buffer_create()
        net_recvbuf = buffer_create()
    }
    if !variable_global_exists('netid_counter') {
        global.netid_counter = 0
    }
    if !variable_global_exists('netid_count') {
        global.netid_count = 0
    }
}
