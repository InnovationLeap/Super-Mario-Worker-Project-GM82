if(place_meeting(argument0,argument1,o_pointblock)) {
    tmp2 = instance_place(argument0,argument1,o_pointblock);
    if (tmp2.bonus<>20) {tmp2.bumped=1} else {tmp2.spawn_delay=10}
} else {
    if(place_meeting(argument0,argument1,obj_wall)) {
        tmp2 = instance_place(argument0,argument1,obj_wall);
        tmp2.bumped=1
    }
}
instance_create(x+8,y+16,o_fireexplode);
if global.sample {sound_play(snd_stun2);}
