// gen_spawn_offset(cat, code, field) —— 生成物初始实例坐标换算（field: 0=dx, 1=dy）
// 标准（用户定）：所见即所得——生成物出现的位置必须与"编辑器里把该物品摆在生成器同格、直接放置"时完全一致
// 依据：关卡存档对"编辑器格坐标 → 运行时实例坐标"的统一换算（与直接放置同源，Save_Script_Enemy:7-23"位置补正相关I"）
//   · Object Offset Correct = YES（global.objectoffset=0，默认）：存档写出前 += 各物品补正（板栗仔 +16,+16 等）
//   · Object Offset Correct = NO（global.objectoffset=1）：存档不做补正 → 运行时实例坐标 = 编辑器坐标，此处同样返回 0
// 生成器坐标 = 格左上角（Save_Script_Generator 无补正），故按同一换算取偏移即可保证"生成 = 直接放置"
// 奖励（cat=3）在存档中无补正（Save_Script_Rest 对 '3' 无位置换算），返回 0
// 43 龟壳 / 16 毒蘑菇：存档同样无补正，返回 0
var _dx, _dy;
_dx = 0;
_dy = 0;
if global.objectoffset = 1 {
    // 关闭"坐标偏移修正"时，直接放置的物品也不做补正——生成器保持一致（所见即所得）
    if argument2 = 0 { return 0 }
    return 0
}
if argument0 = 0 {
    if argument1 = 1 || argument1 = 31 || argument1 = 32 { _dx = 16; _dy = 16 }  // 板栗仔、布布鬼、硬壳龟
    if argument1 = 2 || argument1 = 3 || argument1 = 34 || argument1 = 38 { _dx = 14; _dy = 14 }  // 乌龟
    if argument1 = 4 || argument1 = 33 || argument1 = 35 { _dx = 15; _dy = 17 }  // 红绿蓝飞龟
    if argument1 = 5 { _dx = 17; _dy = 15 }  // 红刺猬
    if argument1 = 25 { _dx = 17; _dy = 18 }  // 灰刺猬
    if argument1 = 10 { _dx = 15; _dy = 8 }  // 刺猬云
    if argument1 = 48 { _dx = 15; _dy = 8 }  // 悲伤云
    if argument1 = 12 || argument1 = 13 || argument1 = 14 || argument1 = 15 { _dx = 16; _dy = 17 }  // 鱼
    if argument1 = 19 || argument1 = 27 { _dx = 17; _dy = 10 }  // 锤龟族
    if argument1 = 21 { _dx = 14; _dy = 0 }  // 火球
    if argument1 = 6 || argument1 = 8 || argument1 = 9 || argument1 = 23 || argument1 = 44 || argument1 = 45 || argument1 = 46 || argument1 = 47 { _dx = 16; _dy = 0 }  // 正向食人花族
    if argument1 = 7 { _dx = 16; _dy = -1 }  // 绿色倒食人花
}
if argument2 = 0 { return _dx }
return _dy;
