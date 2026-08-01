// ed_net_ops_send_full()
// 全量关卡广播（op22）：握手完成后由房主调用，客户端据此整体重建
// 负载：u8=22 | u32 w(tiles) | u32 h(tiles) | w*h 个 u16 网格 | u32 实例数 | 实例负载序列（write_inst 格式）
var _w, _h, _i, _j, _n;
if instance_exists(o_ednet) && o_ednet.net_state = 3 && instance_exists(o_edmain) {
    _w = room_width div 32
    _h = room_height div 32
    buffer_clear(o_ednet.net_sendbuf)
    buffer_set_pos(o_ednet.net_sendbuf, 0)
    buffer_write_u8(o_ednet.net_sendbuf, 22)
    buffer_write_u32(o_ednet.net_sendbuf, _w)
    buffer_write_u32(o_ednet.net_sendbuf, _h)
    for (_j = 0; _j < _h; _j += 1) {
        for (_i = 0; _i < _w; _i += 1) {
            buffer_write_u16(o_ednet.net_sendbuf, o_edmain.arrayetapu[_i, _j])
        }
    }
    _n = instance_number(o_edbonusesblock) + instance_number(o_edenemyblock) + instance_number(o_edsceneriesblock) + instance_number(o_edmarkerblock) + instance_number(o_edpassage)
    buffer_write_u32(o_ednet.net_sendbuf, _n)
    with(o_edbonusesblock) {
        ed_net_ops_write_inst(o_ednet.net_sendbuf, id, 0)
    }
    with(o_edenemyblock) {
        ed_net_ops_write_inst(o_ednet.net_sendbuf, id, 1)
    }
    with(o_edsceneriesblock) {
        ed_net_ops_write_inst(o_ednet.net_sendbuf, id, 2)
    }
    with(o_edmarkerblock) {
        if coto = 18 {
            ed_net_ops_write_inst(o_ednet.net_sendbuf, id, 5)
        } else {
            ed_net_ops_write_inst(o_ednet.net_sendbuf, id, 3)
        }
    }
    with(o_edpassage) {
        ed_net_ops_write_inst(o_ednet.net_sendbuf, id, 4)
    }
    socket_write_message(o_ednet.net_sock, o_ednet.net_sendbuf)
    socket_send(o_ednet.net_sock)
    ed_net_trace('S22 full w=' + string(_w) + ' h=' + string(_h) + ' insts=' + string(_n))
}
