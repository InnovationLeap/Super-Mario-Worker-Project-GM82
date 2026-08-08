#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
vy_offset=-8
shell_kind=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.level_complete=0 {

    if shell_kind=1 {sprite_index=s_trooparedshell}
    if shell_kind=2 {sprite_index=s_troopablueshell}
    if shell_kind=3 {sprite_index=s_troopashellgold}
    if shell_kind=4 {sprite_index=s_spinyshelldead}
    corpse_anim(1,0);

}
