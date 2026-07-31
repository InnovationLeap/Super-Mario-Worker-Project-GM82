var _new_list, _new_blk, _i, _id, _blk_str, _j;
var _col, _row, _val, _sx, _sy, _ex, _ey;

_sx = global.ed_region_sx
_sy = global.ed_region_sy
_ex = global.ed_region_ex
_ey = global.ed_region_ey

if global.ed_region_list == -1 && global.ed_region_blk == -1 {
    exit
}

_new_list = ds_list_create()
_new_blk = ds_list_create()

if global.ed_region_type == 0 || global.ed_region_type == 1 {
    for (_col = floor(_sx / 32); _col <= floor((_ex - 1) / 32); _col += 1) {
        for (_row = floor(_sy / 32); _row <= floor((_ey - 1) / 32); _row += 1) {
            if _col >= 0 && _col < room_width / 32 && _row >= 0 && _row < room_height / 32 {
                _val = o_edmain.arrayetapu[_col, _row]
                if _val != 0 {
                    ds_list_add(_new_blk, string(_col) + "," + string(_row) + "," + string(_val))
                }
            }
        }
    }
}

if global.ed_region_type == 0 || global.ed_region_type == 2 {
    for (_i = 0; _i < instance_number(o_edenemyblock); _i += 1) {
        _id = instance_find(o_edenemyblock, _i)
        if place_meeting_region(_id, _sx, _sy, _ex, _ey) {
            ds_list_add(_new_list, _id)
        }
    }
}

if global.ed_region_type == 0 || global.ed_region_type == 3 {
    for (_i = 0; _i < instance_number(o_edsceneriesblock); _i += 1) {
        _id = instance_find(o_edsceneriesblock, _i)
        if place_meeting_region(_id, _sx, _sy, _ex, _ey) {
            ds_list_add(_new_list, _id)
        }
    }
}

if global.ed_region_type == 0 || global.ed_region_type == 4 {
    for (_i = 0; _i < instance_number(o_edmarkerblock); _i += 1) {
        _id = instance_find(o_edmarkerblock, _i)
        if place_meeting_region(_id, _sx, _sy, _ex, _ey) {
            ds_list_add(_new_list, _id)
        }
    }
    for (_i = 0; _i < instance_number(o_edpassage); _i += 1) {
        _id = instance_find(o_edpassage, _i)
        if place_meeting_region(_id, _sx, _sy, _ex, _ey) {
            ds_list_add(_new_list, _id)
        }
    }
}

if global.ed_region_type == 0 || global.ed_region_type == 5 {
    for (_i = 0; _i < instance_number(o_edbonusesblock); _i += 1) {
        _id = instance_find(o_edbonusesblock, _i)
        if place_meeting_region(_id, _sx, _sy, _ex, _ey) {
            ds_list_add(_new_list, _id)
        }
    }
}

if global.ed_region_list != -1 {
    ds_list_destroy(global.ed_region_list)
}
if global.ed_region_blk != -1 {
    ds_list_destroy(global.ed_region_blk)
}
global.ed_region_list = _new_list
global.ed_region_blk = _new_blk

if ds_list_size(_new_list) == 0 && ds_list_size(_new_blk) == 0 {
    global.ed_region_state = 0
    ds_list_destroy(global.ed_region_list)
    ds_list_destroy(global.ed_region_blk)
    global.ed_region_list = -1
    global.ed_region_blk = -1
} else {
    global.ed_region_state = 2
}

_i = 0
if global.ed_region_list != -1 {
    _i = ds_list_size(global.ed_region_list)
}
_j = 0
if global.ed_region_blk != -1 {
    _j = ds_list_size(global.ed_region_blk)
}
debug_log("Region: Recalc mode=" + string(global.ed_region_mode) + " blocks=" + string(_j) + " instances=" + string(_i))
