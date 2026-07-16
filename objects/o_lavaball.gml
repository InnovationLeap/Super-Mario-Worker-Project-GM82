#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grawitacja=0
sekwencja=0
energia=1
image_speed=0
kierunek=-1
aktywowany=1
rodzajzabicia=0
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

iyor=0
starty=y

zarabia=1 // zmienna informujaca muszle czy mozna zarabiac zycia

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
if global.pauza=0 {

if sekwencja=0 {sekwencja=1; iyor=-10}
if sekwencja=1 {iyor+=0.25; y+=iyor}
if iyor<0 image_yscale=1
if iyor>0 image_yscale=-1
if sekwencja=1 && y>starty && iyor>0 {sekwencja=2; iyor=0; y=-2000; instance_create(x,starty+16,o_firerico)}
if sekwencja>=2 && sekwencja<200 {sekwencja+=1}
if sekwencja=200 {sekwencja=0; y=starty}

image_index=pokazywator.huoqiu

}
