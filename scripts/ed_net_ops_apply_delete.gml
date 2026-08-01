// ed_net_ops_apply_delete(buf)
// 应用 op17 删除消息（o_ednet 上下文调用）：按 netid 销毁实例并清理登记
var _netid, _f;
_netid = buffer_read_u32(argument0)
_f = ed_net_inst_lookup(_netid)
if instance_exists(_f) {
    if _f.coto = 23 {
        if instance_exists(o_edmain) {
            if ds_list_find_index(global.autoscrolls, _f) >= 0 {
                ds_list_delete(global.autoscrolls, ds_list_find_index(global.autoscrolls, _f))
            }
        }
    }
    with (_f) {
        instance_destroy()
    }
}
ds_map_delete(global.netid_map, _netid)
