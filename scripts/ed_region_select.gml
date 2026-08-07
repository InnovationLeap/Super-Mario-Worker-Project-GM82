var _newcol, _newrow, _val, _si, _sx, _sy, _ex, _ey, _mx, _my, _state;
var _inst_list, _blk_list, _hit, _id, _i, _j;
var _col1, _col2, _row1, _row2, _c, _r, _blk_str;
var _sel_sx, _sel_sy, _sel_ex, _sel_ey;
var _dcol, _drow, _target_col, _target_row;
var _key, _keys_a;
var _old_val, _new_val;
var _blk_temp;
var _dx, _dy;
var _ox, _oy;

_state = global.ed_region_state

if _state == 0 {
    if mouse_check_button_pressed(mb_left) {
        if o_edmain.menujesie == 0 && o_edmain.wiatrak == 0 && o_edmain.setting_mode == 0 {
            if o_edmain.czywybieranieback == 0 {
                global.ed_region_mx = mouse_x
                global.ed_region_my = mouse_y
                global.ed_region_sx = mouse_x
                global.ed_region_sy = mouse_y
                global.ed_region_ex = mouse_x
                global.ed_region_ey = mouse_y
                global.ed_region_state = 1
                debug_log("Region: Started selection at " + string(mouse_x) + "," + string(mouse_y))
            }
        }
    }
}

if _state == 1 {
    global.ed_region_ex = mouse_x
    global.ed_region_ey = mouse_y
    if mouse_check_button_released(mb_left) {
        _sx = min(global.ed_region_sx, global.ed_region_ex)
        _sy = min(global.ed_region_sy, global.ed_region_ey)
        _ex = max(global.ed_region_sx, global.ed_region_ex)
        _ey = max(global.ed_region_sy, global.ed_region_ey)
        global.ed_region_sx = _sx
        global.ed_region_sy = _sy
        global.ed_region_ex = _ex
        global.ed_region_ey = _ey
        if global.ed_region_list != -1 {
            ds_list_destroy(global.ed_region_list)
        }
        if global.ed_region_blk != -1 {
            ds_list_destroy(global.ed_region_blk)
        }
        global.ed_region_list = ds_list_create()
        global.ed_region_blk = ds_list_create()
        _inst_list = global.ed_region_list
        _blk_list = global.ed_region_blk
        if global.ed_region_type == 0 || global.ed_region_type == 1 {
            _col1 = floor(_sx / 32)
            _row1 = floor(_sy / 32)
            _col2 = floor((_ex - 1) / 32)
            _row2 = floor((_ey - 1) / 32)
            _col1 = max(_col1, 0)
            _row1 = max(_row1, 0)
            _col2 = min(_col2, room_width / 32 - 1)
            _row2 = min(_row2, room_height / 32 - 1)
            for (_c = _col1; _c <= _col2; _c += 1) {
                for (_r = _row1; _r <= _row2; _r += 1) {
                    _val = o_edmain.arrayetapu[_c, _r]
                    if _val != 0 {
                        ds_list_add(_blk_list, string(_c) + "," + string(_r) + "," + string(_val))
                    }
                }
            }
        }
        if global.ed_region_type == 0 || global.ed_region_type == 2 {
            for (_i = 0; _i < instance_number(o_edenemyblock); _i += 1) {
                _id = instance_find(o_edenemyblock, _i)
                if place_meeting_region(_id, _sx, _sy, _ex, _ey) {
                    ds_list_add(_inst_list, _id)
                }
            }
        }
        if global.ed_region_type == 0 || global.ed_region_type == 3 {
            for (_i = 0; _i < instance_number(o_edsceneriesblock); _i += 1) {
                _id = instance_find(o_edsceneriesblock, _i)
                if place_meeting_region(_id, _sx, _sy, _ex, _ey) {
                    ds_list_add(_inst_list, _id)
                }
            }
        }
        if global.ed_region_type == 0 || global.ed_region_type == 4 {
            for (_i = 0; _i < instance_number(o_edmarkerblock); _i += 1) {
                _id = instance_find(o_edmarkerblock, _i)
                if place_meeting_region(_id, _sx, _sy, _ex, _ey) {
                    ds_list_add(_inst_list, _id)
                }
            }
            for (_i = 0; _i < instance_number(o_edpassage); _i += 1) {
                _id = instance_find(o_edpassage, _i)
                if place_meeting_region(_id, _sx, _sy, _ex, _ey) {
                    ds_list_add(_inst_list, _id)
                }
            }
        }
        if global.ed_region_type == 0 || global.ed_region_type == 5 {
            for (_i = 0; _i < instance_number(o_edbonusesblock); _i += 1) {
                _id = instance_find(o_edbonusesblock, _i)
                if place_meeting_region(_id, _sx, _sy, _ex, _ey) {
                    ds_list_add(_inst_list, _id)
                }
            }
        }
        debug_log("Region: Confirmed - blocks=" + string(ds_list_size(_blk_list)) + ", instances=" + string(ds_list_size(_inst_list)))
        if ds_list_size(_blk_list) > 0 || ds_list_size(_inst_list) > 0 {
            global.ed_region_state = 2
        } else {
            global.ed_region_state = 0
            ds_list_destroy(global.ed_region_list)
            ds_list_destroy(global.ed_region_blk)
            global.ed_region_list = -1
            global.ed_region_blk = -1
        }
    }
}

if _state == 2 {
    if mouse_check_button_pressed(mb_left) {
        if o_edmain.menujesie == 0 && o_edmain.wiatrak == 0 && o_edmain.setting_mode == 0 {
            if o_edmain.czywybieranieback == 0 {
                _hit = false
                _inst_list = global.ed_region_list
                if _inst_list != -1 {
                    _i = 0
                    while _i < ds_list_size(_inst_list) {
                        _id = ds_list_find_value(_inst_list, _i)
                        if instance_exists(_id) {
                            if mouse_x >= _id.bbox_left && mouse_x <= _id.bbox_right && mouse_y >= _id.bbox_top && mouse_y <= _id.bbox_bottom {
                                _hit = true
                                break
                            }
                        }
                        _i += 1
                    }
                }
                if !_hit {
                    _blk_list = global.ed_region_blk
                    if _blk_list != -1 {
                        _i = 0
                        while _i < ds_list_size(_blk_list) {
                            _blk_str = ds_list_find_value(_blk_list, _i)
                            _j = string_pos(",", _blk_str)
                            _newcol = real(string_copy(_blk_str, 1, _j - 1))
                            _blk_str = string_copy(_blk_str, _j + 1, string_length(_blk_str) - _j)
                            _j = string_pos(",", _blk_str)
                            _newrow = real(string_copy(_blk_str, 1, _j - 1))
                            if mouse_x >= _newcol * 32 && mouse_x <= _newcol * 32 + 32 && mouse_y >= _newrow * 32 && mouse_y <= _newrow * 32 + 32 {
                                _hit = true
                                break
                            }
                            _i += 1
                        }
                    }
                }
                if _hit {
                    global.ed_region_mx = mouse_x
                    global.ed_region_my = mouse_y
                    global.ed_region_state = 3
                    global.ed_region_last_dcol = 0
                    global.ed_region_last_drow = 0
                    global.ed_region_orig_x = mouse_x
                    global.ed_region_orig_y = mouse_y
                    _inst_list = global.ed_region_list
                    if _inst_list != -1 {
                        _i = 0
                        while _i < ds_list_size(_inst_list) {
                            _id = ds_list_find_value(_inst_list, _i)
                            if instance_exists(_id) {
                                _id.ed_drag_sx = _id.x
                                _id.ed_drag_sy = _id.y
                                if _id.object_index == o_edenemyblock {
                                    _id.ed_drag_fx = _id.fishendX
                                    _id.ed_drag_fy = _id.fishendY
                                }
                                if _id.object_index == o_edmarkerblock {
                                    _id.ed_drag_wx = _id.water_endX
                                    _id.ed_drag_wy = _id.water_endY
                                    _id.ed_drag_cx = _id.camera_endX
                                    _id.ed_drag_cy = _id.camera_endY
                                }
                                if _id.object_index == o_edpassage {
                                    _id.ed_drag_ex = _id.exitx
                                    _id.ed_drag_ey = _id.exity
                                }
                            }
                            _i += 1
                        }
                    }
                    if global.ed_region_blk != -1 {
                        if global.ed_region_blk_orig != -1 {
                            ds_list_destroy(global.ed_region_blk_orig)
                        }
                        global.ed_region_blk_orig = ds_list_create()
                        for (_i = 0; _i < ds_list_size(global.ed_region_blk); _i += 1) {
                            ds_list_add(global.ed_region_blk_orig, ds_list_find_value(global.ed_region_blk, _i))
                        }
                        for (_c = 0; _c < room_width / 32; _c += 1) {
                            for (_r = 0; _r < room_height / 32; _r += 1) {
                                global.ed_region_orig_mask[_c, _r] = 0
                            }
                        }
                        for (_i = 0; _i < ds_list_size(global.ed_region_blk_orig); _i += 1) {
                            _blk_str = ds_list_find_value(global.ed_region_blk_orig, _i)
                            _j = string_pos(",", _blk_str)
                            _newcol = real(string_copy(_blk_str, 1, _j - 1))
                            _blk_str = string_copy(_blk_str, _j + 1, string_length(_blk_str) - _j)
                            _j = string_pos(",", _blk_str)
                            _newrow = real(string_copy(_blk_str, 1, _j - 1))
                            global.ed_region_orig_mask[_newcol, _newrow] = 1
                        }
                    }
                    _si = 0
                    if global.ed_region_list != -1 {
                        _si = ds_list_size(global.ed_region_list)
                    }
                    _blk_temp = 0
                    if global.ed_region_blk != -1 {
                        _blk_temp = ds_list_size(global.ed_region_blk)
                    }
                    debug_log("Region: Started moving " + string(_si) + " instances, " + string(_blk_temp) + " blocks")
                } else {
                    global.ed_region_mx = mouse_x
                    global.ed_region_my = mouse_y
                    global.ed_region_sx = mouse_x
                    global.ed_region_sy = mouse_y
                    global.ed_region_ex = mouse_x
                    global.ed_region_ey = mouse_y
                    global.ed_region_state = 1
                    debug_log("Region: Started new selection at " + string(mouse_x) + "," + string(mouse_y))
                }
            }
        }
    }
}

if _state == 3 {
    if mouse_check_button_released(mb_left) {
        _inst_list = global.ed_region_list
        _blk_list = global.ed_region_blk
        _si = 0
        if _inst_list != -1 {
            _si = ds_list_size(_inst_list)
        }
        _blk_temp = 0
        if _blk_list != -1 {
            _blk_temp = ds_list_size(_blk_list)
        }
        if global.ed_region_blk_orig != -1 || global.ed_region_copymode {
            _dcol = floor((mouse_x - global.ed_region_orig_x) / 32)
            _drow = floor((mouse_y - global.ed_region_orig_y) / 32)
            if global.ed_region_copymode {
                ed_region_paste(_dcol, _drow)
                global.ed_region_copymode = false
            } else {
                ed_region_commit(_dcol, _drow)
            }
        }
        debug_log("Region: Moved - blocks=" + string(_blk_temp) + ", instances=" + string(_si))
        global.ed_region_state = 2
    } else {
        if mouse_check_button(mb_left) {
            if !global.ed_region_copymode {
                _inst_list = global.ed_region_list
                if _inst_list != -1 {
                    _ox = floor((mouse_x - global.ed_region_orig_x) / 16) * 16
                    _oy = floor((mouse_y - global.ed_region_orig_y) / 16) * 16
                    _i = 0
                    while _i < ds_list_size(_inst_list) {
                        _id = ds_list_find_value(_inst_list, _i)
                        if !instance_exists(_id) {
                            ds_list_delete(_inst_list, _i)
                        } else {
                            if _id.object_index == o_edmarkerblock {
                                if _id.coto == 22 {
                                    _id.x = _id.ed_drag_sx + _ox
                                    _id.y = 0
                                } else {
                                    _id.x = _id.ed_drag_sx + _ox
                                    _id.y = _id.ed_drag_sy + _oy
                                }
                                if _id.coto == 32 {
                                    _id.water_endX = _id.ed_drag_wx + _ox
                                    _id.water_endY = _id.ed_drag_wy + _oy
                                }
                                if _id.coto == 34 {
                                    _id.camera_endX = _id.ed_drag_cx + _ox
                                    _id.camera_endY = _id.ed_drag_cy + _oy
                                }
                            } else {
                                if _id.object_index == o_edenemyblock {
                                    if _id.coto == 40 || _id.coto == 41 {
                                        _id.fishendX = _id.ed_drag_fx + _ox
                                        _id.fishendY = _id.ed_drag_fy + _oy
                                    }
                                }
                                if _id.object_index == o_edpassage {
                                    _id.exitx = _id.ed_drag_ex + _ox
                                    _id.exity = _id.ed_drag_ey + _oy
                                }
                                _id.x = _id.ed_drag_sx + _ox
                                _id.y = _id.ed_drag_sy + _oy
                            }
                            _i += 1
                        }
                    }
                }
            }
            _blk_list = global.ed_region_blk
            if _blk_list != -1 {
                if global.ed_region_blk_orig != -1 {
                    _dcol = floor((mouse_x - global.ed_region_orig_x) / 32)
                    _drow = floor((mouse_y - global.ed_region_orig_y) / 32)
                    if _dcol != global.ed_region_last_dcol || _drow != global.ed_region_last_drow {
                        global.ed_region_last_dcol = _dcol
                        global.ed_region_last_drow = _drow
                        debug_log("RegionDrag: orig=" + string(global.ed_region_orig_x) + "," + string(global.ed_region_orig_y) + " mouse=" + string(mouse_x) + "," + string(mouse_y) + " d=" + string(_dcol) + "," + string(_drow))
                    }
                }
            }
        }
    }
}

if keyboard_check(vk_control) && keyboard_check_pressed(global.key_copy) {
    if global.ed_region_active && global.ed_region_state == 2 {
        global.ed_region_copymode = true
        global.ed_region_mx = mouse_x
        global.ed_region_my = mouse_y
        global.ed_region_state = 3
        global.ed_region_last_dcol = 1
        global.ed_region_last_drow = 1
        global.ed_region_orig_x = mouse_x - 32
        global.ed_region_orig_y = mouse_y - 32
        if global.ed_region_blk != -1 {
            if global.ed_region_blk_orig != -1 {
                ds_list_destroy(global.ed_region_blk_orig)
            }
            global.ed_region_blk_orig = ds_list_create()
            for (_i = 0; _i < ds_list_size(global.ed_region_blk); _i += 1) {
                ds_list_add(global.ed_region_blk_orig, ds_list_find_value(global.ed_region_blk, _i))
            }
        }
        _si = 0
        if global.ed_region_list != -1 {
            _si = ds_list_size(global.ed_region_list)
        }
        _blk_temp = 0
        if global.ed_region_blk != -1 {
            _blk_temp = ds_list_size(global.ed_region_blk)
        }
        debug_log("Region: Copy-started " + string(_si) + " instances, " + string(_blk_temp) + " blocks")
    }
}
