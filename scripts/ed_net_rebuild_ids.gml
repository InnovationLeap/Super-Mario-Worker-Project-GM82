// ed_net_rebuild_ids()
// resize（room_restart 重载）后重建 netid 登记：按固定类型顺序统一编号，保证两端编号一致
// 前提：两端关卡内容一致（resize 流程两端各自 Save→restart→Load，加载顺序一致）
// 顺序：o_edbonusesblock → o_edenemyblock → o_edsceneriesblock → o_edmarkerblock → o_edpassage
// 注意：rebuild 用无偏移编号 1..N（两端一致），结束后 counter 对齐到 _n-1，
//       使后续 ed_net_inst_register 的新实例从 _n 开始分配，避免与 rebuild 已占用编号冲突
var _n;
_n = 1
global.netid_count = 0
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
global.netid_counter = _n - 1
debug_log('[net] rebuild_ids: ' + string(_n - 1) + ' instances')
