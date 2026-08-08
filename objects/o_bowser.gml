#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grav=0
state=0
hp=0
image_speed=0
dir=-1
activated=0
kill_type=0

shoot_seq=0
jump_timer=0
in_block=0
walk_timer=0
chodzonko2=0
angrymode=0
angrymodetimer=0
shoot_seq2=random(0.2)
iyus=y


pivot_x=min(max(320,x),room_width-320)

killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok
hit=0
hurt_anim=0
hurt_timer=0


zarabia=11 // zmienna informujaca muszle czy mozna zarabiac zycia
noshellkick=1
setonce=0
viewsetonce=0
actsetonce=0


//New parameters in SMWP1.7
koopa_strength = 0; //库巴对子弹甜菜的抗性，0和1的区别在于，0在库巴无敌时间也会继续受到攻击，1不会
koopa_reset = 0;  //是否重置HP
koopa_freeview = 0;  //是否自由滚屏
koopa_midboss_hp = -1; //库巴作为道中boss的血量（-1=关底boss，打败后过关，使用原版血量）
//注：道中boss不共享血量；关底boss共享血量。
koopa_speed = 1;//库巴移动速度

//以下为库巴模拟场景切换，在编辑界面中通过与音乐控制元件连接而发挥作用
bgm_change = 1
bgm = '202' //默认库巴bgm
bgp_change = 0
bgp = 0
height = -64

// 发光位置微调
light_x = 0;
light_y = -32;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.level_complete=0 {

    // 如果reset=1且不是midboss，血量重置
    if koopa_reset = 1 && koopa_midboss_hp=-1 && setonce=0 {global.level_bowser_hp=global.bowser_hp_fixed; setonce=1;}

    //进入范围，触发库巴
    if activated=0 && x>view_xview-300 && x<view_xview+960 {
        activated=1;
        //每个freeview=0的被触发库巴将被登记数目
        //主要用来控制滚屏和音乐状态
        if (koopa_freeview = 0 && viewsetonce=0) {
            viewsetonce=1;
            global.koopa_scroll_count+=1;
            if(bgm_change=1 && global.bgm_id<>bgm) { //等效音乐标记
                mm_stop_all_ext();global.muzyka_save = global.bgm_id;global.bgm_id=bgm;Music_Play();
            }
            if (bgp_change=1 && global.background<>bgp) {global.background=bgp;} //等效背景标记
            if (height>-64) {global.auto=0;global.water_level = height;o_waterdraw.velocity=0;o_waterdraw.target=height} //等效水位标记
            if (weather_change == 1) //等效天气标记
            {
                global.rainy = rainy;
                global.fallingstars = fallingstars;
                global.snowy = snowy;
                global.thunder = thunder;
                global.windy = windy;
                global.darkness = darkness;
                global.brightness = brightness;
            }
        }
        // 如果存在最终boss被触发，则activated为2；否则设为1
        // 主要用来控制是否显示血条
        if(global.koopa_activated<2 && actsetonce=0) {
            global.koopa_activated = 1-min(0,koopa_midboss_hp)
            actsetonce=1
        }
    }
    // 受伤后处理
    //1）不是midboss,扣global值
    if hp<=-max(koopa_strength,1) && koopa_midboss_hp=-1 {
        if global.sample=1 && global.level_bowser_hp>1 {
            tmp2=sound_play(snd_bowserhit);
            sound_volume(snd_bowserhit,global.game_volume)
        }
        hp=0;global.level_bowser_hp-=1; hit=200
    }

    //2）是midboss,扣自身值
    if hp<=-max(koopa_strength,1) && koopa_midboss_hp>0 {
        if global.sample=1 && koopa_midboss_hp>1 {
            tmp2=sound_play(snd_bowserhit);
            sound_volume(snd_bowserhit,global.game_volume)
        }
        hp=0;koopa_midboss_hp-=1; hit=200
    }

    if hit>0 {
        hit-=1
        if hurt_anim<1 && hurt_timer=0 {hurt_anim+=0.04}
        if hurt_anim>=1 && hurt_timer=0 {hurt_timer=1}
        if hurt_anim>0 && hurt_timer=1 {hurt_anim-=0.03}
        if hurt_anim<=0 && hurt_timer=1 {hurt_timer=0}
        image_alpha=hurt_anim
    } else image_alpha=1

    //打败后过关
    if global.level_bowser_hp<=0 {
        if global.sample=1 {sound_play(snd_bowserdefeat);sound_volume(snd_bowserdefeat,global.game_volume)}
        instance_destroy()
        tmp=instance_create(x,y,o_bowserdead)
        tmp.image_xscale=image_xscale
        tmp5=instance_create(x,y,o_scorepop)
        tmp5.image_index=5
        global.score+=5000
        global.level_complete=1
    }

    //道中boss打败后不过关
    if koopa_midboss_hp=0 {
        global.pauza=3;
        if global.sample=1 {sound_play(snd_bowserdefeat);sound_volume(snd_bowserdefeat,global.game_volume)}
        if(koopa_freeview=0) {global.koopa_scroll_count-=1;}
        instance_destroy()
        tmp=instance_create(x,y,o_bowserdead)
        tmp.mid=1
        tmp.image_xscale=image_xscale
        tmp5=instance_create(x,y,o_scorepop)
        tmp5.image_index=5
        global.score+=5000
    }

    //库巴跳跃
    if activated=1 {
        // spadanie i skakanie
        if state=0 {jump_timer+=1}
        if jump_timer>100 {jump_timer=0; state=1; grav=-12; y-=10}
        if grav<0 {knockback=abs(grav)}
        if grav>=0 {knockback=0}

        if state=0 && !place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y+1,obj_wall) {state=1}
        if state=1 {grav+=0.5; y+=grav}
        if state=1 && in_block=0 && grav<0 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {in_block=1}
        if state=1 && in_block=1 && grav>0 && !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {in_block=0}
        if state=1 && (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall)) && in_block=0 {grav=0; state=2}
        while state=2 && (place_meeting(x,y,obj_halfground) ||place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1 if !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {state=0}}


        // 库巴运动与喷火
        if x>o_marker.x {image_xscale=-1}
        if x<o_marker.x {image_xscale=1}

        shoot_seq+=1+shoot_seq2
        if shoot_seq<=150 {sprite_index=s_bowser;image_index+=0.2}
        if shoot_seq>=150 && shoot_seq<180 {sprite_index=s_bowserreadyfire;image_index=0}
        if shoot_seq>=180 && shoot_seq<200 {sprite_index=s_bowserreadyfire;image_index=1}
        if shoot_seq>=200 {shoot_seq=0; tmp=instance_create(x,y-32,o_bowserfire); tmp.dir=image_xscale;tmp.iyus=iyus
            if global.sample=1 && x>view_xview-300 && x<view_xview+960 && y>view_yview-200 && y<view_yview+700
            {tmp2=sound_play(snd_bowsersnore);sound_volume(snd_bowsersnore,global.game_volume)}}


        if dir=-1 && chodzonko2>0 {x-=koopa_speed}
        if dir=1 && chodzonko2>0 {x+=koopa_speed}
        if chodzonko2>0 {chodzonko2-=1}

        walk_timer+=1
        if walk_timer>60 {walk_timer=0; chodzonko2=30+round(random(70))}


        if (place_meeting(x+1,y,obj_wall) || place_meeting(x-1,y,obj_wall)) && in_block=0 {dir=dir*-1}
        if (place_meeting(x+1,y,o_pointblock) || place_meeting(x-1,y,o_pointblock)) && in_block=0 {dir=dir*-1}


        if dir=-1 && x<=pivot_x-200 {dir=1}
        if dir=1 && x>=pivot_x+200 {dir=-1}
    }


}
if y>room_height[0]+64 {instance_destroy()}
