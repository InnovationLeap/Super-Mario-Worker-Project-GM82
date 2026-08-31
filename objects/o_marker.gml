#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//游戏界面的初始化代码在这里


fangka = 0

aktywowanamoza=0
form_backup=0
razujy=0
//WTF，这三个是嘛玩意
global.bowser_phase=0 //翻译为“激活库巴”目测是库巴触发相关，设置为否
real_time=0 //初始时间设为0
global.parallax=0
global.paralax2=0
global.paralax3=0 //这三个目测滚屏相关，暂不讨论
global.level_cleared=0 //是否为过关状态，初始设置为否
real_time=global.level_time //把初始时间设置为关卡时间
wlaczonykuppa=0 //翻译为”启用库巴“，这个是对象变量不是全局变量，暂时不知道在实质作用上和上面那个有何区别
winduje=0  //翻译为”推升“，不明觉厉
star_timer=0  //”明星“，继续懵逼
kolor=0  //颜色，啥颜色
nabijanie=0 //”取笑“ WTH……

monetowanie=0 //翻译器炸了
time_accum=0 //翻译器炸了×2
time_accum2=0//翻译器炸了×3
shake_timer=0//
shake_offset=0//这两个玩意是用来辅助实现剩余100时间单位的时候时间字体震动的效果

cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0) // 定义字体

nabija=0  //”开玩笑“，和前面那个应该是一个词的不同词性，这就懵逼了
water_alpha=0 //蛤？
cloud_drift=0 //蛤？？
windonip=0
//muzyka负责记录音乐序号
//大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲
//你们要改音乐的到Scripts -> Music_Play改

elevator_adjust=0 // wyjatkowa zmienna poprawiajaca wysokosc gracza do muru, gdy winda na ktorej siedzi gracz ma wiekszy delay Y spadania, ktory spowodowalby wejscie gracza w mur
hpbar_y=0 // pasek energii dla kuppy a dokladnie jego pozycja Y

pipe_state=0
pipe_delay=0
tele=0

hit_timer=0 ; shield=0 ; shieldanim=0; shell_lock=0
stomp_lock=0 //specjalny delay, tak aby po rozdeptaniu mario nie rozdeptywal ponownie
collect_delay=0 // specjalny delay czasu przy zdobywaniu bonusow
sizing=0 // grafika powiekszania maria podczas zdobywania bonusow
schylanie=0 // zmienna daj筩a do wiadomosci ze gracz "probuje" sie schylic
image_speed=0
global.input_sync_frames=6
shoot_anim=0 // dla animacji strzelania
shoot_anim2=0 // antyrapid fire
animkind=0 // przy zdobywaniu bonusow animacja mario musi wiedziec z jakiego w jakiego sie zamieniac
bump_block=0 // zmienna sprawdzajaca czy gracz stojacy w niewidzialnym punkcie chce go podbic
endscoring=0 // Czyli ile punktow dostane za przejscie etapu

// Raccoon Mario variables
rodzajmaria_is_raccoon=0
p_meter=0
p_meter_max=50
raccoon_fly_allowed=0
raccoon_fly_timer=0
raccoon_fly_time=212
raccoon_flew=0
raccoon_fall=0
raccoon_fall_timer=0
raccoon_fall_time=12
p_meter_run_timer=0
p_meter_run_time=35
raccoon_fly_speed=-8
p_meter_sfx_playing=0

prev_x=0
prev_dx=0

jump_buffer=0
grav=0;
state=0;
hspd=0;

step_timer=0
teststep=0
steploop=0
teststep2=0
steploop2=0

looptest3=0
loopstep3=0

animator2=instance_create(0,0,o_mario2)
animator=instance_create(0,0,o_mario)
windor=instance_create(0,0,o_markerwind)
windloop=0
//animator.visible=0
animacja=0
dir=0


step_timer=0
teststep=0
steploop=0
teststep2=0
steploop2=0

teststep3=0
steploop3=0
efekt1=0


global.step=0
global.roznica=0
water_jump_lock=0 // dla plywania w wodzie
entered_water=0
swim_anim=0



numerspritea=0
frame_index=0

animator2.visible=0

if global.checkpoint=0 {checkpointdetect=1} else {checkpointdetect=0}

global.level_complete=0

global.scrollPaused= -1 //强制滚屏开关，可在god中切换

//smwp1.8
global.koopa_activated = 0 //记录是否触发库巴
global.final_koopa_activated = 0 //记录是否触发关底库巴
global.koopa_freeview = 0 //记录触发库巴后是否允许自由滚屏
global.koopa_scroll_count=0 //记录参与滚屏的库巴数目
global.koopa_bgm=''; //记录库巴用bgm
instance_create(0,0,o_textDrawer)

/*for(i=0;i<5;i+=1){
fofo=instance_create(128+32*i,128,o_switch);fofo.color=i
fofo=instance_create(320+32*i,128,o_yinyang);fofo.color=i
fofo=instance_create(320+32*i,256,o_static);
}
fofo=instance_create(640,32,o_shyguy);
fofo=instance_create(128,256,o_waterchanger)
fofo.target = 0
fofo.velocity = 1
fofo.reuse = 1

fofo=instance_create(256,256,o_waterchanger)
fofo.target = 416
fofo.velocity = 1
fofo.reuse = 1*/


/*for(i=0;i<14;i+=1){
instance_create(128+32*i,384,obj_static);
}*/

/*for(i=0;i<29;i+=1){
fofo=instance_create(64*i,384,o_bgmchange);
fofo.visible=1
fofo.bgm=string(4*i+1)
fofo.bgp=i+1
}*/



global.water_level=global.water_height_record;
global.bgm_id=global.music_record
global.fuck+=1
global.background=global.background_record
global.lava=global.lava_record
global.auto=global.auto_record
// Weather
global.rainy=global.rainy_record
global.fallingstars=global.fallingstars_record
global.snowy=global.snowy_record
global.thunder=global.thunder_record
global.windy=global.windy_record
global.darkness=global.darkness_record
global.brightness=global.brightness_record



Music_Play()
//附加参数，记得最后去掉
/*global.lava=0
global.auto=0
global.advswitch=1
global.fast_retry=0*/

initial_check=0
view_set=0
inedit=0
stuck=0
sound_text=0
orange_recover=0
spring_vx=0
spring_vy=0
spring_settled_x=0
spring_settled_y=0
prev_osc_dx=0
prev_osc_dy=0
prev_bowser_phase=0
spring_timer_x=0
spring_timer_y=0
//附加参数，记得最后去掉
//global.MFbeet=1
vvvv=mm_get_volume(global.musicplay)
vvvv2=mm_get_volume(global.musicplay2)

global.enablesave=false


//天气 Weather
instance_create(0,0,o_weather);

fofolight = instance_create(x, y, o_lightmarker);

level_start_disable_jump_timer = 0;

// 发光位置微调
light_x = 0;
light_y = -16;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//自定义暂停：外层暂停期间 o_marker 完全休眠（不跑按键同步/逻辑/绘制）
if global.userpause=1 exit
//开局按键状态维护：仅在进入关卡/重开后的前6帧执行（重同步按住键 + 清理卡键），失焦时不会向系统注入按键
if global.input_sync_frames>0 {
    input_sync_step();
    global.input_sync_frames-=1
}

// 玩家逻辑已按功能拆分到 scripts/ 目录下的 player_* 脚本（tree.yyd 中 +player 分组）。
// 各脚本内部自带原有守卫，调用顺序与拆分前 Step_0 完全一致。

// 物理与运动学
player_pipe();      // 管道进出检测与移动
player_move();      // 蹲下/滑行/冰面/入水/水平移动/横向碰撞
player_jump();      // 跳跃输入/跳出水/浣熊起飞/落地检测
player_raccoon();   // 浣熊 P-Meter/飞行/缓降 + 状态清理（无守卫，每帧执行）
player_bump();      // 顶砖/垂直碰撞/移动桥/重力应用/god 模式移动

// 皮肤与动画
player_skin();      // 皮肤精灵表 + god 模式形态切换
player_anim();      // 小/大/火/绿果/甜菜/浣熊 六形态动画

// 光照偏移（无守卫）
player_effects();

// 战斗 / 拾取 / 环境（各脚本内部自带守卫）
player_combat();    // combo 重置 + 浣熊尾巴 + 踩踏/龟壳/库巴判定
player_shoot();     // 火球/甜菜发射 + 浣熊尾巴攻击
player_volume();    // fast retry 背景音量恢复
player_pickup();    // 金币/奖励拾取 + 受伤死亡 + 无敌星
player_fish();      // 游鱼/飞鱼区域生成
player_camera();    // 过关检测 + 相机跟随/滚屏/位置矫正
player_level_flow();// 背景绘制 + 过关结算/跳转 + 多余玩家清理 + ESC 暂停

// 光照跟随
fofolight.x = x;
fofolight.y = y;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Energia Kuppy
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//自定义暂停：外层暂停期间视差/血条/animator 同步全部休眠
if global.userpause=1 exit
//血条：有最终koopa出现时才出现
if global.koopa_activated=2 {
    aktywowanamoza=1
    if instance_number(object112)=0 {hud_inst=instance_create(view_xview[0]+500,view_yview[0]-100,object112)} //object112是库巴血量条
    hud_inst.x=view_xview[0]+480
    hud_inst.y=view_yview[0]+hpbar_y-60
    if hpbar_y<120 hpbar_y+=1

    if (global.huddisplay = 1) { hud_inst.visible = false;} else { hud_inst.visible = true; }
}

//库巴音乐：库巴滚屏启动时才播放，根据koopa_activated决定播放道中boss音乐还是最终boss音乐
/*if wlaczonykuppa=0 && global.aktywowanykuppa=1{
   wlaczonykuppa=1;
   if gwiadzka<=0{mm_stop_all_ext();global.muzyka=global.koopa_bgm;Music_Play();}
}*/


if global.parallax<>x {
    fangka = 1
    global.paralax2=x-global.parallax ;global.parallax=x;
    if x>320 && x<room_width-320 {global.paralax3+=global.paralax2/10}
}
animator.x=x
animator.y=y


animator2.sprite_index=animator.sprite_index
animator2.image_index=animator.image_index
animator2.x=animator.x
animator2.y=animator.y
animator2.image_xscale=animator.image_xscale
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//自定义暂停：外层暂停期间 HUD 绘制与时间/奖命/调试键逻辑全部休眠（冻结帧由 o_pausemenu 绘制）
if global.userpause=1 exit
/*
if global.escowanie=0 && keyboard_check(vk_escape) {

if !variable_global_exists("testmode") {
    global.testmode=0
}

warning2=0;
warning3=0;

if global.testmode=0{
    warning2=show_question('Do you REALLY want to quit the level and go back to title screen???')
}
else{
    warning2=show_question('Do you REALLY want to quit the level and go back to edit screen???')
}

if warning2=1{
    if global.testmode=1{
        global.godmode=0;
        global.testout=1;
        if global.sample=1 {sound_stop(snd_pmeter); sound_stop(snd_spin)}
        p_meter_sfx_playing=0
        file_text_close(global.toload);
        file_delete(global.toloader)
        // NET-SYNC: 测关结束返回。o_edmain 不持久化（换房即销毁），数据源 = F3 时的完整存盘（testsave/temp.smwl）；
        // 测关期间好友的编辑已由 o_ednet 入队，返回后触发器统一重放+全量广播
        room_goto(editor_level)
    }
    else{
        if global.currentlevel>0 && global.enablesave{warning3 = show_question('SAVE Progress?')}
        if warning3=1{Create_Save_File();}
        global.escowanie=1;
        file_text_close(global.toload);
        file_delete(global.toloader);
        if global.sample=1 {sound_stop(snd_pmeter); sound_stop(snd_spin)}
        p_meter_sfx_playing=0
        room_goto(title);
        mm_stop_all_ext()
    }
}
else{exit}

}
*/


//cyferkimario是刚才定义的字体，下面这段显示关卡信息栏
draw_set_font(cyferkimario)
draw_set_color(c_white)

if global.huddisplay=0 || global.gameversion <= 1711 {
    // P-Meter HUD drawing for Raccoon Mario
    // Draw immediately when raccoon state is active (regardless of pause/animation)
    if global.rodzajmaria = 6 {
        var _pmx, _pmy;
        _pmx = view_xview[0] + 24
        _pmy = view_yview[0] + 456
        // Draw P-Meter progress bar (7 frames, frame 0=empty, frame 6=full)
        var _fill;
        _fill = floor((p_meter / p_meter_max) * 6)
        draw_sprite(s_pmeterbar, _fill, _pmx, _pmy)
        // Draw P indicator with flash when P-Meter is full
        // Use current_time (ms) for alternating flash: 250ms on, 250ms off
        if raccoon_fly_allowed = 1 {
            var _flash;
            _flash = (current_time mod 500 < 250)
            draw_sprite(s_pmeter_active, _flash, _pmx + 96, _pmy + 2)
        } else {
            draw_sprite(s_pmeter_active, 0, _pmx + 96, _pmy + 2)
        }
    }

    // --- Debug: Raccoon flight timers ---
    if debug_mode = 1 && global.rodzajmaria = 6 {
        var _dx, _dy, _dh;
        _dx = view_xview[0] + 24
        _dy = view_yview[0] + 320
        _dh = 16
        draw_set_color(c_white)
        draw_text(_dx, _dy, "P-METER: " + string(p_meter) + "/" + string(p_meter_max))
        _dy += _dh
        draw_text(_dx, _dy, "FLY ALLOWED: " + string(raccoon_fly_allowed))
        _dy += _dh
        draw_text(_dx, _dy, "FLEW: " + string(raccoon_flew) + "  TIMER: " + string(raccoon_fly_timer) + "/" + string(raccoon_fly_time))
        _dy += _dh
        draw_text(_dx, _dy, "FALL: " + string(raccoon_fall) + "  TIMER: " + string(raccoon_fall_timer) + "/" + string(raccoon_fall_time))
        _dy += _dh
        draw_text(_dx, _dy, "RUN TIMER: " + string(p_meter_run_timer) + "/" + string(p_meter_run_time))
        _dy += _dh
        draw_text(_dx, _dy, "SEQ: " + string(state) + "  GRAV: " + string(grav))
        _dy += _dh
        draw_text(_dx, _dy, "SKUSIL: " + string(shell_lock) + "  SCHYLANIE: " + string(schylanie))
    }

    if global.godmode=0 && !global.levelsmooth=1 {draw_text(view_xview[0]+40,view_yview[0]+20,string(global.character_name)+string(global.zycia)) }//zycia是生命数
    if global.godmode=1 && !global.levelsmooth=1 {draw_text(view_xview[0]+40,view_yview[0]+20,'GOD   '+string(global.zycia))}
    if global.godmode=0 && global.levelsmooth=1 {draw_text(view_xview[0]+40,view_yview[0]+20,'SMOOTH '+string(global.zycia))}
    if global.godmode=1 && global.levelsmooth=1 {draw_text(view_xview[0]+40,view_yview[0]+20,'GOD '+string(global.zycia))
        draw_text(view_xview[0]+40,view_yview[0]+35,"(SMOOTH)")}
    if global.godmode=1 && global.levelsmooth=1 {draw_text(view_xview[0]+40,view_yview[0]+50,string(global.score))} else {draw_text(view_xview[0]+40,view_yview[0]+35,string(global.score))}//punkty是分数
    if global.scrollPaused = 1 {draw_text(view_xview[0]+40,view_yview[0]+464,'SCROLL DISABLED ')} else {draw_text(view_xview[0]+40,view_yview[0]+464,'')} //关闭滚屏的提示
    if instance_exists(o_bowser) {
        iii = 0;
        while(iii<instance_number(o_bowser)) {
            fofofo = instance_find(o_bowser,iii)
            if fofofo.koopa_midboss_hp>0 {
                draw_text(fofofo.x,fofofo.y-32,string(fofofo.koopa_midboss_hp));
            }
            iii+=1;
        }
    }


    draw_sprite(txt_coins,monetowanie,view_xview[0]+200,view_yview[0]+20)
    draw_text(view_xview[0]+220,view_yview[0]+20,string(global.coins))  //金币不解释
    monetowanie+=0.2  //上面那个金币小图案是动画，通过不断改变帧来实现动画

    // v1.7.11.16 及以后开始支持自由 Level Title

    if global.gameversion <= 1711 {
        // 旧版标题
        draw_text(view_xview[0]+400,view_yview[0]+20,'WORLD')

        draw_set_halign(fa_center)
        draw_text(view_xview[0]+430,view_yview[0]+35,string_upper(global.level_name_play))
        draw_set_halign(fa_left)
    } else {
        // 标题中“WORLD”一行可自定义修改
        var len, i, result0, result1;
        len = string_length(global.level_name_play);

        // 不使用array_create，直接初始化数组元素
        result0 = "";
        result1 = "";

        i = 1;

        // 直接内联拆分逻辑
        // 直接内联拆分逻辑
        while (i <= len) {
            if (string_char_at(global.level_name_play, i) == "#") {
                // 处理单独的#符号（排除被反斜杠转义的\#）
                // 检查当前#的前一个字符是否为反斜杠，如果是则视为转义，不拆分
                if (i == 1) {
                    // 第一个字符是#，不可能有反斜杠前缀，直接视为单独#
                    result0 = string_copy(global.level_name_play, 1, i-1); // 空字符串（因为i=1）
                    result1 = string_copy(global.level_name_play, i+1, len - i);
                    break;
                } else {
                    // 非第一个字符，检查前一个字符是否为反斜杠
                    if (string_char_at(global.level_name_play, i-1) != "\") {
                        // 前一个字符不是反斜杠，视为单独#
                        result0 = string_copy(global.level_name_play, 1, i-1);
                        result1 = string_copy(global.level_name_play, i+1, len - i);
                        break;
                    }
                }
            }
            i += 1;
        }

        // 如果未找到单独的#，使用完整标题作为第一行
        if (i > len) {
            result0 = global.level_name_play;
        }

        // 存储结果到全局变量
        global.level_title_new0 = result0;
        global.level_title_new1 = result1;

        // 绘制标题
        draw_set_halign(fa_center)
        draw_text(view_xview[0]+430-2,view_yview[0]+20,string_upper(global.level_title_new0))
        draw_set_halign(fa_left)

        if string_length(global.level_title_new1) > 0 {
            draw_set_halign(fa_center)
            draw_text(view_xview[0]+430,view_yview[0]+35,string_upper(global.level_title_new1))
            draw_set_halign(fa_left)
        }
    }

    if real_time>=0 {
        draw_text(view_xview[0]+580+shake_offset,view_yview[0]+20+shake_offset,'TIME')

        draw_set_halign(fa_center) //prawdziwyczas显示时间，那个rork和rork2是用来实现100单位的时候时间字体震动效果的
        if real_time>-1 {
            draw_text(view_xview[0]+600+shake_offset,view_yview[0]+35+shake_offset,string(real_time))} else
        {
            draw_text(view_xview[0]+600+shake_offset,view_yview[0]+35+shake_offset,string(0))}
        draw_set_halign(fa_left)
    }

    shake_offset=random(shake_timer)-random(shake_timer)
}

if pipe_state=0 {time_accum+=1} //czasor是基本计时单位，每个绘制周期czasor增加1
if shake_timer>0 shake_timer-=0.1
if time_accum>15 && real_time>0 && global.level_cleared=0 && instance_number(o_mariodead)=0 && global.pauza!=3 {time_accum=0; real_time-=1;} //每过16个绘制周期，czasor增加到16，这时候时间-1，然后czasor归零循环）
if real_time>0&&real_time<100 && time_accum2=0 && global.level_cleared=0 {shake_timer=10;time_accum2=1;if global.sample=1 {tmp2=sound_play(snd_timeover);sound_volume(snd_timeover,global.game_volume)}} //100时间单位警报
if global.coins>99 {global.coins=0; global.zycia+=1;if global.sample=1 {tmp2=sound_play(snd_1up);sound_volume(snd_1up,global.game_volume)}} //100金币奖命音效
if real_time=0 && global.level_cleared=0 {global.rodzajmaria=0; hit_timer=1 ; shield=0} //时间归零死亡


if keyboard_check_pressed(global.key_f2) {
    global.beep=1-global.beep
    sound_text = 1
}

if sound_text>0 {
    if !global.beep {draw_text(view_xview[0]+460,view_yview[0]+464,'SWITCH SOUND: OFF')} else {draw_text(view_xview[0]+460,view_yview[0]+464,'SWITCH SOUND: ON')}
    sound_text+=1;
}

if sound_text>60 {sound_text=0}

if keyboard_check_pressed(global.key_f11) && global.smooth_allowed {
    global.newsmooth=1-global.newsmooth
    smooth_text = 1
}

if smooth_text>0 {
    if !global.newsmooth {draw_text(view_xview[0]+32,view_yview[0]+464,'ENEMY OPTIMIZATION: OFF')} else {draw_text(view_xview[0]+32,view_yview[0]+464,'ENEMY OPTIMIZATION: ON')}
    smooth_text+=1;
}

if smooth_text>60 {smooth_text=0}

var line_spacing;
line_spacing = 24;
if keyboard_check(global.key_f1) {
    room_caption = '[Level Author]: ' + global.level_author + ' (' + string(global.gameversion) + ')'
    draw_text(view_xview[0]+32,view_yview[0]+464 - line_spacing * 6, 'MODIFIED MOVEMENT: ' + yes_no(global.modifiedmov))
    draw_text(view_xview[0]+32,view_yview[0]+464 - line_spacing * 5, 'ADVANCED SWITCH: ' + yes_no(global.advswitch))
    draw_text(view_xview[0]+32,view_yview[0]+464 - line_spacing * 4, 'MF STYLE BEET: ' + yes_no(global.MFbeet))
    draw_text(view_xview[0]+32,view_yview[0]+464 - line_spacing * 3, 'CELESTE STYLE SWITCH: ' + yes_no(global.celeste))
    draw_text(view_xview[0]+32,view_yview[0]+464 - line_spacing * 2, 'ENEMY OPTIMIZATION: ' + yes_no(global.newsmooth))
    draw_text(view_xview[0]+32,view_yview[0]+464 - line_spacing * 1, 'MF STYLE PIPE EXIT: ' + yes_no(global.pipeout))
} else {
    room_caption='Super Mario Worker Project '+global.versiontext;
}

// 上帝模式摄像机模式下显示玩家坐标
if (global.rodzajmaria=5) {
    draw_set_halign(fa_right)
    draw_text(view_xview[0]+640,view_yview[0]+468,'('+string(x)+','+string(y)+')')
    draw_set_halign(fa_left)
}
