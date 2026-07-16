#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !variable_local_exists('wejscie'){wejscie=0
wyjscie=0
cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0) // 定义字体

tak=0
tak2=0
tak3=0

exitx=0
exity=0
deltax=0
deltay=0
}
//水管配对相关
cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0) // 定义字体
shuiguanhele=0
shuiguanhele2=0
helewrap=0

imweitiao=0
drink=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//这是水管出入口为啥要叫enemiesblock2 简直喝了
draw_sprite_ext(s_enemiesblock2,0,x,y,1,1,0,c_white,0.5)
if tak=1
draw_sprite_ext(s_entrancedir,0,x+32,y+32,1,1,wejscie,c_white,0.5)
if tak2=1
draw_sprite_ext(s_enemiesblock3,0,exitx,exity,1,1,0,c_white,0.5)
if tak3=1
draw_sprite_ext(s_entrancedir,0,exitx+32,exity+32,1,1,wyjscie,c_white,0.5)
/*if x=o_acc.x && y=o_acc.y && o_acc.visible=1 && o_edmain.drinkability=4 {
draw_set_color(c_white)
draw_set_font(cyferkimario)
draw_text(view_xview[0]+556,view_yview[0]+468,'('+string(x)+','+string(y)+')')
deltax=x mod 32
deltay=y mod 32
if deltax>16 {deltax-=32}
if deltay>16 {deltay-=32}
if deltax>0 && deltay>0 {draw_text(view_xview[0]+16,view_yview[0]+468,'(+'+string(deltax)+',+'+string(deltay)+')')}
if deltax>0 && deltay<=0 {draw_text(view_xview[0]+16,view_yview[0]+468,'(+'+string(deltax)+','+string(deltay)+')')}
if deltax<=0 && deltay>0 {draw_text(view_xview[0]+16,view_yview[0]+468,'('+string(deltax)+',+'+string(deltay)+')')}
if deltax<=0 && deltay<=0 {draw_text(view_xview[0]+16,view_yview[0]+468,'('+string(deltax)+','+string(deltay)+')')}
}
if exitx=o_acc.x && exity=o_acc.y && o_acc.visible=1 && o_edmain.drinkability=4 {
draw_set_color(c_white)
draw_set_font(cyferkimario)
draw_text(view_xview[0]+556,view_yview[0]+468,'('+string(exitx)+','+string(exity)+')')
deltax=exitx mod 32
deltay=exity mod 32
if deltax>16 {deltax-=32}
if deltay>16 {deltay-=32}
if deltax>0 && deltay>0 {draw_text(view_xview[0]+16,view_yview[0]+468,'(+'+string(deltax)+',+'+string(deltay)+')')}
if deltax>0 && deltay<=0 {draw_text(view_xview[0]+16,view_yview[0]+468,'(+'+string(deltax)+','+string(deltay)+')')}
if deltax<=0 && deltay>0 {draw_text(view_xview[0]+16,view_yview[0]+468,'('+string(deltax)+',+'+string(deltay)+')')}
if deltax<=0 && deltay<=0 {draw_text(view_xview[0]+16,view_yview[0]+468,'('+string(deltax)+','+string(deltay)+')')}
}*/
//水管出入口配对?
if  tak3=1 {
if shuiguanhele2=1 && shuiguanhele=0{
helewrap=global.warp[floor((abs(exitx)+16)/32)+50,floor((abs(exity)+16)/32)+50]
global.warp[floor((abs(exitx)+16)/32)+50,floor((abs(exity)+16)/32)+50]+=1
shuiguanhele=1}
if shuiguanhele2=0{
global.warp[floor((abs(exitx)+16)/32)+50,floor((abs(exity)+16)/32)+50]=1
shuiguanhele2=1
}
textx=exitx+72
texty=exity+58-12*(helewrap-1)

entrancecolor=make_color_rgb(128,128,255)
exitcolor=make_color_rgb(255,128,128)
draw_set_color(entrancecolor)
draw_set_font(cyferkimario)
draw_text(x-8,y+8,string(warpnum))
draw_set_color(exitcolor)
draw_text(textx,texty,string(warpnum))}
