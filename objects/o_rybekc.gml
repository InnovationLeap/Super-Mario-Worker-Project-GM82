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

if global.layerord=0||global.layerord=1{depth=0}
if global.layerord=2{depth=-22}

//dabusi=1

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
if y>global.poziomwody && setonce=0{
  is_swimming = 1
  setonce=1
}

if is_swimming=1 && y<=global.poziomwody{
  fofo=instance_create(x,y,o_rybekc3);
  fofo.xspeed=2-irandom(2)+1.25
  fofo.yspeed=-1-1.3*irandom(4)
  instance_destroy();
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.etappokonany=0 {


if aktywowany=0 {if x>view_xview[0]-100 && x<view_xview[0]+740 && y>view_yview[0]-100 && y<view_yview[0]+580
    {
    if x<o_marker.x {aktywowany=1; kierunek=1}
    if x>=o_marker.x {aktywowany=1; kierunek=-1;image_xscale=-1}
    }}
if aktywowany=1{
// chodzenie
if (!global.newsmooth){
if kierunek=-1 {x-=1; image_xscale=-1}
if kierunek=1 {x+=1; image_xscale=1}
if place_meeting(x-2,y,obj_wall) or place_meeting(x-2,y,o_pointblock) && kierunek=-1 {kierunek=1}
if place_meeting(x+2,y,obj_wall) or place_meeting(x+2,y,o_pointblock) && kierunek=1 {kierunek=-1}
}
else{
if kierunek=1{
    if (place_meeting(x+2,y,obj_wall)|| place_meeting(x+2,y,o_pointblock)) {kierunek=-1;x-=1;image_xscale=-1}
    else{
        x+=1;
    }
}
else{
    if (place_meeting(x-2,y,obj_wall)|| place_meeting(x-2,y,o_pointblock)) {kierunek=1;x+=1;image_xscale=1}
    else{
        x-=1;
    }
}
}
image_index=pokazywator.fish
//if rodzajzabicia=5 {instance_destroy(); lolo=instance_create(x,y,o_rybekadie); lolo.sprite_index=s_fish3; lolo=instance_create(x,y,o_punkciornik); lolo.image_index=0;if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}
if rodzajzabicia=2 {instance_destroy(); lolox=instance_create(x,y+16,o_rybekadie);lolox.sprite_index=s_fish3}
}
}
