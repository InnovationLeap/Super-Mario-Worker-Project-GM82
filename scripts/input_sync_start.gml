// 开局按键状态重同步
// GM8 在房间重开（room_restart）或进关瞬间可能丢失按住键的状态，
// 导致按住跑/跳/方向键开局不生效。用 keyboard_check_direct（直读硬件）
// 检测"物理按住但引擎未识别"的键，用 keyboard_key_press 重新标为按下。
// 全程无需修改任何 keyboard_check 调用点。
if keyboard_check_direct(global.sterowanieskok) && !keyboard_check(global.sterowanieskok) {keyboard_key_press(global.sterowanieskok)}
if keyboard_check_direct(global.sterowaniebieg) && !keyboard_check(global.sterowaniebieg) {keyboard_key_press(global.sterowaniebieg)}
if keyboard_check_direct(global.sterowaniegora) && !keyboard_check(global.sterowaniegora) {keyboard_key_press(global.sterowaniegora)}
if keyboard_check_direct(global.sterowaniedol) && !keyboard_check(global.sterowaniedol) {keyboard_key_press(global.sterowaniedol)}
if keyboard_check_direct(global.sterowanielewo) && !keyboard_check(global.sterowanielewo) {keyboard_key_press(global.sterowanielewo)}
if keyboard_check_direct(global.sterowanieprawo) && !keyboard_check(global.sterowanieprawo) {keyboard_key_press(global.sterowanieprawo)}
if keyboard_check_direct(global.restartlevelkey) && !keyboard_check(global.restartlevelkey) {keyboard_key_press(global.restartlevelkey)}
