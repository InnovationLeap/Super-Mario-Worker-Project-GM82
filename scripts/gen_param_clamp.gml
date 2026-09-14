// gen_param_clamp(field, value)
// 生成器作者参数钳制（ObjGenerator.md §12.1 取值范围）——编辑器输入 / 存盘 / 读档 / 运行时懒初始化共用
// field: 0=数量(1-99) 1=生成间隔(帧,50fps,1-1000) 2=距离阈值(px,0-640) 3=屏内限制(0/1)
var _v, _lo, _hi;
_v = floor(argument1);
_lo = 0;
_hi = 0;
if argument0 = 0 { _lo = 1; _hi = 99 }
if argument0 = 1 { _lo = 1; _hi = 1000 }
if argument0 = 2 { _lo = 0; _hi = 640 }
if argument0 = 3 { _lo = 0; _hi = 1 }
if _v < _lo { _v = _lo }
if _v > _hi { _v = _hi }
return _v;
