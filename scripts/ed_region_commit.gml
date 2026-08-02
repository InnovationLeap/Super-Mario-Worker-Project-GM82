// ed_region_commit: 提交拖拽结果（松手/U 退出/T 模式切换共用）
// argument0 = dcol, argument1 = drow（提交时的原始拖拽偏移，格）
// 前置条件：state==3 且 blk_orig != -1；实例已实时移动，此处只处理方块网格
// 流程：按选区包围盒钳制偏移（整块选区不越出房间，与拖拽预览一致）→ Pass1 清原位（带值校验 + mask 复位）→ Pass2 平移写入（覆盖目标格）→ 重建 blk → 清理临时结构
var _dcol, _drow, _i, _j, _blk_str, _newcol, _newrow, _val;
var _tcol, _trow;
var _minc, _maxc, _minr, _maxr, _id;

_dcol = argument0
_drow = argument1

if global.ed_region_blk_orig == -1 {
    exit
}

_minc = room_width / 32 - 1
_maxc = 0
_minr = room_height / 32 - 1
_maxr = 0
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
_dcol = clamp(_dcol, -_minc, room_width / 32 - 1 - _maxc)
_drow = clamp(_drow, -_minr, room_height / 32 - 1 - _maxr)

for (_i = 0; _i < ds_list_size(global.ed_region_blk_orig); _i += 1) {
    _blk_str = ds_list_find_value(global.ed_region_blk_orig, _i)
    _j = string_pos(",", _blk_str)
    _newcol = real(string_copy(_blk_str, 1, _j - 1))
    _blk_str = string_copy(_blk_str, _j + 1, string_length(_blk_str) - _j)
    _j = string_pos(",", _blk_str)
    _newrow = real(string_copy(_blk_str, 1, _j - 1))
    _val = real(string_copy(_blk_str, _j + 1, string_length(_blk_str) - _j))
    if o_edmain.arrayetapu[_newcol, _newrow] == _val {
        o_edmain.arrayetapu[_newcol, _newrow] = 0
        ed_net_ops_send_grid(_newcol, _newrow, 0)
    }
    global.ed_region_orig_mask[_newcol, _newrow] = 0
}

if global.ed_region_blk != -1 {
    ds_list_clear(global.ed_region_blk)
}
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
    if global.ed_region_blk != -1 {
        ds_list_add(global.ed_region_blk, string(_tcol) + "," + string(_trow) + "," + string(_val))
    }
}

ds_list_destroy(global.ed_region_blk_orig)
global.ed_region_blk_orig = -1

if global.ed_region_list != -1 {
    for (_i = 0; _i < ds_list_size(global.ed_region_list); _i += 1) {
        _id = ds_list_find_value(global.ed_region_list, _i)
        if instance_exists(_id) {
            ed_net_ops_send_update(_id, 10)
        }
    }
}
