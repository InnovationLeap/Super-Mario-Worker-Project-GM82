// ed_place_block(costawia, x, y)
// 放置方块：写 arrayetapu 网格；autosolid 开启时联动创建实心标记(coto=18)并返回其实例 id，否则返回 -1
var _f;
arrayetapu[argument1 div 32, argument2 div 32] = argument0
ed_net_ops_send_grid(argument1 div 32, argument2 div 32, argument0)
if self_coto_check(4,18) && global.autosolid = 1 {
    _f = instance_create(argument1, argument2, o_edmarkerblock)
    _f.coto = 18 //喝了实心
    ed_net_ops_send_create(_f, 5)
    return _f
}
return -1
