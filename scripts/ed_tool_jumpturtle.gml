// ed_tool_jumpturtle()
// 可调跳乌龟状态机（wiatrak=5），o_edmain 上下文调用
// 完成点（test2=2 落定）处含 NET-SYNC 钩子
if wiatrak=5 { fofo.test2=1 }
if wiatrak=5 && mouse_check_button(mb_left) && mouse_y < fofo.y && kliknieto=0
    {
    wiatrak=0
    fofo.test2=2
    kliknieto=1
    // NET-SYNC: 完成点——跳乌龟落定
    }
