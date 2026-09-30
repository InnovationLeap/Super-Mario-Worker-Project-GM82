// blocks_sheet_build()
// 构建 方块编号 -> 大表坐标 的映射（global.block_sheet_x / global.block_sheet_y）
// 大表 = 精灵 s_blocks_sheet（背景 b_blocks 使用完全相同的布局，供模仿者 tile_add 取图）
// 布局：宽 384（12 列 x 32）
//       每页 = 1 空行 + 7 行 → 页 p 的第 r 行对应大表行号 p*8 + 1 + r
//       表底第 41 行 = 杂项区（面板未收录但仍保留素材的编号）
// 依赖：global.blocks_palette 已初始化（先调用 blocks_palette_data）
// 调用点：o_edmain Create_0（palette 之后）、两处游玩加载器开头
var _p, _r, _c, _id, _i, _oid;

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
// 杂项区：面板未收录但仍有素材的编号
// 每项固定 3 字符（编号有三位数的，如 210）
_oid = '007008031043060082210'
for (_i = 0; _i < 7; _i += 1) {
    _id = real(string_copy(_oid, _i * 3 + 1, 3))
    global.block_sheet_x[_id] = _i * 32
    global.block_sheet_y[_id] = 41 * 32
}
global.block_count = 423
// 编辑器网格单元：旧 s_blocks 帧0（空格子处铺的底纹，与 85 号同款网格线）
// 放在杂项区第 8 格（不能占用编号 0 的映射位——"未映射"判据用的是 y=0）
global.block_grid_x = 224
global.block_grid_y = 41 * 32
