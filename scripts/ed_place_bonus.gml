// ed_place_bonus(coto, x, y)
// 放置奖励块（在 o_edmain 上下文调用），返回实例 id
var _f;
_f = instance_create(argument1, argument2, o_edbonusesblock)
_f.coto = argument0
// NET-SYNC: 完成点——联机同步钩子
return _f
