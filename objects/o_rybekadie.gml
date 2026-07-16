#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
iyor=0
y-=16

if global.layerord=0||global.layerord=1{depth=0}
if global.layerord=2{depth=-22}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {

image_yscale=-1
if iyor<10 {iyor+=0.5}
y+=iyor
if y>view_yview[0]+700 {instance_destroy()}

}
