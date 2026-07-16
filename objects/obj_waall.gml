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
	if (global.etapgravity/5)>-13 && (global.etapgravity/5)<0 && abs(global.etapgravity/5) > grawitacja {
	  grawitacja=abs(global.etapgravity/5) } else { grawitacja = 0 }
	sekwencja=1
  }
}

if o_marker.y < 0 && instance_number(o_marker) > 0 { y = o_marker.y } else { y=0 }
