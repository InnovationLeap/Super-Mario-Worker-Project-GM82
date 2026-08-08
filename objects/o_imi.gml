#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x = view_xview[0]+624
y = view_yview[0]+464

image_alpha = 0.6;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x = mouse_x
y = mouse_y
if o_edmain.place_code3=42 {
    window_set_cursor(cr_none)
    visible = 1
} else {
    // 联机中：系统箭头由 o_ednet 统一管理（隐藏），这里不覆盖，避免与白光标冲突
    if !(instance_exists(o_ednet) && o_ednet.net_state = 3) {
        window_set_cursor(cr_default)
    }
    visible = 0
}
