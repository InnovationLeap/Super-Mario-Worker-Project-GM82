// ed_net_ops_send_update(inst, subop)
// 在工具落定完成点广播 op19 参数更新（实例须存活）
// subop: 1=探照灯(rotor/rotoa/rotomr/rotors/additional3/is_petal) 2=金飞龟(rotor/rotoa/additional3)
//        3=鱼(fishendX/fishendY) 4=镜头(camera_endX/Y) 5=水位(water_endX/Y)
//        6=场景控制元件(bgm_change/bgm/bgp_change/bgp/linked/height/weather 七项)
var _netid;
_netid = 0
if instance_exists(argument0) {
    with(argument0) {
        if variable_local_exists('netid') {
            _netid = netid
        }
    }
}
if _netid <> 0 && instance_exists(o_ednet) && o_ednet.net_state = 3 {
    buffer_clear(o_ednet.net_sendbuf)
    buffer_set_pos(o_ednet.net_sendbuf, 0)
    buffer_write_u8(o_ednet.net_sendbuf, 19)
    buffer_write_u32(o_ednet.net_sendbuf, _netid)
    buffer_write_u8(o_ednet.net_sendbuf, argument1)
    if argument1 = 1 {
        buffer_write_u32(o_ednet.net_sendbuf, argument0.rotor[1])
        buffer_write_u32(o_ednet.net_sendbuf, argument0.rotoa[1])
        buffer_write_u32(o_ednet.net_sendbuf, argument0.rotomr[1])
        buffer_write_u32(o_ednet.net_sendbuf, argument0.rotors[1])
        buffer_write_u32(o_ednet.net_sendbuf, argument0.additional3 * 100)
        buffer_write_u16(o_ednet.net_sendbuf, argument0.is_petal)
    }
    if argument1 = 2 {
        buffer_write_u32(o_ednet.net_sendbuf, argument0.rotor[1])
        buffer_write_u32(o_ednet.net_sendbuf, argument0.rotoa[1])
        buffer_write_u32(o_ednet.net_sendbuf, argument0.additional3 * 100)
    }
    if argument1 = 3 {
        buffer_write_u32(o_ednet.net_sendbuf, argument0.fishendX)
        buffer_write_u32(o_ednet.net_sendbuf, argument0.fishendY)
    }
    if argument1 = 4 {
        buffer_write_u32(o_ednet.net_sendbuf, argument0.camera_endX)
        buffer_write_u32(o_ednet.net_sendbuf, argument0.camera_endY)
    }
    if argument1 = 5 {
        buffer_write_u32(o_ednet.net_sendbuf, argument0.water_endX)
        buffer_write_u32(o_ednet.net_sendbuf, argument0.water_endY)
    }
    if argument1 = 6 {
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
    socket_write_message(o_ednet.net_sock, o_ednet.net_sendbuf)
    socket_send(o_ednet.net_sock)
    ed_net_trace('S19 netid=' + string(_netid) + ' subop=' + string(argument1))
}
