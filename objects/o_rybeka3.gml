#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed=0
kierunek=-1
aktywowany=0
rodzajzabicia=0
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok
coikiedy=round(random(1))
coikiedy2=0
xspeed=4-irandom(4)+1.25
yspeed=-1.3*irandom(10)

if global.layerord=0||global.layerord=1{depth=0}
if global.layerord=2{depth=-22}

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
if global.pauza=0 && global.etappokonany=0 {





if aktywowany=0 {if x>view_xview[0]-100 && x<view_xview[0]+740 && y>view_yview[0]-100 && y<view_yview[0]+580
    {
    if x<o_marker.x {aktywowany=1; kierunek=1}
    if x>=o_marker.x {aktywowany=1; kierunek=-1}
    }}
if aktywowany=1{
x+=kierunek*xspeed
y+=yspeed
yspeed+=0.2

image_index=pokazywator.fish

if kierunek=-1 {image_xscale=-1}
if kierunek=1 {image_xscale=1}

// uppercut i zwykla smierc
//if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
//if place_meeting(x,y,o_troopashell) {energia-=3; rodzajzabicia=0}
//if energia<0 && rodzajzabicia=1 {instance_destroy(); instance_create(x,y+16,o_rybekadie); instance_create(x,y,o_punkciornik)}
if rodzajzabicia=3 || rodzajzabicia=4 || rodzajzabicia=5 {instance_destroy(); instance_create(x,y+16,o_rybekadie); lolo=instance_create(x,y,o_punkciornik); lolo.image_index=0;if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}
if rodzajzabicia=1 {instance_destroy(); instance_create(x,y+16,o_rybekadie); instance_create(x,y,o_punkciornik)}
if rodzajzabicia=2 {instance_destroy(); instance_create(x,y+16,o_rybekadie);}
if x<=view_xview-96||x>=view_xview+640+96||y>=view_yview+480+96 {instance_destroy()}
}
}
