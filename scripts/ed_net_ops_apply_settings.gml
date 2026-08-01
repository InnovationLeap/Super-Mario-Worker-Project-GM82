// ed_net_ops_apply_settings(buf)
// 应用 op20 全量设置包（o_ednet 上下文调用）：解包写回 global 及 local_background/local_muzyka
// 注意：游戏运行中用到的设置多为 global.*；编辑预览相关 global.preview=-1 时 local_* 跟随
var _bg, _mu;
buffer_read_u8(argument0)
_bg = buffer_read_u32(argument0)
_mu = buffer_read_u32(argument0)
global.background = _bg
global.muzyka = string(_mu)
global.etapnazwa = ed_net_read_str(argument0)
global.etapautor = ed_net_read_str(argument0)
global.etapczas = buffer_read_u32(argument0)
global.etapgravity = buffer_read_u32(argument0)
global.etapkuppa = buffer_read_u32(argument0)
global.poziomwody = buffer_read_u32(argument0) - 1000000
global.lava = buffer_read_u16(argument0)
global.auto = buffer_read_u16(argument0)
global.firstbound = buffer_read_u32(argument0) - 1000000
global.secondbound = buffer_read_u32(argument0) - 1000000
global.water_velocity = buffer_read_u16(argument0)
global.water_delay = buffer_read_u32(argument0)
global.modifiedmov = buffer_read_u16(argument0)
global.layerord = buffer_read_u16(argument0)
global.rotodisclay = buffer_read_u16(argument0)
global.advswitch = buffer_read_u16(argument0)
global.fast_retry = buffer_read_u16(argument0)
global.MFbeet = buffer_read_u16(argument0)
global.celeste = buffer_read_u16(argument0)
global.pipeout = buffer_read_u16(argument0)
global.fastpass = buffer_read_u16(argument0)
global.huddisplay = buffer_read_u16(argument0)
global.stunblock = buffer_read_u16(argument0)
global.topdeath = buffer_read_u16(argument0)
global.lightobject = ed_net_read_str(argument0)
global.rainy = buffer_read_u16(argument0)
global.fallingstars = buffer_read_u16(argument0)
global.snowy = buffer_read_u16(argument0)
global.thunder = buffer_read_u16(argument0)
global.windy = buffer_read_u16(argument0)
global.darkness = buffer_read_u16(argument0)
global.brightness = buffer_read_u16(argument0)
if global.preview = -1 {
    global.local_background = _bg
    global.local_muzyka = _mu
}
ed_net_trace('R20 settings applied bg=' + string(_bg) + ' muz=' + string(_mu))
