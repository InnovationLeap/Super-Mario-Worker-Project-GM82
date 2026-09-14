#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 生成器（运行时，纯机关）：四门全真 → 按作者参数（数量/间隔/距离阈值/屏内限制）生成 payload
// 参数由关卡载入的 skript 回填（payload_cat/code/param/dir + gen_max_user/gen_interval/gen_range/gen_screen_only）
// v5.0（ObjGenerator.md §12）：取消"慢/中/快/很快"档位抽象，四项参数全部由作者直接填写
payload_cat = 0
payload_code = 0
payload_param = 0
dir = 0
gen_max_user = 10      // 数量（作者参数，1-99）
gen_interval = 100     // 生成间隔（作者参数，帧 @50fps，1-1000）
gen_range = 160        // 距离阈值（作者参数，px，0-640）：距离 > R 才生成；≤ R 压制（计时清零）
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
var _i, _slot, _obj;
// 懒初始化（载入时 payload 字段可能在实例创建后才赋值）
// v5.0（§12.1）：作者参数钳制到合法范围；实际上限 = 强制上限（花族/320/321/322=1）否则作者填的"数量"
if gen_ready = 0 {
    gen_max_user = gen_param_clamp(0, gen_max_user)
    gen_interval = gen_param_clamp(1, gen_interval)
    gen_range = gen_param_clamp(2, gen_range)
    gen_screen_only = gen_param_clamp(3, gen_screen_only)
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
// 门2（v3.5 反转语义；v5.0 起半径读作者参数 gen_range）：玩家【不在】距离阈值内才生成——
// 玩家进入范围则"压制"（计时清零），离开后重新计时
// 编辑器侧由 o_edgeneratorblock 按 gen_range 绘制该范围圆，便于摆放时直读
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
// 计时（条件全满足才推进）：间隔 = 作者参数 gen_interval（帧 @50fps）
if gen_timer < gen_interval {
    gen_timer += 1
    exit
}
// 已有"生成中"占位物 → 等它转正；名额满 → 计时保持满值等释放
genx_busy = 0
with (o_genitem) {
    if owner_gen = other.id { other.genx_busy = 1 }
}
if genx_busy = 1 { exit }
_slot = 0
_i = 0
while (_i < gen_max_eff) {
    _i += 1
    if _slot = 0 {
        if gen_slots[_i] = 0 { _slot = _i }
    }
}
if _slot = 0 { exit }
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
// 编辑器侧外观由 o_edgeneratorblock 负责（编辑器中仍可见、可摆放）。
// 若未来要加正式水管贴图，在此处恢复绘制即可。
