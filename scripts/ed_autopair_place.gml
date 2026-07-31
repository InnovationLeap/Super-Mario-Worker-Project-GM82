// ed_autopair_place(ap) - autopair 组合砖块预览与放置
// 替代 o_edmain Draw_0 中 44 个重复的 if autopair=N{...} 块
// 布局数据表由 o_edmain Create_0 调用 ed_autopair_data() 初始化
// 特例 autopair=0（单格+autosolid 联动）仍保留在 o_edmain 中
var _ap, _cnt, _i, _j, _fx, _fy, _dx, _dy, _id, _bad;
_ap = argument0;
_cnt = global.autopair_count[_ap];
_fx = floor(mouse_x / 32);
_fy = floor(mouse_y / 32);
// 半透明预览
if costawia<>0 && kliknieto=0 && autopair3=0 && menujesie=0 && wlaczonaopcja=0 && mouse_x>0 && mouse_y>0 {
    for (_i=0; _i<_cnt; _i+=1) {
        _dx = global.autopair_layout[_ap, _i*3];
        _dy = global.autopair_layout[_ap, _i*3+1];
        _id = global.autopair_layout[_ap, _i*3+2];
        draw_sprite_ext(s_blocks, _id, _fx*32+_dx*32, _fy*32+_dy*32, 1, 1, 0, c_white, 0.5);
    }
}
// 放置
if costawia<>0 && kliknieto=0 && autopair3=0 && menujesie=0 && wlaczonaopcja=0 && mouse_x>0 && mouse_y>0 && mouse_check_button(mb_left) {
    // 特例 8/68：边缘守卫（鼠标不出右/下边缘）
    if global.autopair_edge[_ap] = 1 {
        if mouse_x >= room_width-32 || mouse_y >= room_height {
            exit;
        }
    }
    // 特例 8/68：防重叠（目标格已有本组合任一块号则不放置）
    if global.autopair_overlap[_ap] = 1 {
        _bad = 0;
        for (_j=0; _j<_cnt; _j+=1) {
            _dx = global.autopair_layout[_ap, _j*3];
            _dy = global.autopair_layout[_ap, _j*3+1];
            _id = arrayetapu[_fx+_dx, _fy+_dy];
            for (_i=0; _i<_cnt; _i+=1) {
                if _id == global.autopair_layout[_ap, _i*3+2] {
                    _bad = 1;
                }
            }
        }
        if _bad = 1 {
            exit;
        }
    }
    for (_i=0; _i<_cnt; _i+=1) {
        _dx = global.autopair_layout[_ap, _i*3];
        _dy = global.autopair_layout[_ap, _i*3+1];
        _id = global.autopair_layout[_ap, _i*3+2];
        arrayetapu[_fx+_dx, _fy+_dy] = _id;
    }
}
