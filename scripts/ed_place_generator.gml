// ed_place_generator(step, arg1, arg2)
// 生成器放置向导（o_edmain 上下文调用，向导实例存于 tmp2；参照 ed_place_passage 的写法）
// step=1: 在 (arg1,arg2) 落位并返回实例
// step=2: 鼠标点 (arg1,arg2) 决定方向（45° 取整四向，与水管出入口方向拾取一致）
// step=3: 完成并广播（op16 cat6）——v5.0 起档位步骤取消，落位即采用默认参数（数量10/间隔100帧/距离160px/屏内开）
// 向导中途右键取消由 o_edmain 负责销毁预览实例
var _f, _ang, _t;
if argument0 = 1 {
    _f = instance_create(argument1, argument2, o_edgeneratorblock);
    _f.payload_cat = 0;
    _f.payload_code = 0;
    _f.payload_param = 0;
    _f.dir = 0;
    _f.gen_max_user = gen_param_default(0);
    _f.gen_interval = gen_param_default(1);
    _f.gen_range = gen_param_default(2);
    _f.gen_screen_only = gen_param_default(3);
    _f.gen_item = noone;
    _f.wizard = 1;
    _f.gen_menu_armed = 1;
    return _f;
}
if argument0 = 2 {
    if !instance_exists(tmp2) { return -1 }
    _ang = floor((point_direction(tmp2.x + 16, tmp2.y + 16, argument1, argument2) + 45) / 90) * 90;
    if _ang = 0 { tmp2.dir = 0 }
    if _ang = 90 { tmp2.dir = 1 }
    if _ang = 180 { tmp2.dir = 2 }
    if _ang = 270 { tmp2.dir = 3 }
    return tmp2;
}
if argument0 = 3 {
    if !instance_exists(tmp2) { return -1 }
    // v5.0（§12）：档位步骤取消——向导结束即采用默认参数，随后用 submenu 调参（数值项弹 get_integer）
    tmp2.gen_max_user = gen_param_default(0);
    tmp2.gen_interval = gen_param_default(1);
    tmp2.gen_range = gen_param_default(2);
    tmp2.gen_screen_only = gen_param_default(3);
    tmp2.wizard = 0;
    ed_net_ops_send_create(tmp2, 6);
    return tmp2;
}
return -1;
