#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
state=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {
    if state<16 {y-=14-state; state+=1; /*instance_create(x+14,y+16,o_stareffect)*/}
    if state>=16 {y+=1; state+=1; image_alpha-=0.1/*instance_create(x+14,y+16,o_stareffect)*/}
    if state>26 {instance_destroy()}


}
