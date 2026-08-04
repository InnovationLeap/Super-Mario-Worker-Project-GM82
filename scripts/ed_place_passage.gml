// ed_place_passage(step, x, y)
// 水管四步向导（o_edmain 上下文，fofo 为正在放置的水管实例）：
// step=1 创建并返回实例；2=入口方向；3=出口位置；4=出口方向+完成
var _f;
if argument0 = 1 {
    _f = instance_create(argument1, argument2, o_edpassage)
    _f.warpnum = global.warpnum
    global.warpnum += 1
    return _f
}
if argument0 = 2 {
    fofo.wejscie = floor((point_direction(fofo.x+32, fofo.y+32, argument1, argument2)+45)/90)*90
    fofo.tak = 1
    return -1
}
if argument0 = 3 {
    fofo.exitx = argument1
    fofo.exity = argument2
    fofo.tak2 = 1
    return -1
}
if argument0 = 4 {
    fofo.wyjscie = floor((point_direction(fofo.exitx, fofo.exity, argument1, argument2)+45)/90)*90
    if fofo.wyjscie >= 360 {fofo.wyjscie = fofo.wyjscie mod 360}
    fofo.tak3 = 1
    with(o_edpassage) {shuiguanhele = 0; shuiguanhele2 = 0}
    // NET-SYNC: 完成点——op16 cat4 广播（warpnum/wejscie/exitx/exity/wyjscie/x/y，远端创建或更新）
    ed_net_ops_send_create(fofo, 4)
    // NET-SYNC: 配对完成后重算全部水管 warpnum（两端按 (x,y) 排序收敛，防交错放置重复编号）
    ed_passage_reindex()
    return fofo
}
return -1
