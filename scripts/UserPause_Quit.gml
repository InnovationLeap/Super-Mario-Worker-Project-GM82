// 自定义暂停：退出关卡（由 o_pausemenu 调用，复刻 o_marker 原 ESC 退出路径）
// 先续播音乐还原世界状态（title 分支末尾 mm_stop_all_ext 会再停），再走原退出流程
if global.musicplay<>0 { mm_resume(global.musicplay) }
if global.musicplay2<>0 { mm_resume(global.musicplay2) }
global.userpause = 0
if global.testmode=1 {
    global.godmode=0;
    global.testout=1;
    if global.sample=1 {sound_stop(snd_pmeter); sound_stop(snd_spin)}
    o_marker.p_meter_sfx_playing=0
    file_text_close(global.toload);
    room_goto(editor_level)
} else {
    warning3 = 0
    if global.currentlevel>0 && global.enablesave {warning3 = show_question('SAVE Progress?')}
    if warning3=1 {Create_Save_File();}
    global.escowanie=1;
    file_text_close(global.toload);
    file_delete(global.toloader);
    if global.sample=1 {sound_stop(snd_pmeter); sound_stop(snd_spin)}
    o_marker.p_meter_sfx_playing=0
    room_goto(title);
    mm_stop_all_ext()
}
