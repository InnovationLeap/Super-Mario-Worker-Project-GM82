// gen_spawn() —— 由 o_generator Step 调用（self = 生成器）
// 1) 分配名额（首个空槽 + 全局自增 gen_tag）
// 2) 食人花族（mode=1）：直接以"缩回在管内的底部相位"生成，由花自身状态机钻出
//    其他：创建"生成中"占位物 o_genitem，沿方向钻出、与实心不重叠后转正
var _k, _slot, _tag, _obj, _mode, _gi, _dx, _dy;
_obj = gen_payload_info(payload_cat, payload_code, 0);
if _obj = -1 { return 0 }
_mode = gen_payload_info(payload_cat, payload_code, 3);
// 位置补正：生成器坐标=格左上角，生成物按存档同款补正对齐"正常放置"的实例坐标（见 gen_spawn_offset）
_dx = gen_spawn_offset(payload_cat, payload_code, 0);
_dy = gen_spawn_offset(payload_cat, payload_code, 1);
// 名额分配：槽位数 = gen_max_eff（v5.0：强制上限优先，否则 = 作者参数"数量"）
_slot = 0;
_k = 0;
while (_k < gen_max_eff) {
    _k += 1;
    if _slot = 0 {
        if gen_slots[_k] = 0 { _slot = _k }
    }
}
if _slot = 0 { return 0 }
if !variable_global_exists('gen_serial') { global.gen_serial = 0 }
global.gen_serial += 1;
_tag = global.gen_serial;
gen_slots[_slot] = _tag;
gen_slot_id[_slot] = noone;
if _mode = 1 {
    // 食人花族：直接生成（底部相位=缩回在管内，等待玩家远离后自行钻出）
    _gi = instance_create(x + _dx, y + _dy, _obj);
    _gi.gen_tag = _tag;
    _gi.state = 150;
    gen_slot_id[_slot] = _gi;
    return _gi;
}
// 通用：占位物钻出 → 无实心重叠后转正
// v3.8：o_genitem 首帧会自行做"格 + 标准锚点"的幂等对齐（即使此处未补正也能修正），
//       这里的补正与标记保留（对"o_genitem 仍是旧版"的环境仍起作用；两者共存不会双重偏移）
_gi = instance_create(x + _dx, y + _dy, o_genitem);
_gi.gen_offset_done = 1;  // v3.8 起未再使用（保留兼容）
_gi.gen_tag = _tag;
_gi.payload_cat = payload_cat;
_gi.payload_code = payload_code;
_gi.payload_param = payload_param;
_gi.dir = dir;
_gi.owner_gen = id;
gen_slot_id[_slot] = _gi;
return _gi;
