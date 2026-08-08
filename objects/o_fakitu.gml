#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed=0
dir=-1
ixor=0
avy=0

activated=1
kill_type=0
animacja=0
attack_timer=0
reload_timer=random(1)+1
killer=2 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

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
if global.pauza=0 && global.level_complete=0 {

    if activated=0 {
        if x>view_xview[0]-100 && x<view_xview[0]+740 && y>view_yview[0]-100 && y<view_yview[0]+580 {
            activated=1
            if x<o_marker.x {dir=1}
            if x>=o_marker.x {dir=-1}
        }
    }

    if activated=1 {
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


        if attack_timer<500 {attack_timer+=reload_timer}
        if attack_timer>=300 && attack_timer<1000 {attack_timer=1000; reload_timer=random(1)+1; sprite_index=s_fakitu2; image_index=0; animacja=2000}
        if attack_timer>=1000 && attack_timer<1010 {image_index+=1; attack_timer+=1}
        if attack_timer>=1010 && attack_timer<1100 {attack_timer+=1}
        if attack_timer=1100 {attack_timer=2000}
        if attack_timer>=2000 && attack_timer<2010 {image_index-=1; attack_timer+=1}
        if attack_timer=2010 {attack_timer=0; sprite_index=s_fakitu; image_index=0; instance_create(x,y-20,o_fahleeball); animacja=0;avy=1 or 2 or 3}
        //音效
        if avy>0 && y<view_yview[0]+504 && y>view_yview[0]-24 && x<view_xview[0]+656 && x>view_xview[0]-16 {
            if avy=1 && global.sample=1 {tmp2=sound_play(snd_lakitu1);sound_volume(snd_lakitu1,global.game_volume);avy=0}
            if avy=2 && global.sample=1 {tmp2=sound_play(snd_lakitu2);sound_volume(snd_lakitu2,global.game_volume);avy=0}
            if avy=3 && global.sample=1 {tmp2=sound_play(snd_lakitu3);sound_volume(snd_lakitu3,global.game_volume);avy=0}
        } else {avy=0}



        // animacja

        if animacja<200 {animacja=random(100)}
        if animacja>98 && animacja<200 {animacja=1000}
        if animacja>=1000 && animacja<2000 {image_index+=1; animacja+=1; if animacja>=1014 {animacja=0}}
    }
    // uppercut i zwykla smierc
    //if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
/*
if rodzajzabicia=1 {instance_destroy(); instance_create(x,y,o_fakitudead); instance_create(x,y,o_punkciornik)}
if rodzajzabicia=3 || rodzajzabicia=4 || rodzajzabicia=5 {instance_destroy(); instance_create(x,y,o_fakitudead); lolo=instance_create(x,y,o_punkciornik); lolo.image_index=0;if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}
*/
    if kill_type=2 {instance_destroy(); instance_create(x,y,o_fakitudead);}

}
