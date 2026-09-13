#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// "生成中"占位物：沿方向从生成器钻出，判定框与实心不重叠后转正为真实对象
// 生成中期间不执行任何逻辑、不参与任何交互（本对象无 hit 组件）
payload_cat = 0
payload_code = 0
payload_param = 0
dir = 0
gen_tag = 0
owner_gen = noone
obj_index = -1
gen_offset_done = 0  // v3.8 起未再使用（保留兼容：新版 gen_spawn 仍会置 1）
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _obj, _spr, _sub, _v;
// 首次执行：按 payload 设置外观与判定框（与实际对象一致，转正后无缝衔接）
if obj_index = -1 {
    obj_index = gen_payload_info(payload_cat, payload_code, 0)
    if obj_index = -1 { instance_destroy(); exit }
    _spr = gen_payload_sprite(payload_cat, payload_code, payload_param, 0)
    _sub = gen_payload_sprite(payload_cat, payload_code, payload_param, 1)
    if _spr != -1 {
        sprite_index = _spr
        image_index = _sub
    }
    image_speed = 0
    mask_index = object_get_mask(obj_index)
    // v3.8：位置换算（所见即所得 + 幂等）——把实例坐标【对齐到"所在格 + 该物品的标准锚点"】：
    //   板栗仔等 = 格中心（+16,+16）；鱼/云/食人花族等按 gen_spawn_offset 表（43/16/奖励为 0）。
    //   无论创建方（gen_spawn，可能旧版未补正）有没有先做过补正，本式的计算结果都相同：
    //     已补正坐标(gx+16)：floor((gx+16)/32)*32 = gx → 结果 gx+16；未补正坐标(gx)：结果同样是 gx+16。
    //   因此不再依赖 gen_spawn / gen_offset_done 标记——只要本对象是最新版即生效。
    //   注：Object Offset Correct = NO（objectoffset=1）时 gen_spawn_offset 返回 0，与"直接放置"同规则。
    x = floor(x / 32) * 32 + gen_spawn_offset(payload_cat, payload_code, 0)
    y = floor(y / 32) * 32 + gen_spawn_offset(payload_cat, payload_code, 1)
    // v3.9：向上挤出（dir=1）的板栗仔方向性修正（用户实测拍板）：
    //   起点 y += 16（从格的底部开始向上挤）；x -= 16（向上挤时 x 不移动，故转正后 x 同样左移 16）
    if dir = 1 {
        if payload_cat = 0 {
            if payload_code = 1 {
                x -= 16
                y += 16
            }
        }
    }
}
// 与实心不重叠 → "生成完毕"：在当前位置创建真实对象并继承 gen_tag
// 实心集合与 basic_movement（敌人通用运动）一致：obj_wall（含子对象）/ o_pointblock / obj_halfground
// 漏检 halfground 会让生成物"嵌在半实心里"直接转正，随后被卡住
if !place_meeting(x, y, obj_wall) {
    if !place_meeting(x, y, o_pointblock) {
        if !place_meeting(x, y, obj_halfground) {
            _obj = instance_create(x, y, obj_index)
            _obj.gen_tag = gen_tag
            gen_apply_param(_obj, payload_cat, payload_code, payload_param)
            instance_destroy()
            exit
        }
    }
}
// 仍在实心内：沿方向缓慢钻出
_v = 1
if dir = 0 { x += _v }
if dir = 1 { y -= _v }
if dir = 2 { x -= _v }
if dir = 3 { y += _v }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _spr, _sub, _ddx, _ddy;
_spr = gen_payload_sprite(payload_cat, payload_code, payload_param, 0)
_sub = gen_payload_sprite(payload_cat, payload_code, payload_param, 1)
// v4.0：挤出阶段（"抬起中"）的贴图偏移（用户拍板）——仅绘制偏移，不影响实体/挤出/转正位置：
//   向上挤出的板栗仔在抬起过程中贴图 +16,+16；转正后由真实对象绘制，位置保持不变
_ddx = 0;
_ddy = 0;
if dir = 1 {
    if payload_cat = 0 {
        if payload_code = 1 {
            _ddx = 16;
            _ddy = 16;
        }
    }
}
// 按精灵 origin 对齐绘制：生成物坐标语义与真实敌人一致（实例坐标=锚点，非左上角）
if _spr != -1 { draw_sprite_ext(_spr, _sub, x - sprite_get_xoffset(_spr) + _ddx, y - sprite_get_yoffset(_spr) + _ddy, 1, 1, 0, c_white, 1) }
