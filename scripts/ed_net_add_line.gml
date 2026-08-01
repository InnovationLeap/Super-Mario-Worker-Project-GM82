// ed_net_add_line(line)
// 向聊天记录追加一行，上限 200 行（在 o_ednet 上下文调用）
ed_net_init()
ds_list_add(net_chat, argument0)
while ds_list_size(net_chat) > 200 {
    ds_list_delete(net_chat, 0)
}
