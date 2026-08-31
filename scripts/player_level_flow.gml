// player_level_flow.gml —— 背景绘制 + 过关计时结算/跳转 + 多余玩家清理 + ESC 暂停（原 o_marker Step_0 第 2463、2475-2505、2517、2529-2533 行）
// 依赖脚本：background_show(), UserPause_Start()
background_show()

if global.pauza=0 {

    // Normal Level Pass
    if global.fastpass=0 || global.gameversion <= 1711 {
        fast_time = 0;
    }
    // Faster Level Pass
    if global.fastpass=1 {
        fast_time = 300;
    }

    if global.level_cleared>0 && global.level_cleared<1000-fast_time {global.level_cleared+=1}
    if global.level_cleared>450-fast_time && real_time>0 {real_time-=1; global.score+=100;nabija+=1}
    if global.level_cleared>500-fast_time && real_time>9 {real_time-=10; global.score+=1000;nabija+=1}
    if global.level_cleared>650-fast_time && real_time>99 {real_time-=100; global.score+=10000;nabija+=1}

    if nabija>5 {nabija=0; if global.sample=1 {tmp2=sound_play(snd_timescore);sound_volume(snd_timescore,global.game_volume)}}

    if global.level_cleared>450-fast_time && global.level_cleared<1000-fast_time && real_time<=0 {global.level_cleared=2000-fast_time}
    if global.level_cleared>=2000-fast_time global.level_cleared+=1
    if global.level_cleared>=2050-fast_time {global.level_complete=0;
        if global.testmode=1 {
            global.godmode=0;
            // NET-SYNC: 测关结束返回。o_edmain 不持久化（换房即销毁），数据源 = F3 时的完整存盘（testsave/temp.smwl）；
            // 测关期间好友的编辑已由 o_ednet 入队，返回后触发器统一重放+全量广播
            room_goto(editor_level)
        } else {
            room_goto(Another_Level)
        }
    }
}

if instance_number(o_marker)>1 {instance_destroy()}

// Pause
if global.escowanie=1 && !keyboard_check(vk_escape) {global.escowanie=0}
if global.escowanie=0 && global.userpause=0 && keyboard_check(vk_escape) {
    UserPause_Start()
}
