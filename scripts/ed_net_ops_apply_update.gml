// ed_net_ops_apply_update(buf)
// 应用 op19 参数更新（o_ednet 上下文调用）：按 netid 更新工具型实例的最终参数
var _netid, _subop, _f;
_netid = buffer_read_u32(argument0)
_subop = buffer_read_u8(argument0)
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
    ed_net_trace('R19 netid=' + string(_netid) + ' subop=' + string(_subop) + ' applied inst=' + string(_f))
} else {
    ed_net_trace('R19 MISS netid=' + string(_netid) + ' subop=' + string(_subop))
}
