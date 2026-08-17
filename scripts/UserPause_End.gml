// 自定义暂停：恢复（由 o_pausemenu 调用，调用语句应放在其 Step 事件末尾）
// 顺序：续播 BGM -> 隐藏弹窗（防本帧残影）-> 释放冻结帧 -> 解标志 -> 解冻全部实例 -> 清键 -> 销毁弹窗自身
if global.musicplay<>0 { mm_resume(global.musicplay) }
if global.musicplay2<>0 { mm_resume(global.musicplay2) }
visible=false
if global.pausesprite>=0 { sprite_delete(global.pausesprite) }
global.pausesprite = -1
global.userpause = 0
instance_activate_all()
keyboard_clear(vk_escape)
keyboard_clear(vk_enter)
keyboard_clear(vk_up)
keyboard_clear(vk_down)
keyboard_clear(vk_left)
keyboard_clear(vk_right)
keyboard_clear(vk_space)
instance_destroy()
