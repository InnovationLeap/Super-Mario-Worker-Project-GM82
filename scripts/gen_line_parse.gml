// gen_line_parse(aa) —— 解析一行生成器数据，写入全局临时变量
// 供【两处 play 载入器 + 编辑器读档 Load_Script_Masta】共用，避免三份解析逻辑分叉（ObjGenerator.md §6.1）
//
// 格式（v6.0 定稿，ObjGenerator.md §12.2 / §13）——行首标记 '6'：
//   6 <cat:1> <code:2> <x:4> <y:4> <dir:1> <max:3> <tier:1> <screen:1> [参数尾串]
//   固定头 18 字符：pos1='6' 2=cat 3-4=code 5-8=x 9-12=y 13=dir 14-16=max(数量) 17=tier(档位) 18=screen(屏内限制)
//   参数尾串自第 19 字符起：035=jumph(3 位) / 043=shell_type(1-2 位)；其余物品无尾串
//   生成间隔与害羞半径不单独存档，一律由档位（gen_tier_info）决定
//
// 注（用户裁定）：**旧版生成器行不做兼容**——行首 '5'（v3–v5）不在载入器前缀表内，旧生成器随关卡载入自然丢弃
//
// 输出（全局）：genp_cat genp_code genp_dir genp_max genp_tier genp_scr genp_param
var _tail;
_tail = '';
global.genp_cat = real(string_copy(argument0, 2, 1));
global.genp_code = real(string_copy(argument0, 3, 2));
global.genp_dir = real(string_copy(argument0, 13, 1));
global.genp_max = gen_param_clamp(0, real(string_copy(argument0, 14, 3)));
global.genp_tier = gen_param_clamp(1, real(string_copy(argument0, 17, 1)));
global.genp_scr = gen_param_clamp(2, real(string_copy(argument0, 18, 1)));
_tail = string_copy(argument0, 19, 999);
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
