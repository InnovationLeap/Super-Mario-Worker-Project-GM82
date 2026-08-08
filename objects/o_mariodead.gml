#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vy_offset=-6
state=0
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
if(global.fast_retry) {
    if(vvv>0.2) {
        vvv-=0.15;
        if (string(global.bgm_id)='146') {
            if !getv {
                surface_get = mm_get_volume(global.musicplay);
                water_get = mm_get_volume(global.musicplay2);
                getv = true;
            }
            mm_set_volume(global.musicplay,surface_get*vvv)
            mm_set_volume(global.musicplay2,water_get*vvv);
        } else {mm_set_volume(global.musicplay,vvv);}
    }
}


if global.pauza=0 {
    if(!global.fast_retry) {
        state+=1
        if state>=50 {y+=vy_offset; if vy_offset<10 {vy_offset+=0.4}}
    } else {
        state+=2
        if state>=50 {y+=2*vy_offset; if vy_offset<10 {vy_offset+=0.4}}
    }
    if state>=180 && global.zycia>0 {
        if o_marker.suicide=1 {global.rodzajmaria=0}
        global.lastrodzajmaria=global.rodzajmaria
        global.lastzycia=global.zycia
        global.lastcoins=global.coins
        global.last_score=global.score
        room_restart()
    }
    if state>=180 && global.zycia<=0 {gameover.x=view_xview[0]+320; gameover.y=view_yview[0]+240;}
    if state>=500 && global.zycia<=0 {
        if !variable_global_exists("testmode") {
            global.testmode=0
        }
        if global.testmode=1 {
            global.godmode=0;
            room_goto(editor_level)
        } else {
            global.escowanie=1;room_goto(title);SXMS_C_Stop()
        }}




    if state=150 && global.sample=1 && global.zycia<=0 && !global.fast_retry {tmp2=sound_play(snd_gameover);sound_volume(snd_gameover,global.game_volume)}
}
