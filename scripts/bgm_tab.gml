/// bgm_tab(x, y, w, h, page, txt)
/// 登记一个 BGM 面板系列页签：鼠标区域 + 目标页 + 显示文字 三位一体。
/// 由 bgm_palette_data 调用，命中测试与文字绘制由 ed_bgm_page 完成。
var _i;
_i = global.bgm_tab_n
global.bgm_tab_x[_i] = argument0
global.bgm_tab_y[_i] = argument1
global.bgm_tab_w[_i] = argument2
global.bgm_tab_h[_i] = argument3
global.bgm_tab_page[_i] = argument4
global.bgm_tab_txt[_i] = argument5
global.bgm_tab_n = _i + 1
