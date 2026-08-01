// ed_net_ops_write_inst(buf, inst, cato)
// 将实例的 op16 负载写入 buf（供 op16 单条与 op23 全量归档时实例序列化复用）
// 负载：netid u32 + cato u8 + x u32 + y u32 + coto u16 + cato 专属字段
// 与 ed_net_ops_apply_create 读取顺序严格一致；未连接时也返回 netid（0）
var _id, _t;
_id = ed_net_inst_register(argument1)
buffer_write_u32(argument0, _id)
buffer_write_u8(argument0, argument2)
buffer_write_u32(argument0, argument1.x)
buffer_write_u32(argument0, argument1.y)
buffer_write_u16(argument0, argument1.coto)
if argument2 = 1 {
    buffer_write_u16(argument0, argument1.shell_type)
    buffer_write_u16(argument0, argument1.spike_type)
}
if argument2 = 2 {
    buffer_write_u16(argument0, argument1.block_index)
}
if argument2 = 3 {
    _t = 0
    with(argument1) {
        if variable_local_exists('type') {
            _t = type
        }
    }
    buffer_write_u16(argument0, _t)
    if argument1.coto = 23 {
        buffer_write_u16(argument0, argument1.is_orange)
        buffer_write_u32(argument0, argument1.scrollspeed * 100)
    }
    if argument1.coto = 25 {
        buffer_write_u16(argument0, argument1.anime)
    }
    if argument1.coto = 26 {
        ed_net_write_str(argument0, argument1.textMessage)
    }
    if argument1.coto = 27 || argument1.coto = 28 || argument1.coto = 29 {
        buffer_write_u32(argument0, argument1.color)
    }
    if argument1.coto = 31 {
        buffer_write_u16(argument0, argument1.ledge_type)
    }
    if argument1.coto = 32 {
        buffer_write_u32(argument0, argument1.target + 64)
        buffer_write_u16(argument0, argument1.velocity)
    }
    if argument1.coto = 33 {
        buffer_write_u16(argument0, argument1.bgm_change)
        ed_net_write_str(argument0, argument1.bgm)
        buffer_write_u16(argument0, argument1.bgp_change)
        buffer_write_u32(argument0, argument1.bgp + 1000000)
        buffer_write_u16(argument0, argument1.linked)
        buffer_write_u32(argument0, argument1.height + 64)
        buffer_write_u16(argument0, argument1.weather_change)
        buffer_write_u16(argument0, argument1.rainy)
        buffer_write_u16(argument0, argument1.fallingstars)
        buffer_write_u16(argument0, argument1.snowy)
        buffer_write_u16(argument0, argument1.thunder)
        buffer_write_u16(argument0, argument1.windy)
        buffer_write_u16(argument0, argument1.darkness)
        buffer_write_u16(argument0, argument1.brightness)
    }
    if argument1.coto = 34 {
        buffer_write_u32(argument0, argument1.camera_endX)
        buffer_write_u32(argument0, argument1.camera_endY)
    }
}
if argument2 = 4 {
    buffer_write_u16(argument0, argument1.warpnum)
    buffer_write_u16(argument0, argument1.wejscie)
    buffer_write_u32(argument0, argument1.exitx)
    buffer_write_u32(argument0, argument1.exity)
    buffer_write_u16(argument0, argument1.wyjscie)
}
