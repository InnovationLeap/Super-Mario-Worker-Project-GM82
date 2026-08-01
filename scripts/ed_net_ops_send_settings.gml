// ed_net_ops_send_settings()
// 广播 op20 全量设置包（o_edmain 上下文调用，各设置修改点挂接）
// 字段顺序与 ed_net_ops_apply_settings 严格一致；带偏移字段 send 时 +1000000、apply 时 -1000000
if instance_exists(o_ednet) && o_ednet.net_state = 3 {
    buffer_clear(o_ednet.net_sendbuf)
    buffer_set_pos(o_ednet.net_sendbuf, 0)
    buffer_write_u8(o_ednet.net_sendbuf, 20)
    buffer_write_u8(o_ednet.net_sendbuf, o_ednet.net_myid)
    buffer_write_u32(o_ednet.net_sendbuf, global.background)
    buffer_write_u32(o_ednet.net_sendbuf, global.muzyka)
    ed_net_write_str(o_ednet.net_sendbuf, global.etapnazwa)
    ed_net_write_str(o_ednet.net_sendbuf, global.etapautor)
    buffer_write_u32(o_ednet.net_sendbuf, global.etapczas)
    buffer_write_u32(o_ednet.net_sendbuf, global.etapgravity)
    buffer_write_u32(o_ednet.net_sendbuf, global.etapkuppa)
    buffer_write_u32(o_ednet.net_sendbuf, global.poziomwody + 1000000)
    buffer_write_u16(o_ednet.net_sendbuf, global.lava)
    buffer_write_u16(o_ednet.net_sendbuf, global.auto)
    buffer_write_u32(o_ednet.net_sendbuf, global.firstbound + 1000000)
    buffer_write_u32(o_ednet.net_sendbuf, global.secondbound + 1000000)
    buffer_write_u16(o_ednet.net_sendbuf, global.water_velocity)
    buffer_write_u32(o_ednet.net_sendbuf, global.water_delay)
    buffer_write_u16(o_ednet.net_sendbuf, global.modifiedmov)
    buffer_write_u16(o_ednet.net_sendbuf, global.layerord)
    buffer_write_u16(o_ednet.net_sendbuf, global.rotodisclay)
    buffer_write_u16(o_ednet.net_sendbuf, global.advswitch)
    buffer_write_u16(o_ednet.net_sendbuf, global.fast_retry)
    buffer_write_u16(o_ednet.net_sendbuf, global.MFbeet)
    buffer_write_u16(o_ednet.net_sendbuf, global.celeste)
    buffer_write_u16(o_ednet.net_sendbuf, global.pipeout)
    buffer_write_u16(o_ednet.net_sendbuf, global.fastpass)
    buffer_write_u16(o_ednet.net_sendbuf, global.huddisplay)
    buffer_write_u16(o_ednet.net_sendbuf, global.stunblock)
    buffer_write_u16(o_ednet.net_sendbuf, global.topdeath)
    ed_net_write_str(o_ednet.net_sendbuf, global.lightobject)
    buffer_write_u16(o_ednet.net_sendbuf, global.rainy)
    buffer_write_u16(o_ednet.net_sendbuf, global.fallingstars)
    buffer_write_u16(o_ednet.net_sendbuf, global.snowy)
    buffer_write_u16(o_ednet.net_sendbuf, global.thunder)
    buffer_write_u16(o_ednet.net_sendbuf, global.windy)
    buffer_write_u16(o_ednet.net_sendbuf, global.darkness)
    buffer_write_u16(o_ednet.net_sendbuf, global.brightness)
    with(o_ednet) {
        if net_role = 1 {
            ed_net_broadcast(net_sendbuf)
        } else {
            if net_sock_count > 0 {
                ed_net_send_to(net_socks[0], net_sendbuf)
            }
        }
    }
    ed_net_trace('S20 settings broadcast')
}
