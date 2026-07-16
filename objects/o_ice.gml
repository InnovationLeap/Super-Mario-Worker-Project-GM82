#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hp = 2
setonce=0
image_speed = 0

attacked = false;
hit = false;

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
    if !hit {
        if ( hp > 1 ) { sound_play(snd_icebreak1); }
        else { sound_play(snd_icebreak2); }
        hp -= 1;
        hit = true;
    }
}

if !place_meeting(x, y, o_thwompdetector) {
    hit = false;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if setonce=0 && hp=1{
    image_index+=1;
    setonce=1;
}
if global.lava=1 && y>global.poziomwody+9 {instance_destroy();}

//if hit { hit = false; }

if attacked = true
{
    if (hp > 1) {sound_play(snd_icebreak1);}
    else {sound_play(snd_icebreak2);}
    hp -= 1;
}

if hp<=0 {
    instance_destroy();
    lolo=instance_create(x+8,y+8,o_breakice)
    lolo.ixor=-3
    lolo.iyor=-6
    lolo.image_xscale=0.5
    lolo.image_yscale=0.5
    lolo=instance_create(x+8+16,y+8,o_breakice)
    lolo.ixor=3
    lolo.iyor=-6
    lolo.image_xscale=0.5
    lolo.image_yscale=0.5
    lolo=instance_create(x+8+16,y+8+16,o_breakice)
    lolo.ixor=-2
    lolo.iyor=-4
    lolo.image_xscale=0.5
    lolo.image_yscale=0.5
    lolo=instance_create(x+8,y+8+16,o_breakice)
    lolo.ixor=2
    lolo.iyor=-4
    lolo.image_xscale=0.5
    lolo.image_yscale=0.5
}
