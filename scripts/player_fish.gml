// player_fish.gml —— 游鱼/飞鱼区域生成（原 o_marker Step_0 第 1978-2092 行）
// SMWP 1.6+
// 用于控制鱼的生成
// 优化：同一区域各 type 的"生成动作"完全相同，仅阈值/鱼对象/数量上限不同，
//       故按 type 提取配置变量，公共创建代码只保留一份。
// 说明：GM8 的 var 不能出现在块内，故声明集中在脚本顶部；
//       对象 ID 可存进变量，instance_number()/instance_create() 均接受。
var _t1, _t2, _fobj, _fmax;
var _tsame, _topp, _fobj2, _fmax2;
var _valid, _valid2;
_t1 = 0; _t2 = 0; _fobj = -1; _fmax = 0;
_tsame = 0; _topp = 0; _fobj2 = -1; _fmax2 = 0;
_valid = 0; _valid2 = 0;

// --- 游鱼区域（水面以下游泳的鱼） ---
if place_meeting(x,y,o_swimfisharea) {
    fisharea=instance_place(x,y,o_swimfisharea)
    fishcounter+=1

    // 按 type 取配置：触发帧 / 重置帧 / 鱼对象 / 数量上限
    if fisharea.type=0 { _t1=50; _t2=100; _fobj=o_fishred2;   _fmax=8;  _valid=1 }
    else if fisharea.type=1 { _t1=38; _t2=75;  _fobj=o_fishred2;   _fmax=10; _valid=1 }
    else if fisharea.type=2 { _t1=50; _t2=100; _fobj=o_fishgreen2; _fmax=10; _valid=1 }

    if _valid=1 {
        if fishcounter = _t1 {
            fishcreateY=max(view_yview-60,global.water_level+38)+random(300)
            if instance_number(_fobj)<_fmax {
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,_fobj)
                fish.activated=1; fish.dir=fisharea.fishdir
            }
        }
        if fishcounter >= _t2 {
            fishcounter=0
            fishcreateY=max(view_yview-60,global.water_level+38)+300+random(300)
            if instance_number(_fobj)<_fmax {
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,_fobj)
                fish.activated=1; fish.dir=fisharea.fishdir
            }
        }
    }
}

// --- 飞鱼区域（飞出水面/飞行的鱼） ---
if place_meeting(x,y,o_flyfisharea) {
    fisharea2=instance_place(x,y,o_flyfisharea)
    fishcounter2+=1

    // 按 type 取配置：同向帧数 / 反向帧数 / 鱼对象 / 数量上限
    if fisharea2.type=0 { _tsame=25; _topp=13; _fobj2=o_fishred3;  _fmax2=3; _valid2=1 }
    else if fisharea2.type=1 { _tsame=10; _topp=4;  _fobj2=o_fishred3;  _fmax2=3; _valid2=1 }
    else if fisharea2.type=2 { _tsame=25; _topp=13; _fobj2=o_fishblue3; _fmax2=3; _valid2=1 }

    if _valid2=1 {
        if fishcounter2 >= _tsame && fisharea2.fishdir*hspd>=0 {
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(_fobj2)<_fmax2 {
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,_fobj2)
                fish.activated=1; fish.dir=fisharea2.fishdir
            }
        }
        if fishcounter2 >= _topp && fisharea2.fishdir*hspd<0 {
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(_fobj2)<_fmax2 {
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,_fobj2)
                fish.activated=1; fish.dir=fisharea2.fishdir
            }
        }
    }
}
