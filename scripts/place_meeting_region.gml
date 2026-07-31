var _id, _sx, _sy, _ex, _ey, _mode;
var _ix1, _iy1, _ix2, _iy2;
var _ox1, _oy1, _ox2, _oy2;
var _iw, _ih, _ow, _oh, _ia;
_id = argument0
_sx = argument1
_sy = argument2
_ex = argument3
_ey = argument4
_mode = global.ed_region_mode
_ix1 = _id.bbox_left
_iy1 = _id.bbox_top
_ix2 = _id.bbox_right
_iy2 = _id.bbox_bottom
_ox1 = max(_ix1, _sx)
_oy1 = max(_iy1, _sy)
_ox2 = min(_ix2, _ex)
_oy2 = min(_iy2, _ey)
if _ox1 >= _ox2 {
    return false
}
if _oy1 >= _oy2 {
    return false
}
if _mode == 0 {
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
if _mode == 1 {
    if _ox1 == _ix1 && _oy1 == _iy1 && _ox2 == _ix2 && _oy2 == _iy2 {
        return true
    }
    return false
}
if _mode == 2 {
    if (_ow * _oh) >= (_ia * 0.5) {
        return true
    }
    return false
}
return false
