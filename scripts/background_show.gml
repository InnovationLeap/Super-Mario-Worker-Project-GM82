// background_show —— 数据驱动版（原963行switch重构）
// 每帧按数据表应用背景层。表由 background_table_init 首次调用时懒加载构建，
// 调用方（o_marker / o_edmain）无需改动。
// 注意：water_alpha / cloud_drift 是调用者实例变量，本脚本必须保持由这两对象直接调用，
// 不要包进 with() 切换上下文。
var now_background, bid, first, cnt, i, r, lay, _ready, _gr_lastbid, _gr_lastroom, _gr_token, _gr_lasttoken;
now_background = global.background
if (inedit) {now_background = global.local_background}

_ready = 0
if variable_global_exists('bg_table_ready') {_ready = global.bg_table_ready}
if _ready != 1 {background_table_init()}

bid = now_background
if global.bg_count[bid] = 0 {bid = 1}   //未收录id兜底为背景1（等价旧 default 分支）

//坟地（id 33）三合一：背景每次被「设置」时重新随机一个地貌变体。
//触发条件三选一：
//  1) 背景id发生变化（编辑器里换背景、场景控制元件/库巴/测试边界改背景）；
//  2) 换了房间（进编辑器、F3 测关）；
//  3) bg_set_token 变了 —— level_load_play_core / level_next_load_core 每载入一关打一次点。
//     （连续两关都进同一个 Play_Room，房间号不变，只靠 1)+2) 会漏掉，所以需要这个显式打点）
//渐变层（层0）三个变体共用，只有内容层（层1）换图；玩家无从干预，编辑器里也只有一个「坟地」格子。
//随机源 = current_time + irandom：本工程从未调用 randomize()，单用 random() 每次启动都是同一串序列，
//单用 current_time 又会在连续两次切换时按 1/2/3 循环，两者混合后跨启动、跨切关都不会重复成规律。
_gr_lastbid = -1
_gr_lastroom = -1
_gr_lasttoken = -1
if variable_global_exists('bg_grave_lastbid') {_gr_lastbid = global.bg_grave_lastbid}
if variable_global_exists('bg_grave_lastroom') {_gr_lastroom = global.bg_grave_lastroom}
if variable_global_exists('bg_set_token') {_gr_token = global.bg_set_token} else {_gr_token = -1}
if variable_global_exists('bg_grave_lasttoken') {_gr_lasttoken = global.bg_grave_lasttoken}
if bid = 33 {
    if _gr_lastbid != bid || _gr_lastroom != room || _gr_lasttoken != _gr_token {
        global.bg_grave_pick = ((current_time + irandom(2)) mod 3) + 1
    }
    if !variable_global_exists('bg_grave_pick') {global.bg_grave_pick = 1}
    if global.bg_grave_pick < 1 || global.bg_grave_pick > 3 {global.bg_grave_pick = 1}
}
//记录"上一次见到的背景id/房间/打点"，用于下一帧判断背景是否又被设置了一次
global.bg_grave_lastbid = bid
global.bg_grave_lastroom = room
global.bg_grave_lasttoken = _gr_token

first = global.bg_first[bid]
cnt = global.bg_count[bid]

for (i = 0; i < 4; i += 1) {background_visible[i] = 0}
for (r = first; r < first+cnt; r += 1) {
    lay = global.bg_l[r]
    background_visible[lay] = 1
    background_index[lay] = global.bg_spr[r]
    //坟地内容层：按本次抽到的变体换图（1=5-1风 2=5-4风 3=5-7风）
    if bid = 33 && lay = 1 {
        if global.bg_grave_pick = 2 {background_index[lay] = background_grave2}
        if global.bg_grave_pick = 3 {background_index[lay] = background_grave3}
    }
    background_htiled[lay] = 1
    background_vtiled[lay] = global.bg_vti[r]
    background_blend[lay] = c_white
    background_alpha[lay] = water_alpha
    if global.bg_al[r] != -1 {background_alpha[lay] = global.bg_al[r]}
    background_xscale[lay] = 1
    background_yscale[lay] = 1
    if global.bg_sc[r] = 1 {background_yscale[lay] = room_height/480}
    if global.bg_sc[r] = 2 {background_yscale[lay] = room_height}
    if global.bg_sc[r] = 3 {
        background_xscale[lay] = room_width
        background_yscale[lay] = room_height
    }
    if global.bg_sc[r] = 4 {background_yscale[lay] = (room_height+480)/960}
    if global.bg_ym[r] = 0 {background_y[lay] = global.bg_yv[r]}
    if global.bg_ym[r] = 1 {background_y[lay] = room_height-global.bg_yv[r]}
    if global.bg_ym[r] = 2 {background_y[lay] = view_yview[0]+global.bg_yv[r]}
    background_x[lay] = global.bg_pk[r]
    if global.bg_xm[r] = 1 {background_x[lay] = view_xview[0]-global.paralax3*global.bg_pk[r]+cloud_drift*global.bg_dm[r]}
}

//特例：背景28 层1 的 y 依赖自身运行时缩放（照抄原公式）
if bid = 28 {background_y[1] = room_height-320*background_yscale[1]}

//云漂移与水波渐变：仅背景 4/29 原本执行
if bid = 4 || bid = 29 {
    cloud_drift += 0.2
    if view_yview[0]+100 > global.water_level && water_alpha > 0 {water_alpha -= 0.05}
    if view_yview[0]+100 < global.water_level && water_alpha < 1 {water_alpha += 0.05}
}
