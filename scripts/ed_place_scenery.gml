// ed_place_scenery(coto, x, y)
// 放置景物（coto=42 时为模仿者块，使用 global.imitater），返回实例 id
var _f;
_f = instance_create(argument1, argument2, o_edsceneriesblock)
_f.coto = argument0
if argument0 = 42 {
    _f.block_index = global.imitater
}
set_scenery = 1
// NET-SYNC: 完成点——联机同步钩子（coto/block_index/x/y）
return _f
