// background_show —— 数据驱动版（原963行switch重构）
// 每帧按数据表应用背景层。表由 background_table_init 首次调用时懒加载构建，
// 调用方（o_marker / o_edmain）无需改动。
// 注意：water_alpha / cloud_drift 是调用者实例变量，本脚本必须保持由这两对象直接调用，
// 不要包进 with() 切换上下文。
var now_background, bid, first, cnt, i, r, lay, _ready;
now_background = global.background
if (inedit) {now_background = global.local_background}

_ready = 0
if variable_global_exists('bg_table_ready') {_ready = global.bg_table_ready}
if _ready != 1 {background_table_init()}

bid = now_background
if global.bg_count[bid] = 0 {bid = 1}   //未收录id兜底为背景1（等价旧 default 分支）
first = global.bg_first[bid]
cnt = global.bg_count[bid]

for (i = 0; i < 4; i += 1) {background_visible[i] = 0}
for (r = first; r < first+cnt; r += 1) {
    lay = global.bg_l[r]
    background_visible[lay] = 1
    background_index[lay] = global.bg_spr[r]
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
