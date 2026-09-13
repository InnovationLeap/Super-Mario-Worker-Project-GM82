// gen_payload_info(cat, code, field)
// 生成器生成物规则表（ObjGenerator.md §7.4/§7.5），非白名单一律返回不可用
// cat: 0=敌人(001-048) 3=奖励(306/319-324/327)
// field: 0=运行时对象(-1=不可用)
//        1=存活上限（默认 10，逐物品覆盖）
//        2=方向约束(-1=任意；0右/1上/2左/3下)
//        3=生成方式(0=占位物钻出转正 / 1=食人花:底部相位直接生成)
//        4=参数类型(0=无 / 1=jumph / 2=shell_type)
var _obj, _max, _dir, _mode, _par;
_obj = -1;
_max = 10;
_dir = -1;
_mode = 0;
_par = 0;

if argument0 = 0 {
    switch (argument1) {
        case 1:  _obj = o_goomba;          break;
        case 2:  _obj = o_troopa;          break;
        case 3:  _obj = o_troopared;       break;
        case 4:  _obj = o_troopafly;       break;
        case 5:  _obj = o_spiny;           break;
        // 食人花族：max=1、方向必须与花朝向同向（正=上 / 倒=下）、底部相位直接生成
        case 6:  _obj = o_piranha;           _max = 1; _dir = 1; _mode = 1; break;
        case 7:  _obj = o_piranhaflip;       _max = 1; _dir = 3; _mode = 1; break;
        case 8:  _obj = o_piranhafire;       _max = 1; _dir = 1; _mode = 1; break;
        case 9:  _obj = o_piranhafireflip;   _max = 1; _dir = 3; _mode = 1; break;
        case 10: _obj = o_lakitu;          break;
        case 12: _obj = o_fishred;         break;
        case 13: _obj = o_fishgreen;       break;
        // 016/306 同为 o_bonusdead，按 306 规则合并（上向、max=5）
        case 16: _obj = o_bonusdead;       _max = 5; _dir = 1; break;
        case 19: _obj = o_hammerbros;      _max = 1; break;
        case 25: _obj = o_fahlee;          break;
        case 27: _obj = o_firesister;      _max = 1; break;
        case 32: _obj = o_buzzybeetle;     break;
        case 33: _obj = o_troopaflyred;    break;
        case 34: _obj = o_troopablue;      break;
        case 35: _obj = o_troopabluefly;   _par = 1; break;
        case 38: _obj = o_troopagold;      break;
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
        case 6:  _obj = o_bonusdead;      _max = 5; _dir = 1; break;
        case 19: _obj = o_newmush;        _max = 5; break;
        case 20: _obj = o_bonusflower;    _max = 1; _dir = 1; break;
        case 21: _obj = o_bonusbeetroot;  _max = 1; _dir = 1; break;
        case 22: _obj = o_bonuslui;       _max = 1; _dir = 1; break;
        case 23: _obj = o_bonusstar;      break;
        case 24: _obj = o_new1up;         _max = 5; _dir = 1; break;
        case 27: _obj = o_bonusraccoon;   break;
    }
}

if argument2 = 0 { return _obj }
if argument2 = 1 { return _max }
if argument2 = 2 { return _dir }
if argument2 = 3 { return _mode }
if argument2 = 4 { return _par }
return 0;
