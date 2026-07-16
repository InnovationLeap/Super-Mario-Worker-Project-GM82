#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !variable_local_exists('coto'){coto=0}
drink=0
cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0) // 定义字体
deltax=0
deltay=0
imweitiao=0
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !setonce{
    image_index = coto-1;
    setonce=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(s_edbonusbank,coto-1,x,y)
