// ed_net_inst_unregister(netid)
// 从 netid 登记表移除一行（尾部元素补位，保持数组紧凑）
// 数组实现：global.netid_arr[i,0]=netid / [i,1]=instid，行数 = global.netid_count
var _i;
_i = 0
while _i < global.netid_count {
    if global.netid_arr[_i, 0] = argument0 {
        global.netid_count -= 1
        global.netid_arr[_i, 0] = global.netid_arr[global.netid_count, 0]
        global.netid_arr[_i, 1] = global.netid_arr[global.netid_count, 1]
    }
    _i += 1
}
