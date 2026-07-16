#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hardshell=0
grawitacja=0
sekwencja=0

image_speed=0
kierunek=-1
aktywowany=0
rodzajzabicia=0
nabijanie=0
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

czerwona=0


hurt_delay=10
fangsi=0
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
/*备忘
o_pointblock.podbity=1时被激活
*/
//运动龟壳
if aktywowany=0
    {
        if x>view_xview[0]-100 && x<view_xview[0]+740 && y>view_yview[0]-100 && y<view_yview[0]+580
        {
        aktywowany=1
        if single && x<o_marker.x {kierunek=1}
        if single && x>=o_marker.x {kierunek=-1}
        }
    }

if global.pauza=0 && global.etappokonany=0 {
if hurt_delay>0{hurt_delay-=1}
if aktywowany=1{
// spadanie
if czerwona=1 {sprite_index=s_trooparedshell}
/*
basic_movement(5,0.4,0,0);

if hardshell=1 {
if place_meeting(x+5,y,o_pointblock) && kierunek>0 {lolo=instance_place(x+5,y,o_pointblock);lolo.podbity=1;if lolo.bonus=20{lolo.shaben=1;lolo.aplikacja=10};fangsi=1;kierunek=kierunek*-1}
if place_meeting(x-5,y,o_pointblock) && kierunek<0 {lolo=instance_place(x-5,y,o_pointblock);lolo.podbity=1;if lolo.bonus=20{lolo.shaben=1;lolo.aplikacja=10};fangsi=1;kierunek=kierunek*-1}
if place_meeting(x+5,y,o_pointblockpodbijacz) && kierunek>0 {lolo=instance_place(x+5,y,o_pointblockpodbijacz);lolo.podbity=1;fangsi=1;kierunek=kierunek*-1}
if place_meeting(x-5,y,o_pointblockpodbijacz)&& kierunek<0 {lolo=instance_place(x-5,y,o_pointblockpodbijacz);if(!lolo.podbity){lolo.podbity=1;}fangsi=1;kierunek=kierunek*-1}
//if (place_meeting(x+5,y,obj_wall) && !place_meeting(x+5,y,o_pointblockpodbijacz)) || (place_meeting(x-5,y,obj_wall) && !place_meeting(x-5,y,o_pointblockpodbijacz))  {kierunek=kierunek*-1}
}
*/

if sekwencja=0 && !place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,o_pointblock) {sekwencja=1}
if sekwencja=1 {grawitacja+=0.5; y+=grawitacja}
if sekwencja=1 && (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,o_pointblock)) {grawitacja=0; sekwencja=2;}
while sekwencja=2 && (place_meeting(x,y,obj_halfground) ||place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1 if (!place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock)) {sekwencja=0}}

if hardshell=1 {
if place_meeting(x+5,y,o_pointblock) && kierunek>0 {lolo=instance_place(x+5,y,o_pointblock);lolo.podbity=1;if lolo.bonus=20{lolo.shaben=1;lolo.aplikacja=10};fangsi=1;kierunek=kierunek*-1}
if place_meeting(x-5,y,o_pointblock) && kierunek<0 {lolo=instance_place(x-5,y,o_pointblock);lolo.podbity=1;if lolo.bonus=20{lolo.shaben=1;lolo.aplikacja=10};fangsi=1;kierunek=kierunek*-1}
if place_meeting(x+5,y,o_pointblockpodbijacz) && kierunek>0 {lolo=instance_place(x+5,y,o_pointblockpodbijacz);lolo.podbity=1;fangsi=1;kierunek=kierunek*-1}
if place_meeting(x-5,y,o_pointblockpodbijacz)&& kierunek<0 {lolo=instance_place(x-5,y,o_pointblockpodbijacz);if(!lolo.podbity){lolo.podbity=1;}fangsi=1;kierunek=kierunek*-1}
}

if kierunek=-1 && (!place_meeting(x-5,y,obj_wall) || !place_meeting(x-5,y,o_pointblock)) {x-=5}
if kierunek=1 && (!place_meeting(x+5,y,obj_wall) || !place_meeting(x+5,y,o_pointblock)) {x+=5}

if hardshell=1 {
    if (place_meeting(x+5,y,obj_wall) && !place_meeting(x+5,y,o_pointblockpodbijacz)) || (place_meeting(x-5,y,obj_wall) && !place_meeting(x-5,y,o_pointblockpodbijacz))  {kierunek=kierunek*-1}
}
else {
    if  place_meeting(x+5,y,obj_wall) || place_meeting(x-5,y,obj_wall) || place_meeting(x+5,y,o_pointblock) || place_meeting(x-5,y,o_pointblock) {kierunek=kierunek*-1}
}

image_index+=0.4

}

// uppercut i zwykla smierc
if hardshell=0 {

//if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
if rodzajzabicia=6 {instance_destroy(); lolox=instance_create(x,y,o_troopashell2); lolox.kierunek=kierunek; lolox.czerwona=czerwona; if czerwona=1 {lolox.sprite_index=s_trooparedshell}  ; if czerwona=2 {lolox.sprite_index=s_troopablueshell} ;if czerwona=3 {lolox.sprite_index=s_troopashellgold}}
if rodzajzabicia=2 {instance_destroy(); lolo=instance_create(x,y,o_troopadead); lolo.czerwona=czerwona; if czerwona=1 {lolo.sprite_index=s_trooparedshell} ; if czerwona=2 {lolo.sprite_index=s_troopablueshell} ;if czerwona=3 {lolo.sprite_index=s_troopashellgold}}
if rodzajzabicia=1 {instance_destroy(); lolox=instance_create(x,y,o_troopashell2); lolo=instance_create(x,y,o_punkciornik); lolox.kierunek=kierunek; lolox.czerwona=czerwona; if czerwona=1 {lolox.sprite_index=s_trooparedshell}  ; if czerwona=2 {lolox.sprite_index=s_troopablueshell} ;if czerwona=3 {lolox.sprite_index=s_troopashellgold}}
if rodzajzabicia=3 || rodzajzabicia=4 || rodzajzabicia=5 {instance_destroy(); lolox=instance_create(x,y,o_troopadead); lolo=instance_create(x,y,o_punkciornik); lolox.czerwona=czerwona; if czerwona=1 {lolox.sprite_index=s_trooparedshell}  ; if czerwona=2 {lolox.sprite_index=s_troopablueshell};if czerwona=3 {lolox.sprite_index=s_troopashellgold};if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}

}
else {
//if place_meeting(x,y,o_uppercut) && fangsi=0 {energia-=23333333333333333; rodzajzabicia=0}//顶

if rodzajzabicia=1 {
instance_destroy();
lolo=instance_create(x,y,o_troopashell2);
lolo.sprite_index=s_buzzyshell;
lolo.kierunek=kierunek;
lolo.dasini=1
lolo.hardshell=1
//lolo.energia=23333333333
instance_create(x,y,o_punkciornik)}

if rodzajzabicia=6 {
instance_destroy();
lolo=instance_create(x,y,o_troopashell2);
lolo.sprite_index=s_buzzyshell;
lolo.kierunek=kierunek;
lolo.dasini=1
lolo.hardshell=1
//lolo.energia=23333333333
}

if rodzajzabicia=5 {
instance_destroy();
fofo=instance_create(x,y,o_troopadead);
fofo.sprite_index=s_buzzyshell
lolo=instance_create(x,y,o_punkciornik);
lolo.image_index=0;
if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}//顶

if rodzajzabicia=2 {
instance_destroy();
lolo=instance_create(x,y,o_troopadead);
lolo.sprite_index=s_buzzyshell}

}

// zabijanie od muszli
//先把这里治好

if sprite_index != s_buzzyshell {

if place_meeting(x,y,o_goomba) && !place_meeting(x,y,o_troopashell) && !place_meeting(x,y,o_rybekc) && !place_meeting(x,y,o_rynekd)
    {
    lolo=instance_place(x,y,o_goomba)
    if lolo.dabusi=0 && lolo.dasini=0 && lolo.noshellkick=0 {
    lolo.rodzajzabicia=2
    nabijanie+=1
    fofo=instance_create(x,y,o_punkciornik2)
    fofo.image_index=nabijanie-1
    if nabijanie>6 {nabijanie=0}
}
if lolo.dasini <> 0 && lolo.noshellkick=0
    { rodzajzabicia=2 ;fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}

}

if place_meeting(x,y,o_troopashell)
    {
    lolo=instance_place(x,y,o_troopashell)
  /*  if lolo.dabusi=0 && lolo.dasini=0 {
  //  lolo.energia-=10000000
    lolo.rodzajzabicia=2
    nabijanie+=1
    fofo=instance_create(x,y,o_punkciornik2)
    fofo.image_index=nabijanie-1
    if nabijanie>6 {nabijanie=0}
    energia-=1
    rodzajzabicia=2
}*/
if lolo.dasini <> 0
    { rodzajzabicia=2 ;fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}

}

} else {

if place_meeting(x,y,o_goomba) && !place_meeting(x,y,o_troopashell) /*&& !place_meeting(x,y,o_rybekc) && !place_meeting(x,y,o_rynekd)*/
    {
    lolo=instance_place(x,y,o_goomba)
    if lolo.dabusi=0 && lolo.noshellkick=0 {
   // lolo.energia-=233333333333333333333
    lolo.rodzajzabicia=2
    nabijanie+=1
    fofo=instance_create(x,y,o_punkciornik2)
    fofo.image_index=nabijanie-1
    if nabijanie>6 {nabijanie=0}
}
}

if place_meeting(x,y,o_troopashell)
    {
    lolo=instance_place(x,y,o_troopashell)
    if lolo.dabusi=0 && lolo.dasini=0 {
   // lolo.energia-=233333333333333333333
    lolo.rodzajzabicia=2
    nabijanie+=1
    fofo=instance_create(x,y,o_punkciornik2)
    fofo.image_index=nabijanie-1
    if nabijanie>6 {nabijanie=0}
}
/*if lolo.zarabia=1 && lolo.energia>0 { //WTF，这干嘛的，这代码有存在意义？？？？？
    lolo.energia-=233333333333333333333
    lolo.rodzajzabicia=2
    nabijanie+=1
    fofo=instance_create(x,y,o_punkciornik2)
    fofo.image_index=nabijanie-1
    if nabijanie>6 {nabijanie=0}
    energia-=233333333333333333333
    rodzajzabicia=2
    }*///直接禁了（

}

}

// niszcz po za ekranem
if y>room_height[0]+64 {instance_destroy()}

if fangsi>0 {fangsi+=1}
if fangsi>7 {fangsi=0}
}


// 硬壳（划掉）所有龟壳的碰撞检测
if place_meeting(x, y, o_piraniablue) || place_meeting(x, y, o_piraniablueshot)
{
    if place_meeting(x, y, o_piraniablue) {gay_fa = instance_place(x,y,o_piraniablue)}
    if place_meeting(x, y, o_piraniablueshot) {gay_fa = instance_place(x,y,o_piraniablueshot)}

    if gay_fa.dasini_lake = 1
    {

        // 设置死亡类型为特殊击杀（对应硬壳的5号死亡方式）
        rodzajzabicia = 1;

        // 死亡处理（保持与原有逻辑一致）
        instance_destroy();
        fofo = instance_create(x, y, o_troopadead);
        fofo.czerwona = czerwona;
        fofo.hardshell = hardshell;
        if fofo.hardshell = 1 {fofo.sprite_index = s_buzzyshell;}
        else {
        if czerwona=1 {fofo.sprite_index=s_trooparedshell} ; if czerwona=2 {fofo.sprite_index=s_troopablueshell} ;if czerwona=3 {fofo.sprite_index=s_troopashellgold}
        }

        // 创建分数
        lolo = instance_create(x, y, o_punkciornik);
        lolo.image_index = 0;

        /*
        // 音效反馈（根据全局设置）
        if global.sample == 1 {
            sound_play(snd_kick);
            sound_volume(snd_kick, global.glosnosc);
        }
        */

    }
}
