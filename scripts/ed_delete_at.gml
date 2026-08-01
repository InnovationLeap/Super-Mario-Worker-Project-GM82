// ed_delete_at(category, x, y, selcoto)
// 统一删除（o_edmain 上下文调用）：
// category: 0=方块 1=奖励 2=敌人 3=景物 4=标记 5=水管；selcoto=当前选中类型（delete_coto_check 用）
var _t;
if argument0 = 0 {
    //方块删除：清 arrayetapu 网格 + 销毁实心/封顶实心
    arrayetapu[argument1 div 32, argument2 div 32] = 0
    ed_net_ops_send_grid(argument1 div 32, argument2 div 32, 0)
    _t = instance_position(argument1, argument2, o_edmarkerblock)
    if (_t.coto = 18 || _t.coto = 22) {
        ed_net_ops_send_delete(_t)
        with(_t){instance_destroy()}
    }
    return _t
}
if argument0 = 1 {
    //奖励删除
    _t = instance_position(argument1, argument2, o_edbonusesblock)
    ed_net_ops_send_delete(_t)
    with(_t){instance_destroy()}
    return -1
}
if argument0 = 2 {
    //敌人删除：鱼(40/41)需与当前选中类型匹配
    _t = instance_position(argument1, argument2, o_edenemyblock)
    if(_t.coto <> 40 && _t.coto <> 41){
        ed_net_ops_send_delete(_t)
        with(_t){instance_destroy()}
    }
    else{
        if(_t.coto = argument3){
            ed_net_ops_send_delete(_t)
            with(_t){instance_destroy()}
        }
    }
    return -1
}
if argument0 = 3 {
    //景物删除：delete_coto_check(3) 判定
    _t = instance_position(argument1, argument2, o_edsceneriesblock)
    if(delete_coto_check(3, argument3, _t.coto)){
        ed_net_ops_send_delete(_t)
        with(_t){instance_destroy()}
    }
    else{
        with(o_edsceneriesblock){
            if(delete_coto_check(3, argument3, coto) && instance_position(argument1, argument2, id)){
                ed_net_ops_send_delete(id)
                instance_destroy()
            }
        }
    }
    return -1
}
if argument0 = 4 {
    //标记删除：delete_coto_check(4) 判定 + 强滚中心(23)清理 autoscrolls 链表
    _t = instance_position(argument1, argument2, o_edmarkerblock)
    if(delete_coto_check(4, argument3, _t.coto)){
        ed_net_ops_send_delete(_t)
        with(_t){
            if coto=23{ds_list_delete(global.autoscrolls,ds_list_find_index(global.autoscrolls,id))}
            instance_destroy()
        }
    }
    else{
        with(o_edmarkerblock){
            if(delete_coto_check(4, argument3, coto) && instance_position(argument1, argument2, id)){
                if coto=23{ds_list_delete(global.autoscrolls,ds_list_find_index(global.autoscrolls,id))}
                ed_net_ops_send_delete(id)
                instance_destroy()
            }
        }
    }
    return -1
}
if argument0 = 5 {
    //水管删除
    _t = instance_position(argument1, argument2, o_edpassage)
    ed_net_ops_send_delete(_t)
    with(_t){instance_destroy()}
    return -1
}
return -1
