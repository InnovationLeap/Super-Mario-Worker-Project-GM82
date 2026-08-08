#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed=0
dir=-1
activated=0
kill_type=0
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok




angle=0
aspeed=0.03
ys=y

// 发光位置微调
light_x = 0;
light_y = -4;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.level_complete=0 {

    if x < o_marker.x { image_xscale = 1 } else { image_xscale = -1 }
    image_index+=0.1

    y=ys+50*cos(angle)
    angle += aspeed

    // uppercut i zwykla smierc
    //if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
    if kill_type=1 {instance_destroy(); instance_create(x,y,o_troopared);instance_create(x,y,o_scorepop)}
    if kill_type=7 {instance_destroy(); shell_inst=instance_create(x,y-1,o_troopashell2);shell_inst.sprite_index=s_trooparedshell;shell_inst.is_flipped=1;shell_inst.grav=-11;shell_inst.shell_kind=1;shell_inst.tail_kicked=1;shell_inst.dir=dir; instance_create(x,y,o_scorepop)}
    if kill_type=3 || kill_type=4 || kill_type=5 {instance_destroy(); shell_inst=instance_create(x,y,o_troopadead); tmp=instance_create(x,y,o_scorepop); tmp.image_index=0;shell_inst.sprite_index=s_trooparedshell; shell_inst.shell_kind=shell_kind;if global.sample=1 {tmp2=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)}}
    if kill_type=2 {instance_destroy(); shell_inst=instance_create(x,y,o_troopadead);shell_inst.sprite_index=s_trooparedshell; shell_inst.shell_kind=shell_kind}

}
