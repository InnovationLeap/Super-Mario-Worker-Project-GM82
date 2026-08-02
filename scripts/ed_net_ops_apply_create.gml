// ed_net_ops_apply_create(buf)
// 应用 op16 创建消息（o_ednet 上下文调用）：按负载创建实例、恢复完整最终状态并登记 netid
// 注意：远端路径不经过本地输入检查/弹窗，参数全部取自消息负载（与 ed_place_* 的字段一一对应）
var _netid, _cato, _x, _y, _coto, _f, _t, _v;
buffer_read_u8(argument0)
_netid = buffer_read_u32(argument0)
_cato = buffer_read_u8(argument0)
_x = buffer_read_u32(argument0)
_y = buffer_read_u32(argument0)
_coto = buffer_read_u16(argument0)
if _x > 2147483647 { _x -= 4294967296 }
if _y > 2147483647 { _y -= 4294967296 }
_f = -4
if _cato = 0 {
    _f = instance_create(_x, _y, o_edbonusesblock)
    _f.coto = _coto
}
if _cato = 1 {
    _f = instance_create(_x, _y, o_edenemyblock)
    _f.coto = _coto
    _f.shell_type = buffer_read_u16(argument0)
    _f.spike_type = buffer_read_u16(argument0)
}
if _cato = 2 {
    _f = instance_create(_x, _y, o_edsceneriesblock)
    _f.coto = _coto
    _f.block_index = buffer_read_u16(argument0)
    if _coto = 42 {
        _f.sprite_index = s_blocks
        _f.image_index = _f.block_index
        _f.image_alpha = 1
    } else {
        if _coto != 38 {
            _f.sprite_index = s_sceneriesbank
            _f.image_index = _coto - 1
        } else {
            _f.depth = 5
            _f.sprite_index = s_edrotocenter
        }
    }
}
if _cato = 3 {
    _f = instance_create(_x, _y, o_edmarkerblock)
    _f.coto = _coto
    _f.type = buffer_read_u16(argument0)
    if _coto = 23 {
        _f.is_orange = buffer_read_u16(argument0)
        _f.scrollspeed = buffer_read_u32(argument0) / 100
        if instance_exists(o_edmain) {
            ds_list_add(global.autoscrolls, _f)
        }
    }
    if _coto = 25 {
        _f.anime = buffer_read_u16(argument0)
    }
    if _coto = 26 {
        _f.textMessage = ed_net_read_str(argument0)
    }
    if _coto = 27 || _coto = 28 || _coto = 29 {
        _f.color = buffer_read_u32(argument0)
    }
    if _coto = 31 {
        _f.ledge_type = buffer_read_u16(argument0)
    }
    if _coto = 32 {
        _f.target = buffer_read_u32(argument0) - 64
        _f.velocity = buffer_read_u16(argument0)
    }
    if _coto = 33 {
        _f.bgm_change = buffer_read_u16(argument0)
        _f.bgm = ed_net_read_str(argument0)
        _f.bgp_change = buffer_read_u16(argument0)
        _f.bgp = buffer_read_u32(argument0) - 1000000
        _f.linked = buffer_read_u16(argument0)
        _f.height = buffer_read_u32(argument0) - 64
        _f.weather_change = buffer_read_u16(argument0)
        _f.rainy = buffer_read_u16(argument0)
        _f.fallingstars = buffer_read_u16(argument0)
        _f.snowy = buffer_read_u16(argument0)
        _f.thunder = buffer_read_u16(argument0)
        _f.windy = buffer_read_u16(argument0)
        _f.darkness = buffer_read_u16(argument0)
        _f.brightness = buffer_read_u16(argument0)
    }
    if _coto = 34 {
        _f.camera_endX = buffer_read_u32(argument0)
        _f.camera_endY = buffer_read_u32(argument0)
        if _f.camera_endX > 2147483647 { _f.camera_endX -= 4294967296 }
        if _f.camera_endY > 2147483647 { _f.camera_endY -= 4294967296 }
    }
}
if _cato = 4 {
    // 水管：完成态（step4 才广播），远端按 netid 更新或新建
    _f = ed_net_inst_lookup(_netid)
    _v = buffer_read_u16(argument0)
    if !instance_exists(_f) {
        _f = instance_create(_x, _y, o_edpassage)
    }
    _f.warpnum = _v
    _f.wejscie = buffer_read_u16(argument0)
    _f.exitx = buffer_read_u32(argument0)
    _f.exity = buffer_read_u32(argument0)
    _f.wyjscie = buffer_read_u16(argument0)
    if _f.exitx > 2147483647 { _f.exitx -= 4294967296 }
    if _f.exity > 2147483647 { _f.exity -= 4294967296 }
    _f.tak = 1
    _f.tak2 = 1
    _f.tak3 = 1
    with(o_edpassage) { shuiguanhele = 0; shuiguanhele2 = 0 }
    if instance_exists(o_edmain) {
        if _v >= global.warpnum {
            global.warpnum = _v + 1
        }
    }
}
if _cato = 5 {
    _f = instance_create(_x, _y, o_edmarkerblock)
    _f.coto = 18
}
if instance_exists(_f) {
    // NET-SYNC: 测关中远端编辑照常应用（数据进入存盘），但不绘制且不跑 Step（防游戏画面误删/误改）；
    // deactivate 实例仍可被 instance_exists/ed_net_inst_lookup 找到，存盘时 Save_Script_Main 自带 activate_all
    if variable_global_exists('testmode') {
        if global.testmode = 1 {
            // GM8 无按 id 的 instance_deactivate，按对象类型停用（测关中该类型实例本就应隐藏，重复停用无害）
            instance_deactivate_object(_f.object_index)
        }
    }
    _f.netid = _netid
    ed_net_inst_register(_f)
    ed_net_trace('R16 netid=' + string(_netid) + ' cato=' + string(_cato) + ' coto=' + string(_coto) + ' inst=' + string(_f))
} else {
    ed_net_trace('R16 MISS cato=' + string(_cato) + ' netid=' + string(_netid))
}
