// ed_place_marker(coto, x, y, type)
// 放置标记（o_edmain 上下文调用），返回实例 id；type 仅平台桥(coto=25)使用=costawia4-19
// 分步参数（强滚速度弹窗、信息砖文字弹窗、流体目标/速度弹窗）在本脚本内完成
var _f, _msg, _ss;
_f = instance_create(argument1, argument2, o_edmarkerblock)
_f.coto = argument0
if argument0 = 23 {
    //强滚中心：is_orange + autoscrolls 链表 + scrollspeed（首枚弹窗设置，其余沿用前一枚）
    _f.is_orange = global.scrollorange
    ds_list_add(global.autoscrolls, _f)
    if ds_list_size(global.autoscrolls) = 1 {
        _ss = get_integer('Set the scroll speed (unit: 0.01 pixel). Max=6000',100)
        _ss = max(0,_ss)
        _ss = min(_ss,6000)
        _f.scrollspeed = _ss/100
    } else {
        _f.scrollspeed = ds_list_find_value(global.autoscrolls,ds_list_size(global.autoscrolls)-2).scrollspeed
    }
}
if argument0 = 25 {
    //新桥（运输桥系列 19-24 变体）
    _f.type = argument3
    _f.anime = global.platformanime
}
if argument0 = 26 {
    //信息砖：输入要隐藏的信息
    _msg = get_string('Please type the message you want to hide in this block. (In Chinese or English)#Use \# to start a new line, and use \\# for a real "\#" in your text.',defMessage)
    defMessage = _msg
    _f.textMessage = _msg
}
if argument0 = 27 || argument0 = 28 || argument0 = 29 {
    //开关砖/阴阳：颜色样式
    _f.color = global.yinyangcolor
}
if argument0 = 31 {
    //半实心
    _f.ledge_type = global.ledge_type
}
if argument0 = 32 {
    //流体控制元件：类型 + 目标高度 + 速度（type=2 时调用处启动 wiatrak=9 区域向导）
    _f.type = global.water_change_type
    _f.target = min(999999,max(-64,get_integer('Please type the target height.(unit: px, >=-64px)',0)))
    _f.velocity = min(max(0,get_integer('Please type the speed of the fluid(0,1,...,9).',1)),9)
}
if argument0 = 33 {
    //BGM/BGP 场景控制：向导由调用处启动 setting_mode
}
if argument0 = 34 {
    //镜头控制：区域向导由调用处启动 wiatrak=8
}
// NET-SYNC: 完成点——联机同步钩子（coto/type/anime/textMessage/color/ledge_type/target/velocity/is_orange/scrollspeed/x/y）
return _f
