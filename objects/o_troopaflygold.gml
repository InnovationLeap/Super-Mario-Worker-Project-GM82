#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed=0
facing=-1
activated=0
kill_type=0
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

cx=0
cy=0
radius=0
angle=0
dir=0

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

    if dir>1 { dir = 1 }
    if dir>0 && dir<1 { dir=floor(dir) }
    if dir<0 { dir = 0 }

    x = cx+radius*sin(degtorad(angle))
    y = cy+radius*cos(degtorad(angle))

    if radius <= 150 { angle -= dir*2-1 } else { angle -= (150/radius)*(dir*2-1) }

    if x < o_marker.x { image_xscale = 1 } else { image_xscale = -1 }
    image_index+=0.1

    // uppercut i zwykla smierc
    //if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
    if kill_type=1 {instance_destroy(); instance_create(x,y,o_troopagold);instance_create(x,y,o_scorepop)}
    if kill_type=7 {instance_destroy(); shell_inst=instance_create(x,y-1,o_troopashell2);shell_inst.sprite_index=s_troopashellgold;shell_inst.is_flipped=1;shell_inst.grav=-11;shell_inst.shell_kind=3;shell_inst.tail_kicked=1;shell_inst.facing=facing; instance_create(x,y,o_scorepop)}
    if kill_type=3 || kill_type=4 || kill_type=5 {instance_destroy(); shell_inst=instance_create(x,y,o_troopadead); tmp=instance_create(x,y,o_scorepop); tmp.image_index=0;shell_inst.sprite_index=s_troopashellgold; shell_inst.shell_kind=shell_kind;if global.sample=1 {tmp2=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)}}
    if kill_type=2 {instance_destroy(); shell_inst=instance_create(x,y,o_troopadead);shell_inst.sprite_index=s_troopashellgold; shell_inst.shell_kind=shell_kind}

}
