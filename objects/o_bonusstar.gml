#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
state=0
grav=0
ixor=0
dir=1
if dir>=0.5 {dir=-1} else {dir=1}
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
    if state=0 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1}
    if state=0 && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {state=1}

    if state=1 {state=2; grav=-10}
    if state=2 {
        grav+=0.5
        if !place_meeting(x,y-10,obj_wall) && !place_meeting(x,y-10,o_pointblock) && grav<0 {y+=grav}
        if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) && grav<0 {y+=1}
        if grav>0 {y+=grav}
        if grav>0 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {grav=0; state=3}
    }
    while state=3 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1; if !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {state=1}}


    // chodzenie gwiazdki

    if dir=-1 && !place_meeting(x-2,y,obj_wall) && !place_meeting(x-2,y,o_pointblock) {x-=2}
    if dir=1 && !place_meeting(x+2,y,obj_wall) && !place_meeting(x-2,y,o_pointblock) {x+=2}
    if place_meeting(x-2,y,obj_wall) or place_meeting(x+2,y,obj_wall) or place_meeting(x-2,y,o_pointblock) or place_meeting(x+2,y,o_pointblock) {dir=dir*-1}
}
