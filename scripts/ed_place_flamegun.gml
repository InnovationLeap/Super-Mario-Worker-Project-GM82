// ed_place_flamegun(x, y)
// 喷火枪落位（o_edmain 上下文调用）。返回创建的 o_edenemyblock 实例（coto=49）。
// 第一步只定位置，方向随后由 o_edmain 的向导用鼠标指向确定（0=上 1=下 2=左 3=右）。
// 相位（cycle）取编辑器面板上当前选中的 global.flamegun_cycle。
var _f;
_f = instance_create(argument0, argument1, o_edenemyblock)
_f.coto = 49
_f.fgun_dir = 0
_f.fgun_cycle = 0
if variable_global_exists('flamegun_cycle') { _f.fgun_cycle = global.flamegun_cycle }
// NET-SYNC: 向导中途不广播，方向确定后由 o_edmain 的向导完成后统一 ed_net_ops_send_create
//（与 ed_place_generator 的写法一致：中途右键取消不产生同步）
return _f