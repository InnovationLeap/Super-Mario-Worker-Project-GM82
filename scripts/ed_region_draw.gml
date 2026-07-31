var _state, _sx, _sy, _ex, _ey, _i, _id, _blk_str, _j;
var _col, _row, _val, _mode;
var _type_str, _mode_str, _info;
var _dcol, _drow;
var _minc, _maxc, _minr, _maxr;

_state = global.ed_region_state
_sx = global.ed_region_sx
_sy = global.ed_region_sy
_ex = global.ed_region_ex
_ey = global.ed_region_ey

if _state == 1 {
    draw_set_color(c_white)
    draw_set_alpha(0.3)
    draw_rectangle(_sx, _sy, _ex, _ey, false)
    draw_set_alpha(1)
    draw_set_color(c_lime)
    draw_rectangle(_sx, _sy, _ex, _ey, true)
}

if _state == 2 || _state == 3 {
    if global.ed_region_list != -1 {
        _i = 0
        while _i < ds_list_size(global.ed_region_list) {
            _id = ds_list_find_value(global.ed_region_list, _i)
            if instance_exists(_id) {
                draw_set_color(c_lime)
                draw_set_alpha(0.4)
                draw_rectangle(_id.bbox_left, _id.bbox_top, _id.bbox_right, _id.bbox_bottom, false)
                draw_set_alpha(1)
                draw_set_color(c_lime)
                draw_rectangle(_id.bbox_left, _id.bbox_top, _id.bbox_right, _id.bbox_bottom, true)
            }
            _i += 1
        }
    }
    if _state == 2 && global.ed_region_blk != -1 {
        _i = 0
        while _i < ds_list_size(global.ed_region_blk) {
            _blk_str = ds_list_find_value(global.ed_region_blk, _i)
            _j = string_pos(",", _blk_str)
            _col = real(string_copy(_blk_str, 1, _j - 1))
            _blk_str = string_copy(_blk_str, _j + 1, string_length(_blk_str) - _j)
            _j = string_pos(",", _blk_str)
            _row = real(string_copy(_blk_str, 1, _j - 1))
            draw_set_color(c_lime)
            draw_set_alpha(0.4)
            draw_rectangle(_col * 32, _row * 32, _col * 32 + 32, _row * 32 + 32, false)
            draw_set_alpha(1)
            draw_set_color(c_lime)
            draw_rectangle(_col * 32, _row * 32, _col * 32 + 32, _row * 32 + 32, true)
            _i += 1
        }
    }
    if _state == 3 && (global.ed_region_blk_orig != -1 || global.ed_region_copymode) {
        _dcol = floor((mouse_x - global.ed_region_orig_x) / 32)
        _drow = floor((mouse_y - global.ed_region_orig_y) / 32)
        _minc = room_width / 32 - 1
        _maxc = 0
        _minr = room_height / 32 - 1
        _maxr = 0
        if global.ed_region_copymode {
            if global.ed_region_list != -1 {
                _i = 0
                while _i < ds_list_size(global.ed_region_list) {
                    _id = ds_list_find_value(global.ed_region_list, _i)
                    if instance_exists(_id) {
                        _minc = min(_minc, floor(_id.bbox_left / 32))
                        _maxc = max(_maxc, floor((_id.bbox_right - 1) / 32))
                        _minr = min(_minr, floor(_id.bbox_top / 32))
                        _maxr = max(_maxr, floor((_id.bbox_bottom - 1) / 32))
                    }
                    _i += 1
                }
            }
        }
        if global.ed_region_blk_orig != -1 {
            _i = 0
            while _i < ds_list_size(global.ed_region_blk_orig) {
                _blk_str = ds_list_find_value(global.ed_region_blk_orig, _i)
                _j = string_pos(",", _blk_str)
                _col = real(string_copy(_blk_str, 1, _j - 1))
                _blk_str = string_copy(_blk_str, _j + 1, string_length(_blk_str) - _j)
                _j = string_pos(",", _blk_str)
                _row = real(string_copy(_blk_str, 1, _j - 1))
                _minc = min(_minc, _col)
                _maxc = max(_maxc, _col)
                _minr = min(_minr, _row)
                _maxr = max(_maxr, _row)
                _i += 1
            }
        }
        _dcol = clamp(_dcol, -_minc, room_width / 32 - 1 - _maxc)
        _drow = clamp(_drow, -_minr, room_height / 32 - 1 - _maxr)
        if global.ed_region_blk_orig != -1 {
            _i = 0
            while _i < ds_list_size(global.ed_region_blk_orig) {
                _blk_str = ds_list_find_value(global.ed_region_blk_orig, _i)
                _j = string_pos(",", _blk_str)
                _col = real(string_copy(_blk_str, 1, _j - 1))
                _blk_str = string_copy(_blk_str, _j + 1, string_length(_blk_str) - _j)
                _j = string_pos(",", _blk_str)
                _row = real(string_copy(_blk_str, 1, _j - 1))
                _val = real(string_copy(_blk_str, _j + 1, string_length(_blk_str) - _j))
                _col = _col + _dcol
                _row = _row + _drow
                if _col >= 0 && _col < room_width / 32 && _row >= 0 && _row < room_height / 32 {
                    draw_set_alpha(0.5)
                    draw_sprite_ext(s_blocks, _val, _col * 32, _row * 32, 1, 1, 0, c_white, 0.5)
                    draw_set_alpha(1)
                    draw_set_color(c_lime)
                    draw_set_alpha(0.4)
                    draw_rectangle(_col * 32, _row * 32, _col * 32 + 32, _row * 32 + 32, false)
                    draw_set_alpha(1)
                    draw_set_color(c_lime)
                    draw_rectangle(_col * 32, _row * 32, _col * 32 + 32, _row * 32 + 32, true)
                }
                _i += 1
            }
        }
        if global.ed_region_copymode && global.ed_region_list != -1 {
            _i = 0
            while _i < ds_list_size(global.ed_region_list) {
                _id = ds_list_find_value(global.ed_region_list, _i)
                if instance_exists(_id) {
                    if _id.sprite_index != -1 {
                        draw_set_alpha(0.5)
                        draw_sprite_ext(_id.sprite_index, _id.image_index, _id.x + _dcol * 32, _id.y + _drow * 32, 1, 1, 0, c_white, 0.5)
                        draw_set_alpha(1)
                    }
                }
                _i += 1
            }
        }
    }
}

_mode = global.ed_region_mode
if _mode == 0 {
    _mode_str = "ANY"
}
if _mode == 1 {
    _mode_str = "FULL"
}
if _mode == 2 {
    _mode_str = "HALF"
}

_type_str = "NONE"
if global.ed_region_type == 0 {
    _type_str = "ALL"
}
if global.ed_region_type == 1 {
    _type_str = "BLOCKS"
}
if global.ed_region_type == 2 {
    _type_str = "BUDDIES"
}
if global.ed_region_type == 3 {
    _type_str = "SCENERY"
}
if global.ed_region_type == 4 {
    _type_str = "MARKS"
}
if global.ed_region_type == 5 {
    _type_str = "BONUS"
}

_info = "REGION [" + _type_str + "] Mode:" + _mode_str
if _state == 2 || _state == 3 {
    _i = 0
    if global.ed_region_list != -1 {
        _i = ds_list_size(global.ed_region_list)
    }
    _j = 0
    if global.ed_region_blk != -1 {
        _j = ds_list_size(global.ed_region_blk)
    }
    _info = _info + " Sel:" + string(_i) + "i+" + string(_j) + "b"
}
if _state == 0 {
    _info = _info + " IDLE"
}
if _state == 1 {
    _info = _info + " DRAWING"
}
if _state == 3 {
    if global.ed_region_copymode {
        _info = _info + " PASTE"
    } else {
        _info = _info + " MOVING"
    }
}

draw_set_font(o_edmain.cyferki)
draw_set_color(c_yellow)
draw_set_alpha(1)
draw_text(view_xview[0] + 4, view_yview[0] + 464, _info)
