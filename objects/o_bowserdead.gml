#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
vy_offset=0
state=0
smm=0
mid=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
state+=1
image_index+=0.3
if mid=0 {
    if global.fastpass = 0 {
        if state>120 {
            y+=vy_offset; vy_offset+=0.1;
            if smm=0 {smm=1 if global.sample=1 {tmp2=sound_play(snd_bowserfall);sound_volume(snd_bowserfall,global.game_volume)}}
        }
        if state=200 {
            mm_play_ext('.\Data\MW\ktkm4.dll',0);
            global.level_cleared=1;
        }
    }
    if global.fastpass = 1 {
        if state = 50 {
            smoke = instance_create(x+8, y, o_smoke)
            sound_play(snd_fastpass);
            mm_stop_all();
            visible = false;
            global.level_cleared=100;
        }
    }
}

if mid=1 {
    if state>60 {
        y+=vy_offset; vy_offset+=0.1
        if smm=0 {smm=1 if global.sample=1 {tmp2=sound_play(snd_bowserfall);sound_volume(snd_bowserfall,global.game_volume)}}
    }
    if state>120 {
        if(global.koopa_scroll_count=0) {
            global.bgm_id = global.muzyka_save;
            Music_Play();
            global.bowser_phase=4;  //修正滚屏，前往马里奥滚屏代码
        }
    }
}

//如果不是midboss尸体，则过关；否则,若全部锁屏boss清理完毕，则修正滚屏，继续游戏
if y>room_height[0]+640 {instance_destroy();}
