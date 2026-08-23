// place_meeting_region(inst, sx, sy, ex, ey)
// 实例 bbox 与矩形区域按 global.ed_region_mode 判定相交（0=ANY 1=FULL 2=HALF）
// 求交逻辑统一在 ed_region_rect_hit（与水管出口分端判定共用同一实现）
var _id;
_id = argument0
return ed_region_rect_hit(_id.bbox_left, _id.bbox_top, _id.bbox_right, _id.bbox_bottom, argument1, argument2, argument3, argument4)
