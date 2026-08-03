// ed_net_queue(op, buf)
// 测关期间房主（无 o_edmain）把收到的增量编辑消息（op16-21）原始负载入队（o_ednet 上下文调用）
// 消息从 pos 0 整体拷贝（含 opcode + source_id + 负载），返回编辑器后由 ed_net_replay_pending 按时间顺序重放
// 单 buffer 按时间顺序追加，重放端逐条读 opcode 分发到对应 apply_*（apply_* 自行跳过 source_id）
var _sz, _i;
buffer_set_pos(argument1, 0)
_sz = buffer_get_size(argument1)
buffer_set_pos(net_q, buffer_get_size(net_q))
for (_i = 0; _i < _sz; _i += 1) {
    buffer_write_u8(net_q, buffer_read_u8(argument1))
}
buffer_set_pos(argument1, 0)
net_q_pending = 1
