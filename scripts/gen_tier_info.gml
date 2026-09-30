// gen_tier_info(tier, field)
// 生成器档位表（ObjGenerator.md v6.0，用户 2025 定稿）——档位**同时绑定**「生成间隔」与「害羞半径」
// （= 压制半径：玩家进入该半径内生成器停摆、计时清零），二者不再可单独修改。
// 编辑器 / 运行时 / 存读档 / 联机 / 选区粘贴全部以【档位】为唯一来源，改数值只需改本表。
//
//   档位  颜色   生成间隔(帧@50fps)  害羞半径(px)
//    1    紫      16                16
//    2    红      64                32
//    3    黄     128                48   ← 工具面板图标 / 新建生成器的默认档位
//    4    绿     192                64
//    5    蓝     256                96
//
// field: 0=生成间隔(帧) 1=害羞半径(px) 2=管体色 3=内壁色 4=外框/管口色 5=箭头色 6=档位名(英文，用于菜单/角标)
var _t;
_t = floor(argument0);
if _t < 1 { _t = 1 }
if _t > 5 { _t = 5 }
if argument1 = 0 {
    if _t = 1 { return 16 }
    if _t = 2 { return 64 }
    if _t = 3 { return 128 }
    if _t = 4 { return 192 }
    return 256
}
if argument1 = 1 {
    if _t = 1 { return 16 }
    if _t = 2 { return 32 }
    if _t = 3 { return 48 }
    if _t = 4 { return 64 }
    return 96
}
if argument1 = 2 {
    if _t = 1 { return make_color_rgb(150, 92, 214) }
    if _t = 2 { return make_color_rgb(216, 72, 72) }
    if _t = 3 { return make_color_rgb(226, 196, 72) }
    if _t = 4 { return make_color_rgb(86, 190, 96) }
    return make_color_rgb(74, 140, 224)
}
if argument1 = 3 {
    if _t = 1 { return make_color_rgb(104, 60, 158) }
    if _t = 2 { return make_color_rgb(156, 44, 44) }
    if _t = 3 { return make_color_rgb(168, 138, 44) }
    if _t = 4 { return make_color_rgb(48, 130, 60) }
    return make_color_rgb(44, 92, 168)
}
if argument1 = 4 {
    if _t = 1 { return make_color_rgb(52, 24, 92) }
    if _t = 2 { return make_color_rgb(88, 20, 20) }
    if _t = 3 { return make_color_rgb(96, 76, 20) }
    if _t = 4 { return make_color_rgb(22, 74, 32) }
    return make_color_rgb(20, 48, 104)
}
if argument1 = 5 {
    if _t = 1 { return make_color_rgb(228, 194, 255) }
    if _t = 2 { return make_color_rgb(255, 190, 180) }
    if _t = 3 { return make_color_rgb(255, 246, 196) }
    if _t = 4 { return make_color_rgb(200, 255, 200) }
    return make_color_rgb(190, 224, 255)
}
if argument1 = 6 {
    if _t = 1 { return 'PURPLE' }
    if _t = 2 { return 'RED' }
    if _t = 3 { return 'YELLOW' }
    if _t = 4 { return 'GREEN' }
    return 'BLUE'
}
return 0;
