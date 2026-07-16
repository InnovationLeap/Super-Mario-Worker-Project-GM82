#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sekwencja=1
grawitacja=-5
if(global.MFbeet){ixor=1}
else{ixor=abs(o_marker.szybkosc)}
kierunek=0
image_speed=0
uzyto=0
stworzony=0
limit=4-global.MFbeet

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
//==================old MW beet======================

if !global.MFbeet && global.pauza=0{

// initializacja
if stworzony=0 && (place_meeting(x,y,obj_wall) && place_meeting(x,y,o_pointblock)){stworzony=2} else {stworzony=1}
while stworzony=2
    {
    if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) && kierunek=1 {x-=1};
    if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) && kierunek=-1 {x+=1};
    if !place_meeting(x,y,obj_wall) {stworzony=1}
    }

// reszta gowien
image_index+=0.2

if uzyto>4 {grawitacja+=0.5; y+=grawitacja; sekwencja=10}
if sekwencja=1 {sekwencja=2; grawitacja=-7; uzyto+=1}
if sekwencja=2
    {
    grawitacja+=0.5
    if !place_meeting(x,y-10,obj_wall) && !place_meeting(x,y-10,o_pointblock) && grawitacja<0 {y+=grawitacja}
    if (place_meeting(x,y,obj_wall) ||  place_meeting(x,y,o_pointblock)) && grawitacja<0 {y+=1}
    if grawitacja>0 {y+=grawitacja}
    if grawitacja>0 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {grawitacja=0; sekwencja=3}
    }
while sekwencja=3 && (place_meeting(x,y,obj_halfground) ||place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1; if !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {sekwencja=1}}


// chodzenie gwiazdki

if kierunek=-1 && !place_meeting(x-(2+ixor),y,obj_wall) && !place_meeting(x-(2+ixor),y,o_pointblock) && uzyto<=4 {x-=2+ixor}
if kierunek=1 && !place_meeting(x+(2+ixor),y,obj_wall) && !place_meeting(x+(2+ixor),y,o_pointblock) && uzyto<=4 {x+=2+ixor}
if kierunek=-1 && uzyto>4 {x-=2+ixor}
if kierunek=1 && uzyto>4 {x+=2+ixor}

if kierunek=1 && (place_meeting(x+2+ixor,y,obj_wall) || place_meeting(x+2+ixor,y,o_pointblock)) && uzyto<=4 {kierunek=-1}
if kierunek=-1 && (place_meeting(x-(2+ixor),y,obj_wall) || place_meeting(x-(2+ixor),y,o_pointblock) )&& uzyto<=4 {kierunek=1}

// niszcz po za ekranem
if x>view_xview[0]+650 || x<view_xview[0]-10 || y>view_yview[0]+490 {instance_destroy()}


//if place_meeting(x,y,o_kuppa) && uzyto<=4 { uzyto+=100 }
if place_meeting(x,y,o_kuppa) && uzyto<=4 { uzyto+=100 ; lolo=instance_place(x,y,o_kuppa) if (lolo.koopa_strength=0 || lolo.oberw=0){lolo.energia-=1};instance_create(x,y,o_fireexplode) }
if place_meeting(x,y,o_goomba) && uzyto<=4 {uzyto+=1; lolo=instance_place(x,y,o_goomba); if(object_get_name(lolo.object_index)<>'o_kuppa'){lolo.rodzajzabicia=4; instance_create(x,y,o_fireexplode)}} //甜菜

}


//======================MF Beet============================
if global.MFbeet && global.pauza=0{
if uzyto<4 {ixor=uzyto}
if uzyto=4 {ixor=-1.5}
// initializacja
if stworzony=0 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)){
    burax_hit(x,y);
    uzyto=114514;
}
    stworzony=1

// reszta gowien
image_index+=0.2

if uzyto>limit {grawitacja+=0.5; y+=grawitacja; sekwencja=10}
if sekwencja=1 {sekwencja=2; grawitacja=-9; uzyto+=1}
if sekwencja=2
    {
    grawitacja+=0.5;
    if !place_meeting(x,y-10,obj_wall) && !place_meeting(x,y-10,o_pointblock) && grawitacja<0 {y+=grawitacja}
    if (place_meeting(x,y,obj_wall) ||  place_meeting(x,y,o_pointblock)) && grawitacja<0 {y+=1;}
    if grawitacja>0 {y+=grawitacja}
    if grawitacja>0 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {burax_hit(x,y);grawitacja=-9;kierunek*=-1;sekwencja=3}
    }
while sekwencja=3 && (place_meeting(x,y,obj_halfground) ||place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1; if !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {sekwencja=1}}


// chodzenie gwiazdki

if kierunek=-1 && ((!place_meeting(x-(2+ixor),y,obj_wall) && !place_meeting(x-(2+ixor),y,o_pointblock))||global.MFbeet) && uzyto<=limit {x-=2+ixor}
if kierunek=1 && ((!place_meeting(x+(2+ixor),y,obj_wall) && !place_meeting(x+(2+ixor),y,o_pointblock))||global.MFbeet) && uzyto<=limit {x+=2+ixor}
if kierunek=-1 && uzyto>limit {x-=2+ixor}
if kierunek=1 && uzyto>limit {x+=2+ixor}


if kierunek=1 && (place_meeting(x+2+ixor,y,obj_wall) || place_meeting(x+2+ixor,y,o_pointblock)) && uzyto<=limit {kierunek=-1;burax_hit(x+2+ixor,y);uzyto+=1;grawitacja=-9}
if kierunek=-1 && (place_meeting(x-(2+ixor),y,obj_wall) || place_meeting(x-(2+ixor),y,o_pointblock) )&& uzyto<=limit {kierunek=1;burax_hit(x-(2+ixor),y);uzyto+=1;grawitacja=-9}
// niszcz po za ekranem
if x>view_xview[0]+650 || x<view_xview[0]-10 || y>view_yview[0]+490 {instance_destroy()}


//if place_meeting(x,y,o_kuppa) && uzyto<=4 { uzyto+=100 }
if place_meeting(x,y,o_kuppa) && uzyto<=limit { uzyto+=100 ; lolo=instance_place(x,y,o_kuppa) if (lolo.koopa_strength=0 || lolo.oberw=0){lolo.energia-=1};instance_create(x,y,o_fireexplode) }
if place_meeting(x,y,o_goomba) && uzyto<=limit {uzyto+=1; lolo=instance_place(x,y,o_goomba); if(object_get_name(lolo.object_index)<>'o_kuppa'){lolo.rodzajzabicia=4; instance_create(x,y,o_fireexplode)}} //甜菜

}
