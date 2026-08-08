#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
target = 0
velocity = 1
reuse = 0

setonce=0

state=0
moving=0

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
if setonce=0 {image_index=2*global.lava;setonce=1}
if bumped=1 && reuse>=0 {
    if(global.auto || o_waterdraw.target <> target || o_waterdraw.velocity <> velocity) {
        instance_create(x,y-32,o_uppercut)
        if(state=0)moving=1;
        o_waterdraw.target = target;
        o_waterdraw.velocity = velocity;
        if(global.lava) {sound_play(snd_lava);} else {sound_play(snd_water);}
        global.auto=0;
    }
    //if reuse=0 {reuse=-1}
    //podbity=0;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if reuse=-1 {draw_sprite(sprite_index,global.lava*2+1,x,y)} else {
    if (!bumped || !moving) {draw_sprite(sprite_index,global.lava*2,x,y);bumped=0} else {
        if state<10 {draw_sprite_ext(s_waterchanger2,global.lava*2,x,y-state*2,1,1,0,c_white,1); state+=1; }
        if state>=10 && state<20 {draw_sprite_ext(s_waterchanger2,global.lava*2,x,y-40+state*2,1,1,0,c_white,1); state+=1; }
        if state=20 {bumped=0;moving=0;if(reuse=0) {reuse=-1} else {state=0}}
    }
}
