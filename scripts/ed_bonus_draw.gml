// ed_bonus_draw(coto, cx, cy, label)
// 在 64x64 的格子（左上角 cx,cy）内绘制奖励图标。本类别不绘制文字。
// 所有图标取自 s_edbonusbank（coto-1），统一 scale=1 居中绘制。
var _coto, _cx, _cy, _sub, _s, _ox, _oy, _ccx, _ccy, _dx, _dy;
_coto = argument0
_cx = argument1
_cy = argument2
_sub = _coto - 1
// 源精灵 33x35，origin=(0,0)。scale=1 直接以整数坐标居中，避免半像素采样导致发虚/放大感
_s = 1
_dx = floor(_cx + 32 - 16)
_dy = floor(_cy + 32 - 17)
draw_sprite_ext(s_edbonusbank, _sub, _dx, _dy, _s, _s, 0, c_white, 1)
