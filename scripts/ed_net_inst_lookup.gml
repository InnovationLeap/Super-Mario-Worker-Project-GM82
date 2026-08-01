// ed_net_inst_lookup(netid)
// 按 netid 反查本地实例 id；实例已销毁则清理登记并返回 noone
var _id;
_id = -4
if ds_map_exists(global.netid_map, argument0) {
    _id = ds_map_find_value(global.netid_map, argument0)
    if !instance_exists(_id) {
        ds_map_delete(global.netid_map, argument0)
        _id = -4
    }
}
return _id
