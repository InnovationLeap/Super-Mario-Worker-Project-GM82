// ed_net_ops_apply_full(buf)
// 应用 op22 全量关卡（o_ednet 上下文）：重建房间尺寸、网格、全部实例并登记 netid
// 负载格式与 send_full 严格一致（w/h/网格/实例数/实例序列）
var _w, _h, _i, _j, _n;
if !instance_exists(o_edmain) {
    debug_log('[net] op22 ignored: no o_edmain')
    exit
}
_w = buffer_read_u32(argument0)
_h = buffer_read_u32(argument0)
room_set_width(room, _w * 32)
room_set_height(room, _h * 32)
global.lvlwidth = _w * 32
global.lvlheight = _h * 32
for (_j = 0; _j < _h; _j += 1) {
    for (_i = 0; _i < _w; _i += 1) {
        o_edmain.arrayetapu[_i, _j] = buffer_read_u16(argument0)
    }
}
with(o_edbonusesblock) { instance_destroy() }
with(o_edenemyblock) { instance_destroy() }
with(o_edsceneriesblock) { instance_destroy() }
with(o_edmarkerblock) { instance_destroy() }
with(o_edpassage) { instance_destroy() }
if variable_global_exists('autoscrolls') {
    ds_list_clear(global.autoscrolls)
}
global.netid_count = 0
global.netid_counter = 0
_n = buffer_read_u32(argument0)
while _n > 0 {
    ed_net_ops_apply_create(argument0)
    _n -= 1
}
debug_log('[net] op22 full applied w=' + string(_w) + ' h=' + string(_h))
