#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0) // 定义字体
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
if global.etapkuppa>=0 && global.etapkuppa<=20 image_index=global.etapkuppa
if global.etapkuppa>20 {
    image_index=20
}
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.etapkuppa>=0 && global.etapkuppa<=20     draw_sprite(s_kuppaenergy,global.etapkuppa,x,y)
if global.etapkuppa>20 && global.etapkuppa<=500 {
    image_index=20
    draw_sprite(s_kuppaenergy,20,x,y)
    hele=make_color_rgb(255,64,64)
    draw_set_color(hele)
    draw_set_font(cyferkimario)
    draw_text(x+100,y+50,string(global.etapkuppa))
}
