// Save_Script_Generator() —— 由 Save_Script_Main 以 with(o_edgeneratorblock) 调用（self=生成器编辑器实例）
// 写出生成器行（v6.0 格式，ObjGenerator.md §12.2 定稿）——行首标记 '6'（旧版 '5' 行不做兼容）：
//   6 <cat:1> <code:2> <x:4> <y:4> <dir:1> <max:3> <tier:1> <screen:1> [参数尾串]
//   固定头 18 字符：cat 0=敌人 3=奖励；code 两字符（如 01、19、06）
//                   max=数量(1-99) tier=档位(1-5，同时决定生成间隔与害羞半径) screen=屏内限制(0/1)
//   参数尾串自第 19 字符起：035=jumph(3位，>0 才写)；043=shell_type(1-2位)；其余无
// 被收编的物品自身不再写出（见 Save_Script_Enemy / Save_Script_Rest 的 gen_is_captured 过滤）
// 解析端（gen_line_parse）与写入端同源，两处 play 载入器 + 编辑器读档共用
var aa, ab, _cat, _code, _x, _y;
_cat = payload_cat;
_code = payload_code;
_x = x;
_y = y;
aa = '6';
aa = string_insert(string(_cat), aa, string_length(aa) + 1);
ab = string(_code);
repeat (2 - string_length(ab)) { ab = string_insert('0', ab, -1) }
aa = string_insert(ab, aa, string_length(aa) + 1);
if _x >= 0 {
    ab = transB(min(_x, 61999));
    repeat (4 - string_length(ab)) { ab = string_insert('0', ab, 0) }
    aa = string_insert(ab, aa, string_length(aa) + 1);
} else {
    ab = string(min(-_x, 999));
    repeat (3 - string_length(ab)) { ab = string_insert('0', ab, 0) }
    ab = string_insert('-', ab, 0);
    aa = string_insert(ab, aa, string_length(aa) + 1);
}
if _y >= 0 {
    ab = transB(min(_y, 61999));
    repeat (4 - string_length(ab)) { ab = string_insert('0', ab, 0) }
    aa = string_insert(ab, aa, string_length(aa) + 1);
} else {
    ab = string(min(-_y, 999));
    repeat (3 - string_length(ab)) { ab = string_insert('0', ab, 0) }
    ab = string_insert('-', ab, 0);
    aa = string_insert(ab, aa, string_length(aa) + 1);
}
aa = string_insert(string(dir), aa, string_length(aa) + 1);
// 作者参数（存盘前钳制到合法范围）：数量 3 位 + 档位 1 位 + 屏内限制 1 位
ab = string(gen_param_clamp(0, gen_max_user));
repeat (3 - string_length(ab)) { ab = string_insert('0', ab, 0) }
aa = string_insert(ab, aa, string_length(aa) + 1);
aa = string_insert(string(gen_param_clamp(1, gen_tier)), aa, string_length(aa) + 1);
aa = string_insert(string(gen_param_clamp(2, gen_screen_only)), aa, string_length(aa) + 1);
if _cat = 0 {
    if _code = 35 {
        if payload_param > 0 { aa = string_insert(real_string_length(payload_param, 3), aa, string_length(aa) + 1) }
    }
    if _code = 43 {
        aa = string_insert(string(payload_param), aa, string_length(aa) + 1);
    }
}
file_text_write_string(global.script_file, aa);
file_text_writeln(global.script_file);
