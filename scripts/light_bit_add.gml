/// light_bit_add(bit, obj)
/// 光源白名单登记：global.lightobject 第 bit 位为 '1' 时，把对象 obj 加进 global.light_obj_list。
/// 同一位对应多个对象时就多调几次（一次一个对象），所以不需要数组参数。
/// 位号超出字符串长度（旧存档只有 70 位、或尚未初始化）时什么都不做。
/// 只能在 global.light_obj_list 已 ds_list_create 之后调用（也就是 o_weather 的 Create 里）。
if (string_length(global.lightobject) >= argument0) {
    if (string_copy(global.lightobject, argument0, 1) = '1') {ds_list_add(global.light_obj_list, argument1);}
}
