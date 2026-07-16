#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
iyor=-6
sekwencja=0
gameover=instance_create(-1000,-1000,o_gameover)
suicide=0
vvv=1

sprite_index = global.character_dead
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(global.fast_retry){
    if(vvv>0.2){
    vvv-=0.15;
    if (global.muzyka='146'){
        if !getv{
            surface_get = mm_get_volume(global.musicplay);
            water_get = mm_get_volume(global.musicplay2);
            getv = true;
        }
        mm_set_volume(global.musicplay,surface_get*vvv)
        mm_set_volume(global.musicplay2,water_get*vvv);
    }
    else{mm_set_volume(global.musicplay,vvv);}
    }
}


if global.pauza=0 {
if(!global.fast_retry){
    sekwencja+=1
    if sekwencja>=50 {y+=iyor; if iyor<10 {iyor+=0.4}}
}
else{
    sekwencja+=2
    if sekwencja>=50 {y+=2*iyor; if iyor<10 {iyor+=0.4}}
}
if sekwencja>=180 && global.zycia>0 {
    if o_marker.suicide=1{global.rodzajmaria=0}
    global.lastrodzajmaria=global.rodzajmaria
    global.lastzycia=global.zycia
    global.lastcoins=global.coins
    global.lastpunkty=global.punkty
    room_restart()
}
if sekwencja>=180 && global.zycia<=0 {gameover.x=view_xview[0]+320; gameover.y=view_yview[0]+240;}
if sekwencja>=500 && global.zycia<=0 {
    if !variable_global_exists("testmode") {
    global.testmode=0
    }
    if global.testmode=1{
    global.godmode=0;
    room_goto(editor_level)
    }else{
    global.escowanie=1;room_goto(title);SXMS_C_Stop()
    }}




if sekwencja=150 && global.sample=1 && global.zycia<=0 && !global.fast_retry{fofo=sound_play(snd_gameover);sound_volume(snd_gameover,global.glosnosc)}
}
