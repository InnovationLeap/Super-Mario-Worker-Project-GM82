// blocks_draw(id, x, y, scale, alpha)
// 方块统一绘制入口：从大表 s_blocks_sheet 取 32x32 区块绘制
// 编辑器面板 / 编辑器关卡视图 / 游玩渲染 / 模仿者 全部走这里 → 显示完全同源
// id <= 0 视为空方块，不绘制
// 注意 GM8 的 draw_sprite_part_ext 共 12 个参数、没有 rot：
//   (sprite, subimg, left, top, width, height, x, y, xscale, yscale, color, alpha)
if argument0 > 0 {
    draw_sprite_part_ext(s_blocks_sheet, 0, global.block_sheet_x[argument0], global.block_sheet_y[argument0], 32, 32, argument1, argument2, argument3, argument3, c_white, argument4)
}
