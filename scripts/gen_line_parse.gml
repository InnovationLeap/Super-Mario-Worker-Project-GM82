// gen_line_parse(aa) —— 解析一行 5xx 生成器数据，写入全局临时变量
// 供【两处 play 载入器 + 编辑器读档 Load_Script_Masta】共用，避免三份解析逻辑分叉（ObjGenerator.md §6.1）
//
// 存档格式（v5.0 定稿，ObjGenerator.md §12.2）：
//   5 <cat:1> <code:2> <x:4> <y:4> <dir:1> <max:3> <interval:4> <range:3> <screen:1> [参数尾串]
//   固定头 24 字符：pos1='5' 2=cat 3-4=code 5-8=x 9-12=y 13=dir 14-16=max(数量)
//                  17-20=interval(生成间隔帧) 21-23=range(距离阈值px) 24=screen(屏内限制)
//   参数尾串自第 25 字符起：035=jumph(3 位) / 043=shell_type(1-2 位)；其余物品无尾串
//
// 旧格式（v3–v4：固定头 14 字符 + tier）：按 §12.1#9【不做 tier 映射】——
//   payload 与坐标偏移同新格式（2-13 位），数值参数一律取默认值；genp_legacy=1 供编辑器侧提示
//
// 输出（全局）：genp_cat genp_code genp_dir genp_max genp_int genp_rng genp_scr genp_param genp_legacy
var _tail, _new;
_tail = '';
_new = 0;
if string_length(argument0) >= 24 { _new = 1 }
global.genp_legacy = 0;
if _new = 0 { global.genp_legacy = 1 }
global.genp_cat = real(string_copy(argument0, 2, 1));
global.genp_code = real(string_copy(argument0, 3, 2));
global.genp_dir = real(string_copy(argument0, 13, 1));
if _new = 1 {
    global.genp_max = gen_param_clamp(0, real(string_copy(argument0, 14, 3)));
    global.genp_int = gen_param_clamp(1, real(string_copy(argument0, 17, 4)));
    global.genp_rng = gen_param_clamp(2, real(string_copy(argument0, 21, 3)));
    global.genp_scr = gen_param_clamp(3, real(string_copy(argument0, 24, 1)));
    _tail = string_copy(argument0, 25, 999);
} else {
    global.genp_max = gen_param_default(0);
    global.genp_int = gen_param_default(1);
    global.genp_rng = gen_param_default(2);
    global.genp_scr = gen_param_default(3);
    _tail = string_copy(argument0, 15, 999);
}
global.genp_param = 0;
if global.genp_cat = 0 {
    if global.genp_code = 35 {
        if string_length(_tail) >= 3 { global.genp_param = real(string_copy(_tail, 1, 3)) }
    }
    if global.genp_code = 43 {
        if string_length(_tail) >= 1 { global.genp_param = real(_tail) }
    }
}
return 0;
