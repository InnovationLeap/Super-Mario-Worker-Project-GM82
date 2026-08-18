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
if global.pauza=0 && shell_lock=0 && global.level_complete=0 {

    if !place_meeting(x,y,o_yinyang) {stuck=0}
    //global.roznica=x-20
    //x-=global.roznica
    // SKRUTY
    if place_meeting(x,y,o_exiter) && global.rodzajmaria<>5 {
        tele=instance_place(x,y,o_exiter)
        //right
        if tele.wejscie=0 && is_button_pressed('right') && x>tele.x+48 && pipe_state=0 && real_time<>0 {pipe_state=1; hspd=0; state=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)} }
        //left
        if tele.wejscie=2 && is_button_pressed('left') && x<tele.x+16 && pipe_state=0 && real_time<>0 {pipe_state=3; hspd=0; state=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)} }
        //up
        if global.rodzajmaria=0 {
            if tele.wejscie=1 && is_button_pressed('up') && y<tele.y+32 && pipe_state=0 && real_time<>0 {pipe_state=4; hspd=0; state=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)} }
        }
        if global.rodzajmaria<>0 {
            if tele.wejscie=1 && is_button_pressed('up') && y<tele.y+64 && pipe_state=0 && real_time<>0 {pipe_state=4; hspd=0; state=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)} }
        }
        //down
        if tele.wejscie=3 && is_button_pressed('down') && y>tele.y+16 && pipe_state=0 && real_time<>0 {pipe_state=5; hspd=0; state=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)} }
    }

    if pipe_state<>0 {

        if pipe_state=1 && pipe_delay<32 {pipe_delay+=0.7; x+=0.7;y=tele.y+64}
        if pipe_state=3 && pipe_delay<32 {pipe_delay+=0.7; x-=0.7;y=tele.y+64}
        if pipe_state=4 && pipe_delay<32 {pipe_delay+=0.7; y-=0.7;x=tele.x+32}
        if pipe_state=5 && pipe_delay<32 {pipe_delay+=0.7; y+=0.7;x=tele.x+32}

        if pipe_delay>=32 && tele.wyjscie=0 {pipe_state=2;test_bound(tele.exitx+64,tele.exity+64); x=tele.exitx+32/* */+16*(global.gameversion>1709); y=tele.exity+64;pipe_delay=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)}}
        if pipe_state=2 && place_meeting(x,y,obj_wall) {x+=0.7;o_marker.dir=0}
        if pipe_state=2 && !place_meeting(x,y,obj_wall) {pipe_delay=0; pipe_state=0; if(!global.pipeout)shield=100; state=0; grav=0}

        if pipe_delay>=32 && tele.wyjscie=1 {pipe_state=20;test_bound(tele.exitx+32,tele.exity);  x=tele.exitx+32; y=tele.exity+32;pipe_delay=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)}}
        if pipe_state=20 && place_meeting(x,y,obj_wall) {y-=0.7}
        if pipe_state=20 && !place_meeting(x,y,obj_wall) {pipe_delay=0; pipe_state=0; if(!global.pipeout)shield=100; state=0; grav=0}

        if pipe_delay>=32 && tele.wyjscie=2 {pipe_state=30;test_bound(tele.exitx-1,tele.exity+64);  x=tele.exitx/* */+16*(global.gameversion>1709); y=tele.exity+64;pipe_delay=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)}}
        if pipe_state=30 && place_meeting(x,y,obj_wall) {x-=0.7;o_marker.dir=1}
        if pipe_state=30 && !place_meeting(x,y,obj_wall) {pipe_delay=0; pipe_state=0; if(!global.pipeout)shield=100; state=0; grav=0}

        if pipe_delay>=32 && tele.wyjscie=3 {pipe_state=40;test_bound(tele.exitx+32,tele.exity+65);  x=tele.exitx+32; y=tele.exity+64;pipe_delay=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)}}
        if pipe_state=40 && place_meeting(x,y,obj_wall) {y+=0.7}
        if pipe_state=40 && !place_meeting(x,y,obj_wall) {if animator.sprite_index=s_bigmariocrouch {y=y+32} pipe_delay=0; pipe_state=0; if(!global.pipeout)shield=100; state=0; grav=0}
    }


    //exitx=110 //- pozycja x exita
    //exity=110 //- pozycja y exita
    //wejscie=0 //- k箃 pod jakim sie wchodzi
    //wyjscie=0 //- k箃 pod jakim si?wychodzi
    //
    if prev_x<>x {prev_dx=prev_x-x; prev_x=x}




    // SCHYLANIE

    if pipe_state=0 {
        if global.modifiedmov=1 {
            if is_button_pressed('down') && state=0 && schylanie=0 && !global.rodzajmaria=0 && slide=0 { uabfx=x }
            if is_button_pressed('down') && state=0 && !global.rodzajmaria=0 && slide=0 {schylanie=1 ; image_index=0 }
            if !is_button_pressed('down') && !global.rodzajmaria=0 && schylanie = 1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { slide = 1 }
            if !is_button_pressed('down') && !global.rodzajmaria=0 && schylanie = 1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { slide = 2 }
            if !is_button_pressed('down') && !global.rodzajmaria=0 {schylanie=0 ; image_index=1}
            if global.rodzajmaria=0 {schylanie=0 ; image_index=0}
        } else {
            if is_button_pressed('down') && state=0 && !global.rodzajmaria=0 {schylanie=1}
            //if !is_button_pressed('down') && !global.rodzajmaria=0 && schylanie = 1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { huadun = 1 }
            if !is_button_pressed('down') && !global.rodzajmaria=0 {schylanie=0}
            if global.rodzajmaria=0 {schylanie=0}
        }

        if place_meeting(x,y+1,obj_wall) {
            tmp2=instance_place(x,y+1,obj_wall);
            if ice_effect>0 && object_get_name(tmp2.object_index)<>'o_ice' {
                ice_effect=0;
            }
            if ice_effect=0 && object_get_name(tmp2.object_index)='o_ice' {
                ice_effect=0.2;
                if(y>=global.water_level) {hspd=0}
            }
        } else if y>=global.water_level {ice_effect=0;}

        if (place_meeting(x,y+1,o_windas) || place_meeting(x,y+1,o_pointblock)) {ice_effect=0}

        // WPADANIE DO WODY

        if entered_water=1 && (y<global.water_level || global.lava) && global.rodzajmaria<>5 {entered_water=0}
        if entered_water=0 && (y>=global.water_level && !global.lava) && global.rodzajmaria<>5 {entered_water=1; grav=0}

        // CHODZENIE I BIEGANIE

        if (global.lava || y<global.water_level) && global.rodzajmaria<>5 {
            if is_button_pressed('right') && !is_button_pressed('run') && hspd<3 && schylanie=0 && slide=0 && !stuck {hspd+=0.1-0.25*ice_effect}
            if is_button_pressed('left') && !is_button_pressed('run') && hspd>-3 && schylanie=0 && slide=0 && !stuck {hspd-=0.1-0.25*ice_effect}

            if is_button_pressed('right') && is_button_pressed('run') && schylanie=0 && slide=0 && !stuck {hspd+=0.3-ice_effect}
            if is_button_pressed('left') && is_button_pressed('run') && schylanie=0 && slide=0 && !stuck {hspd-=0.3-ice_effect}

            if hspd>8 hspd=8
            if hspd<-8 hspd=-8
        }

        if !global.lava && y>=global.water_level && global.rodzajmaria<>5 {
            if is_button_pressed('right') && !is_button_pressed('run') && hspd<1 && schylanie=0 && slide=0 && ice_effect=0 && !stuck {hspd+=0.05}
            if is_button_pressed('left') && !is_button_pressed('run') && hspd>-1 && schylanie=0 && slide=0 && ice_effect=0 && !stuck {hspd-=0.05}

            if is_button_pressed('right') && is_button_pressed('run') && schylanie=0 && slide=0 && ice_effect=0 && !stuck {hspd+=0.05}
            if is_button_pressed('left') && is_button_pressed('run') && schylanie=0 && slide=0 && ice_effect=0 && !stuck {hspd-=0.05}

            if hspd>3 hspd=3
            if hspd<-3 hspd=-3
        }
        //穿墙强制静止
        if global.bowser_phase>=2 {
            if ds_list_find_index(global.autoscrolls,firstscroll) < ds_list_size(global.autoscrolls) - 2 {
                if x<view_xview[0]+16 && hspd<0 {hspd=0}
                if x>view_xview[0]+624 && hspd>0 {hspd=0}
            }
        }

        if hspd>-0.04 && hspd<0.04 {hspd=0}

        if ((!is_button_pressed('right') && !is_button_pressed('left')) || schylanie=1) && (y<global.water_level || global.lava) && !stuck {hspd=hspd/1.05}
        if ((!is_button_pressed('right') && !is_button_pressed('left')) || schylanie=1) && (y>=global.water_level && !global.lava) && !stuck {hspd=hspd/1.03}

        //这里是横向碰撞判定，注意代码顺序调整

        if global.modifiedmov=1 && global.rodzajmaria != 5 {
            //然而还需要考虑滑蹲的问题
            if slide = 0 && !stuck {
                var nextx;
                nextx = x+hspd
                if hspd != 0 && x>=view_xview[0]+16 && x<=view_xview[0]+624 && (place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) && global.rodzajmaria != 5 && teststep3=0 { teststep3 = 1;}
                while teststep3 = 1 {
                    if (place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) { nextx -= sign(hspd);looplimit+=1; } else { teststep3 = 0 ; x = nextx; looplimit=0; }
                    if looplimit>=16 {teststep3=0; stuck=1;looplimit=0;}
                }
                var nextx2;
                nextx2 = x+wxspeed
                if wxspeed != 0 && x>=view_xview[0]+16 && x<=view_xview[0]+624 && (place_meeting(nextx2,y,obj_wall) || place_meeting(nextx2,y,o_pointblock)) && global.rodzajmaria != 5 && teststep233=0 { teststep233 = 1; }
                while teststep233 = 1 {
                    if (place_meeting(nextx2,y,obj_wall) || place_meeting(nextx2,y,o_pointblock)) { nextx2 -= sign(wxspeed);looplimit+=1; } else { teststep233 = 0 ; x = nextx2;looplimit=0; }
                    if looplimit>=16 {teststep233=0; stuck=1;fuckstuck=1;looplimit=0;}
                }
            } else if slide=1 {
                if uabff=0 { if x<uabfx { uabf=1 } else { uabf=-1 }; uabff=1 }
                if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {hspd=0 ; x+=uabf } else { slide = 0;uabff=0;uabf=0 }
            } else if slide=2 { if !(place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) { slide=0;uabff=0;uabf=0 } }


        }

        if global.modifiedmov=0 {
            if global.bowser_phase<=1 {
                if hspd>0 && x<view_xview[0]+624 {x+=hspd}
                if hspd<0 && x>view_xview[0]+16 {x+=hspd}
            } else {
                if hspd<>0 {x+=hspd}
            }
        } else {
            var nextx;
            nextx = x+hspd
            if global.bowser_phase<=1 {
                if hspd>0 && x<view_xview[0]+624 && !(place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) {x+=hspd}
                if hspd<0 && x>view_xview[0]+16 && !(place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) {x+=hspd}
            } else {
                if hspd>0 && !(place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) {x+=hspd}
                if hspd<0 && !(place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) {x+=hspd}
            }}
        if global.rodzajmaria=5 && hspd<>0 {hspd=0}

/*
if szybkosc>0 {

// testowanie stepa "dolnego" - schodzenie z g髍ki

if !place_meeting(x,y+1,obj_wall) && grawitacja=0 {sekwencja=1; teststep=1}
while teststep=1 && place_meeting(x,y+10+szybkosc,obj_wall) && steploop<10+szybkosc
{steploop+=1; if place_meeting(x,y+steploop,obj_wall) {y+=steploop-1; teststep=0; steploop=0; sekwencja=0}}
if teststep=1 && !place_meeting(x,y+10+szybkosc,obj_wall) {teststep=0; testloop=0}

// testowanie stepa "gornego" - wchodzenie pod g髍k?
if grawitacja=0 && place_meeting(x,y,obj_wall) && !place_meeting(x,y-3-szybkosc,obj_wall) && sekwencja=0 && teststep2=0 {teststep2=1}
while teststep2=1 && steploop2<3+szybkosc {steploop2+=1; if !place_meeting(x,y-steploop2,obj_wall) {y-=steploop2; steploop2=0; teststep2=0}}
}

if szybkosc<0
{

if !place_meeting(x,y+1,obj_wall) && grawitacja=0 {sekwencja=1; teststep=1}
while teststep=1 && place_meeting(x,y+10+szybkosc,obj_wall) && steploop<10+szybkosc
{steploop+=1; if place_meeting(x,y+steploop,obj_wall){y+=steploop-1; teststep=0; steploop=0; sekwencja=0}}
if teststep=1 && !place_meeting(x,y+10+szybkosc,obj_wall) {teststep=0; testloop=0}


// testowanie stepa "gornego" - wchodzenie pod g髍k?
if grawitacja=0 && place_meeting(x,y,obj_wall) && !place_meeting(x,y-(3+szybkosc*-1),obj_wall) && sekwencja=0 && teststep2=0 {teststep2=1;}
while teststep2=1 && steploop2<3+szybkosc*-1 {steploop2+=1; if !place_meeting(x,y-steploop2,obj_wall) {y-=steploop2; steploop2=0; teststep2=0}}

}
*/

        // poprawianie pozycji X - tak aby gracz nie wbijal sie w bloki

        if global.modifiedmov=0 {
            if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock))&& teststep3=0 && hspd>0 && global.rodzajmaria<>5 {teststep3=1; steploop3=round(hspd)}
            while teststep3=1 {if (place_meeting(x+steploop3,y,obj_wall) || place_meeting(x+steploop3,y,o_pointblock)) {steploop3-=1;} if !place_meeting(x+steploop3,y,obj_wall) && !place_meeting(x+steploop3,y,o_pointblock){teststep3=0; x+=steploop3}}

            // poprawianie pozycji X - tak aby gracz nie wbijal sie w bloki
            if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock))&& teststep3=0 && hspd<0 && global.rodzajmaria<>5 {teststep3=1; steploop3=hspd}
            while teststep3=1 {if (place_meeting(x+steploop3,y,obj_wall) || place_meeting(x+steploop3,y,o_pointblock)) {steploop3+=1;} if !place_meeting(x+steploop3,y,obj_wall) && !place_meeting(x+steploop3,y,o_pointblock){teststep3=0; x+=steploop3}}
        }


        // spadanie i skakanie

        if global.rodzajmaria<>3 && global.rodzajmaria<>5 {
            if is_button_pressed('jump') && state=0 && (y<global.water_level || global.lava) && schylanie=0 && slide=0 && !stuck
            {state=1; grav=-(8+abs(hspd)/5); if global.sample=1 {tmp2=sound_play(snd_jump);sound_volume(snd_jump,global.game_volume)}};}
        if global.rodzajmaria=3 && global.rodzajmaria<>5 {
            if is_button_pressed('jump') && state=0 && (y<global.water_level || global.lava) && schylanie=0 && slide=0 && !stuck
            {state=1; grav=-(9+abs(hspd)/5); if global.sample=1 {tmp2=sound_play(snd_jump);sound_volume(snd_jump,global.game_volume)}};}

        if is_button_pressed('jump') && y>=global.water_level && !global.lava && water_jump_lock=0 && y>global.water_level+32 && schylanie=0 && slide=0 && global.rodzajmaria<>5 && !stuck {if global.sample=1 {tmp2=sound_play(snd_swim);sound_volume(snd_swim,global.game_volume)};swim_anim=0; state=1; grav=-(4+abs(hspd)/10);  water_jump_lock=1};
        if !global.lava && is_button_pressed('jump') && y>=global.water_level && !global.lava && water_jump_lock=0 && y<=global.water_level+32 && schylanie=0 && slide=0 && global.rodzajmaria<>5 && !stuck {if global.sample=1 {tmp2=sound_play(snd_swim);sound_volume(snd_swim,global.game_volume)};state=1; grav=-(6+abs(hspd)/5); water_jump_lock=1};
        if !is_button_pressed('jump') {water_jump_lock=0}

        jump_buffer+=1
        if is_button_pressed('jump') && jump_buffer>1 && grav<0 && (y<global.water_level || global.lava) && global.rodzajmaria<>5 && !stuck {grav-=1.5; jump_buffer=0};

        // Raccoon flight takeoff (P-Meter full + press jump in air)
        // keyboard_check_pressed: must press jump fresh, not just hold it
        // Raccoon flight: takeoff (first press) and mid-air boost (subsequent presses)
        // Both give upward lift, but only first press starts the flight timer counting
        if global.rodzajmaria=6 && raccoon_fly_allowed=1 && grav>0 && keyboard_check_pressed(global.key_jump) && y<global.water_level && state=1 && schylanie=0 && !stuck {
            grav=-9
            hspd = max(-4, min(hspd, 4))
            if raccoon_flew=0 {
                raccoon_flew=1
                p_meter_run_timer=0
            }
            if global.sample=1 {tmp2=sound_play(snd_spin);sound_volume(snd_spin,global.game_volume)}
        }

        // Flight timer: prerequisite -- flight must be allowed (P-Meter full,
        // raccoon_fly_allowed=1), plus not hurt, above water, not on lava.
        // Then the timer counts if EITHER: x speed is below running speed
        // (abs(szybkosc) <= 6) OR the player is in the flew state (flew=1).
        // Running with a full P-Meter recharges it (see P-Meter logic below).
        // At 212 frames the flight state is force-cancelled (raccoon_flew=0,
        // P-Meter reset to 0).
        if raccoon_fly_allowed=1 && shell_lock=0 && global.rodzajmaria=6 && y<global.water_level && !place_meeting(x,y,o_lava) && (abs(hspd) <= 6 || raccoon_flew=1 || p_meter_run_timer > 0) {
            raccoon_fly_timer+=1
            if raccoon_fly_timer>raccoon_fly_time {
                raccoon_flew=0
                raccoon_fly_timer=0
                raccoon_fly_allowed=0
                p_meter=0
            }
        }

        if state=0 &&  global.rodzajmaria<>5 && !place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,o_pointblock) && !place_meeting(x,y+2,o_windas) {state=1}
        if global.modifiedmov=0 && state=1 && grav<0 && global.rodzajmaria<>5 {y+=grav+global.level_gravity/5; testujstepa=0}

        // Raccoon Mario sync flag
        rodzajmaria_is_raccoon = (global.rodzajmaria = 6)

        // P-Meter logic (Raccoon Mario)
        if global.rodzajmaria = 6 && shell_lock = 0 {
            var _on_ground;
            _on_ground = (state = 0 || place_meeting(x, y+2, o_windas))

            // Disallow flight if P-Meter is not full
            if raccoon_fly_allowed = 1 && p_meter < p_meter_max {
                raccoon_fly_allowed = 0
            }

            // P-Meter charging: running on ground, not in water, not against a wall, not at screen edge
            if abs(hspd) > 6 && !place_meeting(x,y,o_lava) && y < global.water_level && _on_ground {
                var _at_edge, _against_wall, _nextx;
                _at_edge = (x <= view_xview + 16 || x >= view_xview + 624)
                // Check if running into a solid wall (obj_wall covers obj_waall/obj_halfwall via parent inheritance)
                _nextx = x + sign(hspd) * 2
                _against_wall = (place_meeting(_nextx, y, obj_wall) || place_meeting(_nextx, y, o_pointblock))
                if !_at_edge && !_against_wall {
                    p_meter = min(p_meter + 1, p_meter_max)
                    if raccoon_fly_allowed = 0 {
                        p_meter_run_timer = min(p_meter_run_timer + 1, p_meter_run_time)
                    }
                } else {
                    // Running against wall or screen edge: decay like stopped
                    if raccoon_fly_allowed = 0 {
                        p_meter = max(p_meter - 1, 0)
                        p_meter_run_timer = max(p_meter_run_timer - 1, 0)
                    }
                }
            } else {
                p_meter_run_timer = max(p_meter_run_timer - 1, 0)
                if raccoon_fly_allowed = 0 {
                    p_meter = max(p_meter - 1, 0)
                }
            }

            // In water: reset P-Meter
            if y >= global.water_level || place_meeting(x,y,o_lava) {
                p_meter = 0
                raccoon_fly_allowed = 0
            }

            // P-Meter full => allow flight
            if p_meter >= p_meter_max {
                raccoon_fly_allowed = 1
            }

            // Flight time extension: land while running with full P-Meter
            // P-Meter run timer fills up → reset flight timer, recharging full flight duration
            if raccoon_fly_allowed = 1 {
                if abs(hspd) > 6 && _on_ground {
                    p_meter_run_timer = min(p_meter_run_timer + 1, p_meter_run_time)
                    if p_meter_run_timer >= p_meter_run_time {
                        raccoon_fly_timer = 0
                    }
                }
            }

            // P-Meter sound effect (loop while P-meter full / flight ready - SMWP2 behavior)
            if raccoon_fly_allowed = 1 {
                if p_meter_sfx_playing = 0 {
                    p_meter_sfx_playing = 1
                    if global.sample=1 {sound_loop(snd_pmeter); sound_volume(snd_pmeter, global.game_volume)}
                }
            } else {
                if p_meter_sfx_playing = 1 {
                    p_meter_sfx_playing = 0
                    if global.sample=1 {sound_stop(snd_pmeter)}
                }
            }
        }

        // Raccoon flight and fall logic
        if global.rodzajmaria = 6 && shell_lock = 0 {
            // Slow fall (raccoon parachute descent)
            // keyboard_check_pressed: must press jump fresh, not just hold it
            if grav > 0 && keyboard_check_pressed(global.key_jump) && !raccoon_fall && y < global.water_level && state = 1 && raccoon_fly_allowed = 0 {
                raccoon_fall = 1
                raccoon_fall_timer = 0
                hspd = max(-4, min(hspd, 4))
                if global.sample=1 {tmp2=sound_play(snd_spin);sound_volume(snd_spin,global.game_volume)}
            }

            if raccoon_fall = 1 {
                if grav > 0 && y < global.water_level {
                    grav = min(grav, 2)
                    raccoon_fall_timer += 1
                    if raccoon_fall_timer > raccoon_fall_time || grav <= 0 {
                        raccoon_fall = 0
                        raccoon_fall_timer = 0
                    }
                } else {
                    raccoon_fall = 0
                    raccoon_fall_timer = 0
                }
            }
            if !is_button_pressed('jump') || state = 0 {
                raccoon_fall = 0
                raccoon_fall_timer = 0
            }
        }
        // Bugort - tlumaczenie w Create Actions
        // who can tell me wtf is this

        if bump_block=0 && place_meeting(x,y-8,o_pointblock2) && state=0 && global.rodzajmaria<>5 {bump_block=1}
        if bump_block=0 && place_meeting(x,y-8,o_pointblock2) && state=0 && global.rodzajmaria<>5 {bump_block=1}

        // podbijanie punktu

        if place_meeting(x,y-8,o_pointblock) && grav<0 && global.rodzajmaria<>5 {tmp=instance_place(x,y-8,o_pointblock); tmp.bumped=1; grav=0}
        if place_meeting(x,y-8,o_blockbumper) && grav<0 && global.rodzajmaria<>5 {tmp=instance_place(x,y-8,o_blockbumper); if(!tmp.bumped) {tmp.bumped=1;} grav=0 }

        if global.modifiedmov=0 {
            if place_meeting(x,y-8,o_pointblock2) && grav<0 && global.rodzajmaria<>5 {tmp=instance_place(x,y-8,o_pointblock2); tmp.bumped=1; grav=0 y+=4}
        }

        //喝了这里负责的是顶头（原版代码）

        if global.modifiedmov=0 {

            if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) && grav<0 && global.rodzajmaria<>5 {looptest3=1; grav=0}
            {while looptest3=1 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y+=1};} looptest3=0
        }


        if global.modifiedmov=1 {
            if slide = 0  && !stuck {
                if (grav+global.level_gravity/5) < 0 && state=1 {
                    var nexty;
                    nexty = y+grav+global.level_gravity/5
                    if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) && global.rodzajmaria<>5 { looptest3=1; }
                    while looptest3=1 {
                        if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) { nexty+=1; looplimit+=1; } else { y=nexty ; looptest3=0 ; grav=0;looplimit=0;
                            //负引力的处理
                            if (global.level_gravity/5)>-13 && (global.level_gravity/5)<0 && abs(global.level_gravity/5) > grav { grav=abs(global.level_gravity/5) }
                        }
                        if looplimit>=16 {looptest3=0; stuck=1;looplimit=0;}
                    }
                }
                if shift_speed < 0 && grav = 0 {
                    var nexty2;
                    nexty2 = y+shift_speed
                    if (place_meeting(x,nexty2,obj_wall) || place_meeting(x,nexty2,o_pointblock)) && global.rodzajmaria<>5 { looptest233=1;}
                    while looptest233=1 {
                        if (place_meeting(x,nexty2,obj_wall) || place_meeting(x,nexty2,o_pointblock)) { nexty2+=1;looplimit+=1; } else { y=nexty2 ; looptest233=0 ; grav=0;looplimit=0; }
                        if looplimit>=16 {looptest233=0; stuck=1;looplimit=0;}
                    }
                }

                if (grav+global.level_gravity/5+shift_speed) > 0 && state=1 {
                    var nexty;
                    nexty = y+grav+global.level_gravity/5
                    if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) && global.rodzajmaria<>5 { looptest3=2;}
                    while looptest3=2 {
                        if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) { nexty-=1;looplimit+=1; } else { y=nexty ; looptest3=0 ; grav=0 ; state=0;looplimit=0;}
                        if looplimit>=16 {looptest3=0; stuck=1;looplimit=0;}
                    }
                }
                if shift_speed > 0 && grav = 0 {
                    var nexty2;
                    nexty2 = y+shift_speed
                    if (place_meeting(x,nexty2,obj_wall) || place_meeting(x,nexty2,o_pointblock)) && global.rodzajmaria<>5 { looptest233=1;}
                    while looptest233=1 {
                        if (place_meeting(x,nexty2,obj_wall) || place_meeting(x,nexty2,o_pointblock)) { nexty2-=1;looplimit+=1; } else { y=nexty2 ; looptest233=0 ; grav=0;looplimit=0; }
                        if looplimit>=16 {looptest233=0; stuck=1; looplimit=0;}
                    }
                }
            } else if slide=2 {
                var nexty;
                nexty = y
                if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) && global.rodzajmaria<>5 { looptest3=1 }
                while looptest3=1 {
                    if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) { nexty+=1 } else { y=nexty ; looptest3=0 ; grav=0
                        //负引力的处理
                        if (global.level_gravity/5)>-13 && (global.level_gravity/5)<0 && abs(global.level_gravity/5) > grav { grav=abs(global.level_gravity/5) }
                    }
                }
            }
        }

        if global.modifiedmov=1 {
            //新版顶隐藏砖，仅在马里奥顶部撞到隐藏砖底部生效
            if grav<0 && instance_place(x,y+grav,o_pointblock2) {
                var bump;
                bump=instance_place(x,y+grav,o_pointblock2)
                var height;
                if global.rodzajmaria=0 { height=24 } else { height=48 }
                if y >= bump.y+32+height && bump.bumped=0 {
                    if (global.level_gravity/5)>-13 && (global.level_gravity/5)<0 && abs(global.level_gravity/5) > grav { grav=abs(global.level_gravity/5) } else { grav=0 }
                    bump.bumped=1
                }
            }
        }

        //移动桥相关
        if state<>0 {winduje=0}


        if grav=0 && state=0 && !place_meeting(x,y-2,o_windas) && global.rodzajmaria<>5 // Lapanie windy, gdy mario stoi w miejscu
        {
            o_marker.y=round(o_marker.y)
            windor.x=x
            windor.y=y
            with(windor) {
                if place_meeting(x,y+2,o_windas) && (place_meeting(x,y+o_marker.windloop,o_pointblock) && global.rodzajmaria<>5 || place_meeting(x,y+o_marker.windloop,obj_wall)) && global.rodzajmaria<>5 && !other.stuck {
                    getwind=instance_place(x,y+o_marker.windloop,o_windas)
                    o_marker.y=getwind.y
                    o_marker.grav=0
                    o_marker.state=0
                    o_marker.windloop=ceil(o_marker.grav+1)
                    o_marker.winduje=getwind
                }
            }

        }

        if grav>0 && !place_meeting(x,y-2,o_windas) && global.rodzajmaria<>5 // Lapanie windy
        {
            o_marker.y=round(o_marker.y)
            windor.x=x
            windor.y=y
            with(windor) {

                while o_marker.windloop<ceil(o_marker.grav+1) {
                    if place_meeting(x,y+o_marker.windloop,o_windas) && !place_meeting(x,y+o_marker.windloop,o_pointblock) && !place_meeting(x,y+o_marker.windloop,obj_wall) && global.rodzajmaria<>5 && !other.stuck {
                        getwind=instance_place(x,y+o_marker.windloop,o_windas)
                        o_marker.y=getwind.y
                        o_marker.grav=0
                        o_marker.state=0
                        o_marker.windloop=ceil(o_marker.grav+1)
                        o_marker.winduje=getwind
                    }
                    o_marker.windloop+=1
                }
            }
            windloop=0
        }
        if grav=0 && place_meeting(x,y-2,o_windas) && (place_meeting(x,y-1,obj_wall) && global.rodzajmaria<>5 || place_meeting(x,y-1,o_pointblock)) && global.rodzajmaria<>5 {grav=0; state=1}


        if state=1 && !stuck //dodawaj do Y wspolczynnik grawitacji
        {
            if grav>=0 && global.modifiedmov=0 {y+=grav+global.level_gravity/5}
            if global.modifiedmov=1 {
                var nexty3;
                nexty3 = y+grav+global.level_gravity/5
                if !(place_meeting(x,nexty3,obj_wall) || place_meeting(x,nexty3,o_pointblock)) {
                    y+=grav+global.level_gravity/5 }
            }
            if (y<global.water_level || global.lava) {grav+=1}
            if y>=global.water_level && !global.lava {grav+=0.2}

            if (y<global.water_level || global.lava) && grav>13 {grav=13}
            if y>=global.water_level && !global.lava && grav>6 {grav=6}
        }

        if global.modifiedmov=0 {

            if state=1 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) && grav>0 {state=2; grav=0};

            while state=2 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock) ) {y-=1;};

            if state=2 && (!place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock)) {state=0};

        }

        if global.rodzajmaria=5 {
            grav=0
            state=0
            if keyboard_check(global.key_right) { x += 8; }
            if keyboard_check(global.key_left) { x -= 8; }
            if keyboard_check(global.key_up) { y -= 8; }
            if keyboard_check(global.key_down) { y += 8; }
        }

        //god模式中的CP跳转
        if global.godmode=1 {

            if keyboard_check_released(global.godkey_cp_prev) {
                global.checkpointa=global.checkpoint+1
                o_checkpoint.kk=1
            }

            if keyboard_check_released(global.godkey_cp_next) {
                global.checkpointa=global.checkpoint-1
                o_checkpoint.kk=1
            }
        }

        wxspeed=0
        shift_speed=0

        //尝试性修复非整格实心穿墙
        if (hspd = 0)
        x = round(x);
        if (grav = 0)
        y = round(y);

    }}

    // Raccoon 状态清理：不受 shell_lock/pauza 守卫限制，每帧执行
    // （死亡/受伤会置 shell_lock=1 或 pauza=2，守卫块被跳过，
    //  若不在此处停掉 snd_pmeter，摔死/受伤后飞行音效会一直残留）
    if global.rodzajmaria <> 6 {
        raccoon_fall = 0
        raccoon_fly_allowed = 0
        raccoon_flew = 0
        raccoon_fly_timer = 0
        p_meter = 0
        if p_meter_sfx_playing=1 {
            p_meter_sfx_playing=0
            if global.sample=1 {sound_stop(snd_pmeter)}
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && shell_lock=0 && global.level_complete=0 {


    //定义一系列全局变量作为玩家的皮肤
    global.skin = 0

    global.character_name = 'MARIO '

    global.character_dead = s_mariodead

    global.small_character_run = s_smallmariorun
    global.small_character_jump = s_smallmariojump
    global.small_character_swim = s_smallmarioswim

    global.big_character_run = s_bigmariorun
    global.big_character_jump = s_bigmariojump
    global.big_character_swim = s_bigmarioswim
    global.big_character_crouch = s_bigmariocrouch

    global.fire_character_run = s_firemariorun
    global.fire_character_jump = s_firemariojump
    global.fire_character_swim = s_firemarioswim
    global.fire_character_crouch = s_firemariocrouch
    global.fire_character_shoot = s_firemarioshot

    global.lui_character_run = s_luimariorun
    global.lui_character_jump = s_luimariojump
    global.lui_character_swim = s_luimarioswim
    global.lui_character_crouch = s_luimariocrouch

    global.beetroot_character_run = s_beetrootmariorun
    global.beetroot_character_jump = s_beetrootmariojump
    global.beetroot_character_swim = s_beetrootmarioswim
    global.beetroot_character_crouch = s_beetrootmariocrouch
    global.beetroot_character_shoot = s_beetrootmarioshot

    //马里奥皮肤
    if global.skin = 0 {
        global.character_name = 'MARIO '

        global.character_dead = s_mariodead

        global.small_character_run = s_smallmariorun
        global.small_character_jump = s_smallmariojump
        global.small_character_swim = s_smallmarioswim

        global.big_character_run = s_bigmariorun
        global.big_character_jump = s_bigmariojump
        global.big_character_swim = s_bigmarioswim
        global.big_character_crouch = s_bigmariocrouch

        global.fire_character_run = s_firemariorun
        global.fire_character_jump = s_firemariojump
        global.fire_character_swim = s_firemarioswim
        global.fire_character_crouch = s_firemariocrouch
        global.fire_character_shoot = s_firemarioshot

        global.lui_character_run = s_luimariorun
        global.lui_character_jump = s_luimariojump
        global.lui_character_swim = s_luimarioswim
        global.lui_character_crouch = s_luimariocrouch

        global.beetroot_character_run = s_beetrootmariorun
        global.beetroot_character_jump = s_beetrootmariojump
        global.beetroot_character_swim = s_beetrootmarioswim
        global.beetroot_character_crouch = s_beetrootmariocrouch
        global.beetroot_character_shoot = s_beetrootmarioshot

        global.raccoon_character_idle = s_raccoonmarioidle
        global.raccoon_character_run = s_raccoonmariorun
        global.raccoon_character_jump = s_raccoonmariojump
        global.raccoon_character_crouch = s_raccoonmariocrouch
        global.raccoon_character_shoot = s_raccoonmarioshoot
        global.raccoon_character_swim = s_raccoonmarioswim
        global.raccoon_character_walk = s_raccoonmariowalk
        global.raccoon_character_fall = s_raccoonmariofall
        global.raccoon_character_fly = s_raccoonmariofly
    }

    //WEEGEE皮肤
    if global.skin = 1 {
        global.character_name = 'LUIGI '

        global.character_dead = s_luigidead

        global.small_character_run = s_smallluigirun
        global.small_character_jump = s_smallluigijump
        global.small_character_swim = s_smallluigiswim

        global.big_character_run = s_bigluigirun
        global.big_character_jump = s_bigluigijump
        global.big_character_swim = s_bigluigiswim
        global.big_character_crouch = s_bigluigicrouch

        global.fire_character_run = s_fireluigirun
        global.fire_character_jump = s_fireluigijump
        global.fire_character_swim = s_fireluigiswim
        global.fire_character_crouch = s_fireluigicrouch
        global.fire_character_shoot = s_fireluigishot

        global.lui_character_run = s_luiluigirun
        global.lui_character_jump = s_luiluigijump
        global.lui_character_swim = s_luiluigiswim
        global.lui_character_crouch = s_luiluigicrouch

        global.beetroot_character_run = s_beetrootluigirun
        global.beetroot_character_jump = s_beetrootluigijump
        global.beetroot_character_swim = s_beetrootluigiswim
        global.beetroot_character_crouch = s_beetrootluigicrouch
        global.beetroot_character_shoot = s_beetrootluigishot

        // Luigi uses same raccoon sprites as Mario for now (no Luigi raccoon skin yet)
        global.raccoon_character_idle = s_raccoonmarioidle
        global.raccoon_character_run = s_raccoonmariorun
        global.raccoon_character_jump = s_raccoonmariojump
        global.raccoon_character_crouch = s_raccoonmariocrouch
        global.raccoon_character_shoot = s_raccoonmarioshoot
        global.raccoon_character_swim = s_raccoonmarioswim
        global.raccoon_character_walk = s_raccoonmariowalk
        global.raccoon_character_fall = s_raccoonmariofall
        global.raccoon_character_fly = s_raccoonmariofly
    }


    //下面是与马里奥状态相关的代码
    //godmode
    if global.rodzajmaria<>5 && form_backup<>global.rodzajmaria {form_backup=global.rodzajmaria}
    if global.godmode=1 {
        if keyboard_check(global.godkey_small) {global.rodzajmaria=0;star_timer=0;shield=0} //小个子
        if keyboard_check(global.godkey_big) {if global.modifiedmov=1 && global.rodzajmaria=0 && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { slide = 1 };if global.modifiedmov=1 && global.rodzajmaria=0 && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)){ slide = 2 };global.rodzajmaria=1;star_timer=0;shield=0} //大个子
        if keyboard_check(global.godkey_fire) {if global.modifiedmov=1 && global.rodzajmaria=0 && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { slide = 1 };if global.modifiedmov=1 && global.rodzajmaria=0 && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)){ slide = 2 };global.rodzajmaria=2;star_timer=0;shield=0} //花身
        if keyboard_check(global.godkey_fruit) {if global.modifiedmov=1 && global.rodzajmaria=0 && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { slide = 1 };if global.modifiedmov=1 && global.rodzajmaria=0 && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)){ slide = 2 };global.rodzajmaria=4;star_timer=0;shield=0} //绿果（为啥甜菜在绿果后面……）
        if keyboard_check(global.godkey_beet) {if global.modifiedmov=1 && global.rodzajmaria=0 && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { slide = 1 };if global.modifiedmov=1 && global.rodzajmaria=0 && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)){ slide = 2 };global.rodzajmaria=3;star_timer=0;shield=0} //甜菜
        if keyboard_check(global.godkey_raccoon) {if global.modifiedmov=1 && global.rodzajmaria=0 && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { slide = 1 };if global.modifiedmov=1 && global.rodzajmaria=0 && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)){ slide = 2 };global.rodzajmaria=6;star_timer=0;shield=0}
        if keyboard_check(global.godkey_star) {global.rodzajmaria=form_backup;star_timer=500;animator2.visible=1}
        if keyboard_check(global.godkey_invincible) {global.rodzajmaria=form_backup
            star_timer=500
            animator2.visible=1
        }
        if keyboard_check(global.godkey_invincible) {global.rodzajmaria=form_backup;shield=10000000;star_timer=0}
        if keyboard_check_pressed(global.godkey_fly) {if global.rodzajmaria<>5 {global.rodzajmaria=5} else {global.rodzajmaria=form_backup}}
        if keyboard_check_pressed(global.godkey_life) {
            if global.zycia < 99 {
                fifi=instance_create(x,y-32,o_scorepop3)
                fifi.image_index=6
                if global.sample=1 {
                    tmp2=sound_play(snd_1up);
                    sound_volume(snd_1up,global.game_volume)
                }
                //lobal.zycia+=1
            }}
        if keyboard_check_pressed(global.godkey_scroll) { global.scrollPaused *= -1 } //按0切换滚屏开关
        if global.scrollPaused = 1 && keyboard_check_pressed(global.godkey_bowser) {global.bowser_phase=0}
    }

    // MALY MARIO：小马里奥
    if global.rodzajmaria=0 { //rodazajmaria用来记录马里奥状态，对应表见上。
        if y<global.water_level || global.lava //poziomwody记录水面高度，下面的代码为马里奥在水面上方的动画代码
        {image_index=0

            if hspd<0 {dir=1}//kierunek记录马里奥朝向，1为右，0为左
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 {animator.sprite_index=global.small_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0}
            if hspd=0 && state=0 && dir=1 {animator.sprite_index=global.small_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0}//image_xscale=-1表示把图像反向

            if hspd>0 && dir=0 && state=0 {animator.sprite_index=global.small_character_run; animator.image_index+=hspd/10; animator.image_xscale=1; animkind=0}
            if hspd<0 && dir=1 && state=0 {animator.sprite_index=global.small_character_run; animator.image_index+=hspd/10; animator.image_xscale=-1; animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.small_character_jump; animator.image_xscale=1;animkind=1} //grawitacja记录“重力状况”，也就是是否在空中（因为在地面上相当于“重力”为0）
            if dir=1 && grav<>0 {animator.sprite_index=global.small_character_jump; animator.image_xscale=-1;animkind=1}

        }

        if y>=global.water_level && !global.lava//poziomwody记录水面高度，下面的代码为马里奥在水面下方的动画代码
        {image_index=0

            if hspd<0 {dir=1}//szybkosc记录水平速度状态，0为静止，向左为正
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 {animator.sprite_index=global.small_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0 }
            if hspd=0 && state=0 && dir=1 {animator.sprite_index=global.small_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0 }

            if hspd>0 && dir=0 && state=0 {animator.sprite_index=global.small_character_run; animator.image_index+=hspd/20; animator.image_xscale=1; animkind=0}//image_index表示帧数，通过马里奥运动速度来控制帧的切换速度
            if hspd<0 && dir=1 && state=0 {animator.sprite_index=global.small_character_run; animator.image_index+=hspd/20; animator.image_xscale=-1; animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.small_character_swim; animator.image_index=swim_anim; animator.image_xscale=1;animkind=2}
            if dir=1 && grav<>0 {animator.sprite_index=global.small_character_swim; animator.image_index=swim_anim; animator.image_xscale=-1;animkind=2}
            if swim_anim<9 {swim_anim+=0.2}


            if global.efekty>5 {tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale}


        }}



    // DUZY MARIO
    if global.rodzajmaria=1 {
        if y<global.water_level || global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 {animator.sprite_index=global.big_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0}
            if hspd=0 && state=0 && dir=1 {animator.sprite_index=global.big_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0}

            if hspd>0 && dir=0 && state=0 {animator.sprite_index=global.big_character_run; animator.image_index+=hspd/10; animator.image_xscale=1; animkind=0}
            if hspd<0 && dir=1 && state=0 {animator.sprite_index=global.big_character_run; animator.image_index+=hspd/10; animator.image_xscale=-1; animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.big_character_jump; animator.image_xscale=1;animkind=1}
            if dir=1 && grav<>0 {animator.sprite_index=global.big_character_jump; animator.image_xscale=-1;animkind=1}

            if schylanie=1 && dir=0 {animator.sprite_index=global.big_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.big_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}
        }

        if y>=global.water_level && !global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 {animator.sprite_index=global.big_character_run; animator.image_index=0; animator.image_xscale=1 ; animkind=0}
            if hspd=0 && state=0 && dir=1 {animator.sprite_index=global.big_character_run; animator.image_index=0; animator.image_xscale=-1 ; animkind=0}

            if hspd>0 && dir=0 && state=0 {animator.sprite_index=global.big_character_run; animator.image_index+=hspd/20; animator.image_xscale=1; animkind=0 }
            if hspd<0 && dir=1 && state=0 {animator.sprite_index=global.big_character_run; animator.image_index+=hspd/20; animator.image_xscale=-1; animkind=0 }

            if dir=0 && grav<>0 {animator.sprite_index=global.big_character_swim; animator.image_index=swim_anim; animator.image_xscale=1;animkind=2}
            if dir=1 && grav<>0 {animator.sprite_index=global.big_character_swim; animator.image_index=swim_anim; animator.image_xscale=-1;animkind=2}
            if swim_anim<9 {swim_anim+=0.2}

            if schylanie=1 && dir=0 {animator.sprite_index=global.big_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.big_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            if global.efekty>5 {tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale}


        }}


    // FIRE MARIO
    if global.rodzajmaria=2 {
        if y<global.water_level || global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 && shoot_anim=0 {animator.sprite_index=global.fire_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0}
            if hspd=0 && state=0 && dir=1 && shoot_anim=0 {animator.sprite_index=global.fire_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0}

            if hspd>0 && dir=0 && state=0 && shoot_anim=0 {animator.sprite_index=global.fire_character_run; animator.image_index+=hspd/10; animator.image_xscale=1; animkind=0}
            if hspd<0 && dir=1 && state=0 && shoot_anim=0 {animator.sprite_index=global.fire_character_run; animator.image_index+=hspd/10; animator.image_xscale=-1; animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.fire_character_jump; animator.image_xscale=1;animkind=1}
            if dir=1 && grav<>0 {animator.sprite_index=global.fire_character_jump; animator.image_xscale=-1;animkind=1}

            if schylanie=1 && dir=0 {animator.sprite_index=global.fire_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.fire_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            if schylanie=1 || state<>0 {shoot_anim=0}
            if dir=0 && shoot_anim>0 {animator.sprite_index=global.fire_character_shoot; animator.image_xscale=1; shoot_anim+=1;animkind=0}
            if dir=1 && shoot_anim>0 {animator.sprite_index=global.fire_character_shoot; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
            if shoot_anim>3 {shoot_anim=0}
        }

        if y>=global.water_level && !global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 {animator.sprite_index=global.fire_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0}
            if hspd=0 && state=0 && dir=1 {animator.sprite_index=global.fire_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0}

            if hspd>0 && dir=0 && state=0 {animator.sprite_index=global.fire_character_run; animator.image_index+=hspd/20; animator.image_xscale=1; animkind=0}
            if hspd<0 && dir=1 && state=0 {animator.sprite_index=global.fire_character_run; animator.image_index+=hspd/20; animator.image_xscale=-1; animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.fire_character_swim; animator.image_index=swim_anim; animator.image_xscale=1;animkind=2}
            if dir=1 && grav<>0 {animator.sprite_index=global.fire_character_swim; animator.image_index=swim_anim; animator.image_xscale=-1;animkind=2}
            if swim_anim<9 {swim_anim+=0.2}

            if schylanie=1 && dir=0 {animator.sprite_index=global.fire_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.fire_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            if schylanie=1 || state<>0 {shoot_anim=0}
            if dir=0 && shoot_anim>0 {animator.sprite_index=global.fire_character_shoot; animator.image_xscale=1; shoot_anim+=1;animkind=0}
            if dir=1 && shoot_anim>0 {animator.sprite_index=global.fire_character_shoot; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
            if shoot_anim>3 {shoot_anim=0}

            if global.efekty>5 {tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale}


        }}

    // OGRODNIX MARIO
    if global.rodzajmaria=3 {
        if y<global.water_level || global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 && shoot_anim=0 {animator.sprite_index=global.lui_character_run; animator.image_index=0; animator.image_xscale=1;animkind=0}
            if hspd=0 && state=0 && dir=1 && shoot_anim=0 {animator.sprite_index=global.lui_character_run; animator.image_index=0; animator.image_xscale=-1;animkind=0}

            if hspd>0 && dir=0 && state=0 && shoot_anim=0 {animator.sprite_index=global.lui_character_run; animator.image_index+=hspd/10; animator.image_xscale=1;animkind=0}
            if hspd<0 && dir=1 && state=0 && shoot_anim=0 {animator.sprite_index=global.lui_character_run; animator.image_index+=hspd/10; animator.image_xscale=-1;animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.lui_character_jump; animator.image_xscale=1;animkind=1}
            if dir=1 && grav<>0 {animator.sprite_index=global.lui_character_jump; animator.image_xscale=-1;animkind=1}

            if schylanie=1 && dir=0 {animator.sprite_index=global.lui_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.lui_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            shoot_anim=0 // nie ma strzelania!

        }

        if y>=global.water_level && !global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 {animator.sprite_index=global.lui_character_run; animator.image_index=0; animator.image_xscale=1;animkind=0}
            if hspd=0 && state=0 && dir=1 {animator.sprite_index=global.lui_character_run; animator.image_index=0; animator.image_xscale=-1;animkind=0}

            if hspd>0 && dir=0 && state=0 {animator.sprite_index=global.lui_character_run; animator.image_index+=hspd/20; animator.image_xscale=1;animkind=0}
            if hspd<0 && dir=1 && state=0 {animator.sprite_index=global.lui_character_run; animator.image_index+=hspd/20; animator.image_xscale=-1;animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.lui_character_swim; animator.image_index=swim_anim; animator.image_xscale=1;animkind=2}
            if dir=1 && grav<>0 {animator.sprite_index=global.lui_character_swim; animator.image_index=swim_anim; animator.image_xscale=-1;animkind=2}
            if swim_anim<9 {swim_anim+=0.2}

            if schylanie=1 && dir=0 {animator.sprite_index=global.lui_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.lui_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            shoot_anim=0 // nie ma strzelania!
            if global.efekty>5 {tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale}


        }}

    // BURACZANY MARIO
    if global.rodzajmaria=4 {
        if y<global.water_level || global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 && shoot_anim=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index=0; animator.image_xscale=1;animkind=0}
            if hspd=0 && state=0 && dir=1 && shoot_anim=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index=0; animator.image_xscale=-1;animkind=0}

            if hspd>0 && dir=0 && state=0 && shoot_anim=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index+=hspd/10; animator.image_xscale=1;animkind=0}
            if hspd<0 && dir=1 && state=0 && shoot_anim=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index+=hspd/10; animator.image_xscale=-1;animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.beetroot_character_jump; animator.image_xscale=1;animkind=1}
            if dir=1 && grav<>0 {animator.sprite_index=global.beetroot_character_jump; animator.image_xscale=-1;animkind=1}

            if schylanie=1 && dir=0 {animator.sprite_index=global.beetroot_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.beetroot_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            if schylanie=1 || state<>0 {shoot_anim=0}
            if dir=0 && shoot_anim>0 {animator.sprite_index=global.beetroot_character_shoot; animator.image_xscale=1; shoot_anim+=1;animkind=0}
            if dir=1 && shoot_anim>0 {animator.sprite_index=global.beetroot_character_shoot; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
            if shoot_anim>3 {shoot_anim=0}
        }

        if y>=global.water_level && !global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index=0; animator.image_xscale=1;animkind=0}
            if hspd=0 && state=0 && dir=1 {animator.sprite_index=global.beetroot_character_run; animator.image_index=0; animator.image_xscale=-1;animkind=0}

            if hspd>0 && dir=0 && state=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index+=hspd/20; animator.image_xscale=1;animkind=0}
            if hspd<0 && dir=1 && state=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index+=hspd/20; animator.image_xscale=-1;animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.beetroot_character_swim; animator.image_index=swim_anim; animator.image_xscale=1;animkind=2}
            if dir=1 && grav<>0 {animator.sprite_index=global.beetroot_character_swim; animator.image_index=swim_anim; animator.image_xscale=-1;animkind=2}
            if swim_anim<9 {swim_anim+=0.2}

            if schylanie=1 && dir=0 {animator.sprite_index=global.beetroot_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.beetroot_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}


            if global.efekty>5 {tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale}

            if schylanie=1 || state<>0 {shoot_anim=0}
            if dir=0 && shoot_anim>0 {animator.sprite_index=global.beetroot_character_shoot; animator.image_xscale=1; shoot_anim+=1;animkind=0}
            if dir=1 && shoot_anim>0 {animator.sprite_index=global.beetroot_character_shoot; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
            if shoot_anim>3 {shoot_anim=0}
        }}

    // RACCOON MARIO
    if global.rodzajmaria=6 {
        if y<global.water_level || global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_idle; animator.image_index=0; animator.image_xscale=1;animkind=0}
            if hspd=0 && state=0 && dir=1 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_idle; animator.image_index=0; animator.image_xscale=-1;animkind=0}

            if hspd>0 && dir=0 && state=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_walk; animator.image_index+=hspd/10; animator.image_xscale=1;animkind=0}
            if hspd<0 && dir=1 && state=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_walk; animator.image_index+=hspd/10; animator.image_xscale=-1;animkind=0}

            // When P-Meter is full and running, use run animation
            if abs(hspd)>6 && raccoon_fly_allowed=1 && state=0 && shoot_anim=0 && dir=0 {animator.sprite_index=global.raccoon_character_run; animator.image_index+=hspd/10; animator.image_xscale=1;animkind=0}
            if abs(hspd)>6 && raccoon_fly_allowed=1 && state=0 && shoot_anim=0 && dir=1 {animator.sprite_index=global.raccoon_character_run; animator.image_index+=hspd/10; animator.image_xscale=-1;animkind=0}

            // Jump animation
            if dir=0 && grav<>0 && raccoon_fall=0 && raccoon_fly_allowed=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_jump; animator.image_xscale=1;animkind=1}
            if dir=1 && grav<>0 && raccoon_fall=0 && raccoon_fly_allowed=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_jump; animator.image_xscale=-1;animkind=1}

            // Fall / parachute animation
            if dir=0 && raccoon_fall=1 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_fall; animator.image_index+=0.2; animator.image_xscale=1;animkind=1}
            if dir=1 && raccoon_fall=1 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_fall; animator.image_index+=0.2; animator.image_xscale=-1;animkind=1}

            // Fly animation (ascending or descending, matches SMWP2 behavior)
            if dir=0 && raccoon_fly_allowed=1 && grav<>0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_fly; animator.image_index+=0.25; animator.image_xscale=1;animkind=1}
            if dir=1 && raccoon_fly_allowed=1 && grav<>0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_fly; animator.image_index+=0.25; animator.image_xscale=-1;animkind=1}

            // Crouch
            if schylanie=1 && dir=0 {animator.sprite_index=global.raccoon_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.raccoon_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            // Shooting (tail whip) animation — high priority, works in air and on ground
            if schylanie=1 {shoot_anim=0}
            if dir=0 && shoot_anim>0 {animator.sprite_index=global.raccoon_character_shoot; animator.image_index+=0.5; animator.image_xscale=1; shoot_anim+=1;animkind=0}
            if dir=1 && shoot_anim>0 {animator.sprite_index=global.raccoon_character_shoot; animator.image_index+=0.5; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
            if shoot_anim>8 {shoot_anim=0; animator.image_index=0}
        }

        if y>=global.water_level && !global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_idle; animator.image_index=0; animator.image_xscale=1;animkind=0}
            if hspd=0 && state=0 && dir=1 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_idle; animator.image_index=0; animator.image_xscale=-1;animkind=0}

            if hspd>0 && dir=0 && state=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_walk; animator.image_index+=hspd/20; animator.image_xscale=1;animkind=0}
            if hspd<0 && dir=1 && state=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_walk; animator.image_index+=hspd/20; animator.image_xscale=-1;animkind=0}

            if dir=0 && grav<>0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_swim; animator.image_index=swim_anim; animator.image_xscale=1;animkind=2}
            if dir=1 && grav<>0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_swim; animator.image_index=swim_anim; animator.image_xscale=-1;animkind=2}
            if swim_anim<9 {swim_anim+=0.2}

            if schylanie=1 && dir=0 {animator.sprite_index=global.raccoon_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.raccoon_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            // Shooting (tail whip) animation — high priority, works in water too
            if schylanie=1 {shoot_anim=0}
            if dir=0 && shoot_anim>0 {animator.sprite_index=global.raccoon_character_shoot; animator.image_index+=0.5; animator.image_xscale=1; shoot_anim+=1;animkind=0}
            if dir=1 && shoot_anim>0 {animator.sprite_index=global.raccoon_character_shoot; animator.image_index+=0.5; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
            if shoot_anim>8 {shoot_anim=0; animator.image_index=0}

            if global.efekty>5 {tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale}

        }}

} // koniec global.pauza


// 光照设置
if
(
(
global.rodzajmaria = 0 || ( schylanie = 1 && global.rodzajmaria <> 5 )
)
||
(
global.rodzajmaria = 5 &&
(
animator.sprite_index = global.small_character_run ||
animator.sprite_index = global.small_character_jump ||
animator.sprite_index = global.small_character_swim
)
)
)
{
    light_y = -16;
} else {
    light_y = -28;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=combo
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

// algorytm ktory resetuje nabijanie combo za zabijanie przeciwnikow, dla rozdeptywania bez dotykania ziemii i zabijania
// muszla.

if global.pauza=0 && shell_lock=0 && global.level_complete=0 {

    if global.combo1>0 {global.combo1reset+=1}
    if global.combo1reset>200 {global.combo1=0;global.combo1reset=0}

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=kick
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && shell_lock=0 && global.level_complete=0 && pipe_state=0 {
    // rozdeptywanie wrogow

    // Raccoon tail hit check runs first: mark enemies before stomp so tail takes priority
    // Must calculate tail position from CURRENT frame player data (not stale tail.x/y)
    // because o_raccoon_tail Step runs AFTER o_marker Step, leaving position 1 frame behind
    if instance_exists(o_raccoon_tail) {
        var _tdir, _tsweepX, _ttimer, _ttailX, _ttailY;
        _tdir = 1
        if o_raccoon_tail.dir = 1 { _tdir = -1 }

        _ttimer = o_raccoon_tail.timer
        if _ttimer <= 2 { _tsweepX = 0 } else {
            if _ttimer <= 4 { _tsweepX = (_ttimer - 2) / 2 * 20 * _tdir } else {
                if _ttimer <= 7 { _tsweepX = (20 - (_ttimer - 4) / 3 * 40) * _tdir } else { _tsweepX = (-20 + (_ttimer - 7) / 5 * 20) * _tdir }
            }
        }

        // Tail X: player center + sweep (SMWP2: tail.Position = Vector2.Zero)
        _ttailX = x + _tsweepX
        // Tail Y: align tail bbox_bottom (origin_y=12+11=23) with player bbox_bottom (origin_y=65)
        _ttailY = y - 11

        // Falling offset (SMWP2: offset down by fall speed in open air)
        if grav > 0 {
            var _tcheckY;
            _tcheckY = y + grav + 1
            if !place_meeting(x, _tcheckY, obj_wall) && !place_meeting(x, _tcheckY, o_pointblock) && !place_meeting(x, _tcheckY, o_windas) {
                _ttailY = y - 11 + grav
            }
        }

        // Apply calculated position so raccoon_tail_hit_check sees correct self.x/self.y
        o_raccoon_tail.x = _ttailX
        o_raccoon_tail.y = _ttailY

        with(o_raccoon_tail) {
            raccoon_tail_hit_check()
        }
    }

    if global.rodzajmaria<>5 {

        //gwiazdka记录是否为无敌星状态
        if star_timer<=0 {
            //踩或撞普通可踩敌人
            if place_meeting(x,y+max(0,grav+global.level_gravity/5),o_goomba) && !place_meeting(x,y+max(0,grav+global.level_gravity/5),o_troopashell2)  && !place_meeting(x,y+max(0,grav+global.level_gravity/5),o_troopashell) && !place_meeting(x,y+max(0,grav+global.level_gravity/5),o_bowser) /* && muszlowanie>10 */
            {
                tmp=instance_place(x,y+max(0,grav+global.level_gravity/5),o_goomba)
                if tmp.killer=0 && tmp.license <> 1 && tmp.hurt_delay=0 {
                    if tmp.kill_type=0 && grav>0 && y<tmp.y {
                        //lolo.energia-=233333333333333333333; 恶劣变量
                        tmp.kill_type=1;//这里是记录是普通的踩还是无敌星，估计主要是为了计分之类
                        state=1;
                        grav=-8-tmp.knockback
                        if raccoon_flew=1 {raccoon_fly_timer=0}
                        global.combo1+=1
                        global.combo1reset=0
                        //muszlowanie=0
                        if global.sample=1 {tmp2=sound_play(snd_stomp);sound_volume(snd_stomp,global.game_volume)} //sampel
                        if tmp.object_index=o_bowser && dir=0 {hspd+=6}
                        if tmp.object_index=o_bowser && dir=1 {hspd-=6}
                    }
                }
                if tmp.hurt_delay=0 && tmp.killer=0 && hit_timer=0 && y>=tmp.y && shield=0 && tmp.license <> 1 {hit_timer=1}
            }

            //踩或撞炮弹
            if place_meeting(x,y,o_goomba) && !place_meeting(x,y,o_troopashell2) && !place_meeting(x,y,o_bowser) /* && muszlowanie>10 */
            {
                tmp=instance_place(x,y,o_goomba)
                if tmp.killer=0 && tmp.license = 1 {
                    if tmp.kill_type=0 && grav>0 && y<tmp.y {
                        // lolo.energia-=233333333333333333333;
                        tmp.kill_type=1;
                        state=1;
                        grav=-8-tmp.knockback
                        if raccoon_flew=1 {raccoon_fly_timer=0}
                        global.combo1+=1
                        global.combo1reset=0
                        //muszlowanie=0
                        if global.sample=1 {tmp2=sound_play(snd_stomp);sound_volume(snd_stomp,global.game_volume)} //sampel
                        if tmp.object_index=o_bowser && dir=0 {hspd+=6}
                        if tmp.object_index=o_bowser && dir=1 {hspd-=6}
                    } }
                if tmp.killer=0 && hit_timer=0 && y>=tmp.y && shield=0 && tmp.license = 1 {hit_timer=1}
            }

            //踩或撞到危险敌人
            if place_meeting(x,y,o_goomba) && !place_meeting(x,y,o_troopashell2) && !place_meeting(x,y,o_bowser) /* && muszlowanie>10 */
            {
                tmp=instance_place(x,y,o_goomba)
                if tmp.killer=1 && hit_timer=0 && shield=0 {hit_timer=1}//killer=1就是不能踩（刺猬）
            }

            //踢静止龟壳
            if place_meeting(x,y+max(0,grav+global.level_gravity/5),o_troopashell2) /* && muszlowanie>10*/ && shell_lock=0//这个是静止龟壳
            {
                tmp=instance_place(x,y+max(0,grav+global.level_gravity/5),o_troopashell2)
                if tmp.hurt_delay=0 && tmp.kill_type=0 {
                    // spiny shell: kick only on the safe (non-spike) side
                    var _canKick; _canKick = 1;
                    if tmp.shell_kind=4 {
                        if tmp.is_flipped=0 {
                            // spikes on top: player above (y < shell.y) → hurt
                            if y < tmp.y { _canKick = 0; }
                        } else {
                            // spikes on bottom: hurt only when truly below (feet y-1 below shell bottom shell.y+13; same ground = kickable)
                            if y > tmp.y + 14 { _canKick = 0; }
                        }
                        if _canKick=0 && hit_timer=0 && shield=0 { hit_timer=1 }
                    }
                    if _canKick=1 {
                        if x<tmp.x {tmp.dir=1;tmp.kill_type=1}
                        if x>=tmp.x {tmp.dir=-1;tmp.kill_type=1}//这里实现的是踢龟壳（所以为什么要以踩为判定基础……）
                        if state=1 {grav=-8; if raccoon_flew=1 {raccoon_fly_timer=0}}
                        if global.sample=1 {tmp2=sound_play(snd_stomp);sound_volume(snd_stomp,global.game_volume)} //sampel
                    }
                }
            }

            //踩停运动龟壳
            if place_meeting(x,y+max(0,grav+global.level_gravity/5),o_troopashell) {
                tmp=instance_place(x,y+max(0,grav+global.level_gravity/5),o_troopashell)
                // spiny shell (czerwona=4): 移动刺壳 - 碰到即受伤，不可踩停
                var _stopAbove, _hurtSide;
                _stopAbove = (y<tmp.y);   // normal: above = safe stop
                _hurtSide = (y>=tmp.y);   // normal: below/side = hurt
                if tmp.shell_kind=4 {
                    if tmp.is_flipped=0 {
                        // 刺向上：移动刺壳不可踩停，接触即受伤
                        _stopAbove = 0;
                        _hurtSide = 1;
                    }
                    // is_flipped=1: 倒立刺壳，和普通龟壳无异（保持默认）
                }
                if tmp.kill_type=0 && grav>0 && _stopAbove && tmp.hurt_delay=0 {
                    tmp.kill_type=1;
                    state=1;
                    grav=-8-tmp.knockback
                    if raccoon_flew=1 {raccoon_fly_timer=0}
                    global.combo1+=1
                    global.combo1reset=0
                    if global.sample=1 {tmp2=sound_play(snd_stomp);sound_volume(snd_stomp,global.game_volume)}
                }
                if tmp.hurt_delay=0 && hit_timer=0 && _hurtSide && shield=0 {hit_timer=1}
            }
        }



        else {

            if place_meeting(x,y+max(0,grav+global.level_gravity/5),o_goomba) && !place_meeting(x,y+max(0,grav+global.level_gravity/5),o_bowser) {
                tmp=instance_place(x,y+max(0,grav+global.level_gravity/5),o_goomba)
                if tmp.stomp_proof=0 && tmp.killer=0 && tmp.license <> 1 {
                    if tmp.kill_type=0 && grav>0 && y<tmp.y {
                        // lolo.energia-=233333333333333333333333333333
                        tmp.kill_type=2//这个是无敌星
                        nabijanie+=1
                        tmp2=instance_create(x,y,o_scorepop2)
                        tmp2.image_index=nabijanie-1
                        if nabijanie>6 {nabijanie=0}
                        state=1;
                        grav=-8-tmp.knockback
                        if raccoon_flew=1 {raccoon_fly_timer=0}
                        global.combo1+=1
                        global.combo1reset=0
                        if global.sample=1 {tmp2=sound_play(snd_stomp);sound_volume(snd_stomp,global.game_volume)} //sampel
                    } }
            }

            if place_meeting(x,y,o_goomba) && !place_meeting(x,y,o_bowser) {
                tmp=instance_place(x,y,o_goomba)
                if tmp.stomp_proof=0 && tmp.killer=0 && tmp.license = 1 {
                    if tmp.kill_type=0 && grav>0 && y<tmp.y {
                        //  lolo.energia-=233333333333333333333333333333
                        tmp.kill_type=2
                        nabijanie+=1
                        tmp2=instance_create(x,y,o_scorepop2)
                        tmp2.image_index=nabijanie-1
                        if nabijanie>6 {nabijanie=0}
                        state=1;
                        grav=-8-tmp.knockback
                        if raccoon_flew=1 {raccoon_fly_timer=0}
                        global.combo1+=1
                        global.combo1reset=0
                        if global.sample=1 {tmp2=sound_play(snd_stomp);sound_volume(snd_stomp,global.game_volume)} //sampel
                    } }
            }

            if place_meeting(x,y,o_goomba) && !place_meeting(x,y,o_bowser) {
                tmp=instance_place(x,y,o_goomba)
                if tmp.stomp_proof=0 && tmp.kill_type=0 {//lolo.energia-=233333333333333333333333333333 啊，这个dabusi变量是我以前加的，防止敌人被星死，以及龟壳撞死
                    tmp.kill_type=2
                    nabijanie+=1
                    tmp2=instance_create(x,y,o_scorepop2)
                    tmp2.image_index=nabijanie-1
                    if nabijanie>6 {nabijanie=0}
                }
            }
        }

        if place_meeting(x,y+max(0,grav+global.level_gravity/5),o_bowser) /* && muszlowanie>10 *///库巴咱就不管了
        {
            tmp=instance_place(x,y+max(0,grav+global.level_gravity/5),o_bowser)
            if tmp.killer=0 {
                if tmp.kill_type=0 && grav>0 && y<tmp.y-40 && tmp.hit<=0 {
                    tmp.hp-=114514; //踩一次必然扣HP，但子弹攻击要看库巴的koopa_strength来判断
                    tmp.kill_type=1;
                    state=1;
                    grav=-8//-lolo.odpych
                    if raccoon_flew=1 {raccoon_fly_timer=0}
                    global.combo1+=1
                    global.combo1reset=0
                    //muszlowanie=0

                    if tmp.object_index=o_bowser && dir=0 {hspd+=6}
                    if tmp.object_index=o_bowser && dir=1 {hspd-=6}
                } }
            if tmp.killer=0 && hit_timer=0 && y>=tmp.y-40 && shield=0 && star_timer<=0 {hit_timer=1}
            if tmp.hit>0 && tmp.hit<170 && shield=0 && star_timer<=0 {hit_timer=1}
        }

    }

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=fireball
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.rodzajmaria=2 && shell_lock=0 && global.level_complete=0 && pipe_state=0 {
    if instance_number(o_fireball)<2 {
        if dir=1 && keyboard_check(global.key_fire) && shoot_anim2=0 {shoot_anim2=1; tmp=instance_create(x-10,y-40,o_fireball); tmp.dir=-1; shoot_anim=1;if global.sample=1 {tmp2=sound_play(snd_fire);sound_volume(snd_fire,global.game_volume)}}
        if dir=0 && keyboard_check(global.key_fire) && shoot_anim2=0 {shoot_anim2=1; tmp=instance_create(x+10,y-40,o_fireball); tmp.dir=1; shoot_anim=1;if global.sample=1 {tmp2=sound_play(snd_fire);sound_volume(snd_fire,global.game_volume)}}
    }
    if !keyboard_check(global.key_fire) {shoot_anim2=0}

}

if global.pauza=0 && global.rodzajmaria=4 && shell_lock=0 && pipe_state=0 {
    if instance_number(o_beetroot)<2 {
        if dir=1 && keyboard_check(global.key_fire) && shoot_anim2=0 {shoot_anim2=1; tmp=instance_create(x-10,y-48,o_beetroot); tmp.dir=-1; shoot_anim=1;if global.sample=1 {tmp2=sound_play(snd_fire);sound_volume(snd_fire,global.game_volume)}}
        if dir=0 && keyboard_check(global.key_fire) && shoot_anim2=0 {shoot_anim2=1; tmp=instance_create(x+10-30*global.MFbeet,y-48,o_beetroot); tmp.dir=1; shoot_anim=1;if global.sample=1 {tmp2=sound_play(snd_fire);sound_volume(snd_fire,global.game_volume)}}
    }
    if !keyboard_check(global.key_fire) {shoot_anim2=0}

}

// Raccoon tail attack
if global.pauza=0 && global.rodzajmaria=6 && shell_lock=0 && global.level_complete=0 && pipe_state=0 && schylanie=0 {
    if !instance_exists(o_raccoon_tail) {
        if dir=1 && keyboard_check(global.key_fire) && shoot_anim2=0 {
            shoot_anim2=1;
            tmp=instance_create(x,y-11,o_raccoon_tail);
            tmp.dir=1;
            tmp.timer=0;
            shoot_anim=1;
            animator.image_index=0;
            if global.sample=1 {tmp2=sound_play(snd_spin);sound_volume(snd_spin,global.game_volume)}
        }
        if dir=0 && keyboard_check(global.key_fire) && shoot_anim2=0 {
            shoot_anim2=1;
            tmp=instance_create(x,y-11,o_raccoon_tail);
            tmp.dir=0;
            tmp.timer=0;
            shoot_anim=1;
            animator.image_index=0;
            if global.sample=1 {tmp2=sound_play(snd_spin);sound_volume(snd_spin,global.game_volume)}
        }
    }
    if !keyboard_check(global.key_fire) {shoot_anim2=0}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=bonus
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//fast retry 恢复背景音量;关于死亡时降低音量请访问马里奥狗带物件

if(string(global.bgm_id)='146') && !instance_exists(o_mariodead) {
    if vvvv<1 && !setonce {vvvv=0.2;setonce=true;}
    surface_volume = 0.01*(global.water_level - y + 50)
    mm_set_volume(global.musicplay,vvvv*(surface_volume))
    mm_set_volume(global.musicplay2,vvvv*(1-surface_volume))
    if vvvv<1 {vvvv+=0.05;}
} else { if vvvv<1 {vvvv+=0.05; mm_set_volume(global.musicplay,vvvv)}}

if pipe_state=0 {
    if global.pauza=0 && shell_lock=0 && global.level_complete=0 {

        // zdobywanie monety



        if place_meeting(x,y,o_point) && global.rodzajmaria<>5 {
            bonus=instance_place(x,y,o_point)
            with(bonus) {instance_destroy()}
            global.coins+=1
            if global.sample=1 {tmp2=sound_play(snd_coin);sound_volume(snd_coin,global.game_volume)}
        }

        //特殊音乐


        // OBRYWANIE

        if y>room_height+30 && hit_timer=0 && global.rodzajmaria<>5 {hit_timer=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white}
        if (global.bowser_phase=2||global.bowser_phase=3)&& y>view_yview+480+30 && hit_timer=0 && global.rodzajmaria<>5 {
            hit_timer=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white
        }
        if global.bowser_phase=0 && region_count>0 && view_set=1 && y>view_yview+480+30 && hit_timer=0 && global.rodzajmaria<>5 {
            hit_timer=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white
        }
        if place_meeting(x,y,o_lava) && hit_timer=0 && global.rodzajmaria<>5 {
            hit_timer=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white
        }

        if place_meeting(x,y,o_bonusdead) && hit_timer=0 && global.rodzajmaria<>5 {hit_timer=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white}
        //下面一行，SMWP1.7新增：马里奥掉进全局岩浆即死
        if y>=global.water_level+2 && global.lava=1  && hit_timer=0 && global.rodzajmaria<>5 {
            hit_timer=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white
        }

        if hit_timer=1 && global.rodzajmaria=5 {hit_timer=0}
        if hit_timer=1 && shield=0 && global.rodzajmaria<>5 {
            if global.rodzajmaria<>0 {shield=200; hit_timer=2; global.pauza=2;}
            if global.rodzajmaria=0 {
                global.zycia-=1; shell_lock=1;
                if(!global.fast_retry) {
                    mm_stop_all_ext();
                    if global.sample=1 {tmp2=sound_play(snd_die);sound_volume(snd_die,global.game_volume)}
                } else {
                    if global.sample=1 {
                        tmp2=sound_play(snd_fastdie);
                        sound_volume(snd_fastdie,global.game_volume);
                    }
                }
                instance_create(x,y,o_mariodead);animator.visible=0;
                // 光照设置
                light_radius = 0;
            }
            if global.rodzajmaria=1 {global.rodzajmaria=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)}}
            if global.rodzajmaria>=2 {global.rodzajmaria=1;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)}}
        }
        if shield>0 && shell_lock=0 {
            shield-=1;
            shieldanim+=1
            if shieldanim>3 && animator.visible=1 {animator.visible=0;shieldanim=0;}
            if shieldanim>3 && animator.visible=0 {animator.visible=1;shieldanim=0;}
        }




        if shield=0 && shell_lock=0 {animator.visible=1}


        // GWIAZDKA

        if place_meeting(x,y,o_bonusstar) && global.rodzajmaria<>5 {
            kafel=instance_place(x,y,o_bonusstar)
            with(kafel) {instance_destroy()}
            star_timer=500
            mm_play_ext('.\Data\MW\ktkm3.dll',0)
            animator2.visible=1
        }




        if /*global.godmode=0 &&*/ keyboard_check(global.key_restart) && hit_timer=0 {instance_create(x,y,o_fireexplode);sound_play(snd_break)hit_timer=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white;suicide=1}
        if star_timer<=0 {animator.image_blend=c_white;animator2.visible=0}
        if star_timer>0 {
            star_timer-=1; kolor=make_color_rgb(random(255),random(255),random(255)); animator.image_blend=kolor

        }
        //无敌星音乐重置
        if star_timer=1 && instance_number(object112)<>0 {mm_play_ext('.\Data\MW\ktkm8.dll',0)}
        if star_timer=1 && instance_number(object112)=0 {
            if (string(global.bgm_id) == "600" || string(global.bgm_id) == "0") {
                mm_stop_all_ext();
            } else {
                Music_Play()//大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲
                //你们要改音乐的到Scripts -> Music_Play改
            }
        }

        // zdobywanie grzyba // POWIEKSZENIE od kwiatka i LUI

        if global.rodzajmaria=0 {image_yscale=1}

        if place_meeting(x,y,o_bonusmush) && global.rodzajmaria=0 && global.rodzajmaria<>5 {
            bonus=instance_place(x,y,o_bonusmush)
            with(bonus) {instance_destroy()}
            global.rodzajmaria=1
            if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { slide = 1 };if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)){ slide = 2 }    global.pauza=1
            if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}

            if animkind=0 {animator.sprite_index=global.big_character_run}
            if animkind=1 {animator.sprite_index=global.big_character_jump}
            if animkind=2 {animator.sprite_index=global.big_character_swim}
        }


        if place_meeting(x,y,o_bonusflower) && global.rodzajmaria=0 && global.rodzajmaria<>5 && checkpointdetect=1 {
            bonus=instance_place(x,y,o_bonusflower)
            with(bonus) {instance_destroy()}
            global.rodzajmaria=1
            if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { slide = 1 };if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)){ slide = 2 }    global.pauza=1
            if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}

            if animkind=0 {animator.sprite_index=global.big_character_run}
            if animkind=1 {animator.sprite_index=global.big_character_jump}
            if animkind=2 {animator.sprite_index=global.big_character_swim}
        }


        if place_meeting(x,y,o_bonus1up) && global.rodzajmaria<>5 && checkpointdetect=1 {
            bonus=instance_place(x,y,o_bonus1up)
            with(bonus) {instance_destroy()}

            fifi=instance_create(x,y-32,o_scorepop3)
            fifi.image_index=6
            if global.sample=1 {tmp2=sound_play(snd_1up);sound_volume(snd_1up,global.game_volume)}

        }



        if place_meeting(x,y,o_bonuslui) && global.rodzajmaria=0 && global.rodzajmaria<>5 && checkpointdetect=1 {
            bonus=instance_place(x,y,o_bonuslui)
            with(bonus) {instance_destroy()}
            global.rodzajmaria=1
            if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { slide = 1 };if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)){ slide = 2 }    global.pauza=1
            if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}

            if animkind=0 {animator.sprite_index=global.big_character_run}
            if animkind=1 {animator.sprite_index=global.big_character_jump}
            if animkind=2 {animator.sprite_index=global.big_character_swim}
        }

        if place_meeting(x,y,o_bonusbeetroot) && global.rodzajmaria=0 && global.rodzajmaria<>5 && checkpointdetect=1 {
            bonus=instance_place(x,y,o_bonusbeetroot)
            with(bonus) {instance_destroy()}
            global.rodzajmaria=1
            if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { slide = 1 };if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)){ slide = 2 }    global.pauza=1
            if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}

            if animkind=0 {animator.sprite_index=global.big_character_run}
            if animkind=1 {animator.sprite_index=global.big_character_jump}
            if animkind=2 {animator.sprite_index=global.big_character_swim}
        }

    }


    // Zdobycie 1000 punktow za grzyba gdy mario nie jest juz maly
    if place_meeting(x,y,o_bonusmush) && global.rodzajmaria>0 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusmush)
        if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}
        tmp=instance_create(bonus.x,bonus.y,o_scorepop3)
        tmp.image_index=3
        with(bonus) {instance_destroy()}
    }

    // ------------------------------------------------------------------------------------------------------
    // ZDOBYWANIE KWIATKA GDY MARIO JEST DUZY | GDY JEST KWIATKOWY | GDY NIE JEST KWIATKOWY, ALE TEZ NIE MALY
    //
    if place_meeting(x,y,o_bonusflower) && global.rodzajmaria=2 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusflower)
        if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}
        tmp=instance_create(bonus.x,bonus.y,o_scorepop3)
        tmp.image_index=3
        with(bonus) {instance_destroy()}
    }

    if place_meeting(x,y,o_bonusflower) && global.rodzajmaria<>2 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusflower)
        with(bonus) {instance_destroy()}
        global.rodzajmaria=2
        global.pauza=1
        if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}

        if animkind=0 {animator.sprite_index=global.fire_character_run}
        if animkind=1 {animator.sprite_index=global.fire_character_jump}
        if animkind=2 {animator.sprite_index=global.fire_character_swim}
    }

    // ------------------------------------------------------------------------------------------------------
    // ZDOBYWANIE LUIGDY MARIO JEST DUZY | GDY JEST LUI'WOY | GDY NIE JEST LUI'OWY, ALE TEZ NIE MALY
    //
    if place_meeting(x,y,o_bonuslui) && global.rodzajmaria=3 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonuslui)
        if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}
        tmp=instance_create(bonus.x,bonus.y,o_scorepop3)
        tmp.image_index=3
        with(bonus) {instance_destroy()}
    }

    if place_meeting(x,y,o_bonuslui) && global.rodzajmaria<>3 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonuslui)
        with(bonus) {instance_destroy()}
        global.rodzajmaria=3
        global.pauza=1
        if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}

        if animkind=0 {animator.sprite_index=global.lui_character_run}
        if animkind=1 {animator.sprite_index=global.lui_character_jump}
        if animkind=2 {animator.sprite_index=global.lui_character_swim}
    }

    // ------------------------------------------------------------------------------------------------------
    // ZDOBYWANIE LUIGDY MARIO JEST DUZY | GDY JEST LUI'WOY | GDY NIE JEST LUI'OWY, ALE TEZ NIE MALY
    //
    if place_meeting(x,y,o_bonusbeetroot) && global.rodzajmaria=4 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusbeetroot)
        if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}
        tmp=instance_create(bonus.x,bonus.y,o_scorepop3)
        tmp.image_index=3
        with(bonus) {instance_destroy()}
    }

    if place_meeting(x,y,o_bonusbeetroot) && global.rodzajmaria<>4 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusbeetroot)
        with(bonus) {instance_destroy()}
        global.rodzajmaria=4
        global.pauza=1
        if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}

        if animkind=0 {animator.sprite_index=global.beetroot_character_run}
        if animkind=1 {animator.sprite_index=global.beetroot_character_jump}
        if animkind=2 {animator.sprite_index=global.beetroot_character_swim}
    }

    // ------------------------------------------------------------------------------------------------------
    // ZDOBYWANIE RACCOON (small pickup, already raccoon, other state)
    if place_meeting(x,y,o_bonusraccoon) && global.rodzajmaria=0 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusraccoon)
        with(bonus) {instance_destroy()}
        global.rodzajmaria=1
        if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { slide = 1 };if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)){ slide = 2 }    global.pauza=1
        if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}

        if animkind=0 {animator.sprite_index=global.big_character_run}
        if animkind=1 {animator.sprite_index=global.big_character_jump}
        if animkind=2 {animator.sprite_index=global.big_character_swim}
    }

    if place_meeting(x,y,o_bonusraccoon) && global.rodzajmaria=6 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusraccoon)
        if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}
        tmp=instance_create(bonus.x,bonus.y,o_scorepop3)
        tmp.image_index=3
        with(bonus) {instance_destroy()}
    }

    if place_meeting(x,y,o_bonusraccoon) && global.rodzajmaria<>6 && global.rodzajmaria<>0 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusraccoon)
        with(bonus) {instance_destroy()}
        global.rodzajmaria=6
        global.pauza=1
        if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}

        if animkind=0 {animator.sprite_index=global.raccoon_character_idle}
        if animkind=1 {animator.sprite_index=global.raccoon_character_jump}
        if animkind=2 {animator.sprite_index=global.raccoon_character_swim}
    }


    if global.pauza=1 {
        if dir=0 {/*animator.image_xscale=1+sin(degtorad(sizing/3 ))/2*/}
        if dir=1 {/*animator.image_xscale=-1-sin(degtorad(sizing/3 ))/2*/}
        animator.image_yscale=1+(sin(degtorad(sizing)))/3
        sizing+=10
        if collect_delay<60 {collect_delay+=1}
        if collect_delay=60 {collect_delay=0; global.pauza=0;animator.image_xscale=1;animator.image_yscale=1}
    }

    if global.pauza=2 {
        if dir=0 {/*animator.image_xscale=1-sin(degtorad(sizing/3 ))/2*/}
        if dir=1 {/*animator.image_xscale=-1-sin(degtorad(sizing/3 ))/2*/}
        animator.image_yscale=1+(sin(degtorad(sizing)))/3
        sizing+=10
        if collect_delay<60 {collect_delay+=1}
        if collect_delay=60 {collect_delay=0; global.pauza=0;animator.image_xscale=1;animator.image_yscale=1; hit_timer=0}
    }


}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=fish area
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//SMWP 1.6+
//用于控制鱼的生成
if place_meeting(x,y,o_swimfisharea) {
    fisharea=instance_place(x,y,o_swimfisharea)
    fishcounter+=1
    if fisharea.type=0 {
        if fishcounter = 50 {
            fishcreateY=max(view_yview-60,global.water_level+38)+random(300)
            if instance_number(o_fishred2)<8 {
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_fishred2)
                fish.activated=1; fish.dir=fisharea.fishdir
            }
        }
        if fishcounter >= 100 {
            fishcounter=0
            fishcreateY=max(view_yview-60,global.water_level+38)+300+random(300)
            if instance_number(o_fishred2)<8 {
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_fishred2)
                fish.activated=1; fish.dir=fisharea.fishdir
            }
        }
    }
    if fisharea.type=1 {
        if fishcounter = 38 {
            fishcreateY=max(view_yview-60,global.water_level+38)+random(300)
            if instance_number(o_fishred2)<10 {
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_fishred2)
                fish.activated=1; fish.dir=fisharea.fishdir
            }
        }
        if fishcounter >= 75 {
            fishcounter=0
            fishcreateY=max(view_yview-60,global.water_level+38)+300+random(300)
            if instance_number(o_fishred2)<10 {
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_fishred2)
                fish.activated=1; fish.dir=fisharea.fishdir
            }
        }
    }
    if fisharea.type=2 {
        if fishcounter = 50 {
            fishcreateY=max(view_yview-60,global.water_level+38)+random(300)
            if instance_number(o_fishgreen2)<10 {
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_fishgreen2)
                fish.activated=1; fish.dir=fisharea.fishdir
            }
        }
        if fishcounter >= 100 {
            fishcounter=0
            fishcreateY=max(view_yview-60,global.water_level+38)+300+random(300)
            if instance_number(o_fishgreen2)<10 {
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_fishgreen2)
                fish.activated=1; fish.dir=fisharea.fishdir
            }
        }
    }
}
if place_meeting(x,y,o_flyfisharea) {
    fisharea2=instance_place(x,y,o_flyfisharea)
    fishcounter2+=1
    if fisharea2.type=0 {
        if fishcounter2 >= 25 && fisharea2.fishdir*hspd>=0 {
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_fishred3)<3 {
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_fishred3)
                fish.activated=1; fish.dir=fisharea2.fishdir
            }
        }
        if fishcounter2 >= 13 && fisharea2.fishdir*hspd<0 {
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_fishred3)<3 {
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_fishred3)
                fish.activated=1; fish.dir=fisharea2.fishdir
            }
        }
    }
    if fisharea2.type=1 {
        if fishcounter2 >= 10 && fisharea2.fishdir*hspd>=0 {
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_fishred3)<3 {
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_fishred3)
                fish.activated=1; fish.dir=fisharea2.fishdir
            }
        }
        if fishcounter2 >= 4 && fisharea2.fishdir*hspd<0 {
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_fishred3)<3 {
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_fishred3)
                fish.activated=1; fish.dir=fisharea2.fishdir
            }
        }
    }
    if fisharea2.type=2 {
        if fishcounter2 >= 25 && fisharea2.fishdir*hspd>=0 {
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_fishblue3)<3 {
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_fishblue3)
                fish.activated=1; fish.dir=fisharea2.fishdir
            }
        }
        if fishcounter2 >= 13 && fisharea2.fishdir*hspd<0 {
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_fishblue3)<3 {
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_fishblue3)
                fish.activated=1; fish.dir=fisharea2.fishdir
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=goal reached
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && pipe_state=0 /*&& prawdziwyczas>0*/ && hit_timer=0 && global.rodzajmaria<>5 {
    if place_meeting(x,y,o_exitar2) && global.level_complete=0 {
        global.level_complete=1
        tmp=instance_place(x,y,o_exitar2)
        endscoring=tmp.vy_offset
        tmp.zabity=1
        if endscoring>=0 && endscoring<10 {
            tmp=instance_create(x,y,o_scorepop)
            tmp.image_index=7
            global.score+=10000
        }
        if endscoring>=10 && endscoring<30 {
            tmp=instance_create(x,y,o_scorepop)
            tmp.image_index=5
        }
        if endscoring>=30 && endscoring<50 {
            tmp=instance_create(x,y,o_scorepop)
            tmp.image_index=4
        }
        if endscoring>=50 && endscoring<70 {
            tmp=instance_create(x,y,o_scorepop)
            tmp.image_index=3
        }
        if endscoring>=70 && endscoring<100 {
            tmp=instance_create(x,y,o_scorepop)
            tmp.image_index=2
        }
        if endscoring>=100 && endscoring<140 {
            tmp=instance_create(x,y,o_scorepop)
            tmp.image_index=1
        }
        if endscoring>=140 && endscoring<=200 {
            tmp=instance_create(x,y,o_scorepop)
            tmp.image_index=0
        }
    }






}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=scroll
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !initial_check {test_bound(x,y);initial_check=1}

if global.bowser_phase=0 {//普通状态
    view_xview=min(max(0,x-320,left_bound),max(0,right_bound),room_width-640)
    view_yview=min(max(0,y-240,top_bound),max(0,bottom_bound),room_height-480)
    if region_count=1 && view_set=0 {view_set = 1}
    //滚屏状态
    if ds_list_size(global.autoscrolls)>0 && global.scrollPaused = -1 {
        firstscroll=ds_list_find_value(global.autoscrolls,0)
        if x>firstscroll.x+16-320&&x<firstscroll.x+16+320&&y>firstscroll.y+16-240&&y<firstscroll.y+16+240&&checkpointdetect=1 {
            global.bowser_phase=2
            if scrolldetect2=0 {
                xcenter=firstscroll.x+16
                ycenter=firstscroll.y+16
            } else {
                xcenter=view_xview+320
                ycenter=view_yview+240
            }
        }
    }

    //CP后强滚
    if global.checkpoint=0 {scrolldetect=1}
    if global.checkpoint<>0&&checkpointdetect=1 && scrolldetect=0 && ds_list_size(global.autoscrolls)>0 {
        for(i=0;i<ds_list_size(global.autoscrolls);i+=1) {
            tmpscroll=ds_list_find_value(global.autoscrolls,i)
            if x>tmpscroll.x+16-320&&x<tmpscroll.x+16+320&&y>tmpscroll.y+16-240&&y<tmpscroll.y+16+240 {
                global.bowser_phase=2
                firstscroll=tmpscroll
                if scrolldetect2=0 {
                    xcenter=firstscroll.x+16
                    ycenter=firstscroll.y+16
                } else {
                    xcenter=view_xview+320
                    ycenter=view_yview+240
                }
                break;
            }
        }
        scrolldetect=1//本变量负责防止马里奥未传送到CP即停止CP强滚检测
    }
    if checkpointdetect<>0 {scrolldetect2=1}//本变量负责判断是否开场在强滚区域内
}

if global.koopa_scroll_count>0 {global.bowser_phase=1}

if global.scrollPaused = -1 {

    if global.bowser_phase=1//库巴状态，触发库巴见库巴对应object代码
    {
        if instance_exists(o_bowser) {if view_xview<o_bowser.pivot_x-320 && instance_number(o_mariodead)=0 && view_xview<room_width-640 {view_xview+=1;if x<=view_xview[0]+16 {x+=1; if place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock) {hit_timer=1 ; shield=0 ; global.rodzajmaria=0}}}}
        if instance_exists(o_bowser) {if view_xview>o_bowser.pivot_x-320 && instance_number(o_mariodead)=0 && view_xview>0 {view_xview-=1;if x>=view_xview[0]+624 {x-=1; if place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock) {hit_timer=1 ; shield=0 ; global.rodzajmaria=0}}}}
        view_yview=min(max(y-240,0),room_height-480)
    }

    if global.bowser_phase=2 && instance_number(o_mariodead)=0//滚屏至第一个滚屏obj
    {
        //if tttest=0{show_message("bingo");tttest=1}
        xcenter+=cos(point_direction(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)/360*2*pi)*firstscroll.scrollspeed
        ycenter-=sin(point_direction(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)/360*2*pi)*firstscroll.scrollspeed
        view_xview=min(max(xcenter-320,0),room_width-640)
        view_yview=min(max(ycenter-240,0),room_height-480)
        if point_distance(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)<=firstscroll.scrollspeed*1.5 {
            xcenter=firstscroll.x+16;ycenter=firstscroll.y+16
            global.bowser_phase=3}
    }

    if global.bowser_phase=3//好了开始激动人心的滚屏环节了
    {
        if orange_recover=0 && ds_list_find_index(global.autoscrolls,firstscroll) < ds_list_size(global.autoscrolls) - 1 && instance_number(o_mariodead)=0 {
            nextscroll = ds_list_find_value(global.autoscrolls,ds_list_find_index(global.autoscrolls,firstscroll)+1)
            xcenter+=cos(point_direction(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)/360*2*pi)*firstscroll.scrollspeed
            ycenter-=sin(point_direction(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)/360*2*pi)*firstscroll.scrollspeed
            if point_distance(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)<=firstscroll.scrollspeed*1.5 {
                xcenter=nextscroll.x+16;ycenter=nextscroll.y+16
                if firstscroll.is_orange=1 && nextscroll.is_orange=0 {
                    // 橙→绿过渡：xcenter停在绿色节点，镜头平滑追上后再继续
                    orange_recover=1
                }
                firstscroll=nextscroll
            }
        } else {
            nextscroll=firstscroll;
        }
        if instance_number(o_mariodead)=0 {
            if orange_recover=1 {
                // 橙→绿过渡：镜头以滚屏速度平滑移向绿色节点（xcenter已在节点位置等待）
                var rec_dir;
                rec_dir=point_direction(view_xview+320,view_yview+240,xcenter,ycenter)
                view_xview=min(max(view_xview+cos(rec_dir/360*2*pi)*firstscroll.scrollspeed,0),room_width-640)
                view_yview=min(max(view_yview-sin(rec_dir/360*2*pi)*firstscroll.scrollspeed,0),room_height-480)
                // 单轴对齐：某轴接近节点时直接赋值
                if abs(view_xview+320-xcenter)<=firstscroll.scrollspeed {view_xview=xcenter-320}
                if abs(view_yview+240-ycenter)<=firstscroll.scrollspeed {view_yview=ycenter-240}
                if point_distance(view_xview+320,view_yview+240,xcenter,ycenter)<=firstscroll.scrollspeed*1.5 {
                    view_xview=xcenter-320;view_yview=ycenter-240
                    orange_recover=0
                }
            } else {
                // 橙色强滚：镜头X跟随玩家，Y由穿过xcenter的垂线约束（玩家Y不参与计算）
                if firstscroll.is_orange=1 {
                    if nextscroll!=firstscroll {
                        osc_dx=nextscroll.x-firstscroll.x
                        osc_dy=nextscroll.y-firstscroll.y
                    } else {
                        // 末尾节点：方向 = 上一→当前，控件不动但镜头继续锁此方向
                        osc_dx=0;osc_dy=0
                        osc_idx=ds_list_find_index(global.autoscrolls,firstscroll)
                        if osc_idx>0 {
                            osc_prev=ds_list_find_value(global.autoscrolls,osc_idx-1)
                            osc_dx=firstscroll.x-osc_prev.x
                            osc_dy=firstscroll.y-osc_prev.y
                        }
                    }
                    // 自适应阻尼弹簧过渡：仅用于初次追上玩家，收束后切回直接跟随
                    // 非滚屏状态下进入的首个橙色节点 → 不应用阻尼，直接跟踪
                    if prev_bowser_phase!=2 && prev_bowser_phase!=3 {
                        spring_settled_x=1
                        spring_settled_y=1
                        spring_timer_x=0
                        spring_timer_y=0
                        prev_osc_dx=osc_dx
                        prev_osc_dy=osc_dy
                    }
                    // 检测滚屏方向是否改变 → 重置收束状态
                    if osc_dx!=prev_osc_dx or osc_dy!=prev_osc_dy {
                        spring_settled_x=0
                        spring_settled_y=0
                        spring_timer_x=0
                        spring_timer_y=0
                        prev_osc_dx=osc_dx
                        prev_osc_dy=osc_dy
                    }
                    // 两阶段追击：前warmup帧阻尼弹簧（平滑启动），之后匀速强追（不惧运动目标）
                    var warmup_frames;
                    warmup_frames=15
                    var k_safe,k_emergency,margin;
                    k_safe=0.02
                    k_emergency=0.20
                    margin=80
                    var screen_x,screen_y,danger_x,danger_y,k,d,target,diff;
                    screen_x=x-view_xview
                    screen_y=y-view_yview
                    danger_x=0
                    danger_y=0
                    if screen_x<margin {danger_x=1-screen_x/margin}
                    if screen_x>640-margin {danger_x=max(danger_x,(screen_x-(640-margin))/margin)}
                    if screen_y<margin {danger_y=1-screen_y/margin}
                    if screen_y>480-margin {danger_y=max(danger_y,(screen_y-(480-margin))/margin)}
                    if osc_dx!=0 and osc_dy!=0 {
                        // 一般斜向：X自由（阻尼→匀速），Y由垂线约束
                        if spring_settled_x=0 {
                            spring_timer_x+=1
                            target=clamp(x-320,0,room_width-640)
                            diff=target-view_xview
                            if spring_timer_x>=60 {
                                view_xview=target;spring_vx=0;spring_settled_x=1;spring_timer_x=0
                            } else if spring_timer_x<warmup_frames {
                                k=k_safe+(k_emergency-k_safe)*danger_x
                                d=2*sqrt(k)
                                spring_vx+=k*diff-d*spring_vx
                                view_xview+=spring_vx
                                if abs(diff)<1 && abs(spring_vx)<1 {
                                    view_xview=target;spring_vx=0;spring_settled_x=1;spring_timer_x=0
                                }
                            } else {
                                // 匀速追击：距离比例+20px下限，确保比玩家任何运动都快
                                k=max(abs(diff)*0.15,20)
                                if abs(diff)<=k {
                                    view_xview=target;spring_vx=0;spring_settled_x=1;spring_timer_x=0
                                } else {
                                    view_xview+=sign(diff)*k
                                    spring_vx=sign(diff)*k
                                }
                            }
                        } else {
                            view_xview=clamp(x-320,0,room_width-640)
                        }
                        view_yview=clamp(ycenter-((view_xview+320-xcenter)*osc_dx)/osc_dy-240,0,room_height-480)
                        spring_vy=0
                    } else if osc_dy==0 {
                        // 纯水平：X锁定，Y自由（阻尼→匀速）
                        view_xview=clamp(xcenter-320,0,room_width-640)
                        spring_vx=0
                        if spring_settled_y=0 {
                            spring_timer_y+=1
                            target=clamp(y-240,0,room_height-480)
                            diff=target-view_yview
                            if spring_timer_y>=60 {
                                view_yview=target;spring_vy=0;spring_settled_y=1;spring_timer_y=0
                            } else if spring_timer_y<warmup_frames {
                                k=k_safe+(k_emergency-k_safe)*danger_y
                                d=2*sqrt(k)
                                spring_vy+=k*diff-d*spring_vy
                                view_yview+=spring_vy
                                if abs(diff)<1 && abs(spring_vy)<1 {
                                    view_yview=target;spring_vy=0;spring_settled_y=1;spring_timer_y=0
                                }
                            } else {
                                k=max(abs(diff)*0.15,20)
                                if abs(diff)<=k {
                                    view_yview=target;spring_vy=0;spring_settled_y=1;spring_timer_y=0
                                } else {
                                    view_yview+=sign(diff)*k
                                    spring_vy=sign(diff)*k
                                }
                            }
                        } else {
                            view_yview=clamp(y-240,0,room_height-480)
                        }
                    } else {
                        // 纯垂直(dx==0)：X自由（阻尼→匀速），Y锁定
                        if spring_settled_x=0 {
                            spring_timer_x+=1
                            target=clamp(x-320,0,room_width-640)
                            diff=target-view_xview
                            if spring_timer_x>=60 {
                                view_xview=target;spring_vx=0;spring_settled_x=1;spring_timer_x=0
                            } else if spring_timer_x<warmup_frames {
                                k=k_safe+(k_emergency-k_safe)*danger_x
                                d=2*sqrt(k)
                                spring_vx+=k*diff-d*spring_vx
                                view_xview+=spring_vx
                                if abs(diff)<1 && abs(spring_vx)<1 {
                                    view_xview=target;spring_vx=0;spring_settled_x=1;spring_timer_x=0
                                }
                            } else {
                                k=max(abs(diff)*0.15,20)
                                if abs(diff)<=k {
                                    view_xview=target;spring_vx=0;spring_settled_x=1;spring_timer_x=0
                                } else {
                                    view_xview+=sign(diff)*k
                                    spring_vx=sign(diff)*k
                                }
                            }
                        } else {
                            view_xview=clamp(x-320,0,room_width-640)
                        }
                        view_yview=clamp(ycenter-240,0,room_height-480)
                        spring_vy=0
                    }
                    view_xview=clamp(view_xview,0,room_width-640)
                    view_yview=clamp(view_yview,0,room_height-480)
                } else {
                    view_xview=min(max(xcenter-320,0),room_width-640)
                    view_yview=min(max(ycenter-240,0),room_height-480)
                }
            }
        }
    }

    if (global.bowser_phase=2 && global.rodzajmaria<>5) {//位置矫正1
        if instance_number(o_mariodead)=0 {if x<=view_xview[0] && !(place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock)) {x+=cos(point_direction(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)/360*2*pi)*firstscroll.scrollspeed}
            if x<view_xview[0]-16 && pipe_state=0 {hit_timer=1 ; shield=0 ; global.rodzajmaria=0}}
        if instance_number(o_mariodead)=0 {if x>=view_xview[0]+640 && !(place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock)) {x+=cos(point_direction(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)/360*2*pi)*firstscroll.scrollspeed}
            if x>view_xview[0]+656 && pipe_state=0 {hit_timer=1 ; shield=0 ; global.rodzajmaria=0}}
        if x>view_xview[0]+624 && !(place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock)) {x=view_xview[0]+624;}
        if x<view_xview[0]+16 && !(place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock)) {x=view_xview[0]+16;}
        if pipe_delay>=31 {global.bowser_phase=0}
    }
    if (global.bowser_phase=3 && global.rodzajmaria<>5) {//位置矫正2
        if instance_number(o_mariodead)=0 {if x<=view_xview[0] && !(place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock)) {x+=cos(point_direction(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)/360*2*pi)*firstscroll.scrollspeed}
            if x<view_xview[0]-16 && pipe_state=0 {hit_timer=1 ; shield=0 ; global.rodzajmaria=0}}
        if instance_number(o_mariodead)=0 {if x>=view_xview[0]+640 && !(place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock)) {x+=cos(point_direction(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)/360*2*pi)*firstscroll.scrollspeed}
            if x>view_xview[0]+656 && pipe_state=0 {hit_timer=1 ; shield=0 ; global.rodzajmaria=0}}
        //强滚向下分量：上面出界死亡（到最后一个节点 nextscroll==firstscroll 时停止；镜头触底 view_yview==room_height-480 时也停止）
        // 橙→osc_dy>0；绿→nextscroll.y>firstscroll.y
        if global.topdeath=1 && nextscroll!=firstscroll && view_yview[0] < room_height - 480 {
            if (firstscroll.is_orange=1 && osc_dy>0) || (firstscroll.is_orange=0 && nextscroll.y>firstscroll.y) {
                if y<view_yview[0]-16 && pipe_state=0 {
                    hit_timer=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white
                }
            }
        }
        if x>view_xview[0]+624 && !(place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock)) {x=view_xview[0]+624;}
        if x<view_xview[0]+16 && !(place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock)) {x=view_xview[0]+16;}
        if pipe_delay>=31 {global.bowser_phase=0}
    }

    prev_bowser_phase=global.bowser_phase
}

if global.bowser_phase=4 { //道中库巴战结束后的滚屏修正过程
    centerset=0 {xcenter = view_xview+320;ycenter = view_yview+240;centerset=1}
    xcenter+=cos(point_direction(xcenter,ycenter,x,y)/360*2*pi)*3
    ycenter-=sin(point_direction(xcenter,ycenter,x,y)/360*2*pi)*3
    if point_distance(xcenter,ycenter,x,y)<=3*1.5 {
        xcenter=x;ycenter=y
        global.pauza=0;
        global.bowser_phase=0;
    }
    view_xview=min(max(xcenter-320,0),room_width-640)
    view_yview=min(max(ycenter-240,0),room_height-480)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=background
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
background_show()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=level completed
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {

    // Normal Level Pass
    if global.fastpass=0 || global.gameversion <= 1711 {
        fast_time = 0;
    }
    // Faster Level Pass
    if global.fastpass=1 {
        fast_time = 300;
    }

    if global.level_cleared>0 && global.level_cleared<1000-fast_time {global.level_cleared+=1}
    if global.level_cleared>450-fast_time && real_time>0 {real_time-=1; global.score+=100;nabija+=1}
    if global.level_cleared>500-fast_time && real_time>9 {real_time-=10; global.score+=1000;nabija+=1}
    if global.level_cleared>650-fast_time && real_time>99 {real_time-=100; global.score+=10000;nabija+=1}

    if nabija>5 {nabija=0; if global.sample=1 {tmp2=sound_play(snd_timescore);sound_volume(snd_timescore,global.game_volume)}}

    if global.level_cleared>450-fast_time && global.level_cleared<1000-fast_time && real_time<=0 {global.level_cleared=2000-fast_time}
    if global.level_cleared>=2000-fast_time global.level_cleared+=1
    if global.level_cleared>=2050-fast_time {global.level_complete=0;
        if global.testmode=1 {
            global.godmode=0;
            // NET-SYNC: 测关结束返回。o_edmain 不持久化（换房即销毁），数据源 = F3 时的完整存盘（testsave/temp.smwl）；
            // 测关期间好友的编辑已由 o_ednet 入队，返回后触发器统一重放+全量广播
            room_goto(editor_level)
        } else {
            room_goto(Another_Level)
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=NIE MA DWOCH MARIOW!
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_number(o_marker)>1 {instance_destroy()}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Pause
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Pause
if global.escowanie=1 && !keyboard_check(vk_escape) {global.escowanie=0}
if global.escowanie=0 && global.userpause=0 && keyboard_check(vk_escape) {
    UserPause_Start()
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=light
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
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
