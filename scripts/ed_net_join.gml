// ed_net_join(ip)
// 加入房主（TCP 51234）
var _sr;
ed_net_init()
with(o_ednet) {
    if net_state = 0 {
        net_sock = socket_create()
        debug_log('[net] join: socket_create -> ' + string(net_sock))
        _sr = socket_connect(net_sock, argument0, 51234)
        debug_log('[net] join: socket_connect(' + string(argument0) + ', 51234) -> ' + string(_sr))
        net_role = 0
        net_state = 2
    } else {
        debug_log('[net] join: ignored, net_state=' + string(net_state))
    }
}
