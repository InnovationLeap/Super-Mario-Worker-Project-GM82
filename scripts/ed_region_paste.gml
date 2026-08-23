// ed_region_paste: 粘贴副本（Ctrl+C 进入复制模式后，松手时调用）
// argument0 = dcol, argument1 = drow（原始拖拽偏移，格）
// 前置条件：state==3 且 copymode==true；blk_orig 为源方块位置快照，ed_region_list 为源实例列表
// 流程：按选区包围盒（方块+实例）钳制偏移 → 方块写入 arrayetapu（覆盖）→ 创建实例副本 → 切换选区为副本 → 同步选区框
var _dcol, _drow, _i, _j, _blk_str, _newcol, _newrow, _val;
var _tcol, _trow;
var _minc, _maxc, _minr, _maxr, _id, _new_id, _cato;
var _new_list, _new_blk;
var _bx1, _by1, _bx2, _by2;
var _iox, _ioy;

_dcol = argument0
_drow = argument1

// 1. 钳制方块偏移：按方块包围盒，保证方块整体不越出房间（实例独立按 16px 偏移，不钳制）
_minc = room_width / 32 - 1
_maxc = 0
_minr = room_height / 32 - 1
_maxr = 0
if global.ed_region_blk_orig != -1 {
    for (_i = 0; _i < ds_list_size(global.ed_region_blk_orig); _i += 1) {
        _blk_str = ds_list_find_value(global.ed_region_blk_orig, _i)
        _j = string_pos(",", _blk_str)
        _newcol = real(string_copy(_blk_str, 1, _j - 1))
        _blk_str = string_copy(_blk_str, _j + 1, string_length(_blk_str) - _j)
        _j = string_pos(",", _blk_str)
        _newrow = real(string_copy(_blk_str, 1, _j - 1))
        _minc = min(_minc, _newcol)
        _maxc = max(_maxc, _newcol)
        _minr = min(_minr, _newrow)
        _maxr = max(_maxr, _newrow)
    }
}
_dcol = clamp(_dcol, -_minc, room_width / 32 - 1 - _maxc)
_drow = clamp(_drow, -_minr, room_height / 32 - 1 - _maxr)

// 2. 方块副本：写入 arrayetapu 并收集新位置
_new_blk = -1
if global.ed_region_blk_orig != -1 {
    _new_blk = ds_list_create()
    for (_i = 0; _i < ds_list_size(global.ed_region_blk_orig); _i += 1) {
        _blk_str = ds_list_find_value(global.ed_region_blk_orig, _i)
        _j = string_pos(",", _blk_str)
        _newcol = real(string_copy(_blk_str, 1, _j - 1))
        _blk_str = string_copy(_blk_str, _j + 1, string_length(_blk_str) - _j)
        _j = string_pos(",", _blk_str)
        _newrow = real(string_copy(_blk_str, 1, _j - 1))
        _val = real(string_copy(_blk_str, _j + 1, string_length(_blk_str) - _j))
        _tcol = _newcol + _dcol
        _trow = _newrow + _drow
        o_edmain.arrayetapu[_tcol, _trow] = _val
        ed_net_ops_send_grid(_tcol, _trow, _val)
        ds_list_add(_new_blk, string(_tcol) + "," + string(_trow) + "," + string(_val))
    }
}

// 3. 实例副本：创建于 16px 网格偏移位置，复制属性，收集新 id
_new_list = -1
_iox = floor((mouse_x - global.ed_region_orig_x) / 16) * 16
_ioy = floor((mouse_y - global.ed_region_orig_y) / 16) * 16
if global.ed_region_list != -1 {
    if ds_list_size(global.ed_region_list) > 0 {
        _new_list = ds_list_create()
        for (_i = 0; _i < ds_list_size(global.ed_region_list); _i += 1) {
            _id = ds_list_find_value(global.ed_region_list, _i)
            if instance_exists(_id) {
                _new_id = instance_create(_id.x + _iox, _id.y + _ioy, _id.object_index)
                _new_id.coto = _id.coto
                if _id.object_index == o_edmarkerblock {
                    _new_id.type = _id.type
                    _new_id.anime = _id.anime
                    _new_id.color = _id.color
                    _new_id.ledge_type = _id.ledge_type
                    _new_id.target = _id.target
                    _new_id.velocity = _id.velocity
                    _new_id.bgm_change = _id.bgm_change
                    _new_id.bgp_change = _id.bgp_change
                    _new_id.weather_change = _id.weather_change
                    _new_id.height = _id.height
                    _new_id.is_orange = _id.is_orange
                    _new_id.scrollspeed = _id.scrollspeed
                    _new_id.textMessage = _id.textMessage
                    _new_id.bgm = _id.bgm
                    _new_id.linked = _id.linked
                    _new_id.rainy = _id.rainy
                    _new_id.fallingstars = _id.fallingstars
                    _new_id.snowy = _id.snowy
                    _new_id.thunder = _id.thunder
                    _new_id.windy = _id.windy
                    _new_id.darkness = _id.darkness
                    _new_id.brightness = _id.brightness
                    _new_id.camera_endX = _id.camera_endX + _iox
                    _new_id.camera_endY = _id.camera_endY + _ioy
                    _new_id.bgp = _id.bgp
                    _new_id.water_endX = _id.water_endX + _iox
                    _new_id.water_endY = _id.water_endY + _ioy
                }
                if _id.object_index == o_edpassage {
                    _new_id.wejscie = _id.wejscie
                    _new_id.wyjscie = _id.wyjscie
                    _new_id.exitx = _id.exitx + _iox
                    _new_id.exity = _id.exity + _ioy
                    _new_id.tak = _id.tak
                    _new_id.tak2 = _id.tak2
                    _new_id.tak3 = _id.tak3
                    _new_id.warpnum = _id.warpnum
                    // 副本继承端点选中标志，保证粘贴后仍可分端拖动
                    _new_id.ed_sel_entr = _id.ed_sel_entr
                    _new_id.ed_sel_exit = _id.ed_sel_exit
                }
                if _id.object_index == o_edenemyblock {
                    _new_id.fishendX = _id.fishendX + _iox
                    _new_id.fishendY = _id.fishendY + _ioy
                    _new_id.shell_type = _id.shell_type
                    _new_id.spike_type = _id.spike_type
                    _new_id.jumph = _id.jumph
                    _new_id.type = _id.type
                    if _id.coto == 20 {
                        _new_id.rotoord = _id.rotoord
                        _new_id.is_petal = _id.is_petal
                        for (_j = 1; _j <= _id.rotoord; _j += 1) {
                            _new_id.rotor[_j] = _id.rotor[_j]
                            _new_id.rotoa[_j] = _id.rotoa[_j]
                            _new_id.rotos[_j] = _id.rotos[_j]
                            if _id.is_petal {
                                _new_id.rotomr[_j] = _id.rotomr[_j]
                                _new_id.rotors[_j] = _id.rotors[_j]
                            }
                        }
                    }
                    if _id.coto == 39 {
                        _new_id.rotoord = _id.rotoord
                        for (_j = 1; _j <= _id.rotoord; _j += 1) {
                            _new_id.rotor[_j] = _id.rotor[_j]
                            _new_id.rotoa[_j] = _id.rotoa[_j]
                            _new_id.rotoc[_j] = _id.rotoc[_j]
                            _new_id.rotod[_j] = _id.rotod[_j]
                        }
                    }
                }
                if _id.object_index == o_edsceneriesblock {
                    _new_id.block_index = _id.block_index
                }
                _cato = 0
                if _id.object_index == o_edenemyblock {
                    _cato = 1
                } else if _id.object_index == o_edsceneriesblock {
                    _cato = 2
                } else if _id.object_index == o_edmarkerblock {
                    if _id.coto = 18 {
                        _cato = 5
                    } else {
                        _cato = 3
                    }
                } else if _id.object_index == o_edpassage {
                    _cato = 4
                }
                ed_net_ops_send_create(_new_id, _cato)
                ds_list_add(_new_list, _new_id)
            }
        }
    }
}

// 4. 切换选区为副本 + 同步选区框（T 键 recalc 一致性）
if _new_blk != -1 || _new_list != -1 {
    if global.ed_region_blk != -1 {
        ds_list_destroy(global.ed_region_blk)
    }
    if global.ed_region_list != -1 {
        ds_list_destroy(global.ed_region_list)
    }
    global.ed_region_blk = _new_blk
    global.ed_region_list = _new_list
    _bx1 = room_width
    _by1 = room_height
    _bx2 = 0
    _by2 = 0
    if _new_blk != -1 {
        for (_i = 0; _i < ds_list_size(_new_blk); _i += 1) {
            _blk_str = ds_list_find_value(_new_blk, _i)
            _j = string_pos(",", _blk_str)
            _newcol = real(string_copy(_blk_str, 1, _j - 1))
            _blk_str = string_copy(_blk_str, _j + 1, string_length(_blk_str) - _j)
            _j = string_pos(",", _blk_str)
            _newrow = real(string_copy(_blk_str, 1, _j - 1))
            _bx1 = min(_bx1, _newcol * 32)
            _by1 = min(_by1, _newrow * 32)
            _bx2 = max(_bx2, _newcol * 32 + 32)
            _by2 = max(_by2, _newrow * 32 + 32)
        }
    }
    if _new_list != -1 {
        for (_i = 0; _i < ds_list_size(_new_list); _i += 1) {
            _id = ds_list_find_value(_new_list, _i)
            if instance_exists(_id) {
                _bx1 = min(_bx1, _id.bbox_left)
                _by1 = min(_by1, _id.bbox_top)
                _bx2 = max(_bx2, _id.bbox_right)
                _by2 = max(_by2, _id.bbox_bottom)
            }
        }
    }
    global.ed_region_sx = _bx1
    global.ed_region_sy = _by1
    global.ed_region_ex = _bx2
    global.ed_region_ey = _by2
    _i = 0
    if _new_blk != -1 {
        _i = ds_list_size(_new_blk)
    }
    _j = 0
    if _new_list != -1 {
        _j = ds_list_size(_new_list)
    }
    debug_log("Region: Pasted d=" + string(_dcol) + "," + string(_drow) + " blocks=" + string(_i) + " instances=" + string(_j))
} else {
    if _new_blk != -1 {
        ds_list_destroy(_new_blk)
    }
    if _new_list != -1 {
        ds_list_destroy(_new_list)
    }
}

// 5. 清理源快照
if global.ed_region_blk_orig != -1 {
    ds_list_destroy(global.ed_region_blk_orig)
}
global.ed_region_blk_orig = -1
