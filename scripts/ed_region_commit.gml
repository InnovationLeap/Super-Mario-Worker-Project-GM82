// ed_region_commit: 提交拖拽结果（松手/U 退出/T 模式切换共用）
// argument0 = dcol, argument1 = drow（提交时的最终拖拽偏移，格）
// 前置条件：state==3 且 blk_orig != -1；实例已实时移动，此处只处理方块网格
// 流程：Pass1 清原位（带值校验 + mask 复位）→ Pass2 平移写入（覆盖目标格；越界格恢复原位）→ 重建 blk → 清理临时结构
var _dcol, _drow, _i, _j, _blk_str, _newcol, _newrow, _val;
var _tcol, _trow;

_dcol = argument0
_drow = argument1

if global.ed_region_blk_orig == -1 {
    exit
}

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
    if _tcol < 0 || _tcol >= room_width / 32 || _trow < 0 || _trow >= room_height / 32 {
        _tcol = _newcol
        _trow = _newrow
    }
    o_edmain.arrayetapu[_tcol, _trow] = _val
    if global.ed_region_blk != -1 {
        ds_list_add(global.ed_region_blk, string(_tcol) + "," + string(_trow) + "," + string(_val))
    }
}

ds_list_destroy(global.ed_region_blk_orig)
global.ed_region_blk_orig = -1
