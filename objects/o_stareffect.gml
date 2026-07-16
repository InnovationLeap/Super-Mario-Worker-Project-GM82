#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sekwencja=0
image_angle=random(360)
ixor=random(3)-random(3)
iyor=-random(3)-1
wielkosc=0.1+random(0.3)
obrot=random(10)-random(10)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0{

x+=ixor
y+=iyor
iyor+=0.2
image_alpha-=0.03
if image_alpha<=0 {instance_destroy()}
image_xscale=wielkosc
image_yscale=wielkosc
if wielkosc<1 {wielkosc+=0.01}
image_angle+=obrot

}
