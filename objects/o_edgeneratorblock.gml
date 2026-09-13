#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 编辑器生成器实例：收编同格白名单物品为 payload；submenu 改方向/档位（上限不可改）
payload_cat = 0
payload_code = 0
payload_param = 0
dir = 0
tier = 1
gen_item = noone
gen_item_x = 0
gen_item_y = 0
gen_reject = noone
gen_reject_x = 0
gen_reject_y = 0
gen_skip = 0
gen_clear = 0
genw_alert = 0
genw_id = noone
wizard = 0
gen_menu_armed = 1
// 扫描用实例变量（避免在 with 内使用 var 造成的作用域歧义）
gen_cx = 0
gen_cy = 0
gen_gx = 0
gen_gy = 0
gen_cand = noone
gen_cand_cat = 0
gen_cand_code = 0
gen_d = 0
gen_need = -1
gen_ok = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 收编刷新：与生成器同格、白名单、方向兼容的物品被"收编"为 payload（物品保留可视，打小勾）
// 收编锚点 = 收编时物品坐标；此后物品发生任何位移（含 Precise move 微调，位移非 0）→ 解除收编，
// 并记入"位移拒绝"：只有物品回到锚点位置（位移归零）才会被重新收编
// 交互失败（不在白名单 / 方向不兼容 / 处于位移拒绝）→ 无任何效果
if wizard = 1 { genw_alert = 0; exit } // 向导期间不扫描、不显示警告（收编尚未开始，避免误导）
gen_cx = floor(x / 32)
gen_cy = floor(y / 32)
gen_gx = gen_cx * 32 + 16
gen_gy = gen_cy * 32 + 16
// 已有收编：物品必须仍在收编锚点位置（且白名单/方向仍兼容）
if instance_exists(gen_item) {
    gen_ok = 0
    if gen_item.x = gen_item_x {
        if gen_item.y = gen_item_y {
            gen_need = gen_payload_info(payload_cat, payload_code, 2)
            if gen_need = -1 { gen_ok = 1 }
            if gen_need = dir { gen_ok = 1 }
        }
    }
    if gen_ok = 1 {
        payload_param = gen_param_snapshot(payload_cat, payload_code, gen_item)
        exit
    }
    // 锚点失效（被微调 / 方向改变）→ 解除收编并记入拒绝，防止下一帧立即重收编
    gen_reject = gen_item
    gen_reject_x = gen_item_x
    gen_reject_y = gen_item_y
}
// v3.4：位移拒绝解锁——被拒绝的物品离开生成器格（或被删除）即清除拒绝，之后重新放回本格可再次收编
gen_clear = 0
if gen_reject != noone {
    if !instance_exists(gen_reject) {
        gen_clear = 1
    } else {
        if floor(gen_reject.x / 32) != gen_cx { gen_clear = 1 }
        if floor(gen_reject.y / 32) != gen_cy { gen_clear = 1 }
    }
    if gen_clear = 1 { gen_reject = noone }
}
// 重新找候选：同格 + 白名单 + 方向兼容 + 不处于"位移拒绝"状态，取中心最近者（平手保留先扫到的敌人）
gen_cand = noone
gen_cand_cat = 0
gen_cand_code = 0
gen_d = 9999999
with (o_edenemyblock) {
    if floor(x / 32) = other.gen_cx {
        if floor(y / 32) = other.gen_cy {
            other.gen_skip = 0
            if id = other.gen_reject {
                if x != other.gen_reject_x || y != other.gen_reject_y { other.gen_skip = 1 }
            }
            if other.gen_skip = 0 {
                if gen_payload_info(0, coto, 0) != -1 {
                    if gen_payload_info(0, coto, 2) = -1 || gen_payload_info(0, coto, 2) = other.dir {
                        if point_distance(x + 16, y + 16, other.gen_gx, other.gen_gy) < other.gen_d {
                            other.gen_d = point_distance(x + 16, y + 16, other.gen_gx, other.gen_gy)
                            other.gen_cand = id
                            other.gen_cand_cat = 0
                            other.gen_cand_code = coto
                        }
                    }
                }
            }
        }
    }
}
with (o_edbonusesblock) {
    if floor(x / 32) = other.gen_cx {
        if floor(y / 32) = other.gen_cy {
            other.gen_skip = 0
            if id = other.gen_reject {
                if x != other.gen_reject_x || y != other.gen_reject_y { other.gen_skip = 1 }
            }
            if other.gen_skip = 0 {
                if gen_payload_info(3, coto, 0) != -1 {
                    if gen_payload_info(3, coto, 2) = -1 || gen_payload_info(3, coto, 2) = other.dir {
                        if point_distance(x + 16, y + 16, other.gen_gx, other.gen_gy) < other.gen_d {
                            other.gen_d = point_distance(x + 16, y + 16, other.gen_gx, other.gen_gy)
                            other.gen_cand = id
                            other.gen_cand_cat = 3
                            other.gen_cand_code = coto
                        }
                    }
                }
            }
        }
    }
}
if gen_cand != noone {
    payload_cat = gen_cand_cat
    payload_code = gen_cand_code
    payload_param = gen_param_snapshot(payload_cat, payload_code, gen_cand)
    gen_item = gen_cand
    gen_item_x = gen_cand.x
    gen_item_y = gen_cand.y
    gen_reject = noone
} else {
    // 物品被移走/删除/方向变为不兼容/位移中 → 释放（生成器回到空载）
    payload_cat = 0
    payload_code = 0
    payload_param = 0
    gen_item = noone
}
// v3.4：空载警告扫描——生成器空载但格内存在白名单物品（未收编：位移拒绝 / 方向不符 / 首次放置前一帧）时，
// 由 Draw 在该物品处画红色警示标，避免"以为收编了、实际没有"导致游玩时什么都不生成
genw_alert = 0
genw_id = noone
if gen_item = noone {
    with (o_edenemyblock) {
        if floor(x / 32) = other.gen_cx {
            if floor(y / 32) = other.gen_cy {
                if gen_payload_info(0, coto, 0) != -1 {
                    if other.genw_alert = 0 {
                        other.genw_alert = 1
                        other.genw_id = id
                    }
                }
            }
        }
    }
    with (o_edbonusesblock) {
        if floor(x / 32) = other.gen_cx {
            if floor(y / 32) = other.gen_cy {
                if gen_payload_info(3, coto, 0) != -1 {
                    if other.genw_alert = 0 {
                        other.genw_alert = 1
                        other.genw_id = id
                    }
                }
            }
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _menu, _nd, _gx, _gy, _gr;
// v3.5：压制范围指示圆——玩家进入该半径内生成器停摆（计时清零），离开后才重新计时；半径随档位（96/160/224/320）
_gr = gen_tier_info(tier, 1)
draw_set_alpha(0.10)
draw_set_color(make_color_rgb(0, 190, 255))
draw_circle(x + 16, y + 16, _gr, 0)
draw_set_alpha(0.55)
draw_circle(x + 16, y + 16, _gr, 1)
draw_set_alpha(1)
draw_set_color(c_white)
gen_draw_pipe(x, y, dir, tier, 0.55, 1)
if gen_payload_info(payload_cat, payload_code, 0) != -1 {
    gen_payload_draw(x + 16, y + 16, payload_cat, payload_code, payload_param, 0.6)
}
// v3.5：生成物出生点标记（黄十字+方框，画在图标之上）——该 payload 的真实初始坐标 = 生成器坐标 + gen_spawn_offset 补正
// 用于对照"生成出来的物品"与"正常摆放位置"是否一致
if gen_payload_info(payload_cat, payload_code, 0) != -1 {
    _gx = x + gen_spawn_offset(payload_cat, payload_code, 0)
    _gy = y + gen_spawn_offset(payload_cat, payload_code, 1)
    draw_set_alpha(0.9)
    draw_set_color(c_yellow)
    draw_line(_gx - 5, _gy, _gx + 5, _gy)
    draw_line(_gx, _gy - 5, _gx, _gy + 5)
    draw_rectangle(_gx - 8, _gy - 8, _gx + 8, _gy + 8, 1)
    draw_set_alpha(1)
    draw_set_color(c_white)
}
// 收编成功标记：物品右下角小勾（描边效果由半透明管体提供）
if instance_exists(gen_item) {
    _gx = gen_item.x + 30
    _gy = gen_item.y + 30
    draw_set_alpha(1)
    draw_set_color(c_black)
    draw_circle(_gx, _gy, 7, 0)
    draw_set_color(c_white)
    draw_circle(_gx, _gy, 6, 0)
    draw_set_color(make_color_rgb(0, 176, 80))
    draw_circle(_gx, _gy, 5, 0)
    draw_set_color(c_white)
    draw_line(_gx - 3, _gy, _gx - 1, _gy + 3)
    draw_line(_gx - 1, _gy + 3, _gx + 4, _gy - 4)
    draw_line(_gx - 3, _gy + 1, _gx - 1, _gy + 4)
    draw_line(_gx - 1, _gy + 4, _gx + 4, _gy - 3)
    draw_set_color(c_white)
}
// v3.4：空载警告标（红圈感叹号）——该白名单物品在生成器格上但未被收编
// （位移拒绝 / 方向不符；解决办法：重新摆放该物品，或先移出本格再放回，小勾出现即收编成功）
if genw_alert = 1 {
    _gx = genw_id.x + 16
    _gy = genw_id.y + 16
    draw_set_alpha(1)
    draw_set_color(c_black)
    draw_circle(_gx, _gy - 40, 9, 1)
    draw_set_color(make_color_rgb(255, 32, 32))
    draw_circle(_gx, _gy - 40, 8, 1)
    draw_set_color(c_white)
    draw_rectangle(_gx - 1, _gy - 46, _gx + 1, _gy - 41, 0)
    draw_rectangle(_gx - 1, _gy - 39, _gx + 1, _gy - 37, 0)
}
// submenu：改方向 / 档位（上限固定，不提供入口）
if mouse_x > x {
    if mouse_x < x + 32 {
        if mouse_y > y {
            if mouse_y < y + 32 {
                if keyboard_check(global.key_submenu) {
                    if gen_menu_armed = 1 {
                        if global.picking = false {
                            gen_menu_armed = 0
                            _menu = show_menu('Direction: Up|Direction: Right|Direction: Down|Direction: Left|Tier: Slow|Tier: Medium|Tier: Fast|Tier: Very Fast', -1)
                            if _menu = 0 { dir = 1 }
                            if _menu = 1 { dir = 0 }
                            if _menu = 2 { dir = 3 }
                            if _menu = 3 { dir = 2 }
                            if _menu = 4 { tier = 1 }
                            if _menu = 5 { tier = 2 }
                            if _menu = 6 { tier = 3 }
                            if _menu = 7 { tier = 4 }
                            if _menu >= 0 {
                                // 方向约束物品：强制同向（方向不符的生成器无效果）
                                _nd = gen_payload_info(payload_cat, payload_code, 2)
                                if _nd != -1 { dir = _nd }
                                ed_net_ops_send_update(id, 13)
                            }
                        }
                    }
                } else {
                    gen_menu_armed = 1
                }
            }
        }
    }
}
