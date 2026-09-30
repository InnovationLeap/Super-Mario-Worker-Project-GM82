// ed_blocks_page_draw()
// Blocks 选择面板：格子区改用 s_blocks 逐格绘制（与游玩渲染同源）
// 目的：面板里显示的方块与关卡里放置的方块使用同一套素材（s_blocks），
//       不再依赖 s_edblocks 整页图里烘焙的方块（那属于重复素材，且容易与 s_blocks 不同步）。
// 85 号（EDIT 界面网格砖）额外叠画 s_block85，与 o_edwallsdrawer 的画法保持一致。
// 调用点：o_edmain 的 Draw_0，option_open=1 换页段（画完 s_edblocks 整页图之后）。
var _p, _r, _c, _id, _gx, _gy;

_p = o_edmain.blockpage + 1
if _p < 0 {exit}
if _p > 4 {exit}

draw_set_alpha(1)
for (_r = 0; _r < 7; _r += 1) {
    for (_c = 0; _c < 12; _c += 1) {
        _gx = view_xview[0] + 206 + _c * 32
        _gy = view_yview[0] + 128 + _r * 32
        // 先铺格子底色，盖掉整页图里烘焙的旧方块
        draw_set_color(make_color_rgb(66, 66, 255))
        draw_rectangle(_gx, _gy, _gx + 31, _gy + 31, false)
        _id = global.blocks_palette[_p, _r * 12 + _c]
        if _id > 0 {
            draw_sprite(s_blocks, _id, _gx, _gy)
            if _id = 85 {draw_sprite(s_block85, 0, _gx, _gy)}
        }
    }
}
// 补回格子区左上两条 1px 边框线（整页图原有，逐格重绘时被盖掉）
draw_set_color(make_color_rgb(32, 32, 32))
draw_line(view_xview[0] + 206, view_yview[0] + 128, view_xview[0] + 206, view_yview[0] + 128 + 224)
draw_line(view_xview[0] + 206, view_yview[0] + 128, view_xview[0] + 206 + 384, view_yview[0] + 128)
draw_set_color(c_white)
