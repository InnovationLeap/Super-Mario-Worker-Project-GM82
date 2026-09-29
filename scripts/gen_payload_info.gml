// gen_payload_info(cat, code, field)
// 生成器生成物规则表（ObjGenerator.md §7.4/§7.5），非白名单一律返回不可用
// cat: 0=敌人(001-048) 3=奖励(306/319-324/327)
// field: 0=运行时对象(-1=不可用)
//        1=强制上限（v5.0 §12.1#4：仅食人花族与 320/321/322 返回 1；
//                   其余一律返回 -1 = 由生成器实例的作者参数"数量"决定 gen_max_user）
//        2=方向约束(-1=任意；0右/1上/2左/3下)
//        3=生成方式(0=占位物钻出转正 / 1=食人花:底部相位直接生成)
//        4=参数类型(0=无 / 1=jumph / 2=shell_type)
//        5=抬起（挤出）阶段显示的子图（v5.0.4，用户要求）：0=对象默认第一帧；
//          乌龟族（002/003/004/033/034/035/038）与锤子龟 019、火球龟 027 = 1（第二帧）
var _obj, _max, _dir, _mode, _par, _ef;
_obj = -1;
_max = -1;
_dir = -1;
_mode = 0;
_par = 0;
_ef = 0;

if argument0 = 0 {
    switch (argument1) {
        case 1:  _obj = o_goomba;          break;
        // 乌龟族（含飞龟）：抬起阶段用第二帧（v5.0.4，用户要求）
        case 2:  _obj = o_troopa;          _ef = 1; break;
        case 3:  _obj = o_troopared;       _ef = 1; break;
        case 4:  _obj = o_troopafly;       _ef = 1; break;
        case 5:  _obj = o_spiny;           break;
        // 食人花族：max=1、方向必须与花朝向同向（正=上 / 倒=下）、底部相位直接生成
        case 6:  _obj = o_piranha;           _max = 1; _dir = 1; _mode = 1; break;
        case 7:  _obj = o_piranhaflip;       _max = 1; _dir = 3; _mode = 1; break;
        case 8:  _obj = o_piranhafire;       _max = 1; _dir = 1; _mode = 1; break;
        case 9:  _obj = o_piranhafireflip;   _max = 1; _dir = 3; _mode = 1; break;
        case 10: _obj = o_lakitu;          break;
        case 12: _obj = o_fishred;         break;
        case 13: _obj = o_fishgreen;       break;
        // 016/306 同为 o_bonusdead：方向=上（强制）；数量自 v5.0 起由作者参数决定（不再固定 max=5）
        case 16: _obj = o_bonusdead;       _dir = 1; break;
        case 19: _obj = o_hammerbros;      _ef = 1; break;
        case 25: _obj = o_fahlee;          break;
        case 27: _obj = o_firesister;      _ef = 1; break;
        case 32: _obj = o_buzzybeetle;     break;
        case 33: _obj = o_troopaflyred;    _ef = 1; break;
        case 34: _obj = o_troopablue;      _ef = 1; break;
        case 35: _obj = o_troopabluefly;   _par = 1; _ef = 1; break;
        case 38: _obj = o_troopagold;      _ef = 1; break;
        case 43: _obj = o_troopashell2;    _par = 2; break;
        case 44: _obj = o_piranhablue;       _max = 1; _dir = 1; _mode = 1; break;
        case 45: _obj = o_piranhablueflip;   _max = 1; _dir = 3; _mode = 1; break;
        case 46: _obj = o_piranhagrey;       _max = 1; _dir = 1; _mode = 1; break;
        case 47: _obj = o_piranhagreyflip;   _max = 1; _dir = 3; _mode = 1; break;
        case 48: _obj = o_fakitu;          break;
    }
}
if argument0 = 3 {
    switch (argument1) {
        // 306 与敌人 016 同对象（o_bonusdead）：方向=上（强制），数量由作者参数决定
        case 6:  _obj = o_bonusdead;      _dir = 1; break;
        case 19: _obj = o_newmush;        break;
        // 320/321/322：强制上限 1（§12.1#4），其余奖励无强制上限
        case 20: _obj = o_bonusflower;    _max = 1; _dir = 1; break;
        case 21: _obj = o_bonusbeetroot;  _max = 1; _dir = 1; break;
        case 22: _obj = o_bonuslui;       _max = 1; _dir = 1; break;
        case 23: _obj = o_bonusstar;      break;
        case 24: _obj = o_new1up;         _dir = 1; break;
        case 27: _obj = o_bonusraccoon;   break;
    }
}

if argument2 = 0 { return _obj }
if argument2 = 1 { return _max }
if argument2 = 2 { return _dir }
if argument2 = 3 { return _mode }
if argument2 = 4 { return _par }
if argument2 = 5 { return _ef }
return 0;
