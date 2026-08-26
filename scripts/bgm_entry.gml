/// bgm_entry(page, x, y, w, h, id, txt)
/// 登记一个 BGM 选择条目：鼠标区域(x,y,w,h) + BGM编号(id) + 显示文字(txt) 三位一体。
/// 由 bgm_palette_data（静态页）与 bgm_custom_rebuild（自定义页）调用，
/// 追加到 global.bgm_e_*[page, i]，命中测试与文字绘制由 ed_bgm_page 完成。
var _p, _i;
_p = argument0
_i = global.bgm_e_n[_p]
global.bgm_e_x[_p, _i] = argument1
global.bgm_e_y[_p, _i] = argument2
global.bgm_e_w[_p, _i] = argument3
global.bgm_e_h[_p, _i] = argument4
global.bgm_e_id[_p, _i] = argument5
global.bgm_e_txt[_p, _i] = argument6
global.bgm_e_n[_p] = _i + 1
