// int fw_ensure_font(string ttf, real size, bool bold, bool italic, bool stroke)
// 全局字体守卫：同一 (ttf,size) 组合整个会话只加载一次，重复调用直接返回缓存句柄
// 防止 DLL 字体表被重复加载耗尽（句柄泄漏）后返回 -1 导致文字全部不显示
var _key, _id;
_key = argument0 + "|" + string(argument1)

if variable_global_exists("fw_font_map") == false {
    global.fw_font_map = ds_map_create()
}
if ds_map_exists(global.fw_font_map, _key) {
    return ds_map_find_value(global.fw_font_map, _key)
}
if variable_global_exists("__NF_W_ED_AddFontFromFile") == false {
    debug_log("fw_ensure_font: fw_init 尚未执行，无法加载字体 " + _key)
    ds_map_add(global.fw_font_map, _key, -1)
    return -1
}
_id = fw_add_font_from_file(argument0, argument1, argument2, argument3, argument4)
if _id < 0 {
    debug_log("fw_ensure_font: 字体加载失败 " + _key + "（DLL 字体表已满？请重启游戏）")
}
ds_map_add(global.fw_font_map, _key, _id)
return _id
