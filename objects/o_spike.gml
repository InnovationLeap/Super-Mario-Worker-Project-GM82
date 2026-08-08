#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grav=0
state=0

image_speed=0
dir=-1
activated=1
kill_type=0
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

zarabia=1 // zmienna informujaca muszle czy mozna zarabiac zycia

stomp_proof=1

// 发光位置微调
light_x = 16;
light_y = 16;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=l
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

switch (spike_type) {
case 0: sprite_index = s_spike; break;
case 1: sprite_index = s_spike2; break;
case 2: sprite_index = s_spike3; break;
case 3: sprite_index = s_spike4; break;
default: sprite_index = s_spike; break;
}
