// Save_Script_Generator() —— 由 Save_Script_Main 以 with(o_edgeneratorblock) 调用（self=生成器编辑器实例）
// 写出 5xx 行：5 <cat:1> <code:2> <x:4> <y:4> <dir:1> <tier:1> [参数尾串]
// cat: 0=敌人 3=奖励；code 为两字符（如 01、19、06）
// 参数尾串：035=jumph(3位，>0 才写)；043=shell_type；其余无
// 被收编的物品自身不再写出（见 Save_Script_Enemy / Save_Script_Rest 的 gen_is_captured 过滤）
var aa, ab, _cat, _code, _x, _y;
_cat = payload_cat;
_code = payload_code;
_x = x;
_y = y;
aa = '5';
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
aa = string_insert(string(tier), aa, string_length(aa) + 1);
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
