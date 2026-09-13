// gen_is_captured(inst)
// 编辑器存盘用：该物品实例是否已被某个生成器"收编"
// 被收编的物品不再作为独立物品写出（游玩时只由生成器产出，即需求中的"该物品消失"）
// 注意：用实例变量承载临时结果，避免在 with 内使用 var（GM8 作用域歧义）
genx_probe_id = argument0;
genx_probe = 0;
with (o_edgeneratorblock) {
    if gen_item = other.genx_probe_id { other.genx_probe = 1 }
}
return genx_probe;
