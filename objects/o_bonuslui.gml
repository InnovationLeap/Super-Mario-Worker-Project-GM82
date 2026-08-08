#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
state=0
image_speed=0
grav=0
saved_y=0

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
    if state=0 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1}
    if state=0 && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {state=1; saved_y=y}
    if state=1 {state=2; grav=-8}
    if state=2 {y+=grav; grav+=0.4 if y>saved_y {y=saved_y; state=1}}


    // niszcz po za ekranem

}
