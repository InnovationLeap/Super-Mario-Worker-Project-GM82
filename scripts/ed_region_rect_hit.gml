// ed_region_rect_hit(ix1, iy1, ix2, iy2, sx, sy, ex, ey)
// 矩形 (ix1,iy1)-(ix2,iy2) 与选区矩形 (sx,sy)-(ex,ey) 按 global.ed_region_mode 判定：
// 0=ANY 相交即中；1=FULL 完全包含；2=HALF 相交面积过半。
// 供 place_meeting_region 与水管出口分端判定共用同一实现（出口矩形 = 入口 bbox 平移到 exitx/exity）。
var _ix1, _iy1, _ix2, _iy2;
var _ox1, _oy1, _ox2, _oy2;
var _iw, _ih, _ow, _oh, _ia;
_ix1 = argument0
_iy1 = argument1
_ix2 = argument2
_iy2 = argument3
_ox1 = max(_ix1, argument4)
_oy1 = max(_iy1, argument5)
_ox2 = min(_ix2, argument6)
_oy2 = min(_iy2, argument7)
if _ox1 >= _ox2 {
    return false
}
if _oy1 >= _oy2 {
    return false
}
if global.ed_region_mode == 0 {
    return true
}
_iw = _ix2 - _ix1
_ih = _iy2 - _iy1
_ow = _ox2 - _ox1
_oh = _oy2 - _oy1
_ia = _iw * _ih
if _ia <= 0 {
    return false
}
if global.ed_region_mode == 1 {
    if _ox1 == _ix1 && _oy1 == _iy1 && _ox2 == _ix2 && _oy2 == _iy2 {
        return true
    }
    return false
}
if global.ed_region_mode == 2 {
    if (_ow * _oh) >= (_ia * 0.5) {
        return true
    }
    return false
}
return false
