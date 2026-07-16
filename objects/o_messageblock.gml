#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0
podbity = 0
showMessage = -1
showed = 0
textMessage = ""
sekwencja=0
stefan=0
setonce=0

// 发光位置微调
light_x = 16;
light_y = 16;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if place_meeting(x, y, o_thwompdetector) {
    podbity = 1;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if podbity=1 && setonce=0{
    instance_create(x,y-32,o_uppercut)
    if (o_textDrawer.target = id) {
        global.isDisplaying *= -1
        if global.sample=1 && global.beep=1{
            if(global.isDisplaying = -1){
                fofo=sound_play(snd_messageoff);
                sound_volume(snd_messageoff,global.glosnosc)
                fw_release_cache()
            }
            else{
                fofo=sound_play(snd_message);
                sound_volume(snd_message,global.glosnosc)
            }
        }
    }
    else{
        global.isDisplaying = 1
        o_textDrawer.textMessage = textMessage
        o_textDrawer.targetShowed = showed
        o_textDrawer.target = id
        o_textDrawer.pointerReset = 1
        if global.sample=1 && global.beep=1{
            fofo=sound_play(snd_message);
            sound_volume(snd_message,global.glosnosc)
        }
    }
    setonce=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if podbity=0{draw_sprite(s_pointblock5,stefan,x,y)}
else{
    if sekwencja<10 {draw_sprite_ext(s_pointblock2,stefan,x+16,y+16-sekwencja*2,1,1,0,c_white,1); sekwencja+=1; }
    if sekwencja>=10 && sekwencja<20 {draw_sprite_ext(s_pointblock2,stefan,x+16,y+16-40+sekwencja*2,1,1,0,c_white,1); sekwencja+=1; }
    if sekwencja=20 {podbity=0;sekwencja=0;setonce=0}
}
stefan=pokazywator.wenhao
