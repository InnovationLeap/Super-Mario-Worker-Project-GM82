/// toggle_light_icon(col, row, bit)
/// 检测编辑器网格中指定位置是否被右键点击，若是则翻转 global.lightobject 的对应位。
/// col: 编辑器网格中的列索引 (0~5)
/// row: 编辑器网格中的行索引 (0~3)
/// bit: global.lightobject 字符串中的位索引 (1-based)
/// 应在 mouse_check_button_released(mb_right) 条件块内调用。
/// 对于跨多格共享同一位的物品，可多次调用（不同 col/row 同一 bit）。
if ed_hit(206+64*argument0, 110+64*argument1, 64, 64) {
    if string_copy(global.lightobject, argument2, 1) = '0'
    { global.lightobject = string_replace_char(global.lightobject, argument2, '1'); } else
    { global.lightobject = string_replace_char(global.lightobject, argument2, '0'); }
}
