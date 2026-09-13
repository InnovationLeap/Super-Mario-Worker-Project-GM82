// gen_param_snapshot(cat, code, inst)
// 编辑器"收编"时快照带参数物品的参数：035=跳跃高度 jumph，043=壳类型 shell_type，其余 0
// inst 为被收编的物品实例（编辑器实例），不允许 noone
if argument2 = noone { return 0 }
if argument0 = 0 && argument1 = 35 { return argument2.jumph }
if argument0 = 0 && argument1 = 43 { return argument2.shell_type }
return 0;
