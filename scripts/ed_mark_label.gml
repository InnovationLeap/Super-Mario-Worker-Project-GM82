// ed_mark_label(pc4) — 返回 marks 选择面板格子下方的说明文字（全大写，空格分隔）
// pc4 即面板格子从左到右、从上到下的序号（与 place_code4 一致）
var _pc4; _pc4 = argument0;
switch (_pc4) {
    case 1: return "PASSAGE";
    case 2: return "LEVEL END";
    case 3: return "SOLID";
    case 4: return "PLAYER START";
    case 5: return "CHECK POINT";
    case 6: return "SEALER";
    case 7: return "AUTO SCROLL";
    case 8: return "PLATFORM COLLISION";
    case 9: return "MESSAGE";
    case 10: return "SWITCH";
    case 11: return "TYPE A";
    case 12: return "TYPE B";
    case 13: return "ICE";
    case 14: return "LEDGE";
    case 15: return "FLUID CONTROL";
    case 16: return "SCENE CONTROL";
    case 17: return "VIEW CONTROL";
    case 19: return "PLATFORM";
    case 20: return "RAINY";
    case 21: return "STARRY";
    case 22: return "SNOWY";
    case 23: return "THUNDER";
    case 24: return "WINDY";
}
return "";
