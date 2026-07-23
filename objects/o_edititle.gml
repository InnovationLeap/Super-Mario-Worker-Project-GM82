#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fw_release_cache(); //信息转字体缓存清理

if !variable_global_exists('font_render') global.font_render = 0
fw_set_render_scale(1+global.font_render)

global.customMusicName = ''

view_xview[0]=1280
view_yview[0]=960
if global.zamenowane=0 view_angle[0]=-90
folia=0
opcjon=0

kreatuj=0
skipper=0
start=1
ciper=0

wafel=180

if global.zamenowane=1 {wafel=0}

cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0)



pufel=0
pufel2=20
pufel3=0

//键位设置
for(i=0;i<10;i+=1){setkey[ord('i')]=string(i)}
for(i=0;i<26;i+=1){setkey[ord('A')+i]=chr(ord('A')+i)}
setkey[vk_left]='left'
setkey[vk_right]='right'
setkey[vk_up]='up'
setkey[vk_down]='down'
setkey[vk_enter]='enter'
setkey[vk_escape]='esc'
setkey[vk_space]='space'
setkey[vk_shift]='shift'
setkey[vk_control]='ctrl'
setkey[vk_alt]='alt'
setkey[vk_backspace]='backspace'
setkey[vk_tab]='tab'
setkey[vk_home]='home'
setkey[vk_end]='end'
setkey[vk_delete]='delete'
setkey[vk_insert]='insert'
setkey[vk_pageup]='pgup'
setkey[vk_pagedown]='pgdn'
setkey[vk_pause]='pause'
setkey[vk_printscreen]='prtsc'
setkey[vk_f1]='f1'
setkey[vk_f2]='f2'
setkey[vk_f3]='f3'
setkey[vk_f4]='f4'
setkey[vk_f5]='f5'
setkey[vk_f6]='f6'
setkey[vk_f7]='f7'
setkey[vk_f8]='f8'
setkey[vk_f9]='f9'
setkey[vk_f10]='f10'
setkey[vk_f11]='f11'
setkey[vk_f12]='f12'
setkey[vk_multiply]='*'
setkey[vk_divide]=';'
setkey[vk_add]='+'
setkey[vk_subtract]='-'
setkey[vk_decimal]='.'
setkey[189]='-'
setkey[187]='='
setkey[219]='Left Square Bracket'
setkey[221]='Right Square Bracket'
setkey[220]='Reverse Solidus'
setkey[186]='Semicolon'
setkey[222]='Quotation'
setkey[188]='Comma'
setkey[190]='Full stop'
setkey[191]='/'

debug_skip = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !mouse_check_button(mb_left) && !mouse_check_button(mb_right) {kliknieto=0}

if global.escowanie=0 && globaloption=0 && keyboard_check(vk_escape){
    global.escowanie=1;
    if globaloption=0{game_end()}
    if globaloption=1 && keydetect=0{globaloption=0}
    if globaloption=1 && keydetect>0{keydetect=0}
}
if !(mouse_check_button(mb_left)&&mouse_check_button(mb_right)) && keydetect2=1 && keydetect>0{keydetect2=0}
if (mouse_check_button(mb_left)||mouse_check_button(mb_right)) && keydetect2=0 && keydetect>0{keydetect=0}
if global.escowanie=1 && !keyboard_check(vk_escape) {global.escowanie=0}

if staffmusic=1 && globaloption!=3{staffmusic=0;mm_stop_all_ext()}

if globaloption=0{
if start<=0 && wafel<=0 && global.zamenowane=0 {
draw_set_blend_mode(bm_add)
draw_sprite(sprite176,0,65+1280,320+960-pufel+410)
draw_set_blend_mode(bm_normal)
draw_sprite(sprite175,0,65+1280,320+964-pufel+410)


kreatuj+=1
if kreatuj>20 {instance_create(65+1280+random(60)-random(60),320+960-pufel+410+random(150)-random(200),object129)}



if pufel2<12 && pufel3=0 {pufel3=1; sound_play(snd_marioworker)}
if pufel2<2 && pufel3=1 {pufel3=2; sound_play(sound28);}
if pufel2<0.1 && pufel3=2 {pufel3=3;  mm_play_ext('.\Data\MW\ktkm120.dll',0) }

pufel+=pufel2
pufel2=pufel2/1.05
}

//

if !mouse_check_button(mb_left) && skipper=1 {skipper=0}
if mouse_check_button_pressed(mb_left) && skipper=0 && ciper=0{skipper=1; wafel=0;ciper=1 ;view_angle[0]=0}


if start>0 && wafel<=0
    {
    draw_set_blend_mode(bm_add)
    draw_background_ext(background10,view_xview[0],view_yview[0],1,1,0,c_white,start)
    draw_background_ext(background10,view_xview[0],view_yview[0],1,1,0,c_white,start)
    draw_set_blend_mode(bm_normal)
    start-=0.02
    }

view_angle[0]=view_angle[0]+wafel
if wafel>0 {wafel=wafel-1}


// Debug Skip
if debug_mode && debug_skip = 0 { debug_skip = 1; wafel = 0; ciper = 1; view_angle[0] = 0; start = 0; }


if (start<=0 && wafel<=0) || debug_mode {
ciper=1
opcjon=0; folia+=0.1
if mouse_x>128+1280 && mouse_x<250+1280 && mouse_y>160+960 && mouse_y<280+960
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_maskselector,0,128-4+1280,160+960,1,1,0,c_white,0.3+sin(folia)/10)
    draw_set_blend_mode(bm_normal)
    opcjon=1
    if mouse_check_button_pressed(mb_left) && skipper=0 {room_set_width(editor_level,640);room_set_height(editor_level,480);room_goto(editor_level);global.zamenowane=1;global.modifiedmov=1;global.layerord=2;global.rotodisclay=0}
    }

if mouse_x>128+131+9+1280  && mouse_x<250+131+9+1280  && mouse_y>160+960 && mouse_y<280+960
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_maskselector,0,128-4+131+9+1280,160+960,1,1,0,c_white,0.3+sin(folia)/10)
    draw_set_blend_mode(bm_normal)
    opcjon=2
    if mouse_check_button_pressed(mb_left) && skipper=0 {execute_shell('https://download.marioforever.net/mw-levels.html',0);global.zamenowane=1}
    }

if mouse_x>128+131+9+131+9+1280  && mouse_x<250+131+9+131+9+1280  && mouse_y>160+960 && mouse_y<280+960
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_maskselector,0,128-4+131+9+131+9+1280,160+960,1,1,0,c_white,0.3+sin(folia)/10)
    draw_set_blend_mode(bm_normal)
    opcjon=3
    if mouse_check_button_pressed(mb_left) && skipper=0 {Create_Scenario()}
    }

if mouse_x>128+1280  && mouse_x<250+1280  && mouse_y>160+131+9+22+960 && mouse_y<280+131+9+22+960
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_maskselector,0,128+1280 ,160+131+9+22+960,1,1,0,c_white,0.3+sin(folia)/10)
    draw_set_blend_mode(bm_normal)
    opcjon=3
    if mouse_check_button_pressed(mb_left) && skipper=0 {room_goto(Loader);global.zamenowane=1}
    }

if mouse_x>128+131+9+1280  && mouse_x<250+131+9+1280  && mouse_y>160+131+9+22+960 && mouse_y<280+131+9+22+960
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_maskselector,0,128+131+9+1280 ,160+131+9+22+960,1,1,0,c_white,0.3+sin(folia)/10)
    draw_set_blend_mode(bm_normal)
    opcjon=3
    if mouse_check_button_pressed(mb_left) && skipper=0 {room_goto(LoaderScenario);global.zamenowane=1}
    }

if mouse_x>128+131+9+131+9+1280  && mouse_x<250+131+9+131+9+1280 && mouse_y>160+131+9+22+960 && mouse_y<280+131+9+22+960
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_maskselector,0,128+131+9+131+1280,160+131+9+22+960,1,1,0,c_white,0.3+sin(folia)/10)
    draw_set_blend_mode(bm_normal)
    opcjon=3
    if mouse_check_button_pressed(mb_left) && skipper=0 {game_end()}
    }

if mouse_x>128+131+9+131+9+1280+131+9-20 && mouse_x<250+131+9+131+9+1280+131+9-48 && mouse_y>160+131+9+22+960+48-20 && mouse_y<280+131+9+22+960-48+32
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_maskselector,0,128+131+9+131+1280+9+131+15,160+131+9+22+960+48-18,0.5,0.5,0,c_white,0.3+sin(folia)/10)
    draw_set_blend_mode(bm_normal)
    opcjon=3
    if mouse_check_button_pressed(mb_left) && skipper=0 {execute_shell('https://zh.wiki.marioforever.net/wiki/Super_Mario_Worker_Project',0)}
    }

if mouse_x>128+131+9+131+9+1280+131+9-20 && mouse_x<250+131+9+131+9+1280+131+9-48 && mouse_y>160+131+9+22+960+48-20-80 && mouse_y<280+131+9+22+960-48+32-80
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_maskselector,0,128+131+9+131+1280+9+131+15,160+131+9+22+960+48-18-80,0.5,0.5,0,c_white,0.3+sin(folia)/10)
    draw_set_blend_mode(bm_normal)
    opcjon=3
    if mouse_check_button_pressed(mb_left) && skipper=0 {globaloption=1}
    }

if mouse_x>128+131+9+131+9+1280+131+9-20 && mouse_x<250+131+9+131+9+1280+131+9-48 && mouse_y>160+131+9+22+960+48-20-80-80 && mouse_y<280+131+9+22+960-48+32-80-80
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_maskselector,0,128+131+9+131+1280+9+131+15,160+131+9+22+960+48-18-80-80,0.5,0.5,0,c_white,0.3+sin(folia)/10)
    draw_set_blend_mode(bm_normal)
    opcjon=3
    if mouse_check_button_pressed(mb_left) && skipper=0 {execute_shell('https://smwp.marioforever.net/',0)}
    }

    }
}
    // 进入全局选项界面
if globaloption>0
    {
    draw_sprite(s_edadditional,1,view_xview[0],view_yview[0])
    draw_set_font(cyferkimario)
    //页面
    if globaloption=1{draw_set_color(c_yellow)}else{draw_set_color(c_white)}
    draw_text(view_xview[0]+450,view_yview[0]+150,string_upper('Game Config'))
    if ed_hit(450, 130, 150, 30)&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+450,view_yview[0]+140,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){
        globaloption=1
        }
    }
    if globaloption=2{draw_set_color(c_yellow)}else{draw_set_color(c_white)}
    draw_text(view_xview[0]+450,view_yview[0]+200,string_upper('Keyboard Config'))
    if ed_hit(450, 180, 150, 30)&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+450,view_yview[0]+190,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){
        globaloption=2
        }
    }
    if globaloption=3{draw_set_color(c_yellow)}else{draw_set_color(c_white)}
    draw_text(view_xview[0]+450,view_yview[0]+250,string_upper('Staff Roll'))
    if ed_hit(450, 230, 150, 30)&& kliknieto=0 &&globaloption!=3
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+450,view_yview[0]+240,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){
        globaloption=3
        staffmusic=1
        staffY=view_yview+480
        mm_play_ext('.\Data\MFR\ktkm0.dll',0);
        }
    }

    //第一页
    if globaloption=1{
        //临时文件数量
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('Temporary Files'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+100,string(global.maxtemp))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 90, 190, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+90,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){
                global.maxtemp=get_integer("Set the max number of the temporary files.",global.maxtemp)
            }
        }
        //开启坐标偏移
        draw_text(view_xview[0]+40,view_yview[0]+130,string_upper('Object Offset Correct'))
        draw_set_halign(fa_right)
        if global.objectoffset=0{draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+130,string_upper('yes'))}
        if global.objectoffset=1{draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+130,string_upper('no'))}
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 120, 190, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+120,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){global.objectoffset=1-global.objectoffset;kliknieto=1;
                ini_write_real('GameConfig','ObjOffset',global.objectoffset)
            }
        }
        //窗口化
        draw_text(view_xview[0]+40,view_yview[0]+160,string_upper('Display Mode'))
        draw_set_halign(fa_right)
        if global.displaymode=1{draw_text(view_xview[0]+405,view_yview[0]+160,string_upper('Full Screen'))}
        if global.displaymode=0{draw_text(view_xview[0]+405,view_yview[0]+160,string_upper('Window Screen'))}
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 150, 190, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+150,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){global.displaymode=1-global.displaymode;kliknieto=1;
                if global.displaymode=0{window_set_fullscreen(0)}
                if global.displaymode=1{window_set_fullscreen(1)}
            }
        }
        //顺滑模式edit
        draw_text(view_xview[0]+40,view_yview[0]+190,string_upper('Smooth Mode (edit)'))
        draw_set_halign(fa_right)
        if global.smoothmode=1{draw_set_color(c_red);draw_text(view_xview[0]+405,view_yview[0]+190,string_upper('Yes'))}
        if global.smoothmode=-1{draw_text(view_xview[0]+405,view_yview[0]+190,string_upper('No'))}
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 180, 190, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+180,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){global.smoothmode=-global.smoothmode;kliknieto=1;
                if global.smoothmode=1{show_message("Warning: This is a beta-test function, and may cause many problems.#You could turn it off by pressing F11 when editing the level.")}
            }
        }
        //顺滑模式level
        draw_text(view_xview[0]+40,view_yview[0]+220,string_upper('Smooth Mode (play)'))
        draw_set_halign(fa_right)
        if global.levelsmooth=1{draw_set_color(c_red);draw_text(view_xview[0]+405,view_yview[0]+220,string_upper('Yes'))}
        if global.levelsmooth=-1{draw_text(view_xview[0]+405,view_yview[0]+220,string_upper('No'))}
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 210, 190, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+210,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){global.levelsmooth=-global.levelsmooth;kliknieto=1;
                if global.levelsmooth=1{show_message("Warning: This is a beta-test function, and may cause many problems.#You could turn it off by pressing F11 when playing the level.")}
            }
        }
        //颜色辅助模式
        draw_text(view_xview[0]+40,view_yview[0]+250,string_upper('Accessibility Mode (color)'))
        draw_set_halign(fa_right)
        if global.assist=1{draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+250,string_upper('Yes'))}
        if global.assist=0{draw_text(view_xview[0]+405,view_yview[0]+250,string_upper('No'))}
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 240, 190, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+240,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){global.assist=1-global.assist;kliknieto=1;
                if global.assist=1{show_message("Attention: This function aims to help users distinguish colors.#Switch blocks and yinyang blocks will be marked with letters corresponding to their colors:#R-Red, G-Green, B-Blue, C-Cyan, M-Magenta, Y-Yellow, K-Black, W-White.")}
                ini_write_real('GameConfig','Assist',global.assist)
            }
        }
        //音乐包设置
        draw_text(view_xview[0]+40,view_yview[0]+280,string_upper('Custom Music Package'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+280,string_upper(global.customMusic))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 270, 190, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+270,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){
                global.customMusic = get_string('Enter the name of your custom music package. The package should be a folder located at \data\custom.',global.customMusic)
                ini_write_string('GameConfig','CustomMusicPackage',global.customMusic)
                music_list_update();
            }
        }

        //单关初始命数
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+310,string_upper('Initial Lives of Single Level'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+310,string(global.initiallives))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 300, 190, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+300,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){
                global.initiallives=get_integer("Set initial lives while playing single level.",global.initiallives)
                ini_write_real('GameConfig','InitialLives',global.initiallives)
            }
        }

        //2x 字体渲染
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+340,string_upper('2x Font Render'))
        draw_set_halign(fa_right)
        if global.font_render=1{draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+340,string_upper('Yes'))}
        if global.font_render=0{draw_text(view_xview[0]+405,view_yview[0]+340,string_upper('No'))}
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 330, 190, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+330,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){global.font_render=1-global.font_render;kliknieto=1;
                ini_write_real('GameConfig','2xFontRender',global.font_render)
                fw_set_render_scale(1+global.font_render)
            }
        }

    }
    //第二页
    if globaloption=2{
        //上键
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('Up'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+100,string_upper(keyshow1))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 90, 190, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+90,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){
                keydetect=1;keydetect2=1
            }
        }
        if keydetect=1{keyshow1='press a key...'}else{keyshow1=setkey[global.sterowaniegora]}
        if keydetect=1 && keyboard_check_released(vk_anykey) && (keyboard_lastkey!=0&&keyboard_lastkey<=222){
            global.sterowaniegora=keyboard_lastkey
            ini_write_real('KeyConfig','up',global.sterowaniegora)
            keydetect=0
        }
        //下键
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+130,string_upper('Down'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+130,string_upper(keyshow2))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 120, 190, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+120,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){
                keydetect=2;keydetect2=1
            }
        }
        if keydetect=2{keyshow2='press a key...'}else{keyshow2=setkey[global.sterowaniedol]}
        if keydetect=2 && keyboard_check_released(vk_anykey) && (keyboard_lastkey!=0&&keyboard_lastkey<=222){
            global.sterowaniedol=keyboard_lastkey
            ini_write_real('KeyConfig','down',global.sterowaniedol)
            keydetect=0
        }
        //左键
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+160,string_upper('Left'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+160,string_upper(keyshow3))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 150, 190, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+150,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){
                keydetect=3;keydetect2=1
            }
        }
        if keydetect=3{keyshow3='press a key...'}else{keyshow3=setkey[global.sterowanielewo]}
        if keydetect=3 && keyboard_check_released(vk_anykey) && (keyboard_lastkey!=0&&keyboard_lastkey<=222){
            global.sterowanielewo=keyboard_lastkey
            ini_write_real('KeyConfig','left',global.sterowanielewo)
            keydetect=0
        }
        //右键
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+190,string_upper('Right'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+190,string_upper(keyshow4))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 180, 190, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+180,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){
                keydetect=4;keydetect2=1
            }
        }
        if keydetect=4{keyshow4='press a key...'}else{keyshow4=setkey[global.sterowanieprawo]}
        if keydetect=4 && keyboard_check_released(vk_anykey) && (keyboard_lastkey!=0&&keyboard_lastkey<=222){
            global.sterowanieprawo=keyboard_lastkey
            ini_write_real('KeyConfig','right',global.sterowanieprawo)
            keydetect=0
        }
        //跳键
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+220,string_upper('Jump'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+220,string_upper(keyshow5))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 210, 190, 30)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+210,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){
                keydetect=5;keydetect2=1
            }
        }
        if keydetect=5{keyshow5='press a key...'}else{keyshow5=setkey[global.sterowanieskok]}
        if keydetect=5 && keyboard_check_released(vk_anykey) && (keyboard_lastkey!=0&&keyboard_lastkey<=222){
            global.sterowanieskok=keyboard_lastkey
            ini_write_real('KeyConfig','jump',global.sterowanieskok)
            keydetect=0
        }
        //开火键
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+250,string_upper('Fire'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+250,string_upper(keyshow6))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 240, 220, 30)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+240,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){
                keydetect=6;keydetect2=1
            }
        }
        if keydetect=6{keyshow6='press a key...'}else{keyshow6=setkey[global.sterowaniebieg]}
        if keydetect=6 && keyboard_check_released(vk_anykey) && (keyboard_lastkey!=0&&keyboard_lastkey<=222){
            global.sterowaniebieg=keyboard_lastkey
            ini_write_real('KeyConfig','fire',global.sterowaniebieg)
            keydetect=0
        }
        //10自杀键/自爆键
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+280,string_upper('Restart Level'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+280,string_upper(keyshow10))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 270, 220, 30)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+270,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){
                keydetect=10;keydetect2=1
            }
        }
        if keydetect=10{keyshow10='press a key...'}else{keyshow10=setkey[global.restartlevelkey]}
        if keydetect=10 && keyboard_check_released(vk_anykey) && (keyboard_lastkey!=0&&keyboard_lastkey<=222){
            global.restartlevelkey=keyboard_lastkey
            ini_write_real('KeyConfig','restartlevel',global.restartlevelkey)
            keydetect=0
        }

        //编辑界面按键
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+310,string_upper('---editor key config---'))


        //7提取键
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+340,string_upper('pick'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+340,string_upper(keyshow7))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 330, 220, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+330,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){
                keydetect=7;keydetect2=1
            }
        }
        if keydetect=7{keyshow7='press a key...'}else{keyshow7=setkey[global.key_pick]}
        if keydetect=7 && keyboard_check_released(vk_anykey) && (keyboard_lastkey!=0&&keyboard_lastkey<=222){
            global.key_pick=keyboard_lastkey
            ini_write_real('KeyConfig','pick',global.key_pick)
            keydetect=0
        }

        //8微调键
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+370,string_upper('accurate move'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+370,string_upper(keyshow8))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 360, 220, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+360,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){
                keydetect=8;keydetect2=1
            }
        }
        if keydetect=8{keyshow8='press a key...'}else{keyshow8=setkey[global.key_select]}
        if keydetect=8 && keyboard_check_released(vk_anykey) && (keyboard_lastkey!=0&&keyboard_lastkey<=222){
            global.key_select=keyboard_lastkey
            ini_write_real('KeyConfig','accurate_move',global.key_select)
            keydetect=0
        }

        //9子菜单键
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+400,string_upper('submenu'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+400,string_upper(keyshow9))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 390, 220, 20)&& kliknieto=0
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+390,1.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){
                keydetect=9;keydetect2=1
            }
        }
        if keydetect=9{keyshow9='press a key...'}else{keyshow9=setkey[global.key_submenu]}
        if keydetect=9 && keyboard_check_released(vk_anykey) && (keyboard_lastkey!=0&&keyboard_lastkey<=222){
            global.key_submenu=keyboard_lastkey
            ini_write_real('KeyConfig','submenu',global.key_submenu)
            keydetect=0
        }
        //警告提示
        if keyboard_lastkey>222 {
            draw_set_color(c_yellow);
            draw_text(view_xview[0]+40,view_yview[0]+280,string_upper('Warning:'));
            draw_text(view_xview[0]+40,view_yview[0]+300,string_upper('It is likely that you are using'));
            draw_text(view_xview[0]+40,view_yview[0]+320,string_upper('a Chinese input method. Turn'));
            draw_text(view_xview[0]+40,view_yview[0]+340,string_upper('it off or this function may'));
            draw_text(view_xview[0]+40,view_yview[0]+360,string_upper('not work well.'));
            draw_set_color(c_white);
        }
    }
    //第三页
    if globaloption=3{
        draw_set_color(c_white)
        draw_sprite(s_staffroll,0,view_xview,staffY)
        staffY-=0.5
        if staffY<=view_yview+480-2000{staffY+=2000}
        draw_sprite_part(s_edadditional,1,0,0,450,85,view_xview[0],view_yview[0])
        //draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('This page is working in progress yet.'))
        //draw_text(view_xview[0]+40,view_yview[0]+120,string_upper('If you want to see this page soon,'))
        //draw_text(view_xview[0]+40,view_yview[0]+140,string_upper('contact @longzongkuiyan.'))
    }
    //退出
    if ed_hit(561, 427, 60, 30){
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+561,view_yview[0]+427,0.5,1.3,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        quitadditional=1}else
    {quitadditional=0}
    if mouse_check_button(mb_left) && quitadditional=1
    {globaloption=0;}
    }

// SMWP 单关 TAS 入口
//global.smwptas = 1;

// 检测按键序列 S -> M -> W -> P -> T -> A -> S
if global.smwptas == 0 { // 只有在未激活状态下才检测
    // 检测S键
    if keyboard_check_pressed(ord('S')) {
        if smwptas_sequence == 0 || smwptas_sequence == 6 {
            smwptas_sequence += 1;
            // 完成最后一个S的输入，激活
            if smwptas_sequence == 7 {
                global.smwptas = 1;
            }
        } else {
            smwptas_sequence = 0; // 输入错误，重置序列
        }
    }
    else if keyboard_check_pressed(ord('M')) && smwptas_sequence == 1 { smwptas_sequence = 2; } // 检测M键
    else if keyboard_check_pressed(ord('W')) && smwptas_sequence == 2 { smwptas_sequence = 3; } // 检测W键
    else if keyboard_check_pressed(ord('P')) && smwptas_sequence == 3 { smwptas_sequence = 4; } // 检测P键
    else if keyboard_check_pressed(ord('T')) && smwptas_sequence == 4 { smwptas_sequence = 5; } // 检测T键
    else if keyboard_check_pressed(ord('A')) && smwptas_sequence == 5 { smwptas_sequence = 6; } // 检测A键
    else if keyboard_check_pressed(vk_anykey) { smwptas_sequence = 0; } // 按下了其他无关按键重置序列
}

if global.smwptas {
    room_goto(Loader); global.zamenowane = 1;
    sound_stop_all(); // 防止 INL 音效残留
}
