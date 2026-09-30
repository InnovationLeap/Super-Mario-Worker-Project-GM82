// bg_preview_init —— 背景选择面板「格子预览」的元数据
// 由 bg_preview_draw 首次调用时懒加载（模式同 background_table_init），调用后写入：
//   global.bg_pv_paralax[id]  1 = 该背景带视差 → 格子上叠「PARALLAX INCLUDED!」斜标
//   global.bg_pv_camy[id]     预览镜头 y 偏移（默认 0）——见下方说明
//   global.bg_pv_num[id]      1 = 格子右上角标出背景编号
// 这三项都只是「面板怎么显示」，不影响关卡里的真实背景（那部分在 background_show）。
var _i;
for (_i = 0; _i < 80; _i += 1) {
    global.bg_pv_paralax[_i] = 0
    global.bg_pv_camy[_i] = 0
    global.bg_pv_num[_i] = 0
}

// 视差背景：原烤图里带斜标的三个（4 草地视差 / 8 水下视差 / 9 城堡视差）
global.bg_pv_paralax[4] = 1
global.bg_pv_paralax[8] = 1
global.bg_pv_paralax[9] = 1

// 预览取景：白天/夜晚 + 地下（2 / 13）的天空层画在地下层的上面，
// 镜头不下移就只能看到天空，下移半屏才能把「上天下地」两半都露出来。
// 其余背景保持 (0,0)，与游戏里 480 高房间的画面一致。
global.bg_pv_camy[2] = 240
global.bg_pv_camy[13] = 240

// 编号角标：10 / 14 号本身是纯色天空，和 1 / 11 号长得一样，标出编号便于区分
global.bg_pv_num[10] = 1
global.bg_pv_num[14] = 1

global.bg_pv_ready = 1
