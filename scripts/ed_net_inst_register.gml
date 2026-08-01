// ed_net_inst_register(id)
// 为实例分配/确认 netid 并登记到 global.netid_map（netid = net_myid<<16 | 计数器）
// 房主 net_myid=0、客户端 net_myid=1，双方空间不冲突；仅由 ed_net_ops_send_create 在已连接时调用，
// 未连接期间创建的实例 netid 保持未定义（=0），不会产生同步（远端从未见过它，删除/更新也跳过）
var _old;
_old = 0
if instance_exists(argument0) {
    with(argument0) {
        if variable_local_exists('netid') {
            _old = netid
        }
    }
    if _old = 0 {
        global.netid_counter += 1
        _old = (o_ednet.net_myid << 16) + global.netid_counter
        argument0.netid = _old
    }
    if _old <> 0 {
        ds_map_replace(global.netid_map, _old, argument0)
    }
}
return _old
