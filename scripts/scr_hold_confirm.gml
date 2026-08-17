// scr_hold_confirm(held, need)
// 与弹窗/UI 完全解耦的"按住确认"状态机：
//   held = 本帧确认输入是否持续按住（由调用方自行定义：键盘按住 / 鼠标按住按钮等）
//   need = 需要的持续帧数（工程固定 50 FPS，故 50 = 1 秒）
// 返回确认进度 0..1；松开即清零；达到 1 后保持直到松开再按。
// 状态保存在调用对象的实例变量 hc_t / hc_need 上，脚本本身不依赖任何弹窗概念。
if argument0 {
    hc_t = hc_t + 1
    if hc_t > argument1 { hc_t = argument1 }
} else {
    hc_t = 0
}
if argument1 <= 0 { hc_t = 0 }
return hc_t / argument1
