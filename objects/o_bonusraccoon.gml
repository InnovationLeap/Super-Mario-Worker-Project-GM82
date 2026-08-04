#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sekwencja=0
image_speed=0
image_xscale=1

// Rising phase
// Grid-aligned rise: total displacement = 96px (physics) + ~32px(block escape) ≈ 128px = 4*32
// Formula: D = g*k*(1-k)/2, with k = -v0/g
// v0=-8, g=8/25 → k=25, D=-96 (upward 96px)
leaf_faza=0
leaf_speedY=-8
leaf_gravity=8/25

// Falling flutter
leaf_originX=0
leaf_kat=0
leaf_floatY=6
leaf_floatDist=32
leaf_floatYRange=2.8

leaf_prev_x=0

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

    image_index=0

    if leaf_faza=0 {
        if sekwencja=0 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1}
        if sekwencja=0 && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {sekwencja=1}
        if sekwencja=1 {
            leaf_speedY+=leaf_gravity
            y+=leaf_speedY
            if leaf_speedY>=0 {
                leaf_faza=1
                leaf_originX=x
                leaf_prev_x=x
                leaf_kat=0
            }
        }
    }

    if leaf_faza=1 {
        var _rad, dx;
        _rad=degtorad(leaf_kat)
        x=leaf_originX-(cos(_rad)-1)*leaf_floatDist
        leaf_speedY=(sin(degtorad((leaf_kat mod 180)*0.5+180))+1)*leaf_floatYRange
        y+=leaf_speedY
        leaf_kat+=leaf_floatY

        // Direction based on X velocity
        dx=x-leaf_prev_x
        if dx>0.3 {image_xscale=1}
        if dx<-0.3 {image_xscale=-1}
        leaf_prev_x=x
    }

    if x>view_xview[0]+650 || x<view_xview[0]-10 || y>view_yview[0]+490 {instance_destroy()}

}
