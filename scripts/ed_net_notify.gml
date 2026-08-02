// ed_net_notify(msg)
// 仅左上角显示 3 秒（o_debugmsg 绘制 debug_msg_list）
// 不写 debug_log.txt、不受 debug_mode 限制；任何上下文可调用
if variable_global_exists("debug_msg_list") == false {
    global.debug_msg_list = ds_list_create()
}
ds_list_add(global.debug_msg_list, "180|" + string(argument0))
