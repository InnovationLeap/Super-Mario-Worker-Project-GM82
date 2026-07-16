#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
iyor=-8

if global.layerord=0||global.layerord=1{depth=1}
if global.layerord=2{depth=-20}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {

if iyor<10 {iyor+=0.5}
y+=iyor
if y>view_yview[0]+700 {instance_destroy()}

}
