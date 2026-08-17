#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
//Fox Writing init
//fw_release_cache();
//fw_set_encoding("GB18030");
//fw_draw_set_halign(fa_left);
//fw_draw_set_valign(fa_bottom);
//fw_enable_pixel_alignment(true);
//draw_set_color(c_white)
//fw_draw_set_line_spacing(4)
//Fox Writing init end
*/

myfont = fw_ensure_font(".\Fonts\message.ttf", 14, false, false, true)
fw_draw_set_font(myfont)

global.isDisplaying = -1
textMessage = ""
target = -1
targetShowed = 0
pointerReset = 0
pointer = 1
charCounter = 0
// 文字缓存（避免每帧 string_copy / ec_is_cjk 对长文本造成卡顿；不涉及 surface）
msg_len = 0
cache_built = 0

xpos=128+2
ypos=464+5
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if pointerReset = 1 {
    pointer = 1
    charCounter = 0
    pointerReset = 0
    // 新消息载入时，一次性预计算所有前缀子串与宽体字标记，避免每帧 string_copy / ec_is_cjk
    msg_len = string_length(textMessage)
    if msg_len > 0 {
        qk = 1
        while qk <= msg_len {
            disp_arr[qk] = string_copy(textMessage, 1, qk)
            wide_arr[qk] = ec_is_cjk(string_char_at(textMessage, qk))
            qk += 1
        }
    }
    cache_built = 1
}

if global.isDisplaying && keyboard_check_pressed(vk_enter) {
    global.isDisplaying=-1
    sound_play(snd_messageoff);
    sound_volume(snd_messageoff,global.game_volume)
}

if global.isDisplaying = -1 {
    pointer = 1
    charCounter = 0
    fw_draw_text(xpos,ypos,"")
}

//逐步显示文字
else {
    if targetShowed = 1 {
        fw_draw_text(xpos,ypos,textMessage)
    } else {
        //正在等待帧（上一字是宽体字需要停留）
        if charCounter > 0 {
            charCounter -= 1
            tempMessage = disp_arr[pointer - 1]
            fw_draw_text(xpos,ypos,tempMessage)
        }
        //还有未展示的字
        else if pointer <= msg_len {
            tempMessage = disp_arr[pointer]
            fw_draw_text(xpos,ypos,tempMessage)
            //判断刚展示的这个字是否为CJK宽体字
            isWide = wide_arr[pointer]
            if isWide > 0 {
                charCounter = 1
            }
            pointer += 1
        }
        //所有字已展示完毕
        else {
            fw_draw_text(xpos,ypos,textMessage)
            targetShowed = 1
            with(target)showed = 1
            pointer = 1
            charCounter = 0
        }
    }
}
