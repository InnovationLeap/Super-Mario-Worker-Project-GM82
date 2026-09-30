#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 生成器（运行时，纯机关）：四门全真 → 按作者参数（数量/档位/屏内限制）生成 payload
// 参数由关卡载入的 skript 回填（payload_cat/code/param/dir + gen_max_user/gen_tier/gen_screen_only）
// v6.0（ObjGenerator.md §12）：档位复活并绑定「生成间隔」+「害羞半径」——间隔与半径由 gen_tier_info 推导，
//   运行时在懒初始化时缓存为 gen_interval / gen_range（实例内只读，档位不再有单独的数值输入）
payload_cat = 0
payload_code = 0
payload_param = 0
dir = 0
gen_max_user = 10      // 数量（作者参数，1-99）
gen_tier = 3           // 档位（作者参数，1-5；同时决定生成间隔与害羞半径，见 gen_tier_info）
gen_interval = 128     // 生成间隔（由档位推导，帧 @50fps；懒初始化时回填）
gen_range = 48         // 害羞半径（由档位推导，px）：距离 > R 才生成；≤ R 压制（计时清零）
gen_screen_only = 1    // 屏内限制（作者参数，0/1）：1=生成器必须在屏内才工作
gen_max_force = -1     // 强制上限（规则表：食人花族 / 320 / 321 / 322 返回 1；其余 -1）
gen_max_eff = 10       // 实际上限 = 强制上限（若有）否则 gen_max_user（懒初始化计算）
gen_timer = 0
gen_need = -1
gen_ready = 0
if !variable_global_exists('gen_serial') { global.gen_serial = 0 }
image_speed = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _i, _slot, _obj, _gi;
// 懒初始化（载入时 payload 字段可能在实例创建后才赋值）
// v6.0（§12）：档位钳制 1-5，生成间隔与害羞半径由档位推导；实际上限 = 强制上限（花族/320/321/322=1）否则作者填的"数量"
if gen_ready = 0 {
    gen_max_user = gen_param_clamp(0, gen_max_user)
    gen_tier = gen_param_clamp(1, gen_tier)
    gen_screen_only = gen_param_clamp(2, gen_screen_only)
    gen_interval = gen_tier_info(gen_tier, 0)
    gen_range = gen_tier_info(gen_tier, 1)
    gen_max_force = gen_payload_info(payload_cat, payload_code, 1)
    gen_max_eff = gen_max_user
    if gen_max_force >= 0 { gen_max_eff = gen_max_force }
    gen_need = gen_payload_info(payload_cat, payload_code, 2)
    _i = 0
    while (_i <= gen_max_eff) {
        gen_slots[_i] = 0
        gen_slot_id[_i] = noone
        _i += 1
    }
    gen_ready = 1
}
// ── 记账与清理（v6.12：必须放在四道门**之前**）────────────────────────────────
//   这两段与"能不能生成"无关，只负责名额回收与出界回收；放在门后会被门1（离屏）/门2（被玩家压制）
//   /门3（暂停）挡住 —— 表现就是"掉出房间的生成物一直不销毁、名额也不释放"。
// 名额血缘回收：主实例消失时按 gen_tag 全表扫描，血缘全灭则释放名额（槽位数 = gen_max_eff）
_i = 1
while (_i <= gen_max_eff) {
    if gen_slots[_i] != 0 {
        if !instance_exists(gen_slot_id[_i]) {
            genx_alive = 0
            genx_tag = gen_slots[_i]
            genx_slot = _i
            with (all) {
                if gen_tag = other.genx_tag {
                    other.genx_alive = 1
                    other.gen_slot_id[other.genx_slot] = id
                }
            }
            if genx_alive = 0 { gen_slots[_i] = 0 }
        }
    }
    _i += 1
}
// v6.9（用户要求）：**生成器负责回收自己生成的单位**——左 / 下 / 右**出界（相对房间）256px** 即销毁
//   （不判上方，允许飞出房间顶部）。用槽位里记录的"当前实例"（血缘后继会被上一段扫描刷新）；
//   非生成物（gen_tag = 0）仍走各自对象里的旧规则。
_i = 1
while (_i <= gen_max_eff) {
    if gen_slots[_i] != 0 {
        _gi = gen_slot_id[_i]
        if instance_exists(_gi) {
            genx_ob = 0
            if _gi.x < -256 { genx_ob = 1 }
            if _gi.x > room_width[0] + 256 { genx_ob = 1 }
            if _gi.y > room_height[0] + 256 { genx_ob = 1 }
            if genx_ob = 1 {
                // 注意：本工程（GM8.2）的 instance_destroy 不接受参数、只能销毁 self → 用 with 切上下文
                with (_gi) { instance_destroy() }
                if !instance_exists(_gi) { gen_slots[_i] = 0 } // 确实销毁了才释放名额
            }
        }
    }
    _i += 1
}
// 门0：payload 合法性 + 方向约束
_obj = gen_payload_info(payload_cat, payload_code, 0)
if _obj = -1 { exit }
if gen_need >= 0 {
    if dir != gen_need {
        gen_timer = 0
        exit
    }
}
// 门1：屏内限制（作者参数 gen_screen_only=1 时生效；=0 则跳过本门）
// 已知影响（§12.1#3）：允许屏外生成时，敌人多数"入屏才激活"→可能入屏后不动，由作者自行取舍
if gen_screen_only = 1 {
    if x + 31 < view_xview[0] { gen_timer = 0; exit }
    if x > view_xview[0] + view_wview[0] - 1 { gen_timer = 0; exit }
    if y + 31 < view_yview[0] { gen_timer = 0; exit }
    if y > view_yview[0] + view_hview[0] - 1 { gen_timer = 0; exit }
}
// 门2（v3.5 反转语义；v6.0 起半径 = 档位害羞半径）：玩家【不在】距离阈值内才生成——
// 玩家进入范围则"压制"（计时清零），离开后重新计时
// 编辑器侧由 o_edgeneratorblock 按档位半径绘制该圆，便于摆放时直读
if instance_exists(o_marker) {
    if point_distance(x + 16, y + 16, o_marker.x, o_marker.y) <= gen_range {
        gen_timer = 0
        exit
    }
}
// 门3：世界状态
if global.pauza != 0 { exit }
if variable_global_exists('userpause') {
    if global.userpause != 0 { exit }
}
if global.level_complete != 0 { gen_timer = 0; exit }
// 注：名额血缘回收与出界回收已上移到本事件开头（v6.12）——它们**不能被四道门挡住**，
//   否则生成器离屏（门1）或被玩家压制（门2）时就停止回收，掉出世界的生成物会一直留着。
// v6.4（用户反馈"食人花被打死瞬间就生成下一个"）：名额满时倒计时**冻结**（停在当前进度），
//   名额一释放就从当前进度继续计时，所以打死 / 转化掉一个不会立刻补一个。
// v6.6（用户反馈"紫档间隔调到很小还是感觉很大"）：**只有"名额已满"冻结倒计时**——
//   "生成中"占位物不再冻结它。否则埋在实心里、需要挤出的物品会把挤出时间加到每一个间隔上
//   （间隔越小，挤出时间占比越大，手感就像"间隔下不去"）。
_slot = 0
_i = 0
while (_i < gen_max_eff) {
    _i += 1
    if _slot = 0 {
        if gen_slots[_i] = 0 { _slot = _i }
    }
}
if _slot = 0 { exit }
// 计时（50fps，1 帧 = 0.02s）：间隔 = 档位推导的 gen_interval
if gen_timer < gen_interval {
    gen_timer += 1
    exit
}
// 已有"生成中"占位物 → 等它转正（计时停在满值，转正后立即生成，不重复计一个间隔）
genx_busy = 0
with (o_genitem) {
    if owner_gen = other.id { other.genx_busy = 1 }
}
if genx_busy = 1 { exit }
gen_spawn()
gen_timer = 0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// v3.4（用户拍板）：生成器在关卡（游玩）中【不可视】——纯机关，不绘制任何内容。
// 注意：保留空的 Draw 事件本身（存在 Draw 事件即抑制 GM8 默认精灵绘制，因此这里什么都不画 = 完全不可见）。
// 编辑器侧外观由 o_edgeneratorblock 负责（编辑器中仍可见、可摆放，且按档位上色）。
// 若未来要加正式水管贴图，在此处恢复绘制即可。
