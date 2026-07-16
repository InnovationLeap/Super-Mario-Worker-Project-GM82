if(place_meeting(argument0,argument1,o_pointblock)){
    fofo = instance_place(argument0,argument1,o_pointblock);
    if (fofo.bonus<>20){fofo.podbity=1}
    else {fofo.aplikacja=10}
}
else{
    if(place_meeting(argument0,argument1,obj_wall)){
        fofo = instance_place(argument0,argument1,obj_wall);
        fofo.podbity=1
    }
}
instance_create(x+8,y+16,o_fireexplode);
if global.sample{sound_play(snd_stun2);}
