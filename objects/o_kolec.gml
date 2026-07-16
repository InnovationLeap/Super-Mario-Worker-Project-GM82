#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grawitacja=0
sekwencja=0

image_speed=0
kierunek=-1
aktywowany=1
rodzajzabicia=0
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

zarabia=1 // zmienna informujaca muszle czy mozna zarabiac zycia

dabusi=1

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
    case 0: sprite_index = s_kolec; break;
    case 1: sprite_index = s_kolec2; break;
    case 2: sprite_index = s_kolec3; break;
    case 3: sprite_index = s_kolec4; break;
    default: sprite_index = s_kolec; break;
}
