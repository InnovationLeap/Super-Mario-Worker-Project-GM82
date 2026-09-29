// gen_param_default(field)
// 生成器"作者参数"默认值（ObjGenerator.md v6.0）——向导落位 / 旧档兜底时的初值
// field: 0=数量(1-99) 1=档位(1-5) 2=屏内限制(0=无限制 1=必须在屏内)
// 注：v6.0 起「生成间隔」「害羞半径」不再单独可调，二者由档位 gen_tier_info 决定
if argument0 = 0 { return 10 }
if argument0 = 1 { return 3 }
if argument0 = 2 { return 1 }
return 0;
