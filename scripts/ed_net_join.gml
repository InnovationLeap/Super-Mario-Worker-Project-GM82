// ed_net_join(ip_or_ip:port)
// 加入房主（TCP，默认端口 51234，支持 "ip:port" 格式，如 frp-bar.com:41621）
var _sr, _addr, _port, _c;
_addr = string(argument0)
_port = 51234
_c = string_pos(':', _addr)
if _c > 0 {
    _port = real(string_copy(_addr, _c+1, string_length(_addr)-_c))
    _addr = string_copy(_addr, 1, _c-1)
}
if _port < 1 || _port > 65535 {
    _port = 51234
}
ed_net_init()
with(o_ednet) {
    if net_state = 0 {
        net_sock = socket_create()
        debug_log('[net] join: socket_create -> ' + string(net_sock))
        _sr = socket_connect(net_sock, _addr, _port)
        debug_log('[net] join: socket_connect(' + string(_addr) + ', ' + string(_port) + ') -> ' + string(_sr))
        net_role = 0
        net_state = 2
    } else {
        debug_log('[net] join: ignored, net_state=' + string(net_state))
    }
}
