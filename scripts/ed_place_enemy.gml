// ed_place_enemy(coto, x, y)
// 放置敌人（o_edmain 上下文调用），返回实例 id
// 工具类（20探照灯/35跳乌龟/39金飞龟/40/41鱼）的 wiatrak 状态机启动由调用处完成
var _f;
_f = instance_create(argument1, argument2, o_edenemyblock)
global.fotel = _f.x
global.fotel2 = _f.y
_f.coto = argument0
if argument0 = 43 {
    //龟壳
    _f.shell_type = global.shell_type
}
if argument0 = 17 || argument0 = 22 || argument0 = 37 {
    //扎地刺/MW刺/MF刺
    _f.spike_type = global.spike_type
}
// NET-SYNC: 创建完成点（工具类 20/35/39/40/41 的向导完成后另有 op19 参数同步；向导右键取消由工具脚本发 op17）
ed_net_ops_send_create(_f, 1)
return _f
