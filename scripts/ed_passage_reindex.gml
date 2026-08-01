// ed_passage_reindex()
// 重算全部 o_edpassage 的 warpnum：按 (x, y) 排序后从 0 重新编号
// 触发点：水管放置完成（ed_place_passage step4）、水管删除（ed_delete_at cat5）、远端应用后
// 排序规则与 Load_Script_Masta 读取顺序无关，仅保证两端按相同规则收敛：
// 先按 x 升序，x 相同按 y 升序
// NET-SYNC: 完成后通过 op19 subop 9 广播全部 (netid, warpnum) 覆盖对端
var _n, _i, _j, _a, _b, _tmp, _cnt, _arr;
_n = 0
with(o_edpassage) {
    _arr[_n] = id
    _n += 1
}
if _n > 1 {
    // 冒泡排序（GM8 无 sort 函数与 ds_list_set，用数组+临时交换；数量少性能可接受）
    for (_i = 0; _i < _n - 1; _i += 1) {
        for (_j = _i + 1; _j < _n; _j += 1) {
            _a = _arr[_i]
            _b = _arr[_j]
            if _b.x < _a.x {
                _tmp = _arr[_i]
                _arr[_i] = _arr[_j]
                _arr[_j] = _tmp
            } else {
                if _b.x = _a.x {
                    if _b.y < _a.y {
                        _tmp = _arr[_i]
                        _arr[_i] = _arr[_j]
                        _arr[_j] = _tmp
                    }
                }
            }
        }
    }
}
// 重新编号
for (_i = 0; _i < _n; _i += 1) {
    _a = _arr[_i]
    _a.warpnum = _i
}
// 更新 global.warpnum 计数（下一次新建从 _n 开始）
if instance_exists(o_edmain) {
    global.warpnum = _n
}
// 广播全部 (netid, warpnum)
if instance_exists(o_ednet) && o_ednet.net_state = 3 {
    buffer_clear(o_ednet.net_sendbuf)
    buffer_set_pos(o_ednet.net_sendbuf, 0)
    buffer_write_u8(o_ednet.net_sendbuf, 19)
    buffer_write_u32(o_ednet.net_sendbuf, 0)
    buffer_write_u8(o_ednet.net_sendbuf, 9)
    buffer_write_u32(o_ednet.net_sendbuf, _n)
    _cnt = 0
    for (_i = 0; _i < _n; _i += 1) {
        _a = _arr[_i]
        // 连接期间实例必有 netid（register 分配），与 write_inst 一致
        _a.netid = ed_net_inst_register(_a)
        buffer_write_u32(o_ednet.net_sendbuf, _a.netid)
        buffer_write_u16(o_ednet.net_sendbuf, _a.warpnum)
        _cnt += 1
    }
    socket_write_message(o_ednet.net_sock, o_ednet.net_sendbuf)
    socket_send(o_ednet.net_sock)
    ed_net_trace('S19 subop=9 passage reindex n=' + string(_cnt))
}
