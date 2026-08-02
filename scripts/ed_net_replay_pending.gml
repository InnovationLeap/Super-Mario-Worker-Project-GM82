// ed_net_replay_pending()
// 房主测关返回编辑器后：按 opcode 顺序（16→21）重放测关期间入队的增量编辑（o_ednet 上下文调用）
// 消息格式与 live 路径一致（每条 = u8 opcode + u8 source_id + 负载，apply_* 自行跳过 source_id）
// 顺序按 opcode 升序保证"先建后改/删"；op21 resize 最后重放（其 rebuild 会重编号，仅剩统一 rebuild）
// 全部重放后统一 rebuild_ids()：重放创建的客户端空间实例（65536+）与客户端从广播文件 rebuild 的普通编号对齐
// 已知限制：测关期间对客户端创建实例的删除/更新（65536+ id）可能 MISS；resize 后入队的操作可能 MISS（罕见）
var _i, _w, _h, _tx, _ty;
if net_role <> 1 {
    exit
}
if net_q_pending = 0 {
    exit
}
// 16 创建
buffer_set_pos(net_q[0], 0)
while buffer_get_pos(net_q[0]) < buffer_get_size(net_q[0]) {
    buffer_read_u8(net_q[0])
    ed_net_ops_apply_create(net_q[0])
}
// 17 删除
buffer_set_pos(net_q[1], 0)
while buffer_get_pos(net_q[1]) < buffer_get_size(net_q[1]) {
    buffer_read_u8(net_q[1])
    ed_net_ops_apply_delete(net_q[1])
}
// 18 网格
buffer_set_pos(net_q[2], 0)
while buffer_get_pos(net_q[2]) < buffer_get_size(net_q[2]) {
    buffer_read_u8(net_q[2])
    ed_net_ops_apply_grid(net_q[2])
}
// 19 参数更新
buffer_set_pos(net_q[3], 0)
while buffer_get_pos(net_q[3]) < buffer_get_size(net_q[3]) {
    buffer_read_u8(net_q[3])
    ed_net_ops_apply_update(net_q[3])
}
// 20 设置
buffer_set_pos(net_q[4], 0)
while buffer_get_pos(net_q[4]) < buffer_get_size(net_q[4]) {
    buffer_read_u8(net_q[4])
    ed_net_ops_apply_settings(net_q[4])
}
// 21 尺寸调整（最后重放）
buffer_set_pos(net_q[5], 0)
while buffer_get_pos(net_q[5]) < buffer_get_size(net_q[5]) {
    buffer_read_u8(net_q[5])
    buffer_read_u8(net_q[5])
    _w = buffer_read_u32(net_q[5])
    _h = buffer_read_u32(net_q[5])
    _tx = buffer_read_u32(net_q[5])
    _ty = buffer_read_u32(net_q[5])
    if _tx > 2147483647 {
        _tx -= 4294967296
    }
    if _ty > 2147483647 {
        _ty -= 4294967296
    }
    with(o_edmain) {
        ed_resize_level(_w, _h, _tx, _ty)
    }
}
// 统一重编号：重放后的实例与客户端从广播文件 rebuild 的编号对齐
ed_net_rebuild_ids()
_i = 0
while _i < 6 {
    buffer_destroy(net_q[_i])
    net_q[_i] = buffer_create()
    _i += 1
}
net_q_pending = 0
