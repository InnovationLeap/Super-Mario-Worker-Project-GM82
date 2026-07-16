#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
kierunek=-1
ixor=random(6)-random(6)
iyor=-10

energia=1
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

dabusi=1

// 发光位置微调
light_x = 0;
light_y = 0;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.etappokonany=0 {


y+=iyor
x+=ixor
iyor+=0.5
image_angle+=30


// niszcz po za ekranem
if y>room_height {instance_destroy()}


}
