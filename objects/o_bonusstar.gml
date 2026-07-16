#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sekwencja=0
grawitacja=0
ixor=0
kierunek=1
if kierunek>=0.5 {kierunek=-1} else {kierunek=1}
image_speed=0

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
if sekwencja=0 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1}
if sekwencja=0 && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {sekwencja=1}

if sekwencja=1 {sekwencja=2; grawitacja=-10}
if sekwencja=2
    {
    grawitacja+=0.5
    if !place_meeting(x,y-10,obj_wall) && !place_meeting(x,y-10,o_pointblock) && grawitacja<0 {y+=grawitacja}
    if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) && grawitacja<0 {y+=1}
    if grawitacja>0 {y+=grawitacja}
    if grawitacja>0 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {grawitacja=0; sekwencja=3}
    }
while sekwencja=3 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)){y-=1; if !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {sekwencja=1}}


// chodzenie gwiazdki

if kierunek=-1 && !place_meeting(x-2,y,obj_wall) && !place_meeting(x-2,y,o_pointblock) {x-=2}
if kierunek=1 && !place_meeting(x+2,y,obj_wall) && !place_meeting(x-2,y,o_pointblock) {x+=2}
if place_meeting(x-2,y,obj_wall) or place_meeting(x+2,y,obj_wall) or place_meeting(x-2,y,o_pointblock) or place_meeting(x+2,y,o_pointblock) {kierunek=kierunek*-1}
}
