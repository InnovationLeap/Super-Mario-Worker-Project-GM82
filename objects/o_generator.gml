#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 生成器（运行时，纯机关）：屏幕内 + 玩家在感应范围内 → 按档位间隔生成 payload
// 参数由关卡载入的 skript 回填（payload_cat/code/param/dir/tier）
payload_cat = 0
payload_code = 0
payload_param = 0
dir = 0
tier = 1
gen_timer = 0
gen_max = 10
gen_need = -1
gen_interval = 200
gen_range = 96
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
if gen_ready = 0 {
    gen_max = gen_payload_info(payload_cat, payload_code, 1)
    gen_need = gen_payload_info(payload_cat, payload_code, 2)
    gen_interval = gen_tier_info(tier, 0)
    gen_range = gen_tier_info(tier, 1)
    _i = 0
    while (_i <= 10) {
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
// 门1：屏幕内（生成器 32x32 与视口相交）
if x + 31 < view_xview[0] { gen_timer = 0; exit }
if x > view_xview[0] + view_wview[0] - 1 { gen_timer = 0; exit }
if y + 31 < view_yview[0] { gen_timer = 0; exit }
if y > view_yview[0] + view_hview[0] - 1 { gen_timer = 0; exit }
// 门2（v3.5 反转，用户拍板）：玩家【不在】该档感应范围内才生成——玩家进入范围则"压制"（计时清零），
// 离开范围后重新计时；范围半径按档位（gen_tier_info(tier,1)：96/160/224/320）
// 编辑器侧由 o_edgeneratorblock 绘制该范围圆，便于摆放时直读
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
// 名额血缘回收：主实例消失时按 gen_tag 全表扫描，血缘全灭则释放名额
_i = 1
while (_i <= gen_max) {
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
// 计时（条件全满足才推进）
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
while (_i < gen_max) {
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
