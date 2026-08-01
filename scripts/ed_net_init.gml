// ed_net_init()
// 确保 o_ednet 会话变量就位（幂等，可重复调用）
// 哨兵：net_sendbuf（buffer id >= 1；未定义/无效时为 0）
var _i;
with(o_ednet) {
    if net_sendbuf < 1 {
        net_state = 0
        net_role = 0
        net_socks[0] = -1
        net_sock_count = 0
        net_listener = -1
        net_myid = 0
        net_pl_count = 0
        net_pl_id[0] = 0
        net_pl_sock[0] = -1
        net_pl_name[0] = ''
        net_pl_mx[0] = 0
        net_pl_my[0] = 0
        net_pl_time[0] = -1
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
        net_file_total = 0
        net_file_got = 0
        net_file_fid = -1
        net_file_path = ''
        net_file_active = 0
        net_pending_reload = 0
        for (_i = 0; _i < 8; _i += 1) {
            net_socks[_i] = -1
            net_pl_id[_i] = 0
            net_pl_sock[_i] = -1
            net_pl_name[_i] = ''
            net_pl_mx[_i] = 0
            net_pl_my[_i] = 0
            net_pl_time[_i] = -1
        }
    }
    if !variable_global_exists('netid_counter') {
        global.netid_counter = 0
    }
    if !variable_global_exists('netid_count') {
        global.netid_count = 0
    }
}
