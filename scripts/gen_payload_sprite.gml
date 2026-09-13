// gen_payload_sprite(cat, code, param, field)
// 生成物绘制用精灵查表：field 0=sprite(-1=无) 1=子图
// 043 龟壳按 shell_type(0-11) 选壳贴图（与 ed_enemy_draw 的壳分支一致），其余用运行时对象的默认精灵
var _obj, _spr, _sub;
_obj = -1;
_spr = -1;
_sub = 0;
if argument0 = 0 && argument1 = 43 {
    switch (argument2) {
        case 0:  _spr = s_troopashell;     _sub = 0; break;
        case 1:  _spr = s_troopashell;     _sub = 1; break;
        case 2:  _spr = s_trooparedshell;  _sub = 0; break;
        case 3:  _spr = s_trooparedshell;  _sub = 1; break;
        case 4:  _spr = s_troopablueshell; _sub = 0; break;
        case 5:  _spr = s_troopablueshell; _sub = 3; break;
        case 6:  _spr = s_troopashellgold; _sub = 0; break;
        case 7:  _spr = s_troopashellgold; _sub = 1; break;
        case 8:  _spr = s_buzzyshell;      _sub = 0; break;
        case 9:  _spr = s_buzzyshell;      _sub = 1; break;
        case 10: _spr = s_spinyshell;      _sub = 0; break;
        case 11: _spr = s_spinyshell;      _sub = 1; break;
    }
} else {
    _obj = gen_payload_info(argument0, argument1, 0);
    if _obj != -1 { _spr = object_get_sprite(_obj) }
}
if argument3 = 0 { return _spr }
return _sub;
