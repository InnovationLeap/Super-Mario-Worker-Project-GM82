// ed_tool_jumpturtle()
// 可调跳乌龟状态机（wiatrak=5），o_edmain 上下文调用
// 完成点（test2=2 落定）处含 NET-SYNC 钩子
if tool_mode=5 { tmp2.test2=1 }
if tool_mode=5 && mouse_check_button(mb_left) && mouse_y < tmp2.y && clicked=0 {
    tool_mode=0
    tmp2.test2=2
    clicked=1
    // NET-SYNC: 完成点——跳乌龟落定
    ed_net_ops_send_update(tmp2, 7)
}
