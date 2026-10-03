#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 喷火枪的火柱（Burner Fire）——本体前方连续 3 格的危险区。
//
// 刻意 **不挂在 o_goomba 家族下**：这是一块不可摧毁的地形威胁，
// 不进敌人碰撞分组，火球/甜菜/龟壳/浣熊尾巴就都不会把它打掉，
// 也不需要去那些脚本里维护免疫名单；接触伤害在本对象 Step 里自己判。
//
// 动画（速度一律 33/100）：appearing = 帧 0→2（火苗由小长大），
//                          常态 = 帧 3、4 循环，
//                          disappearing = appearing 的倒放（帧 2→1→0），播完即销毁。
// 计时：appearing 播放期间不计时；播完后每 tick +1，超过 喷火周期/2-30（=120）转入 disappearing。
// 判定：只有常态（fgun_anim=1）有伤害；appearing / disappearing 期间没有伤害判定，玩家可以安全穿过。
fgun_dir = 0
fgun_anim = 0
fgun_burn = 0
fgun_clock = 0
image_speed = 0
image_index = 0

// 循环音效：CTF 的条件是「窗口附近存在 Burner Fire」，所以由火柱自己刷「最近可见时刻」；
// 起播/停播的判定统一放在本体 o_flamegun 那边（全场只维持一条循环音）。
if !variable_global_exists('fgun_snd_on') {global.fgun_snd_on = 0}
if !variable_global_exists('fgun_last_seen') {global.fgun_last_seen = 0}

// 发光位置微调（光源白名单第 70 位登记的是本对象，不是本体 o_flamegun）
// 精灵 origin=(0,0)，x/y 就是火柱占位区的左上角；上/下是 32×96、左右是 96×32，
// 所以光心要按方向取：竖柱 (16,48)、横柱 (48,16)。
// light_radius 由 Step 按动画阶段推（appearing 由小到大、常态 1、disappearing 缩回 0），
// 光圈跟着火苗长灭；此处先给 0，避免生成那一帧先闪一下满光。
light_x = 16;
light_y = 48;
light_radius = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _do_die;
_do_die = 0

// 按方向选贴图（方向由本体在创建后回填）
if fgun_dir=0 {sprite_index = s_flamegunfireup}
if fgun_dir=1 {sprite_index = s_flamegunfiredown}
if fgun_dir=2 {sprite_index = s_flamegunfireleft}
if fgun_dir=3 {sprite_index = s_flamegunfireright}

// 光心跟着方向走：上/下 = 32×96 竖柱 → (16,48)；左/右 = 96×32 横柱 → (48,16)
if fgun_dir<2 {light_x = 16; light_y = 48} else {light_x = 48; light_y = 16}

if global.pauza=0 && global.level_complete=0 {
    // CTF 动画速度 33/100：100/100 是 1 个物理帧切一次动画帧
    // → 33 即每 100/33 ≈ 3.03 个物理帧切一帧（两引擎同为 50 tick，不需要换算帧率）。
    // 注意不要用 image_speed 让 GM8 自己走：image_index 越界会自动回绕，
    // 那样就分不清 appearing 与常态了。这里自己计时，动画阶段完全可控。
    fgun_clock += 0.33
    if fgun_clock >= 1 {
        fgun_clock -= 1
        if fgun_anim=0 {
            // appearing：帧 0→2 播完即停，转入常态循环
            image_index += 1
            if image_index >= 3 {image_index = 3; fgun_anim = 1}
        } else {
            if fgun_anim=2 {
                // disappearing：appearing 的倒放（帧 2→1→0），播完销毁
                image_index -= 1
                if image_index <= 0 {image_index = 0; _do_die = 1}
            } else {
                // 常态：帧 3、4 循环
                image_index += 1
                if image_index > 4 {image_index = 3}
            }
        }
    }
    if fgun_anim=1 {
        fgun_burn += 1
        if fgun_burn > 120 {
            // 喷火周期/2 - 30 = 300/2 - 30：转入消失动画，从 appearing 的末帧（帧 2）开始倒放
            fgun_anim = 2
            fgun_clock = 0
            image_index = 2
        }
    }

    // 光圈半径跟随动画阶段（o_weather 画光时读 light_radius）：
    //   appearing（帧 0/1/2）→ 0/0.33/0.67，常态（帧 3、4）→ 1，
    //   disappearing 是 appearing 的倒放（帧 2/1/0）→ 0.67/0.33/0。
    // 即火苗长多大、光圈就多大，火灭光也灭（销毁后自然不出光）。
    if fgun_anim=1 {light_radius = 1} else {light_radius = image_index/3}

    // 接触伤害不在这里判 —— 与地刺等"不可踩的固定危险物"一致，判定写在玩家侧
    // （player_combat.gml「撞到喷火枪火柱」分支），共用外层 rodzajmaria<>5 / star_timer<=0
    // 两道无敌闸 + hit_timer / shield 豁免，以及同一个判定时机。
    // 本物体只提供状态：fgun_anim=1 表示处于常态（可以打人），appearing/disappearing 期间不打人。
}

// 「最近可见时刻」刷新：本火柱存在且在视口附近（±96px 边距，同 CTF）时打时间戳。
// 本体每帧只看这个时间戳来决定播/停，所以火柱一消失（含 appearing/disappearing 走完销毁）音就会在 120ms 内停。
if global.pauza=0 && global.level_complete=0 {
    if x+96 > view_xview[0]-96 && x < view_xview[0]+view_wview[0]+96 && y+96 > view_yview[0]-96 && y < view_yview[0]+view_hview[0]+96 {
        global.fgun_last_seen = current_time
    }
}

if _do_die=1 {instance_destroy()}