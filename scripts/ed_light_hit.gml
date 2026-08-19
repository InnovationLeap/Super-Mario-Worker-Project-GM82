/// ed_light_hit(col, row, w)
/// 检测编辑器网格 (col,row) 处宽度 w 的矩形是否命中（用于光照图标右键点击判定）。
/// 高度恒为 64（所有格子等高等宽）。返回 0/1，可多个 || 组合（跨格物品）。
return ed_hit(206+64*argument0, 110+64*argument1, argument2, 64);
