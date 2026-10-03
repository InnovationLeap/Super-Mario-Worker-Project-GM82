#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 喷火枪本体（Burner）——实心障碍物，按周期在指定方向生成一束火柱。
// 继承 obj_wall：玩家可以站在上面，本体本身不造成伤害（伤害来自 o_flamegunfire）。
//
// fgun_dir  ：0=上 1=下 2=左 3=右（沿用扎地食人花 / global.spike_type 的四方向规范）
//             贴图帧号 = fgun_dir，四帧的定义（不是简单旋转，按美术确认逐向定过）：
//               上 = 素材原样
//               下 = 垂直镜像（180° 再左右翻）
//               左 = 主对角线镜像（逆时针 90° 再上下翻）
//               右 = 纯顺时针 90°（副对角线镜像再上下翻）
//             效果：机身的明暗/侧板在四个方向上都落在同一侧（左/右时右缘都朝屏幕下方），
//             不会像纯旋转那样把高光翻到反侧。
//             s_flamegun 与 s_flameguncycleb 用的是同一套四帧。
// fgun_cycle：0/1 两个相位（同周期，起始时刻错开半个周期）——编辑器里对应两种图标
// fgun_period：喷火周期，取自 CTF 原工程「Burner Controller.喷火周期」= 300 tick；
//              两个引擎同为 50 tick，直接照抄，不做换算。
// 方向/相位由关卡创建代码（room_set_code 的那段 skript）在进房时回填，
// 所以这里只给默认值、Step 里每帧按 fgun_dir 同步贴图。
fgun_dir = 0
fgun_cycle = 0
fgun_period = 300
fire_timer = fgun_period
fgun_phase_done = 0
image_speed = 0
image_index = 0

// 循环音效的全局状态（全关卡共用一条，由本体统一管理）：
//   fgun_snd_on    —— 循环音当前是否已经在放（0→1 时才真正起播，多台共用一条，不会叠音）
//   fgun_last_seen —— 最近一次"视野附近存在火柱"的时刻（毫秒，由 o_flamegunfire 每帧刷新），120ms 内没刷新就停
// 进关 / 进编辑器 / 进标题 / 暂停时由各自入口归零并 sound_stop。
if !variable_global_exists('fgun_snd_on') {global.fgun_snd_on = 0}
if !variable_global_exists('fgun_last_seen') {global.fgun_last_seen = 0}

// 发光位置微调（占位，本体不可发光）
// 光源白名单第 70 位登记的是火柱 o_flamegunfire，不是本体：机关本体是实心铁块，不该发光；
// 编辑器里右键点亮喷火枪那格，亮起来的是它喷出的火（见 o_weather Create 末尾）。
// 这三个变量仅占位，避免任何地方读到未定义变量。
light_x = 16;
light_y = 16;
light_radius = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _ff, _fx, _fy;
if global.pauza=0 && global.level_complete=0 {
    // 相位错开：cycle 1 的起始计时提前半个周期（CTF 里两个 Burner 交替喷火）
    if fgun_phase_done=0 {
        fgun_phase_done = 1
        if fgun_cycle=1 {fire_timer = floor(fgun_period/2)}
    }
    image_index = fgun_dir

    // CTF 事件：Flag 1 初始为 on → 进场立刻喷一次；命中后置 Flag 1 off 并重置计时，
    // 之后每满一个周期再喷一次。
    fire_timer += 1
    if fire_timer >= fgun_period {
        fire_timer = 0
        // 火柱占据本体前方连续 3 格（32x96），x/y 取该区域的左上角
        _fx = x
        _fy = y
        if fgun_dir=0 {_fy = y-96}
        if fgun_dir=1 {_fy = y+32}
        if fgun_dir=2 {_fx = x-96}
        if fgun_dir=3 {_fx = x+32}
        _ff = instance_create(_fx,_fy,o_flamegunfire)
        _ff.fgun_dir = fgun_dir
    }
}

// 循环音效：播放条件是「屏幕附近确实存在火柱」，时间戳由 o_flamegunfire 每帧刷新，
// 本体只负责在这里做唯一的起播/停播判定（全场永远只有一条循环音，多台共用）。
// 用 120ms 窗口而不是「本帧有没有」——多台时间错开时不会互相掐断，也不会随每发火柱反复起停；
// 火柱彻底消失后时间戳不再刷新，120ms 内就会停。
if current_time - global.fgun_last_seen <= 120 {
    if global.fgun_snd_on=0 {
        global.fgun_snd_on = 1
        if global.sample=1 {sound_loop(snd_firezhu); sound_volume(snd_firezhu, global.game_volume)}
    }
} else {
    if global.fgun_snd_on=1 {
        global.fgun_snd_on = 0
        if global.sample=1 {sound_stop(snd_firezhu)}
    }
}