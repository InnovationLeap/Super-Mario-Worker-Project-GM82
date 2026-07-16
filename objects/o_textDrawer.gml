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
charCounter = 0

xpos=128+2
ypos=464
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if pointerReset = 1{
    pointer = 1
    charCounter = 0
    pointerReset = 0
}

if global.isDisplaying && keyboard_check_pressed(vk_enter){
    global.isDisplaying=-1
    sound_play(snd_messageoff);
    sound_volume(snd_messageoff,global.glosnosc)
}

if global.isDisplaying = -1{
    pointer = 1
    charCounter = 0
    fw_draw_text(xpos,ypos,"")
}

//逐步显示文字
else{
    if targetShowed = 1{
        fw_draw_text(xpos,ypos,textMessage)
    }
    else{
        //正在等待帧（上一字是宽体字需要停留）
        if charCounter > 0{
            charCounter -= 1
            tempMessage = string_copy(textMessage,1,pointer - 1)
            fw_draw_text(xpos,ypos,tempMessage)
        }
        //还有未展示的字
        else if pointer <= string_length(textMessage){
            tempMessage = string_copy(textMessage,1,pointer)
            fw_draw_text(xpos,ypos,tempMessage)
            //判断刚展示的这个字是否为CJK宽体字
            nextChar = string_char_at(textMessage,pointer)
            isWide = ec_is_cjk(nextChar)
            if isWide > 0{
                charCounter = 1
            }
            pointer += 1
        }
        //所有字已展示完毕
        else{
            fw_draw_text(xpos,ypos,textMessage)
            targetShowed = 1
            with(target)showed = 1
            pointer = 1
            charCounter = 0
        }
    }
}
