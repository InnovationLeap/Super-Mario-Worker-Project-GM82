#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 编辑器生成器实例：收编**位置严格匹配**的白名单物品为 payload；submenu 改方向 + 作者参数（数量/间隔/距离/屏内）
// v5.0（ObjGenerator.md §12）：档位退役，参数由作者直接填写（数值项走 get_integer 输入）
cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0) // HUD 字体（与关卡 HUD 同源：o_marker 同名变量；角标绘制用）
payload_cat = 0
payload_code = 0
payload_param = 0
dir = 0
gen_max_user = 10      // 数量（1-99）
gen_interval = 100     // 生成间隔（帧 @50fps，1-1000）
gen_range = 160        // 距离阈值（px，0-640）：玩家距离 > R 才生成
gen_screen_only = 1    // 屏内限制（1=必须在屏内 0=无限制）
gen_legacy = 0         // 读档来源为旧格式（v3-v4 tier 行）时置 1 → Draw 显示提示
gen_item = noone
gen_item_x = 0         // 收编锚点（= 收编时物品的实例坐标；v5.0.3 起位置判定为"严格匹配"，见 Step）
gen_item_y = 0
genw_alert = 0
genw_id = noone
wizard = 0
gen_menu_armed = 1
// 扫描用实例变量（避免在 with 内使用 var 造成的作用域歧义）
gen_cand = noone
gen_cand_cat = 0
gen_cand_code = 0
gen_need = -1
gen_ok = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 收编刷新：**位置严格匹配**的白名单物品被"收编"为 payload（物品保留可视，打小勾）
// v5.0.3（用户要求）：收编判定改为"物品坐标 = 生成器坐标 + 该物品的编辑器放置偏移"——
//   即物品必须**正好落在【生成器所在格的该物品标准放置位置】上**，不再是"同格 / 有重叠即可"。
//   · 绝大多数物品的编辑器实例坐标 = 格左上角（ed_place_* 传 floor(mouse/32)*32）→ 偏移 0；
//   · 食人花族（6/7/8/9/44/45/46/47）在 Object Offset Correct = YES 时由 ed_place_* 传
//     floor((mouse_x-16)/32)*32+16 放置 → 偏移 dx=+16（见 gen_editor_offset）。
//   由此任何位移（Precise move 微调 / 16px 大位移 / 选区粘贴的 16px 网格）都会立即解除收编，
//   移回标准位置即自动重新收编——v3.1/v3.4 的"收编锚点 + 位移拒绝（gen_reject）"机制随之退役。
// 交互失败（非白名单 / 方向不兼容 / 位置不匹配）→ 无任何效果
if wizard = 1 { genw_alert = 0; exit } // 向导期间不扫描、不显示警告（收编尚未开始，避免误导）
// 已有收编：物品必须仍在收编锚点、且仍满足"坐标严格匹配"（且白名单/方向仍兼容）
if instance_exists(gen_item) {
    gen_ok = 0
    if gen_item.x = gen_item_x {
        if gen_item.y = gen_item_y {
            if gen_item.x = x + gen_editor_offset(payload_cat, payload_code, 0) {
                if gen_item.y = y + gen_editor_offset(payload_cat, payload_code, 1) {
                    gen_need = gen_payload_info(payload_cat, payload_code, 2)
                    if gen_need = -1 { gen_ok = 1 }
                    if gen_need = dir { gen_ok = 1 }
                }
            }
        }
    }
    if gen_ok = 1 {
        payload_param = gen_param_snapshot(payload_cat, payload_code, gen_item)
        exit
    }
    // 位置或方向失效 → 解除收编（无需"拒绝"状态：严格匹配本身保证不会立即重收编）
    gen_item = noone
    gen_item_x = 0
    gen_item_y = 0
}
// 找候选（v5.0.3）：**坐标严格匹配**（物品坐标 = 生成器坐标 + 该物品的编辑器放置偏移）+ 白名单 + 方向兼容
// 同一位置同时存在敌人与奖励时保留先扫到的敌人（gen_cand 已占用则不再覆盖）
// 性能：先用 |dx| / |dy| ≤ 16 的廉价闸门（放置偏移最大 16px，必然满足）过滤掉绝大多数物品，
//       只对"贴着生成器"的物品才调用 gen_editor_offset
gen_cand = noone
gen_cand_cat = 0
gen_cand_code = 0
with (o_edenemyblock) {
    if abs(x - other.x) <= 16 {
        if abs(y - other.y) <= 16 {
            if x = other.x + gen_editor_offset(0, coto, 0) {
                if y = other.y + gen_editor_offset(0, coto, 1) {
                    if gen_payload_info(0, coto, 0) != -1 {
                        if gen_payload_info(0, coto, 2) = -1 || gen_payload_info(0, coto, 2) = other.dir {
                            if other.gen_cand = noone {
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
}
with (o_edbonusesblock) {
    if abs(x - other.x) <= 16 {
        if abs(y - other.y) <= 16 {
            if x = other.x + gen_editor_offset(3, coto, 0) {
                if y = other.y + gen_editor_offset(3, coto, 1) {
                    if gen_payload_info(3, coto, 0) != -1 {
                        if gen_payload_info(3, coto, 2) = -1 || gen_payload_info(3, coto, 2) = other.dir {
                            if other.gen_cand = noone {
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
}
if gen_cand != noone {
    payload_cat = gen_cand_cat
    payload_code = gen_cand_code
    payload_param = gen_param_snapshot(payload_cat, payload_code, gen_cand)
    gen_item = gen_cand
    gen_item_x = gen_cand.x
    gen_item_y = gen_cand.y
} else {
    // 物品被移走/删除/方向变为不兼容/位置不匹配 → 释放（生成器回到空载）
    payload_cat = 0
    payload_code = 0
    payload_param = 0
    gen_item = noone
}
// v3.4（v5.0.3 起判定同为严格匹配）：空载警告扫描——生成器空载但**位置上正好站着**白名单物品
// （未收编：通常为方向不符；位置不匹配的物品不再误报）时，由 Draw 在该物品处画红色警示标，
// 避免"以为收编了、实际没有"导致游玩时什么都不生成
genw_alert = 0
genw_id = noone
if gen_item = noone {
    with (o_edenemyblock) {
        if abs(x - other.x) <= 16 {
            if abs(y - other.y) <= 16 {
                if x = other.x + gen_editor_offset(0, coto, 0) {
                    if y = other.y + gen_editor_offset(0, coto, 1) {
                        if gen_payload_info(0, coto, 0) != -1 {
                            if other.genw_alert = 0 {
                                other.genw_alert = 1
                                other.genw_id = id
                            }
                        }
                    }
                }
            }
        }
    }
    with (o_edbonusesblock) {
        if abs(x - other.x) <= 16 {
            if abs(y - other.y) <= 16 {
                if x = other.x + gen_editor_offset(3, coto, 0) {
                    if y = other.y + gen_editor_offset(3, coto, 1) {
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
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _menu, _nd, _gx, _gy, _gr, _mx, _mf, _s;
// v3.5/v5.0：压制范围指示圆——玩家进入该半径内生成器停摆（计时清零），离开后才重新计时；半径 = 作者参数 gen_range
_gr = gen_range
draw_set_alpha(0.10)
draw_set_color(make_color_rgb(0, 190, 255))
draw_circle(x + 16, y + 16, _gr, 0)
draw_set_alpha(0.55)
draw_circle(x + 16, y + 16, _gr, 1)
draw_set_alpha(1)
draw_set_color(c_white)
gen_draw_pipe(x, y, dir, 0, 0.55, 0)
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
// v5.0.1（§12.1#8；用户反馈）：参数角标——**只显示参数值、不显示参数名**（去掉 N/I/D/S 前缀）
//   顺序（与 submenu 一致）：① 数量 ② 间隔:距离 ③ 屏内开关；字体 = 关卡 HUD 同源（cyferkimario / txt_mariofonts）
//   ① 数量后带 * = 该 payload 有强制上限（食人花族 / 320 / 321 / 322 = 1），此时显示的是强制值
//   分隔符用 ':'（HUD 精灵字体字形表从 '!' 起，空格不在表内，故不依赖空格表现）
//   行距 16px（HUD 字体帧高约 16px：bbox_top=2 / bbox_bottom=18）
//   v5.0.2（用户反馈）：**不要描边/阴影**——直接 draw_text（原 ed_text_shadow 已移除）
_mx = gen_max_user
_mf = gen_payload_info(payload_cat, payload_code, 1)
if _mf >= 0 { _mx = _mf }
draw_set_font(cyferkimario)
draw_set_halign(fa_center)
draw_set_alpha(1)
draw_set_color(c_white)
_s = string(_mx)
if _mf >= 0 { _s += '*' }
draw_text(x + 16, y + 34, _s)
draw_text(x + 16, y + 50, string(gen_interval) + ':' + string(gen_range))
if gen_screen_only = 1 { _s = 'ON' } else { _s = 'OFF' }
draw_text(x + 16, y + 66, _s)
if gen_legacy = 1 {
    draw_set_color(make_color_rgb(255, 210, 64))
    draw_text(x + 16, y + 82, 'OLD')
    draw_set_color(c_white)
}
draw_set_halign(fa_left)
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
// submenu：方向 + 作者参数（数量 / 间隔 / 距离阈值 / 屏内限制；数值项弹 get_integer 输入，§12.1#7）
if mouse_x > x {
    if mouse_x < x + 32 {
        if mouse_y > y {
            if mouse_y < y + 32 {
                if keyboard_check(global.key_submenu) {
                    if gen_menu_armed = 1 {
                        if global.picking = false {
                            gen_menu_armed = 0
                            _menu = show_menu('Direction: Up|Direction: Right|Direction: Down|Direction: Left|Items: ' + string(gen_max_user) + '...|Interval: ' + string(gen_interval) + '...|Distance: ' + string(gen_range) + '...|Screen Only', -1)
                            if _menu = 0 { dir = 1 }
                            if _menu = 1 { dir = 0 }
                            if _menu = 2 { dir = 3 }
                            if _menu = 3 { dir = 2 }
                            if _menu = 4 { gen_max_user = gen_param_clamp(0, get_integer('Number of items at the same time (1-99)', gen_max_user)) }
                            if _menu = 5 { gen_interval = gen_param_clamp(1, get_integer('Spawn interval, in frames at 50 FPS (1-1000)', gen_interval)) }
                            if _menu = 6 { gen_range = gen_param_clamp(2, get_integer('Spawn only when the player is farther than this distance, in pixels (0-640)', gen_range)) }
                            if _menu = 7 { if gen_screen_only = 1 { gen_screen_only = 0 } else { gen_screen_only = 1 } }
                            if _menu >= 0 {
                                // 方向约束物品：强制同向（方向不符的生成器无效果）
                                _nd = gen_payload_info(payload_cat, payload_code, 2)
                                if _nd != -1 { dir = _nd }
                                gen_legacy = 0  // 参数已被作者确认过 → 不再是"旧格式待确认"状态
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
