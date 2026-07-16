#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sekwencja=0
image_speed=0
grawitacja=0
nastawy=0

// 发光位置微调
light_x = 16;
light_y = 16;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {

image_index+=0.2
if sekwencja=0 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)){y-=1}
if sekwencja=0 && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {sekwencja=1; nastawy=y}
if sekwencja=1 {sekwencja=2; grawitacja=-8}
if sekwencja=2 {y+=grawitacja; grawitacja+=0.4 if y>nastawy{y=nastawy; sekwencja=1}}


// niszcz po za ekranem

}
