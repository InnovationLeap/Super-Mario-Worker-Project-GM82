#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lifetime=0
image_speed=0
zaliczono=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {
    lifetime+=1
    y-=0.5
    if lifetime>100 {image_alpha-=0.1}
    if image_alpha<=0 {instance_destroy()}

    if zaliczono=0 {
        zaliczono=1
        if image_index=0 {global.score+=100}
        if image_index=1 {global.score+=200}
        if image_index=2 {global.score+=500}
        if image_index=3 {global.score+=1000}
        if image_index=4 {global.score+=2000}
        if image_index=5 {global.score+=5000}
        if image_index=6 {
            global.zycia+=1;
            if global.sample=1 {tmp2=sound_play(snd_1up);sound_volume(snd_1up,global.game_volume)}
        }
    }
}
