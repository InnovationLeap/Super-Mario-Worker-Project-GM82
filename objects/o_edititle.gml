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

keyboard_page=0

//键位设置
for(i=0;i<10;i+=1) {setkey[ord('0')+i]=string(i)}
for(i=0;i<26;i+=1) {setkey[ord('A')+i]=chr(ord('A')+i)}
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

if global.escowanie=0 && globaloption=0 && keyboard_check(vk_escape) {
    global.escowanie=1;
    if globaloption=0 {game_end()}
    if globaloption=1 && keydetect=0 {globaloption=0}
    if globaloption=1 && keydetect>0 {keydetect=0}
}
if !(mouse_check_button(mb_left)&&mouse_check_button(mb_right)) && keydetect2=1 && keydetect>0 {keydetect2=0}
if (mouse_check_button(mb_left)||mouse_check_button(mb_right)) && keydetect2=0 && keydetect>0 {keydetect=0}
if global.escowanie=1 && !keyboard_check(vk_escape) {global.escowanie=0}

if staffmusic=1 && globaloption!=3 {staffmusic=0;mm_stop_all_ext()}

if globaloption=0 {
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
    if mouse_check_button_pressed(mb_left) && skipper=0 && ciper=0 {skipper=1; wafel=0;ciper=1 ;view_angle[0]=0}


    if start>0 && wafel<=0 {
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
        if mouse_x>128+1280 && mouse_x<250+1280 && mouse_y>160+960 && mouse_y<280+960 {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_maskselector,0,128-4+1280,160+960,1,1,0,c_white,0.3+sin(folia)/10)
            draw_set_blend_mode(bm_normal)
            opcjon=1
            if mouse_check_button_pressed(mb_left) && skipper=0 {room_set_width(editor_level,640);room_set_height(editor_level,480);room_goto(editor_level);global.zamenowane=1;global.modifiedmov=1;global.layerord=2;global.rotodisclay=0}
        }

        if mouse_x>128+131+9+1280  && mouse_x<250+131+9+1280  && mouse_y>160+960 && mouse_y<280+960 {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_maskselector,0,128-4+131+9+1280,160+960,1,1,0,c_white,0.3+sin(folia)/10)
            draw_set_blend_mode(bm_normal)
            opcjon=2
            if mouse_check_button_pressed(mb_left) && skipper=0 {execute_shell('https://download.marioforever.net/mw-levels.html',0);global.zamenowane=1}
        }

        if mouse_x>128+131+9+131+9+1280  && mouse_x<250+131+9+131+9+1280  && mouse_y>160+960 && mouse_y<280+960 {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_maskselector,0,128-4+131+9+131+9+1280,160+960,1,1,0,c_white,0.3+sin(folia)/10)
            draw_set_blend_mode(bm_normal)
            opcjon=3
            if mouse_check_button_pressed(mb_left) && skipper=0 {Create_Scenario()}
        }

        if mouse_x>128+1280  && mouse_x<250+1280  && mouse_y>160+131+9+22+960 && mouse_y<280+131+9+22+960 {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_maskselector,0,128+1280 ,160+131+9+22+960,1,1,0,c_white,0.3+sin(folia)/10)
            draw_set_blend_mode(bm_normal)
            opcjon=3
            if mouse_check_button_pressed(mb_left) && skipper=0 {room_goto(Loader);global.zamenowane=1}
        }

        if mouse_x>128+131+9+1280  && mouse_x<250+131+9+1280  && mouse_y>160+131+9+22+960 && mouse_y<280+131+9+22+960 {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_maskselector,0,128+131+9+1280 ,160+131+9+22+960,1,1,0,c_white,0.3+sin(folia)/10)
            draw_set_blend_mode(bm_normal)
            opcjon=3
            if mouse_check_button_pressed(mb_left) && skipper=0 {room_goto(LoaderScenario);global.zamenowane=1}
        }

        if mouse_x>128+131+9+131+9+1280  && mouse_x<250+131+9+131+9+1280 && mouse_y>160+131+9+22+960 && mouse_y<280+131+9+22+960 {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_maskselector,0,128+131+9+131+1280,160+131+9+22+960,1,1,0,c_white,0.3+sin(folia)/10)
            draw_set_blend_mode(bm_normal)
            opcjon=3
            if mouse_check_button_pressed(mb_left) && skipper=0 {game_end()}
        }

        if mouse_x>128+131+9+131+9+1280+131+9-20 && mouse_x<250+131+9+131+9+1280+131+9-48 && mouse_y>160+131+9+22+960+48-20 && mouse_y<280+131+9+22+960-48+32 {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_maskselector,0,128+131+9+131+1280+9+131+15,160+131+9+22+960+48-18,0.5,0.5,0,c_white,0.3+sin(folia)/10)
            draw_set_blend_mode(bm_normal)
            opcjon=3
            if mouse_check_button_pressed(mb_left) && skipper=0 {execute_shell('https://zh.wiki.marioforever.net/wiki/Super_Mario_Worker_Project',0)}
        }

        if mouse_x>128+131+9+131+9+1280+131+9-20 && mouse_x<250+131+9+131+9+1280+131+9-48 && mouse_y>160+131+9+22+960+48-20-80 && mouse_y<280+131+9+22+960-48+32-80 {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_maskselector,0,128+131+9+131+1280+9+131+15,160+131+9+22+960+48-18-80,0.5,0.5,0,c_white,0.3+sin(folia)/10)
            draw_set_blend_mode(bm_normal)
            opcjon=3
            if mouse_check_button_pressed(mb_left) && skipper=0 {globaloption=1}
        }

        if mouse_x>128+131+9+131+9+1280+131+9-20 && mouse_x<250+131+9+131+9+1280+131+9-48 && mouse_y>160+131+9+22+960+48-20-80-80 && mouse_y<280+131+9+22+960-48+32-80-80 {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_maskselector,0,128+131+9+131+1280+9+131+15,160+131+9+22+960+48-18-80-80,0.5,0.5,0,c_white,0.3+sin(folia)/10)
            draw_set_blend_mode(bm_normal)
            opcjon=3
            if mouse_check_button_pressed(mb_left) && skipper=0 {execute_shell('https://smwp.marioforever.net/',0)}
        }

    }
}
// 进入全局选项界面
if globaloption>0 {
    draw_sprite(s_edadditional,1,view_xview[0],view_yview[0])
    draw_set_font(cyferkimario)
    //页面
    if globaloption=1 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
    draw_text(view_xview[0]+450,view_yview[0]+150,string_upper('Game Config'))
    if ed_hit(450, 130, 150, 30)&& kliknieto=0 {
        draw_prefs_highlight(view_xview[0]+450, view_yview[0]+140, 1.4, 0.8, 0.2);
        if mouse_check_button(mb_left) {
            globaloption=1
        }
    }
    if globaloption=2 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
    draw_text(view_xview[0]+450,view_yview[0]+200,string_upper('Keyboard Config'))
    if ed_hit(450, 180, 150, 30)&& kliknieto=0 {
        draw_prefs_highlight(view_xview[0]+450, view_yview[0]+190, 1.4, 0.8, 0.2);
        if mouse_check_button(mb_left) {
            globaloption=2
            keyboard_page=0
        }
    }
    if globaloption=3 {draw_set_color(c_yellow)} else {draw_set_color(c_white)}
    draw_text(view_xview[0]+450,view_yview[0]+250,string_upper('Staff Roll'))
    if ed_hit(450, 230, 150, 30)&& kliknieto=0 &&globaloption!=3 {
        draw_prefs_highlight(view_xview[0]+450, view_yview[0]+240, 1.4, 0.8, 0.2);
        if mouse_check_button(mb_left) {
            globaloption=3
            staffmusic=1
            staffY=view_yview+480
            mm_play_ext('.\Data\MFR\ktkm0.dll',0);
        }
    }

    //第一页
    if globaloption=1 {
        //临时文件数量
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('Temporary Files'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+100,string(global.maxtemp))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 90, 190, 20)&& kliknieto=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+90, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {
                global.maxtemp=get_integer("Set the max number of the temporary files.",global.maxtemp)
            }
        }
        //开启坐标偏移
        draw_text(view_xview[0]+40,view_yview[0]+130,string_upper('Object Offset Correct'))
        draw_set_halign(fa_right)
        if global.objectoffset=0 {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+130,string_upper('yes'))}
        if global.objectoffset=1 {draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+130,string_upper('no'))}
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 120, 190, 20)&& kliknieto=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+120, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {global.objectoffset=1-global.objectoffset;kliknieto=1;
                ini_write_real('GameConfig','ObjOffset',global.objectoffset)
            }
        }
        //窗口化
        draw_text(view_xview[0]+40,view_yview[0]+160,string_upper('Display Mode'))
        draw_set_halign(fa_right)
        if global.displaymode=1 {draw_text(view_xview[0]+405,view_yview[0]+160,string_upper('Full Screen'))}
        if global.displaymode=0 {draw_text(view_xview[0]+405,view_yview[0]+160,string_upper('Window Screen'))}
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 150, 190, 20)&& kliknieto=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+150, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {global.displaymode=1-global.displaymode;kliknieto=1;
                if global.displaymode=0 {window_set_fullscreen(0)}
                if global.displaymode=1 {window_set_fullscreen(1)}
            }
        }
        //顺滑模式edit
        draw_text(view_xview[0]+40,view_yview[0]+190,string_upper('Smooth Mode (edit)'))
        draw_set_halign(fa_right)
        if global.smoothmode=1 {draw_set_color(c_red);draw_text(view_xview[0]+405,view_yview[0]+190,string_upper('Yes'))}
        if global.smoothmode=-1 {draw_text(view_xview[0]+405,view_yview[0]+190,string_upper('No'))}
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 180, 190, 20)&& kliknieto=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+180, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {global.smoothmode=-global.smoothmode;kliknieto=1;
                if global.smoothmode=1 {show_message("Warning: This is a beta-test function, and may cause many problems.#You could turn it off by pressing F11 when editing the level.")}
            }
        }
        //顺滑模式level
        draw_text(view_xview[0]+40,view_yview[0]+220,string_upper('Smooth Mode (play)'))
        draw_set_halign(fa_right)
        if global.levelsmooth=1 {draw_set_color(c_red);draw_text(view_xview[0]+405,view_yview[0]+220,string_upper('Yes'))}
        if global.levelsmooth=-1 {draw_text(view_xview[0]+405,view_yview[0]+220,string_upper('No'))}
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 210, 190, 20)&& kliknieto=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+210, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {global.levelsmooth=-global.levelsmooth;kliknieto=1;
                if global.levelsmooth=1 {show_message("Warning: This is a beta-test function, and may cause many problems.#You could turn it off by pressing F11 when playing the level.")}
            }
        }
        //颜色辅助模式
        draw_text(view_xview[0]+40,view_yview[0]+250,string_upper('Accessibility Mode (color)'))
        draw_set_halign(fa_right)
        if global.assist=1 {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+250,string_upper('Yes'))}
        if global.assist=0 {draw_text(view_xview[0]+405,view_yview[0]+250,string_upper('No'))}
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 240, 190, 20)&& kliknieto=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+240, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {global.assist=1-global.assist;kliknieto=1;
                if global.assist=1 {show_message("Attention: This function aims to help users distinguish colors.#Switch blocks and yinyang blocks will be marked with letters corresponding to their colors:#R-Red, G-Green, B-Blue, C-Cyan, M-Magenta, Y-Yellow, K-Black, W-White.")}
                ini_write_real('GameConfig','Assist',global.assist)
            }
        }
        //音乐包设置
        draw_text(view_xview[0]+40,view_yview[0]+280,string_upper('Custom Music Package'))
        draw_set_halign(fa_right)
        draw_text(view_xview[0]+405,view_yview[0]+280,string_upper(global.customMusic))
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 270, 190, 20)&& kliknieto=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+270, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {
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
        if ed_hit(40, 300, 190, 20)&& kliknieto=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+300, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {
                global.initiallives=get_integer("Set initial lives while playing single level.",global.initiallives)
                ini_write_real('GameConfig','InitialLives',global.initiallives)
            }
        }

        //2x 字体渲染
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+340,string_upper('2x Font Render'))
        draw_set_halign(fa_right)
        if global.font_render=1 {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+340,string_upper('Yes'))}
        if global.font_render=0 {draw_text(view_xview[0]+405,view_yview[0]+340,string_upper('No'))}
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 330, 190, 20)&& kliknieto=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+330, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {global.font_render=1-global.font_render;kliknieto=1;
                ini_write_real('GameConfig','2xFontRender',global.font_render)
                fw_set_render_scale(1+global.font_render)
            }
        }

        //保存时压缩文件
        draw_set_color(c_white)
        draw_text(view_xview[0]+40,view_yview[0]+370,string_upper('Compress file when saving'))
        draw_set_halign(fa_right)
        if global.compress_save=1 {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+370,string_upper('Yes'))}
        if global.compress_save=0 {draw_text(view_xview[0]+405,view_yview[0]+370,string_upper('No'))}
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 360, 190, 20)&& kliknieto=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+360, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {global.compress_save=1-global.compress_save;kliknieto=1;
                ini_write_real('GameConfig','CompressSave',global.compress_save)
            }
        }

    }
    //第二页 - 键盘设置
    if globaloption=2 {

        //========== PAGE 0: 游戏按键 + 基础编辑器按键 ==========
        if keyboard_page=0 {
            //上键
            ed_keyrow(1,'Up',100,'key_up','up')
            //下键
            ed_keyrow(2,'Down',130,'key_down','down')
            //左键
            ed_keyrow(3,'Left',160,'key_left','left')
            //右键
            ed_keyrow(4,'Right',190,'key_right','right')
            //跳键
            ed_keyrow(5,'Jump',220,'key_jump','jump')
            //开火键
            ed_keyrow(6,'Fire',250,'key_fire','fire')
            //10自杀键/自爆键
            ed_keyrow(10,'Restart Level',280,'key_restart','restartlevel')

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

        //========== PAGE 1: God Mode 数字键 (1~0) ==========
        if keyboard_page=1 {
            draw_set_color(c_white)
            draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('--- God Mode Keys ---'))
            draw_set_color(c_white)
            // 1: Small Mario
            ed_keyrow(50,'Small Mario',125,'godkey_small','god_small')
            // 2: Big Mario
            ed_keyrow(51,'Big Mario',150,'godkey_big','god_big')
            // 3: Fire Flower
            ed_keyrow(52,'Fire Flower',175,'godkey_fire','god_fire')
            // 4: Green Lui
            ed_keyrow(53,'Green Lui',200,'godkey_fruit','god_fruit')
            // 5: Beet
            ed_keyrow(54,'Beet',225,'godkey_beet','god_beet')
            // 6: Super Star
            ed_keyrow(55,'Super Star',250,'godkey_star','god_star')
            // 7: Invincible
            ed_keyrow(56,'Invincible',275,'godkey_invincible','god_invincible')
            // 8: Toggle Fly
            ed_keyrow(57,'Toggle Fly',300,'godkey_fly','god_fly')
            // 9: Extra Life
            ed_keyrow(58,'Extra Life',325,'godkey_life','god_life')
            // 0: Toggle Scroll
            ed_keyrow(59,'Toggle Scroll',350,'godkey_scroll','god_scroll')
            // Raccoon (-)
            ed_keyrow(65,'Raccoon',375,'godkey_raccoon','god_raccoon')
        }

        //========== PAGE 2: God Mode 辅助键 (PgUp/PgDn/Backspace) ==========
        if keyboard_page=2 {
            draw_set_color(c_white)
            draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('--- God Mode Extra Keys ---'))
            draw_set_color(c_white)
            // 1: Check Point Prev (PgUp)
            ed_keyrow(60,'CP Prev',125,'godkey_cp_prev','god_cp_prev')
            // 2: Check Point Next (PgDn)
            ed_keyrow(61,'CP Next',155,'godkey_cp_next','god_cp_next')
            // 3: Cancel Scroll (Backspace)
            ed_keyrow(62,'Cancel Scroll',185,'godkey_bowser','god_bowser')
        }

        //========== PAGE 3: 基础编辑键 + 保存/读取 ==========
        if keyboard_page=3 {
            draw_set_color(c_white)
            draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('--- Basic Editor Keys ---'))

            // 7: PICK
            ed_keyrow(7,'Pick',125,'key_pick','pick')

            // 8: ACCURATE MOVE
            ed_keyrow(8,'Accurate Move',150,'key_select','accurate_move')

            // 9: SUBMENU
            ed_keyrow(9,'Submenu',175,'key_submenu','submenu')

            // 22: CANCEL
            ed_keyrow(22,'Cancel',200,'key_ed_cancel','ed_cancel')

            draw_set_color(c_white)
            draw_text(view_xview[0]+40,view_yview[0]+230,string_upper('--- Save / Load ---'))

            // 23: Save (Ctrl+)
            ed_keyrow(23,'Save (Ctrl+)',255,'key_ed_save','ed_save')

            // 24: Load (Ctrl+)
            ed_keyrow(24,'Load (Ctrl+)',280,'key_ed_load','ed_load')

            // 46: Ed Panel
            ed_keyrow(46,'Edit Panel',305,'key_ed_pause','ed_pause')

            // 47: Ed Delete (删除模式)
            ed_keyrow(47,'Delete Mode',330,'key_ed_delete','ed_delete')
        }

        //========== PAGE 4: 编辑器画布滚动 (8键) ==========
        if keyboard_page=4 {
            draw_set_color(c_white)
            draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('--- ED SCROLL ---'))

            // 11: Ed Scroll Left 1
            ed_keyrow(11,'Ed Scroll Left 1',125,'key_ed_left','ed_left')

            // 33: Ed Scroll Left 2
            ed_keyrow(33,'Ed Scroll Left 2',150,'key_ed_left_2','ed_left_2')

            // 12: Ed Scroll Right 1
            ed_keyrow(12,'Ed Scroll Right 1',175,'key_ed_right','ed_right')

            // 34: Ed Scroll Right 2
            ed_keyrow(34,'Ed Scroll Right 2',200,'key_ed_right_2','ed_right_2')

            // 13: Ed Scroll Up 1
            ed_keyrow(13,'Ed Scroll Up 1',225,'key_ed_up','ed_up')

            // 35: Ed Scroll Up 2
            ed_keyrow(35,'Ed Scroll Up 2',250,'key_ed_up_2','ed_up_2')

            // 14: Ed Scroll Down 1
            ed_keyrow(14,'Ed Scroll Down 1',275,'key_ed_down','ed_down')

            // 36: Ed Scroll Down 2
            ed_keyrow(36,'Ed Scroll Down 2',300,'key_ed_down_2','ed_down_2')

            // 63: Ed CP Prev (jump to previous checkpoint)
            ed_keyrow(63,'Ed CP Prev Jump',325,'edkey_cp_prev','ed_cp_prev')

            // 64: Ed CP Next (jump to next checkpoint)
            ed_keyrow(64,'Ed CP Next Jump',350,'edkey_cp_next','ed_cp_next')
        }

        //========== PAGE 5: 缩放 + 水位 + 功能键 ==========
        if keyboard_page=5 {
            draw_set_color(c_white)
            draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('--- Zoom ---'))

            // 15: Zoom In
            ed_keyrow(15,'Zoom In (Ctrl+)',125,'key_zoomin','zoomin')

            // 16: Zoom Out
            ed_keyrow(16,'Zoom Out (Ctrl+)',150,'key_zoomout','zoomout')

            draw_set_color(c_white)
            draw_text(view_xview[0]+40,view_yview[0]+180,string_upper('--- Water Level ---'))

            // 17: Water Up
            ed_keyrow(17,'Water Up',205,'key_waterup','waterup')

            // 18: Water Down
            ed_keyrow(18,'Water Down',230,'key_waterdown','waterdown')


        }

        //========== PAGE 6: F 键 (F1-F12) ==========
        if keyboard_page=6 {
            draw_set_color(c_white)
            draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('--- Tool Keys ---'))

            // F1 (Level Info)
            ed_keyrow(37,'Level Info',122,'key_f1','f1')

            // F2 (Switch Sound)
            ed_keyrow(38,'Switch Sound',144,'key_f2','f2')

            // F3 (unused)
            ed_keyrow(39,'Test Level',166,'key_f3','f3')

            // F4 (unused)
            ed_keyrow(40,'God Mode',188,'key_f4','f4')

            // F5 (unused)
            ed_keyrow(41,'Solid View',210,'key_f5','f5')

            // F6 (BG Panel)
            ed_keyrow(21,'BG Panel',232,'key_bgpanel','bgpanel')

            // F7 (unused)
            ed_keyrow(42,'Level Size',254,'key_f7','f7')

            // F8 (Music Toggle)
            ed_keyrow(19,'Music Toggle',276,'key_musictoggle','musictoggle')

            // F9 (Screenshot)
            ed_keyrow(43,'Screenshot',298,'key_f9','f9')

            // F10 (unused)
            ed_keyrow(44,'Water Level',320,'key_f10','f10')

            // F11 (Smooth Mode)
            ed_keyrow(45,'Smooth Mode',342,'key_f11','f11')

            // F12 (Auto Pair)
            ed_keyrow(20,'Auto Pair',364,'key_autopair','autopair')
        }

        //========== PAGE 7: 精确移动键 ==========
        if keyboard_page=7 {
            draw_set_color(c_white)
            draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('--- Accurate Move ---'))

            // 25: Acc Up
            ed_keyrow(25,'Acc Up',120,'key_acc_up','acc_up')

            // 26: Acc Down
            ed_keyrow(26,'Acc Down',140,'key_acc_down','acc_down')

            // 27: Acc Left
            ed_keyrow(27,'Acc Left',160,'key_acc_left','acc_left')

            // 28: Acc Right
            ed_keyrow(28,'Acc Right',180,'key_acc_right','acc_right')

            draw_set_color(c_white)
            draw_text(view_xview[0]+40,view_yview[0]+230,string_upper('--- Big Step (16px) ---'))

            // 29: Acc Big Up
            ed_keyrow(29,'Acc Big Up',255,'key_acc_bigup','acc_bigup')

            // 30: Acc Big Down
            ed_keyrow(30,'Acc Big Down',280,'key_acc_bigdown','acc_bigdown')

            // 31: Acc Big Left
            ed_keyrow(31,'Acc Big Left',305,'key_acc_bigleft','acc_bigleft')

            // 32: Acc Big Right
            ed_keyrow(32,'Acc Big Right',330,'key_acc_bigright','acc_bigright')
        }

        //========== PAGE 8: 选区编辑键 ==========
        if keyboard_page=8 {
            draw_set_color(c_white)
            draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('--- Region Selection ---'))

            // 48: Region Cycle (T) 选区判定模式切换
            ed_keyrow(48,'Region Mode Cycle',125,'key_region_cycle','region_cycle')

            // 49: Region Select (U) 进入/退出选区模式
            ed_keyrow(49,'Region Select',155,'key_region_select','region_select')

            // 66: Copy Region (Ctrl+C) 选区复制
            ed_keyrow(66,'Copy Region (Ctrl+)',185,'key_copy','copy')
        }

        //========== 页面导航按钮 ==========
        // 页面指示器
        draw_set_color(c_yellow)
        draw_text(view_xview[0]+40,view_yview[0]+410,string_upper('Page ')+string(keyboard_page+1)+'/9')
        draw_set_color(c_white)
        // 上一页
        if keyboard_page>0 && keydetect=0 {
            draw_set_color(c_white)
            draw_text(view_xview[0]+40,view_yview[0]+428,string_upper('< Prev Page'))
            if ed_hit(40, 418, 160, 20)&& kliknieto=0 {
                draw_prefs_highlight(view_xview[0]+40, view_yview[0]+418, 1.4, 0.8, 0.2);
                if mouse_check_button(mb_left) {keyboard_page-=1;keydetect=0;kliknieto=1}
            }
        }
        // 下一页
        if keyboard_page<8 && keydetect=0 {
            draw_set_color(c_white)
            draw_text(view_xview[0]+40,view_yview[0]+446,string_upper('< Next Page'))
            if ed_hit(40, 436, 160, 20)&& kliknieto=0 {
                draw_prefs_highlight(view_xview[0]+40, view_yview[0]+436, 1.4, 0.8, 0.2);
                if mouse_check_button(mb_left) {keyboard_page+=1;keydetect=0;kliknieto=1}
            }
        }
    }
    //第三页 - Staff Roll
    if globaloption=3 {
        draw_set_color(c_white)
        draw_sprite(s_staffroll,0,view_xview,staffY)
        //按住空格或回车快进
        if keyboard_check(vk_space) || keyboard_check(vk_enter) {
            staffY-=2
        } else {
            staffY-=0.5
        }
        if staffY<=view_yview+480-2000 {staffY+=2000}
        draw_sprite_part(s_edadditional,1,0,0,450,85,view_xview[0],view_yview[0])
    }
    //退出
    if ed_hit(561, 427, 60, 30) {
        draw_prefs_highlight(view_xview[0]+561, view_yview[0]+427, 0.5, 1.3, 0.2);
        quitadditional=1} else
    {quitadditional=0}
    if mouse_check_button(mb_left) && quitadditional=1 {globaloption=0;}
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
    } else if keyboard_check_pressed(ord('M')) && smwptas_sequence == 1 { smwptas_sequence = 2; } // 检测M键 else if keyboard_check_pressed(ord('W')) && smwptas_sequence == 2 { smwptas_sequence = 3; } // 检测W键 else if keyboard_check_pressed(ord('P')) && smwptas_sequence == 3 { smwptas_sequence = 4; } // 检测P键 else if keyboard_check_pressed(ord('T')) && smwptas_sequence == 4 { smwptas_sequence = 5; } // 检测T键 else if keyboard_check_pressed(ord('A')) && smwptas_sequence == 5 { smwptas_sequence = 6; } // 检测A键 else if keyboard_check_pressed(vk_anykey) { smwptas_sequence = 0; } // 按下了其他无关按键重置序列
}

if global.smwptas {
    room_goto(Loader); global.zamenowane = 1;
    sound_stop_all(); // 防止 INL 音效残留
}
