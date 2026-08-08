#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0
bumped = 0
showMessage = -1
showed = 0
textMessage = ""
state=0
block_frame=0
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
    bumped = 1;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bumped=1 && setonce=0 {
    instance_create(x,y-32,o_uppercut)
    if (o_textDrawer.target = id) {
        global.isDisplaying *= -1
        if global.sample=1 && global.beep=1 {
            if(global.isDisplaying = -1) {
                tmp2=sound_play(snd_messageoff);
                sound_volume(snd_messageoff,global.game_volume)
                fw_release_cache()
            } else {
                tmp2=sound_play(snd_message);
                sound_volume(snd_message,global.game_volume)
            }
        }
    } else {
        global.isDisplaying = 1
        o_textDrawer.textMessage = textMessage
        o_textDrawer.targetShowed = showed
        o_textDrawer.target = id
        o_textDrawer.pointerReset = 1
        if global.sample=1 && global.beep=1 {
            tmp2=sound_play(snd_message);
            sound_volume(snd_message,global.game_volume)
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
if bumped=0 {draw_sprite(s_pointblock5,block_frame,x,y)} else {
    if state<10 {draw_sprite_ext(s_pointblock2,block_frame,x+16,y+16-state*2,1,1,0,c_white,1); state+=1; }
    if state>=10 && state<20 {draw_sprite_ext(s_pointblock2,block_frame,x+16,y+16-40+state*2,1,1,0,c_white,1); state+=1; }
    if state=20 {bumped=0;state=0;setonce=0}
}
block_frame=o_preview.qblock_preview
