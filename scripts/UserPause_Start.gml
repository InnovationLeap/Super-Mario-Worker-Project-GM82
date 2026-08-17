// 自定义暂停：入口（由 o_marker 的 ESC 处理调用）
// 顺序：重入守卫 -> 置位 -> 防抖 -> 清键 -> 截取冻结帧 -> 暂停 BGM -> 停蓄力音效 -> 冻结全部实例（含 o_marker）-> 建暂停弹窗
if global.userpause=1 exit
if instance_exists(o_pausemenu) exit
if !variable_global_exists("testmode") { global.testmode=0 }
global.userpause = 1
global.escowanie = 1
keyboard_clear(vk_escape)
keyboard_clear(vk_enter)
keyboard_clear(vk_up)
keyboard_clear(vk_down)
keyboard_clear(vk_left)
keyboard_clear(vk_right)
keyboard_clear(vk_space)
global.pausesprite = sprite_create_from_screen(0,0,640,480,false,false,0,0)
if global.musicplay<>0 { mm_pause(global.musicplay) }
if global.musicplay2<>0 { mm_pause(global.musicplay2) }
if global.sample=1 { sound_stop(snd_pmeter); sound_stop(snd_spin) }
instance_deactivate_all(true)
instance_deactivate_object(o_marker)
instance_create(0,0,o_pausemenu)
