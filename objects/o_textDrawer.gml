#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
//Fox Writing init
fw_release_cache();
fw_set_encoding("GB18030");
testfont = fw_add_font_from_file(".\Fonts\message.ttf", 14, false, false, true)
fw_draw_set_font(testfont);
fw_draw_set_halign(fa_left);
fw_draw_set_valign(fa_bottom);
fw_enable_pixel_alignment(true);
draw_set_color(c_white)
fw_draw_set_line_spacing(4)
//Fox Writing init end
*/

global.isDisplaying = -1
textMessage = ""
target = -1
targetShowed = 0
pointerReset = 0
pointer = 1

xpos=128
ypos=464
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if pointerReset = 1{
    pointer = 1
    pointerReset = 0
}

if global.isDisplaying && keyboard_check_pressed(vk_enter){
    global.isDisplaying=-1
    sound_play(snd_messageoff);
    sound_volume(snd_messageoff,global.glosnosc)
    fw_release_cache()
}

if global.isDisplaying = -1{
    pointer = 1
    fw_draw_text(view_xview[0]+xpos,view_yview[0]+ypos,"")
}

//逐步显示文字
else{
    if targetShowed = 1{
        fw_draw_text(view_xview[0]+xpos,view_yview[0]+ypos,textMessage)
    }
    else{
        if pointer<string_length(textMessage){
            tempMessage = string_copy(textMessage,1,pointer)
            fw_draw_text(view_xview[0]+xpos,view_yview[0]+ypos,tempMessage)
            pointer+=1
        }
        else{
            fw_draw_text(view_xview[0]+xpos,view_yview[0]+ypos,textMessage)
            targetShowed = 1
            with(target)showed = 1
            pointer = 1
        }
    }
}

//直接显示所有文字
/*else{
    fw_draw_text(view_xview[0]+xpos,view_yview[0]+ypos,textMessage)
}*/
