// ed_net_inst_lookup(netid)
// 按 netid 反查本地实例 id；实例已销毁则清理登记并返回 -4
// 数组实现：global.netid_arr[i,0]=netid / [i,1]=instid，线性查找（GM8.2 ds_map 不可用）
var _id, _i;
_id = -4
_i = 0
while _i < global.netid_count {
    if global.netid_arr[_i, 0] = argument0 {
        _id = global.netid_arr[_i, 1]
        if !instance_exists(_id) {
            ed_net_inst_unregister(argument0)
            _id = -4
        }
    }
    _i += 1
}
return _id
