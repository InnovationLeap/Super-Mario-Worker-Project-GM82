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
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok
coikiedy=round(random(1))
coikiedy2=0
setonce=0

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
coikiedy2+=1
if coikiedy2>100 {coikiedy2=0; coikiedy=round(random(10))}

if coikiedy<5 {y+=0.1}
if coikiedy>5 {y-=0.1}
if y<global.poziomwody {coikiedy=2}

// chodzenie
if kierunek=-1 {x-=1; image_xscale=-1}
if kierunek=1 {x+=1; image_xscale=1}

image_index=pokazywator.fish



// uppercut i zwykla smierc
//if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
//if place_meeting(x,y,o_troopashell) {energia-=3; rodzajzabicia=0}
//if energia<0 && rodzajzabicia=1 {instance_destroy(); instance_create(x,y+16,o_rybekadie); instance_create(x,y,o_punkciornik)}
if rodzajzabicia=3 || rodzajzabicia=4 || rodzajzabicia=5 {instance_destroy(); instance_create(x,y+16,o_rybekadie); lolo=instance_create(x,y,o_punkciornik); lolo.image_index=0;if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}
if rodzajzabicia=2 {instance_destroy(); instance_create(x,y+16,o_rybekadie);}
}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if y>global.poziomwody && setonce=0{
  is_swimming = 1
  setonce=1
}

if is_swimming=1 && y<=global.poziomwody{
  fofo=instance_create(x,y,o_rybeka3);
  fofo.xspeed=2-irandom(2)+1.25
  fofo.yspeed=-1-1.3*irandom(4)
  instance_destroy();
}
