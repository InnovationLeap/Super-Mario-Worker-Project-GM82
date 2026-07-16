#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index = w;
if timer > 0 { timer -= 1; }
if timer = 0 { timer = 12; w += 1;}
if image_index = 4 { instance_destroy(); }
