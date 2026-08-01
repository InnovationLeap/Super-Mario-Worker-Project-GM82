// ed_net_host(local_mode)
// 建房：local_mode=1 本机测试（跳过防火墙）/ 0 局域网
ed_net_init()
with(o_ednet) {
    if net_state = 0 {
        net_listener = listener_create()
        debug_log('[net] host: listener_create -> ' + string(net_listener))
        listener_start(net_listener, 0, 51234, argument0)
        debug_log('[net] host: listener_start(0, 51234, local=' + string(argument0) + ') exists=' + string(listener_exists(net_listener)))
        net_role = 1
        net_state = 1
        ed_net_add_line('[Hosting, waiting for players]')
    } else {
        debug_log('[net] host: ignored, net_state=' + string(net_state))
    }
}
