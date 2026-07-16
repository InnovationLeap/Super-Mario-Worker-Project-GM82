#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x = view_xview[0]+624
y = view_yview[0]+464

image_alpha = 0.6;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
  x = mouse_x
  y = mouse_y
  if o_edmain.costawia3=42{
      window_set_cursor(cr_none)
      visible = 1
  }
  else{
      window_set_cursor(cr_default)
      visible = 0
  }
