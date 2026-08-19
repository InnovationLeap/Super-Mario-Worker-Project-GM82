/// ed_light_flip(bit)
/// 翻转 global.lightobject 第 bit 位（'0'→'1' / '1'→'0'）+ 网络同步。
/// 应在命中判定（ed_light_hit）为真后调用。
if string_copy(global.lightobject, argument0, 1) = '0'
{ global.lightobject = string_replace_char(global.lightobject, argument0, '1'); } else
{ global.lightobject = string_replace_char(global.lightobject, argument0, '0'); }
ed_net_ops_send_settings('Light Object')
