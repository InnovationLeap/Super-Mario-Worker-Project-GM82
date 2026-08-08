#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bumped=0
state=0
sound_played=0
block_frame=0
bounce_dir=random(5)-random(5)
dir=0
czas=0
bump_count=0
locked=0
fader=0
punktowy=0

dobity=0

czyzwykly=0

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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if dobity=1 {dobity=0; bumped=1}

if state=0 && locked=0 draw_sprite(s_pointblock3,block_frame,x,y)
if state=0 && locked=1 draw_sprite(s_pointblock2,block_frame,x+16,y+16)
if state>0 && state<10 && locked=0 {draw_sprite_ext(s_pointblock4,block_frame,x+16,y+16-state*2,1,1,0,c_white,1); state+=1; dir+=bounce_dir}
if state>=10 && state<20 && locked=0 {draw_sprite_ext(s_pointblock4,block_frame,x+16,y+16-40+state*2,1,1,0,c_white,1); state+=1; dir-=bounce_dir}
if state>0 && state<10 && locked=1 {draw_sprite_ext(s_pointblock2,block_frame,x+16,y+16-state*2,1,1,0,c_white,1); state+=1; dir+=bounce_dir}
if state>=10 && state<20 && locked=1 {draw_sprite_ext(s_pointblock2,block_frame,x+16,y+16-40+state*2,1,1,0,c_white,1); state+=1; dir-=bounce_dir}



if global.pauza=0 {

    if bumped=1 {
        if state=0 && bump_count<15 {state=1;sound_played=0;bounce_dir=random(5)-random(5); bump_count+=1; czas=0; global.coins+=1;instance_create(x,y-32,o_uppercut)}
        if state=0 && bump_count=15 {state=1;sound_played=0;bounce_dir=random(5)-random(5); bump_count+=1;locked=1; czas=0; global.coins+=1;instance_create(x,y-32,o_uppercut)}
        if state<>0 && locked=0 {bumped=0}
    }
    if state=1 && sound_played=0 {sound_play(snd_coin);sound_played=1;instance_create(x,y,o_coineffect)}


    if state=20 state=0

    if bump_count>0 && bump_count<15 {czas+=1}
    if czas>20 {czas=0; bump_count+=1}

    if bump_count=16 && bumped=1 && czyzwykly=0 {instance_destroy();tmp=instance_create(x,y,o_pointblock); tmp.bonus=20} else czyzwykly=1



}
