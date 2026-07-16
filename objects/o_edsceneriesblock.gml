#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !variable_local_exists('coto'){
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
