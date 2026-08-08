#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,obj_wall)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if o_marker.y < 0 && global.rodzajmaria != 5 && instance_place(x,y-32,o_marker) {
    with(o_marker) {
        y+=32
        while ( instance_place(x,y,obj_wall) || instance_place(x,y,o_pointblock) ) { y+=1 }
        if (global.level_gravity/5)>-13 && (global.level_gravity/5)<0 && abs(global.level_gravity/5) > grav {
            grav=abs(global.level_gravity/5) } else { grav = 0 }
        state=1
    }
}

if o_marker.y < 0 && instance_number(o_marker) > 0 { y = o_marker.y } else { y=0 }
