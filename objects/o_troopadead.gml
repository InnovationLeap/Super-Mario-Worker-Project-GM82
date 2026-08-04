#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
iyor=-8
czerwona=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.etappokonany=0 {

    if czerwona=1 {sprite_index=s_trooparedshell}
    if czerwona=2 {sprite_index=s_troopablueshell}
    if czerwona=3 {sprite_index=s_troopashellgold}
    if czerwona=4 {sprite_index=s_spinyshelldead}
    corpse_anim(1,0);

}
