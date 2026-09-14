// gen_param_default(field)
// 生成器"作者参数"默认值（ObjGenerator.md §12.1）——向导落位 / 旧档兜底时的初值
// field: 0=数量(1-99) 1=生成间隔(帧,50fps,1-1000) 2=距离阈值(px,0-640) 3=屏内限制(0=无限制 1=必须在屏内)
// 注：v5.0 起取消"慢/中/快/很快"档位抽象，三项参数全部由作者直接填写（原 gen_tier_info 已退役）
if argument0 = 0 { return 10 }
if argument0 = 1 { return 100 }
if argument0 = 2 { return 160 }
if argument0 = 3 { return 1 }
return 0;
