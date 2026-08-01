// ed_net_ops_send_create(inst, category)
// 在创建完成点广播 op16 创建消息（o_edmain 上下文调用）
// category: 0=奖励 1=敌人 2=景物 3=标记 4=水管(完成态) 5=实心联动标记(coto=18)
// 负载字段全部从实例变量读取（各对象 Create 均含默认值，未读风险已逐一核对）
var _id, _cato, _t;
if instance_exists(argument0) && instance_exists(o_ednet) && o_ednet.net_state = 3 {
    _id = ed_net_inst_register(argument0)
    _cato = argument1
    buffer_clear(o_ednet.net_sendbuf)
    buffer_set_pos(o_ednet.net_sendbuf, 0)
    buffer_write_u8(o_ednet.net_sendbuf, 16)
    buffer_write_u32(o_ednet.net_sendbuf, _id)
    buffer_write_u8(o_ednet.net_sendbuf, _cato)
    buffer_write_u32(o_ednet.net_sendbuf, argument0.x)
    buffer_write_u32(o_ednet.net_sendbuf, argument0.y)
    buffer_write_u16(o_ednet.net_sendbuf, argument0.coto)
    if _cato = 1 {
        buffer_write_u16(o_ednet.net_sendbuf, argument0.shell_type)
        buffer_write_u16(o_ednet.net_sendbuf, argument0.spike_type)
    }
    if _cato = 2 {
        buffer_write_u16(o_ednet.net_sendbuf, argument0.block_index)
    }
    if _cato = 3 {
        _t = 0
        with(argument0) {
            if variable_local_exists('type') {
                _t = type
            }
        }
        buffer_write_u16(o_ednet.net_sendbuf, _t)
        if argument0.coto = 23 {
            buffer_write_u16(o_ednet.net_sendbuf, argument0.is_orange)
            buffer_write_u32(o_ednet.net_sendbuf, argument0.scrollspeed * 100)
        }
        if argument0.coto = 25 {
            buffer_write_u16(o_ednet.net_sendbuf, argument0.anime)
        }
        if argument0.coto = 26 {
            ed_net_write_str(o_ednet.net_sendbuf, argument0.textMessage)
        }
        if argument0.coto = 27 || argument0.coto = 28 || argument0.coto = 29 {
            buffer_write_u32(o_ednet.net_sendbuf, argument0.color)
        }
        if argument0.coto = 31 {
            buffer_write_u16(o_ednet.net_sendbuf, argument0.ledge_type)
        }
        if argument0.coto = 32 {
            buffer_write_u32(o_ednet.net_sendbuf, argument0.target + 64)
            buffer_write_u16(o_ednet.net_sendbuf, argument0.velocity)
        }
        if argument0.coto = 33 {
            buffer_write_u16(o_ednet.net_sendbuf, argument0.bgm_change)
            ed_net_write_str(o_ednet.net_sendbuf, argument0.bgm)
            buffer_write_u16(o_ednet.net_sendbuf, argument0.bgp_change)
            buffer_write_u32(o_ednet.net_sendbuf, argument0.bgp + 1000000)
            buffer_write_u16(o_ednet.net_sendbuf, argument0.linked)
            buffer_write_u32(o_ednet.net_sendbuf, argument0.height + 64)
            buffer_write_u16(o_ednet.net_sendbuf, argument0.weather_change)
            buffer_write_u16(o_ednet.net_sendbuf, argument0.rainy)
            buffer_write_u16(o_ednet.net_sendbuf, argument0.fallingstars)
            buffer_write_u16(o_ednet.net_sendbuf, argument0.snowy)
            buffer_write_u16(o_ednet.net_sendbuf, argument0.thunder)
            buffer_write_u16(o_ednet.net_sendbuf, argument0.windy)
            buffer_write_u16(o_ednet.net_sendbuf, argument0.darkness)
            buffer_write_u16(o_ednet.net_sendbuf, argument0.brightness)
        }
        if argument0.coto = 34 {
            buffer_write_u32(o_ednet.net_sendbuf, argument0.camera_endX)
            buffer_write_u32(o_ednet.net_sendbuf, argument0.camera_endY)
        }
    }
    if _cato = 4 {
        buffer_write_u16(o_ednet.net_sendbuf, argument0.warpnum)
        buffer_write_u16(o_ednet.net_sendbuf, argument0.wejscie)
        buffer_write_u32(o_ednet.net_sendbuf, argument0.exitx)
        buffer_write_u32(o_ednet.net_sendbuf, argument0.exity)
        buffer_write_u16(o_ednet.net_sendbuf, argument0.wyjscie)
    }
    socket_write_message(o_ednet.net_sock, o_ednet.net_sendbuf)
    socket_send(o_ednet.net_sock)
    ed_net_trace('S16 cato=' + string(_cato) + ' netid=' + string(_id) + ' coto=' + string(argument0.coto) + ' x=' + string(argument0.x) + ' y=' + string(argument0.y))
}
