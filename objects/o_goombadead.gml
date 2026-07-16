#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lifetime=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {

lifetime+=1

if lifetime>100 {image_alpha-=0.1}
if image_alpha<=0 {instance_destroy()}

}
