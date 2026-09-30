// blocks_sheet_build()
// 构建 方块编号 -> 大表坐标 的映射（global.block_sheet_x / global.block_sheet_y）
// 大表 = 精灵 s_blocks_sheet（背景 b_blocks 使用完全相同的布局，供模仿者 tile_add 取图）
// 布局：宽 384（12 列 x 32）
//       每页 = 1 空行 + 7 行 → 页 p 的第 r 行对应大表行号 p*8 + 1 + r
//       面板未收录的历史编号不再单独占格，见文件末尾的别名表
// 依赖：global.blocks_palette 已初始化（先调用 blocks_palette_data）
// 调用点：o_edmain Create_0（palette 之后）、两处游玩加载器开头
var _p, _r, _c, _id, _i;

for (_i = 0; _i < 640; _i += 1) {
    global.block_sheet_x[_i] = 0
    global.block_sheet_y[_i] = 0
}
for (_p = 0; _p < 5; _p += 1) {
    for (_r = 0; _r < 7; _r += 1) {
        for (_c = 0; _c < 12; _c += 1) {
            _id = global.blocks_palette[_p, _r * 12 + _c]
            if _id > 0 {
                if global.block_sheet_y[_id] = 0 {
                    global.block_sheet_x[_id] = _c * 32
                    global.block_sheet_y[_id] = (_p * 8 + 1 + _r) * 32
                }
            }
        }
    }
}

// 历史编号别名：面板从未收录（选不到、也画不出新格子），但旧关卡/旧存档里可能出现，
// 且原素材与某个面板编号逐像素相同 → 直接复用那个编号的格子，不必在大表里单独占一行。
// 7/8 另外还被 PASSAGE 图标当素材用（ed_mark_draw case 1），别名后图标画面不变。
//   7   → 17   纵向绿水管中段左
//   8   → 18   纵向绿水管中段右
//   31  → 30   横向绿水管中上
//   43  → 42   横向绿水管中下
//   60  → 4    砖块（棕），原图逐像素相同
//   82  → 80   夜晚草地中下（无阴影），原图只差 8 像素星屑
//   210 → 21   桥（灰，MW 自带），原图逐像素相同
global.block_sheet_x[7] = global.block_sheet_x[17]
global.block_sheet_y[7] = global.block_sheet_y[17]
global.block_sheet_x[8] = global.block_sheet_x[18]
global.block_sheet_y[8] = global.block_sheet_y[18]
global.block_sheet_x[31] = global.block_sheet_x[30]
global.block_sheet_y[31] = global.block_sheet_y[30]
global.block_sheet_x[43] = global.block_sheet_x[42]
global.block_sheet_y[43] = global.block_sheet_y[42]
global.block_sheet_x[60] = global.block_sheet_x[4]
global.block_sheet_y[60] = global.block_sheet_y[4]
global.block_sheet_x[82] = global.block_sheet_x[80]
global.block_sheet_y[82] = global.block_sheet_y[80]
global.block_sheet_x[210] = global.block_sheet_x[21]
global.block_sheet_y[210] = global.block_sheet_y[21]

// 可绘制编号上限+1（模仿者滚轮用到）；当前最大编号 425 = 静止坦克轮子（右）
global.block_count = 426
// 编辑器网格单元：复用 85 号「EDIT界面网格」的格子（原 s_blocks 帧0 与它逐像素相同）
// 不能占用编号 0 的映射位——"未映射"判据用的是 y=0
global.block_grid_x = global.block_sheet_x[85]
global.block_grid_y = global.block_sheet_y[85]
