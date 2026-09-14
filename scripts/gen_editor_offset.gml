// gen_editor_offset(cat, code, field) —— 编辑器"工具放置"时，物品实例坐标相对【格左上角】的偏移（field: 0=dx、1=dy）
// 用途（ObjGenerator.md；v5.0.3 严格收编判定）：生成器收编要求物品**正好落在生成器所在格的该物品标准放置位置**上——
//   即 item.x = 生成器.x + gen_editor_offset(cat, code, 0)，item.y = 生成器.y + gen_editor_offset(cat, code, 1)
//   （取代旧的"同格 / 有重叠即可"；详见 o_edgeneratorblock 的 Step）。
// 依据 o_edmain 的落地分支：
//   · Object Offset Correct = YES（global.objectoffset = 0，默认）：
//       食人花族（6/7/8/9/44/45/46/47；同一条"所见即所得"分支还含 23 石盾）
//       用 floor((mouse_x-16)/32)*32+16 放置 → dx = +16；其余物品一律 floor(mouse_x/32)*32 → 无偏移。
//   · Object Offset Correct = NO（global.objectoffset = 1）：所有物品都落在格左上角 → 一律无偏移。
// 奖励（cat=3）与其余物品：无偏移。
// 注：本偏移是"编辑器实例坐标"层面；与 gen_spawn_offset（关卡存档 ↔ 运行时坐标换算）用途不同，勿混用。
var _dx, _dy;
_dx = 0;
_dy = 0;
if global.objectoffset = 0 {
    if argument0 = 0 {
        if argument1 = 6 || argument1 = 7 || argument1 = 8 || argument1 = 9 { _dx = 16 }
        if argument1 = 23 || argument1 = 44 || argument1 = 45 || argument1 = 46 || argument1 = 47 { _dx = 16 }
    }
}
if argument2 = 0 { return _dx }
return _dy;
