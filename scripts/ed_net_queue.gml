// ed_net_queue(op, buf)
// 房主在测关期间（无 o_edmain）把收到的增量编辑消息（op16-21）原样入队（o_ednet 上下文调用）
// 队列按 opcode 分 6 个 buffer（net_q[op-16]），返回编辑器后由 ed_net_replay_pending 按序重放
// 消息从 pos 0 整体拷贝（含 opcode + source_id + 负载），重放端逐条调用对应 apply_* 消费
var _b, _i, _sz;
_b = net_q[argument0 - 16]
buffer_set_pos(argument1, 0)
_sz = buffer_get_size(argument1)
buffer_set_pos(_b, buffer_get_size(_b))
for (_i = 0; _i < _sz; _i += 1) {
    buffer_write_u8(_b, buffer_read_u8(argument1))
}
buffer_set_pos(argument1, 0)
net_q_pending = 1
