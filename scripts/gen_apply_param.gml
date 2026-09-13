// gen_apply_param(inst, cat, code, param)
// 生成物转正/生成时按参数回填（对齐关卡载入逻辑 level_next_load_core.gml:136-145）
// 035: height=jumph；043: shell_type → shell_kind/offset/kill_type/single/hardshell
var _st;
if argument0 = -1 { return 0 }
if argument1 = 0 && argument2 = 35 {
    if argument3 > 0 { argument0.height = argument3 }
    return 0;
}
if argument1 = 0 && argument2 = 43 {
    _st = argument3;
    if _st < 8 {
        argument0.shell_kind = floor(_st / 2);
        argument0.offset = 1;
    } else if _st = 10 {
        argument0.shell_kind = 4;
        argument0.offset = 1;
    } else if _st = 11 {
        argument0.shell_kind = 4;
        argument0.offset = 1;
        argument0.kill_type = 1;
        argument0.single = 1;
    } else {
        argument0.hardshell = 1;
        argument0.offset = 1;
    }
    if _st < 10 {
        if floor(_st / 2) <> _st / 2 {
            argument0.kill_type = 1;
            argument0.single = 1;
        }
    }
    return 0;
}
return 0;
