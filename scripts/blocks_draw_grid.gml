// blocks_draw_grid(x, y, alpha)
// 编辑器关卡视图的"网格单元"底纹：旧 s_blocks 帧0（顶横线+左竖线，与 85 号同款）
// 只在编辑器关卡视图里画（arrayetapu 空格子、ratio_level=0 时铺满关卡 = 编辑器网格）
// 与 blocks_draw 分开的原因：编号 0 在面板和游玩里是不画的，只有编辑器视图需要这层底纹
draw_sprite_part_ext(s_blocks_sheet, 0, global.block_grid_x, global.block_grid_y, 32, 32, argument0, argument1, 1, 1, c_white, argument2)
