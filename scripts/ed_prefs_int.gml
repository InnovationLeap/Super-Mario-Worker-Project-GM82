// ed_prefs_int(id, label, y, valx, hitx, hitw, prompt, min, max, netkey)
// 渲染+交互一个数字输入设置项（get_integer 弹窗）。id 决定读写哪个 global。
// valx=值显示 x（右对齐），hitx/hitw=命中区，min/max=输入钳制（get_integer 后 min/max 包裹）。
var _id, _label, _y, _valx, _hitx, _hitw, _prompt, _min, _max, _netkey, _val;
_id = argument0
_label = argument1
_y = argument2
_valx = argument3
_hitx = argument4
_hitw = argument5
_prompt = argument6
_min = argument7
_max = argument8
_netkey = argument9
_val = 0
switch (_id) {
    case 1: _val = global.water_level; break;
    case 2: _val = global.firstbound; break;
    case 3: _val = global.secondbound; break;
    case 4: _val = global.water_velocity; break;
    case 5: _val = global.water_delay; break;
}
draw_text(view_xview[0]+40, view_yview[0]+_y, string_upper(_label))
draw_set_halign(fa_right)
if _id = 4 || _id = 5 {draw_text(view_xview[0]+_valx, view_yview[0]+_y, string(_val)+string_upper(' unit'))}
else {draw_text(view_xview[0]+_valx, view_yview[0]+_y, string(_val)+string_upper(' px'))}
draw_set_halign(fa_left)
draw_set_color(c_white)
if ed_hit(_hitx, _y-10, _hitw, 20) && clicked = 0 {
    draw_prefs_highlight(view_xview[0]+_hitx, view_yview[0]+_y-10, 1.4, 0.8, 0.2);
    if mouse_check_button(mb_left) {
        switch (_id) {
            case 1: global.water_level=min(_max,get_integer(_prompt,global.water_level)); break;
            case 2: global.firstbound=min(_max,max(_min,get_integer(_prompt,global.firstbound))); break;
            case 3: global.secondbound=min(_max,max(_min,get_integer(_prompt,global.secondbound))); break;
            case 4: global.water_velocity=min(_max,max(_min,get_integer(_prompt,global.water_velocity))); break;
            case 5: global.water_delay=max(_min,get_integer(_prompt,global.water_delay)); break;
        }
        clicked = 1
        ed_net_ops_send_settings(_netkey)
    }
}
