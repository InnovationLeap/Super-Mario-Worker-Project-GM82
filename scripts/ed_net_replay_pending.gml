// ed_net_replay_pending()
// 房主测关返回编辑器后：按时间顺序重放测关期间入队的增量编辑（o_ednet 上下文调用）
// 每条 = u8 opcode + u8 source_id + 负载，apply_* 自行跳过 source_id
// op21 resize 测关中不可能入队（只有房主能 resize，而房主测关中不在编辑器），此处仍防御性即时处理
// 全部重放后统一 rebuild_ids()：重放创建的客户端空间实例（65536+）与客户端从广播文件 rebuild 的编号对齐
var _op, _w, _h, _tx, _ty;
if net_role <> 1 {
    exit
}
if net_q_pending = 0 {
    exit
}
buffer_set_pos(net_q, 0)
while buffer_get_pos(net_q) < buffer_get_size(net_q) {
    _op = buffer_read_u8(net_q)
    if _op = 16 {
        ed_net_ops_apply_create(net_q)
    }
    else if _op = 17 {
        ed_net_ops_apply_delete(net_q)
    }
    else if _op = 18 {
        ed_net_ops_apply_grid(net_q)
    }
    else if _op = 19 {
        ed_net_ops_apply_update(net_q)
    }
    else if _op = 20 {
        ed_net_ops_apply_settings(net_q)
    }
    else if _op = 21 {
        buffer_read_u8(net_q)
        _w = buffer_read_u32(net_q)
        _h = buffer_read_u32(net_q)
        _tx = buffer_read_u32(net_q)
        _ty = buffer_read_u32(net_q)
        if _tx > 2147483647 {
            _tx -= 4294967296
        }
        if _ty > 2147483647 {
            _ty -= 4294967296
        }
        with(o_edmain) {
            ed_resize_level(_w, _h, _tx, _ty)
        }
        // resize 的 room_restart 会中断触发器（net_pending_sync 已被清掉），
        // 重设标志让重启后的 o_edmain Step 再次触发全量广播（此时队列已空，重放为 no-op）
        global.net_pending_sync = 1
    }
}
ed_net_rebuild_ids()
buffer_destroy(net_q)
net_q = buffer_create()
net_q_pending = 0
