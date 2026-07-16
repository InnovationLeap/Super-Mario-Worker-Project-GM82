#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
iyor=0
sekwencja=0
smm=0
mid=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sekwencja+=1
image_index+=0.3
if mid=0 {
    if global.fastpass = 0 {
        if sekwencja>120 {
            y+=iyor; iyor+=0.1;
            if smm=0 {smm=1 if global.sample=1 {fofo=sound_play(snd_kuppapapa);sound_volume(snd_kuppapapa,global.glosnosc)}}
        }
        if sekwencja=200 {
            mm_play_ext('.\Data\MW\ktkm4.dll',0);
            global.przeszedllevel=1;
        }
    }
    if global.fastpass = 1 {
        if sekwencja = 50 {
            smoke = instance_create(x+8, y, o_smoke)
            sound_play(snd_fastpass);
            mm_stop_all();
            visible = false;
            global.przeszedllevel=100;
        }
    }
}

if mid=1{
    if sekwencja>60 {
        y+=iyor; iyor+=0.1
        if smm=0 {smm=1 if global.sample=1 {fofo=sound_play(snd_kuppapapa);sound_volume(snd_kuppapapa,global.glosnosc)}}
    }
    if sekwencja>120{
        if(global.koopa_scroll_count=0){
            global.muzyka = global.muzyka_save;
            Music_Play();
            global.aktywowanykuppa=4;  //修正滚屏，前往马里奥滚屏代码
        }
    }
}

//如果不是midboss尸体，则过关；否则,若全部锁屏boss清理完毕，则修正滚屏，继续游戏
if y>room_height[0]+640 {instance_destroy();}
