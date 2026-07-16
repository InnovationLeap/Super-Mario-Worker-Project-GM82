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
x+=16
y+=16

dabusi=1

// 发光位置微调
light_x = 0;
light_y = 0;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {

if aktywowany=1{

image_index=pokazywator.zhadi


}

//if energia<=-100000 && rodzajzabicia=0 {instance_destroy();; }
// niszcz po za ekranem
if y>room_height+64 {instance_destroy()}
}

switch (spike_type) {
    case 0: sprite_index = s_piranioleb; break;
    case 1: sprite_index = s_piranioleb2; break;
    case 2: sprite_index = s_piranioleb3; break;
    case 3: sprite_index = s_piranioleb4; break;
    default: sprite_index = s_piranioleb; break;
}
