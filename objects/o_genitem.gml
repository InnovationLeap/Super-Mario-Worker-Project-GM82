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
var _obj, _spr, _sub, _v, _ef;
// v6.5（用户反馈"玩家受伤时不该继续挤"）：与敌人一致——全局暂停（含玩家受伤定格） / 过关时
//   占位物既不推挤也不转正，等世界恢复后再继续。o_piranha / o_goomba / o_generator 都是同款闸门。
if global.pauza != 0 { exit }
if variable_global_exists('userpause') {
    if global.userpause != 0 { exit }
}
if global.level_complete != 0 { exit }
// 探测"生成器本格是否被实心占据"——它决定是否需要挤出（生成器埋在地形里 = 需要；悬空/立在方块上 = 不需要）
genx_block = 0
if instance_exists(owner_gen) {
    if collision_rectangle(owner_gen.x, owner_gen.y, owner_gen.x + 31, owner_gen.y + 31, obj_wall, 0, 0) { genx_block = 1 }
    if collision_rectangle(owner_gen.x, owner_gen.y, owner_gen.x + 31, owner_gen.y + 31, o_pointblock, 0, 0) { genx_block = 1 }
    if collision_rectangle(owner_gen.x, owner_gen.y, owner_gen.x + 31, owner_gen.y + 31, obj_halfground, 0, 0) { genx_block = 1 }
}
// 首次执行：按 payload 设置外观与判定框（与实际对象一致，转正后无缝衔接）
if obj_index = -1 {
    obj_index = gen_payload_info(payload_cat, payload_code, 0)
    if obj_index = -1 { instance_destroy(); exit }
    _spr = gen_payload_sprite(payload_cat, payload_code, payload_param, 0)
    _sub = gen_payload_sprite(payload_cat, payload_code, payload_param, 1)
    // v5.0.4：抬起（挤出）阶段显示帧可由规则表指定（gen_payload_info 字段 5；
    //   乌龟族 002/003/004/033/034/035/038 与 019/027 = 1 = 第二帧）
    _ef = gen_payload_info(payload_cat, payload_code, 5)
    if _ef > 0 { _sub = _ef }
    if _spr != -1 {
        sprite_index = _spr
        image_index = _sub
    }
    image_speed = 0
    mask_index = object_get_mask(obj_index)
    // v3.8：位置换算（所见即所得 + 幂等）——把实例坐标【对齐到"所在格 + 该物品的标准锚点"】：
    //   板栗仔等 = 格中心（+16,+16）；鱼/云/食人花族等按 gen_spawn_offset 表（43/16/奖励为 0）。
    //   v6.5（用户反馈"板栗仔的生成位置是生成器 y+16"）：**这个标准锚点就是最终落点**——
    //   它相对生成器中心（gen.x+16, gen.y+16）只差该物品自己的 anchor 修正，不再叠加任何"挤出起点"。
    x = floor(x / 32) * 32 + gen_spawn_offset(payload_cat, payload_code, 0)
    y = floor(y / 32) * 32 + gen_spawn_offset(payload_cat, payload_code, 1)
    // v6.8（用户要求"板栗仔生成位置 y -= 16"）：**删除板栗仔专用的起点偏移**——v3.9 让向上挤的板栗仔
    //   从格的底部起步（y += 16），相对标准锚点正好低 16px；现在与其它物品一致，起点就是标准锚点
    //   （埋在地形里时同样从锚点开始向上挤）。
}
// v4.4：抬起阶段"面向玩家"（每帧，Step 内）——玩家在左 → 朝左（image_xscale=-1）；在右 → 朝右（=1）
//   放在转正检测之前：转正那一帧能把该朝向传给真实对象（见下方 instance_create 后的继承），
//   避免"抬起朝左、转正瞬间弹回默认朝右"的闪变
image_xscale = 1;
if instance_exists(o_marker) {
    if o_marker.x < x { image_xscale = -1 }
}
// 与实心不重叠 → "生成完毕"：在当前位置创建真实对象并继承 gen_tag
// 实心集合与 basic_movement（敌人通用运动）一致：obj_wall（含子对象）/ o_pointblock / obj_halfground
// 漏检 halfground 会让生成物"嵌在半实心里"直接转正，随后被卡住
// v6.4/v6.5：判定分三种情形——
//   ① 判定框干净 → 立即转正（生成器本格有空位时，物品判定框伸进邻居实心也算干净，与"直接放置"同理）；
//   ② 生成器本格被实心占据（埋在地形里的管子）→ 沿 dir 挤出，直到判定框完全脱离实心；
//   ③ 本格没实心、但判定框仍压着**前方**的实心（管口被上方/前方方块挡住）→ **原地等待**：
//      不硬挤（原实现会穿过方块、在空中才转正），也不带着实心转正（否则锤子龟自身的 AI 会把它从方块里顶出来 = "腾空"）。
genx_hit = 0
if place_meeting(x, y, obj_wall) { genx_hit = 1 }
if place_meeting(x, y, o_pointblock) { genx_hit = 1 }
if place_meeting(x, y, obj_halfground) { genx_hit = 1 }
if genx_hit = 0 {
    _obj = instance_create(x, y, obj_index)
    _obj.gen_tag = gen_tag
    _obj.image_xscale = image_xscale  // v4.4：转正帧继承"面向玩家"的朝向（避免转正瞬间反向）
    gen_apply_param(_obj, payload_cat, payload_code, payload_param)
    instance_destroy()
    exit
}
if genx_block = 1 {
    // 仍在实心内（埋在地形里）：沿方向缓慢钻出
    _v = 1
    if dir = 0 { x += _v }
    if dir = 1 { y -= _v }
    if dir = 2 { x -= _v }
    if dir = 3 { y += _v }
}
// 否则（本格无实心、判定框被前方实心挡住）：保持"生成中"，原地不动（口被堵死 = 不产出，见 §5.4）
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _spr, _sub, _ef;
_spr = gen_payload_sprite(payload_cat, payload_code, payload_param, 0)
_sub = gen_payload_sprite(payload_cat, payload_code, payload_param, 1)
// v5.0.4（用户要求）：抬起（挤出）阶段显示帧 = 规则表 gen_payload_info 字段 5（0=不覆盖，用对象默认第一帧）
//   乌龟族（绿/红/蓝/金 含飞龟）与锤子龟、火球龟 = 1 = 第二帧（这些精灵均为 2 帧步行循环）
_ef = gen_payload_info(payload_cat, payload_code, 5)
if _ef > 0 { _sub = _ef }
// v6.7（用户反馈"整体偏移都出了大问题…挤出时候的贴图应该 +=(16,16)"）：修正影子的绘制基准。
//   旧式子 `draw_sprite_ext(_spr, _sub, x - sprite_get_xoffset(_spr) + _ddx, y - sprite_get_yoffset(_spr) + _ddy, …)`
//   里 draw_sprite_ext 是把**精灵 origin 放在给定点**，再减一次 origin 就等于把"左上角"放到了 (x, y)；
//   而真身（各敌人对象没有 Draw 事件）由 GM 默认绘制——origin 落在 (x, y)。两者正好差一个 origin，
//   所以 v4.1/v4.2 用 gen_spawn_offset 去补（只有 origin≈(16,16) 的物品恰好对：板栗仔 ✅，
//   锤子龟 (17,27)、乌龟 (14,29)、蓝飞龟 (16,34)、奖励类 (0,0) 都会偏半格），v6.6 又把偏移清零 → 全体偏一个 origin。
//   正解：影子直接画在 (x, y)，与真身完全同基准；转正瞬间贴图不再跳。
// v4.3：抬起阶段"面向玩家"（用户拍板）——玩家在左 → 贴图朝左（image_xscale=-1）；在右 → 朝右（=1）
//   避免"抬起过程中朝右、开始运动后朝左"的跳变；仅影响绘制，实体/挤出/转正位置不变
//   （镜像以绘制点为轴：xs=-1 时覆盖范围相对 xs=1 做水平镜像，中心不变）
image_xscale = 1;
if instance_exists(o_marker) {
    if o_marker.x < x { image_xscale = -1 } else { image_xscale = 1 }
}
// 与真身同基准绘制（origin 落在 (x, y)，等价于直接 draw 在 (x, y)）
if _spr != -1 { draw_sprite_ext(_spr, _sub, x, y, image_xscale, 1, 0, c_white, 1) }
