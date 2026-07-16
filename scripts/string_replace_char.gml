{
    var str, pos, new_char, front, back;
    str = argument0;
    pos = argument1;
    new_char = argument2;

    // 处理无效位置：直接返回原字符串
    if (pos < 1) || (pos > string_length(str)) return str;

    // 获取位置之前的子串
    front = string_copy(str, 1, pos - 1);

    // 获取位置之后的子串
    if (pos = string_length(str)) {
        back = "";
    } else {
        back = string_copy(str, pos + 1, string_length(str) - pos);
    }

    // 组合新字符串：前段 + 新字符 + 后段
    return front + new_char + back;
}
