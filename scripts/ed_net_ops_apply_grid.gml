// ed_net_ops_apply_grid(buf)
// 应用 op18 方块网格写入（o_ednet 上下文调用）：直接写 o_edmain.arrayetapu
var _gx, _gy, _val;
_gx = buffer_read_u32(argument0)
_gy = buffer_read_u32(argument0)
_val = buffer_read_u16(argument0)
if instance_exists(o_edmain) {
    o_edmain.arrayetapu[_gx, _gy] = _val
}
