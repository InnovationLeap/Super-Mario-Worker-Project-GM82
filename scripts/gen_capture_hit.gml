// gen_capture_hit(cat, code, ix, iy, gx, gy) —— 编辑器收编判定：物品实例坐标 (ix,iy) 是否算"摆在生成器本格"
// 基准（v5.0.3 严格匹配）：ix = gx + gen_editor_offset(cat, code, 0)，iy = gy + 同物 dy。
// v6.4（用户反馈"食人花必须放在生成器右边 16px 才被判定配合"）：
//   食人花族的编辑器放置公式是 floor((mouse_x-16)/32)*32+16 —— 相对格左上角只有 **-16 / +16** 两种落点
//   （花心落在格边界上，与"水管 2 格宽"的摆法一致），两者都与生成器本格重叠；只认 +16 会让
//   "把花点在生成器格上"有一半概率不生效。故 Object Offset Correct = YES 时，食人花族 **±16 都算合法**
//   （其余物品、以及 Object Offset Correct = NO 时，仍严格匹配）。
var _dx, _dy, _ok;
_ok = 0;
_dx = gen_editor_offset(argument0, argument1, 0);
_dy = gen_editor_offset(argument0, argument1, 1);
if argument2 = argument4 + _dx {
    if argument3 = argument5 + _dy { _ok = 1 }
}
if _ok = 0 {
    if global.objectoffset = 0 {
        if argument0 = 0 {
            if argument1 = 6 || argument1 = 7 || argument1 = 8 || argument1 = 9 || argument1 = 44 || argument1 = 45 || argument1 = 46 || argument1 = 47 {
                if argument3 = argument5 + _dy {
                    // v6.5：编辑器对"点在生成器格上"只会产生 -16 / +16 两种落点，直接把整条 ±16 带都算合法
                    if argument2 >= argument4 - 16 {
                        if argument2 <= argument4 + 16 { _ok = 1 }
                    }
                }
            }
        }
    }
}
return _ok;
