#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed=0
kierunek=-1
ixor=0
avy=0

aktywowany=1
rodzajzabicia=0
animacja=0
strzelanie=0
ladowanie=random(1)+1
killer=2 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

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

if aktywowany=0
    {
        if x>view_xview[0]-100 && x<view_xview[0]+740 && y>view_yview[0]-100 && y<view_yview[0]+580
        {
        aktywowany=1
        if x<o_marker.x {kierunek=1}
        if x>=o_marker.x {kierunek=-1}
        }
    }

if aktywowany=1{
// chodzenie
if ixor>12 {ixor=12}
if ixor<-12 {ixor=-12}

if x>o_marker.x+150 {ixor-=0.1}
if x<o_marker.x-150 {ixor+=0.1}

if x>o_marker.x+150 && ixor>0 {ixor-=0.2}
if x<o_marker.x-150 && ixor<0 {ixor+=0.2}

if (x<o_marker.x+150 && x>o_marker.x-150) && x>o_marker.x && ixor>-4 {ixor-=0.1}
if (x<o_marker.x+150 && x>o_marker.x-150) && x<o_marker.x && ixor<4 {ixor+=0.1}
x+=ixor
// strzelanie


if strzelanie<500 {strzelanie+=ladowanie}
if strzelanie>=300 && strzelanie<1000 {strzelanie=1000; ladowanie=random(1)+1; sprite_index=s_lakitu2; image_index=0; animacja=2000}
if strzelanie>=1000 && strzelanie<1010 {image_index+=1; strzelanie+=1}
if strzelanie>=1010 && strzelanie<1100 {strzelanie+=1}
if strzelanie=1100 {strzelanie=2000}
if strzelanie>=2000 && strzelanie<2010 {image_index-=1; strzelanie+=1}
if strzelanie=2010 {strzelanie=0; sprite_index=s_lakitu; image_index=0; instance_create(x,y-20,o_lakitubomb); animacja=0;avy=1 or 2 or 3}
//音效
if avy>0 && y<view_yview[0]+504 && y>view_yview[0]-24 && x<view_xview[0]+656 && x>view_xview[0]-16 {
 if avy=1 && global.sample=1 {fofo=sound_play(snd_lakitu1);sound_volume(snd_lakitu1,global.glosnosc);avy=0}
 if avy=2 && global.sample=1 {fofo=sound_play(snd_lakitu2);sound_volume(snd_lakitu2,global.glosnosc);avy=0}
 if avy=3 && global.sample=1 {fofo=sound_play(snd_lakitu3);sound_volume(snd_lakitu3,global.glosnosc);avy=0}
}else {avy=0}



// animacja

if animacja<200 {animacja=random(100)}
if animacja>98 && animacja<200 {animacja=1000}
if animacja>=1000 && animacja<2000 {image_index+=1; animacja+=1; if animacja>=1014 {animacja=0}}
}
// uppercut i zwykla smierc
//if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
if rodzajzabicia=1 {instance_destroy(); instance_create(x,y,o_lakitudead); instance_create(x,y,o_punkciornik)}
if rodzajzabicia=3 || rodzajzabicia=4 || rodzajzabicia=5 {instance_destroy(); instance_create(x,y,o_lakitudead); lolo=instance_create(x,y,o_punkciornik); lolo.image_index=0;if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}
if rodzajzabicia=2 {instance_destroy(); instance_create(x,y,o_lakitudead);}

}
