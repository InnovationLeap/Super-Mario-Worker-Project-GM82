// player_volume.gml —— fast retry 背景音量恢复（原 o_marker Step_0 第 1655-1663 行）
// 关于死亡时降低音量请访问马里奥狗带物件
if(string(global.bgm_id)='146') && !instance_exists(o_mariodead) {
    if vvvv<1 && !setonce {vvvv=0.2;setonce=true;}
    surface_volume = 0.01*(global.water_level - y + 50)
    mm_set_volume(global.musicplay,vvvv*(surface_volume))
    mm_set_volume(global.musicplay2,vvvv*(1-surface_volume))
    if vvvv<1 {vvvv+=0.05;}
} else { if vvvv<1 {vvvv+=0.05; mm_set_volume(global.musicplay,vvvv)}}
