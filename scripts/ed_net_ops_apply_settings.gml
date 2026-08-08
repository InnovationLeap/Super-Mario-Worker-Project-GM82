// ed_net_ops_apply_settings(buf)
// 应用 op20 全量设置包（o_ednet 上下文调用）：解包写回 global 及 local_background/local_muzyka
// 注意：游戏运行中用到的设置多为 global.*；编辑预览相关 global.preview=-1 时 local_* 跟随
// 负载末尾可附加 desc（发送者修改描述），显示到 NETWORK CONSOLE：'[名字] changed: desc'
var _bg, _mu, _src, _desc, _nm, _i;
_src = buffer_read_u8(argument0)
_bg = buffer_read_u32(argument0)
_mu = buffer_read_u32(argument0)
global.background = _bg
global.bgm_id = string(_mu)
global.level_name_edit = ed_net_read_str(argument0)
global.level_author = ed_net_read_str(argument0)
global.level_time = buffer_read_u32(argument0)
global.level_gravity = buffer_read_u32(argument0)
global.level_bowser_hp = buffer_read_u32(argument0)
global.water_level = buffer_read_u32(argument0) - 1000000
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
if !buffer_at_end(argument0) {
    _desc = ed_net_read_str(argument0)
    if string_length(string(_desc)) > 0 {
        _nm = 'P' + string(_src)
        for (_i = 0; _i < net_pl_count; _i += 1) {
            if net_pl_id[_i] = _src {
                _nm = net_pl_name[_i]
            }
        }
        ed_net_notify('[' + _nm + '] changed: ' + string(_desc))
    }
}
ed_net_trace('R20 settings applied bg=' + string(_bg) + ' muz=' + string(_mu))
