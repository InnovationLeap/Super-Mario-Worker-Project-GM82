// 开局按键状态维护（每帧调用）
// GM8 在房间重开（room_restart）或进关瞬间可能丢失按住键的状态，导致按住跑/跳/方向键开局不生效。
// 本脚本做两件事：
// 1. 重同步：keyboard_check_direct（直读硬件）连续 2 帧确认物理按住而引擎未识别时，用 keyboard_key_press 补为按下
//    （2 帧确认可防止房间切换瞬间积压的 WM_KEYDOWN 造成误判，导致模拟按下后真实 WM_KEYUP 被忽略而卡键）
// 2. 清理：引擎状态为按下但物理上未按住时，用 keyboard_key_release 立即解除，任何卡键一帧内自愈
// 玩家真正按住时永远不会触发清理，正常输入不受影响。全程无需修改任何 keyboard_check 调用点。
if keyboard_check_direct(global.key_jump) {
    if !keyboard_check(global.key_jump) {
        if global.input_sync_cnt[global.key_jump]>=1 {keyboard_key_press(global.key_jump);global.input_sync_cnt[global.key_jump]=0}
        else {global.input_sync_cnt[global.key_jump]=1}
    } else {global.input_sync_cnt[global.key_jump]=0}
} else {
    global.input_sync_cnt[global.key_jump]=0
    if keyboard_check(global.key_jump) {keyboard_key_release(global.key_jump)}
}
if keyboard_check_direct(global.key_fire) {
    if !keyboard_check(global.key_fire) {
        if global.input_sync_cnt[global.key_fire]>=1 {keyboard_key_press(global.key_fire);global.input_sync_cnt[global.key_fire]=0}
        else {global.input_sync_cnt[global.key_fire]=1}
    } else {global.input_sync_cnt[global.key_fire]=0}
} else {
    global.input_sync_cnt[global.key_fire]=0
    if keyboard_check(global.key_fire) {keyboard_key_release(global.key_fire)}
}
if keyboard_check_direct(global.key_up) {
    if !keyboard_check(global.key_up) {
        if global.input_sync_cnt[global.key_up]>=1 {keyboard_key_press(global.key_up);global.input_sync_cnt[global.key_up]=0}
        else {global.input_sync_cnt[global.key_up]=1}
    } else {global.input_sync_cnt[global.key_up]=0}
} else {
    global.input_sync_cnt[global.key_up]=0
    if keyboard_check(global.key_up) {keyboard_key_release(global.key_up)}
}
if keyboard_check_direct(global.key_down) {
    if !keyboard_check(global.key_down) {
        if global.input_sync_cnt[global.key_down]>=1 {keyboard_key_press(global.key_down);global.input_sync_cnt[global.key_down]=0}
        else {global.input_sync_cnt[global.key_down]=1}
    } else {global.input_sync_cnt[global.key_down]=0}
} else {
    global.input_sync_cnt[global.key_down]=0
    if keyboard_check(global.key_down) {keyboard_key_release(global.key_down)}
}
if keyboard_check_direct(global.key_left) {
    if !keyboard_check(global.key_left) {
        if global.input_sync_cnt[global.key_left]>=1 {keyboard_key_press(global.key_left);global.input_sync_cnt[global.key_left]=0}
        else {global.input_sync_cnt[global.key_left]=1}
    } else {global.input_sync_cnt[global.key_left]=0}
} else {
    global.input_sync_cnt[global.key_left]=0
    if keyboard_check(global.key_left) {keyboard_key_release(global.key_left)}
}
if keyboard_check_direct(global.key_right) {
    if !keyboard_check(global.key_right) {
        if global.input_sync_cnt[global.key_right]>=1 {keyboard_key_press(global.key_right);global.input_sync_cnt[global.key_right]=0}
        else {global.input_sync_cnt[global.key_right]=1}
    } else {global.input_sync_cnt[global.key_right]=0}
} else {
    global.input_sync_cnt[global.key_right]=0
    if keyboard_check(global.key_right) {keyboard_key_release(global.key_right)}
}
if keyboard_check_direct(global.key_restart) {
    if !keyboard_check(global.key_restart) {
        if global.input_sync_cnt[global.key_restart]>=1 {keyboard_key_press(global.key_restart);global.input_sync_cnt[global.key_restart]=0}
        else {global.input_sync_cnt[global.key_restart]=1}
    } else {global.input_sync_cnt[global.key_restart]=0}
} else {
    global.input_sync_cnt[global.key_restart]=0
    if keyboard_check(global.key_restart) {keyboard_key_release(global.key_restart)}
}
