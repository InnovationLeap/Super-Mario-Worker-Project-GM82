#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !variable_local_exists('coto') {
    coto=0
    drink=0
    imweitiao=0
    additional1=0
    additional2=0
    additional3=0
    additional4=0
    test2=0
}
cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0) // 定义字体
test=0
test3=0
deltax=0
deltay=0
block_index=1

setonce=0
image_speed=0

//风景的绘制已经并入o_edmain
//第一次判断：编辑界面加载完毕后，统一由o_edmain的end step进行绘制
//第二次判断：新放置的风景，先在o_edmain的draw事件进行声明，然后交给step进行绘制

#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 模仿者（coto=42）：从大表 s_blocks_sheet 取方块绘制，与编辑器面板/关卡/游玩完全同源
// 其余景物沿用默认精灵绘制（精灵由 o_edmain 在放置/读档时赋值）
if coto = 42 {
    blocks_draw(block_index, x, y, 1, image_alpha)
} else if coto >= 44 && coto <= 46 {
    // 坦克轮子（44=左 / 45=中 / 46=右）：独立精灵 s_tankwheel，基础帧 (coto-44)*3
    // 编辑器实例坐标 = 格左上角，精灵 origin=(16,32) → 绘制点补 (+16,+32) 让图形正好落在格内
    // 画布上的轮子恒定全亮：不随「当前选中的景物工具」变透明，image_alpha 对它不生效。
    // 跟随鼠标的半透明轮子是放置预览，走 o_edmain 里单独的 draw_sprite_ext(...,0.5)，不受这里影响。
    draw_sprite_ext(s_tankwheel, (coto - 44) * 3, x + 16, y + 32, 1, 1, 0, c_white, 1)
} else {
    draw_self()
}
