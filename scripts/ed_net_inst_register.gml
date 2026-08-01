// ed_net_inst_register(id)
// 为实例分配/确认 netid 并登记到 global.netid_arr（netid = net_myid<<16 | 计数器）
// 房主 net_myid=0、客户端 net_myid=1，双方空间不冲突；本端创建时由 ed_net_ops_send_create 调用，
// 远端应用创建时由 ed_net_ops_apply_create 调用（upsert 语义：已存在则更新 inst 值），
// 未连接期间创建的实例 netid 保持未定义（=0），不会产生同步（远端从未见过它，删除/更新也跳过）
// 注意：GM8.2 运行时 ds_map 整套 API 静默失效，且 GM8 数组单维上限 32000（netid 可到 65536+），
// 故登记表用 2D 数组 + 线性查找：netid_arr[i,0]=netid / [i,1]=instid，行数 = global.netid_count
var _old, _i, _found;
_old = 0
_found = 0
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
        _i = 0
        while _i < global.netid_count {
            if global.netid_arr[_i, 0] = _old {
                global.netid_arr[_i, 1] = argument0
                _found = 1
            }
            _i += 1
        }
        if !_found {
            global.netid_arr[global.netid_count, 0] = _old
            global.netid_arr[global.netid_count, 1] = argument0
            global.netid_count += 1
        }
    }
}
return _old
