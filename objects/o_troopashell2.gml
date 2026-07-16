#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grawitacja=0
sekwencja=0
//if hardshell=0 {energia=0}
//else {energia=23333333333}
image_speed=0
kierunek=1
aktywowany=0
rodzajzabicia=0
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok
czerwona=0
hurt_delay=10
setonce=0
offset=0
single=0

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
if !setonce{
    if hardshell=1{sprite_index=s_buzzyshell;dasini=1}
    else{
        switch(czerwona){
        case 0: sprite_index=s_troopashell;break;
        case 1: sprite_index=s_trooparedshell;break;
        case 2: sprite_index=s_troopablueshell;break;
        case 3: sprite_index=s_troopashellgold;break;
        }
    }
    if(offset){x+=16;y+=18;offset=0}
    setonce=1
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//静止龟壳
if global.pauza=0 && global.etappokonany=0 {
if hurt_delay>0{hurt_delay-=1}
if aktywowany=0
    {
        if x>view_xview[0]-100 && x<view_xview[0]+740 && y>view_yview[0]-100 && y<view_yview[0]+580
        {
        aktywowany=1
        }
    }
if aktywowany=1{

if sekwencja=0{
    if !place_meeting(x,y+1,o_pointblock){
    if !place_meeting(x,y+1,obj_halfground){
    if !place_meeting(x,y+1,obj_wall){
    sekwencja=1;
    }
    }
    }
}

if sekwencja=1 {
    grawitacja+=0.5; y+=grawitacja
    if !place_meeting(x,y,o_uppercut){
    if (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,o_pointblock)){
        grawitacja=0; sekwencja=2;
    }
    }
}

while sekwencja=2{
    if (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)){
        y-=1;
    }
    else{sekwencja=0;}
}

}

// uppercut i zwykla smierc
if hardshell=0 {
//if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
if rodzajzabicia=6 {fofo=instance_create(x,y,o_troopashell); fofo.kierunek=kierunek; fofo.czerwona=czerwona; if czerwona=1 {fofo.sprite_index=s_trooparedshell}; if czerwona=2 {fofo.sprite_index=s_troopablueshell};  if czerwona=3 {fofo.sprite_index=s_troopashellgold} ;instance_destroy();}
if rodzajzabicia=2 {lolo=instance_create(x,y,o_troopadead);lolo.czerwona=czerwona; if czerwona=1 {lolo.sprite_index=s_trooparedshell} ; if czerwona=2 {lolo.sprite_index=s_troopablueshell} ; if czerwona=3 {lolo.sprite_index=s_troopashellgold} ;instance_destroy();}
if rodzajzabicia=1 {fofo=instance_create(x,y,o_troopashell); fofo.kierunek=kierunek; fofo.czerwona=czerwona;fofo.single=single if czerwona=1 {fofo.sprite_index=s_trooparedshell}; if czerwona=2 {fofo.sprite_index=s_troopablueshell};  if czerwona=3 {fofo.sprite_index=s_troopashellgold} ;instance_destroy();}
if rodzajzabicia=3 || rodzajzabicia=4 || rodzajzabicia=5
    {
    instance_destroy();
    koko=instance_create(x,y,o_troopadead);
    koko.czerwona=czerwona
    koko.kierunek=kierunek
    lolo=instance_create(x,y,o_punkciornik);
    lolo.image_index=0
    }
}
else {
//if place_meeting(x,y,o_uppercut) {energia-=23333333333333333; rodzajzabicia=0}//顶

if rodzajzabicia=1 {
    instance_destroy();
    lolo=instance_create(x,y,o_troopashell);
    lolo.hardshell=1
    lolo.dasini=1
    //lolo.energia=23333333333
    lolo.sprite_index=s_buzzyshell;
    lolo.kierunek=kierunek;
    lolo.single = single;
    /*instance_create(x,y,o_punkciornik)*/
}

if rodzajzabicia=6 {
    instance_destroy();
    lolo=instance_create(x,y,o_troopashell);
    lolo.hardshell=1
    lolo.dasini=1
    //lolo.energia=23333333333
    lolo.sprite_index=s_buzzyshell;
    lolo.kierunek=kierunek;
}

if rodzajzabicia=5 {
    instance_destroy();
    fofo=instance_create(x,y,o_troopadead);
    fofo.sprite_index=s_buzzyshell
    lolo=instance_create(x,y,o_punkciornik);
    lolo.image_index=0;
    if global.sample=1 {
        fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)
    }
}//顶

if rodzajzabicia=2 {
    instance_destroy();
    lolo=instance_create(x,y,o_troopadead);
    lolo.sprite_index=s_buzzyshell}//龟壳
}




// niszcz po za ekranem
if y>room_height[0]+64 {instance_destroy()}
}
