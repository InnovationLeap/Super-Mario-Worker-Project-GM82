#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
podbity=0
sekwencja=0
dzwiek=0
stefan=0
lewoprawo=random(5)-random(5)
kierunek=0
czas=0
podbicia=0
blokada=0
fader=0
punktowy=0

dobity=0

czyzwykly=0

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
if place_meeting(x, y, o_thwompdetector) {
    podbity = 1;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if dobity=1 {dobity=0; podbity=1}

if sekwencja=0 && blokada=0 draw_sprite(s_pointblock3,stefan,x,y)
if sekwencja=0 && blokada=1 draw_sprite(s_pointblock2,stefan,x+16,y+16)
if sekwencja>0 && sekwencja<10 && blokada=0 {draw_sprite_ext(s_pointblock4,stefan,x+16,y+16-sekwencja*2,1,1,0,c_white,1); sekwencja+=1; kierunek+=lewoprawo}
if sekwencja>=10 && sekwencja<20 && blokada=0 {draw_sprite_ext(s_pointblock4,stefan,x+16,y+16-40+sekwencja*2,1,1,0,c_white,1); sekwencja+=1; kierunek-=lewoprawo}
if sekwencja>0 && sekwencja<10 && blokada=1 {draw_sprite_ext(s_pointblock2,stefan,x+16,y+16-sekwencja*2,1,1,0,c_white,1); sekwencja+=1; kierunek+=lewoprawo}
if sekwencja>=10 && sekwencja<20 && blokada=1 {draw_sprite_ext(s_pointblock2,stefan,x+16,y+16-40+sekwencja*2,1,1,0,c_white,1); sekwencja+=1; kierunek-=lewoprawo}



if global.pauza=0 {

if podbity=1
    {
    if sekwencja=0 && podbicia<15 {sekwencja=1;dzwiek=0;lewoprawo=random(5)-random(5); podbicia+=1; czas=0; global.coins+=1;instance_create(x,y-32,o_uppercut)}
    if sekwencja=0 && podbicia=15 {sekwencja=1;dzwiek=0;lewoprawo=random(5)-random(5); podbicia+=1;blokada=1; czas=0; global.coins+=1;instance_create(x,y-32,o_uppercut)}
    if sekwencja<>0 && blokada=0 {podbity=0}
    }
if sekwencja=1 && dzwiek=0 {sound_play(snd_coin);dzwiek=1;instance_create(x,y,o_coineffect)}


if sekwencja=20 sekwencja=0

if podbicia>0 && podbicia<15 {czas+=1}
if czas>20 {czas=0; podbicia+=1}

if podbicia=16 && podbity=1 && czyzwykly=0 {instance_destroy();lolo=instance_create(x,y,o_pointblock); lolo.bonus=20} else czyzwykly=1



}
