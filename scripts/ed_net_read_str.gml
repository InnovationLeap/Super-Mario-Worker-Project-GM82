// ed_net_read_str(buf)
// 读取 ed_net_write_str 编码的字符串并返回
var _n;
_n = buffer_read_u32(argument0)
return buffer_read_data(argument0, _n)
