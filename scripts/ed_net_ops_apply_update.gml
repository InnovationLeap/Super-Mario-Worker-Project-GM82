// ed_net_ops_apply_update(buf)
// 应用 op19 参数更新（o_ednet 上下文调用）：按 netid 更新工具型实例的最终参数
// subop 9（水管 warpnum 重算广播）为全局操作，netid 字段为 0，不查实例直接处理
var _netid, _subop, _f, _i, _j, _w, _g, _v;
_netid = buffer_read_u32(argument0)
_subop = buffer_read_u8(argument0)
if _subop = 9 {
    _i = buffer_read_u32(argument0)
    _v = 0
    while _i > 0 {
        _w = buffer_read_u32(argument0)
        _g = ed_net_inst_lookup(_w)
        if instance_exists(_g) {
            _g.warpnum = buffer_read_u16(argument0)
            if _g.warpnum >= _v {
                _v = _g.warpnum + 1
            }
        } else {
            buffer_read_u16(argument0)
        }
        _i -= 1
    }
    if instance_exists(o_edmain) {
        if _v > global.warpnum {
            global.warpnum = _v
        }
    }
    ed_net_trace('R19 subop=9 passage warpnum applied count=' + string(argument0))
    exit
}
_f = ed_net_inst_lookup(_netid)
if instance_exists(_f) {
    if _subop = 1 {
        _f.rotor[1] = buffer_read_u32(argument0)
        _f.rotoa[1] = buffer_read_u32(argument0)
        _f.rotomr[1] = buffer_read_u32(argument0)
        _f.rotors[1] = buffer_read_u32(argument0)
        _f.additional3 = buffer_read_u32(argument0) / 100
        _f.is_petal = buffer_read_u16(argument0)
        _f.test2 = 2
    }
    if _subop = 2 {
        _f.rotor[1] = buffer_read_u32(argument0)
        _f.rotoa[1] = buffer_read_u32(argument0)
        _f.additional3 = buffer_read_u32(argument0) / 100
        _f.test2 = 2
    }
    if _subop = 3 {
        _f.fishendX = buffer_read_u32(argument0)
        _f.fishendY = buffer_read_u32(argument0)
        if _f.fishendX > 2147483647 { _f.fishendX -= 4294967296 }
        if _f.fishendY > 2147483647 { _f.fishendY -= 4294967296 }
        _f.test2 = 2
    }
    if _subop = 4 {
        _f.camera_endX = buffer_read_u32(argument0)
        _f.camera_endY = buffer_read_u32(argument0)
        if _f.camera_endX > 2147483647 { _f.camera_endX -= 4294967296 }
        if _f.camera_endY > 2147483647 { _f.camera_endY -= 4294967296 }
    }
    if _subop = 5 {
        _f.water_endX = buffer_read_u32(argument0)
        _f.water_endY = buffer_read_u32(argument0)
        if _f.water_endX > 2147483647 { _f.water_endX -= 4294967296 }
        if _f.water_endY > 2147483647 { _f.water_endY -= 4294967296 }
    }
    if _subop = 6 {
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
    if _subop = 7 {
        _f.jumph = buffer_read_u32(argument0) / 100
        _f.test2 = 2
    }
    if _subop = 8 {
        _i = buffer_read_u16(argument0)
        if _i > 0 {
            _f.rotoord = _i
            for (_j = 1; _j <= _i; _j += 1) {
                _f.rotor[_j] = buffer_read_u32(argument0)
                _f.rotoa[_j] = buffer_read_u32(argument0)
                _f.rotoc[_j] = buffer_read_u32(argument0)
                _f.rotod[_j] = buffer_read_u16(argument0)
            }
        }
        _f.test2 = 2
    }
    ed_net_trace('R19 netid=' + string(_netid) + ' subop=' + string(_subop) + ' applied inst=' + string(_f))
} else {
    ed_net_trace('R19 MISS netid=' + string(_netid) + ' subop=' + string(_subop))
}
