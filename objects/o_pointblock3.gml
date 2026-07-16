#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !instance_place(x,y,o_marker)
  {
	  lolo=instance_create(x,y,o_pointblock2)
	  lolo.bonus=bonus
	  instance_destroy()
  }
