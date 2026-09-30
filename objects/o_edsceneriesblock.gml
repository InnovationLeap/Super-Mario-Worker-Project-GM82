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
} else {
    draw_self()
}
