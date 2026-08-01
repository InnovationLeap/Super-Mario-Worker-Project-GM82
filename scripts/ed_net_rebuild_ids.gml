// ed_net_rebuild_ids()
// resize（room_restart 重载）后重建 netid 登记：按固定类型顺序统一编号，保证两端编号一致
// 前提：两端关卡内容一致（resize 流程两端各自 Save→restart→Load，加载顺序一致）
// 顺序：o_edbonusesblock → o_edenemyblock → o_edsceneriesblock → o_edmarkerblock → o_edpassage
var _n;
_n = 1
global.netid_count = 0
global.netid_counter = 0
with(o_edbonusesblock) {
    netid = _n
    ed_net_inst_register(id)
    _n += 1
}
with(o_edenemyblock) {
    netid = _n
    ed_net_inst_register(id)
    _n += 1
}
with(o_edsceneriesblock) {
    netid = _n
    ed_net_inst_register(id)
    _n += 1
}
with(o_edmarkerblock) {
    netid = _n
    ed_net_inst_register(id)
    _n += 1
}
with(o_edpassage) {
    netid = _n
    ed_net_inst_register(id)
    _n += 1
}
debug_log('[net] rebuild_ids: ' + string(_n - 1) + ' instances')
