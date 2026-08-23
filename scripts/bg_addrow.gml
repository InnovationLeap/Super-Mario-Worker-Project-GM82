// bg_addrow(r, id, lay, spr, vtiled, y模式, y值, x模式, 视差k, 云漂移d, alpha, 缩放)
// 向背景数据表追加一行图层记录，返回下一可用行号。仅由 background_table_init 调用。
// y模式:  0=取y值  1=room_height-值  2=view_yview[0]+值
// x模式:  0=固定x(值存视差k列)  1=view_xview[0]-global.paralax3*k+cloud_drift*d
// alpha: -1 表示 water_alpha（随镜头相对水面位置淡入淡出）
// 缩放:  0=原大  1=纵向room_height/480  2=纵向撑满room_height
//        3=双向撑满(room_width x room_height)  4=(room_height+480)/960
var r;
r = argument0
global.bg_id[r] = argument1
global.bg_l[r] = argument2
global.bg_spr[r] = argument3
global.bg_vti[r] = argument4
global.bg_ym[r] = argument5
global.bg_yv[r] = argument6
global.bg_xm[r] = argument7
global.bg_pk[r] = argument8
global.bg_dm[r] = argument9
global.bg_al[r] = argument10
global.bg_sc[r] = argument11
if global.bg_first[argument1] = -1 {global.bg_first[argument1] = r}
global.bg_count[argument1] += 1
return r+1
