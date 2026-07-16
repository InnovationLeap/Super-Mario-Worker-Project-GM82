#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
iyor=-8
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.etappokonany=0 {

if image_angle>-180 {image_angle-=10}
if iyor<10 {iyor+=0.5}
y+=iyor
if y>view_yview[0]+700 {instance_destroy()}

}
