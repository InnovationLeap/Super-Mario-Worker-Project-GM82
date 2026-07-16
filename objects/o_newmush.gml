#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sekwencja=0
ixor=0
kierunek=1
if kierunek<0.5 kierunek=-1
if kierunek>=0.5 kierunek=1
grawitacja=0
grawsek=0
odbicie=0
sekwodbicia=0

animacja2=0
animacja=0

spadaczanim=0
spadaczanim2=0

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
if global.pauza=0 {

if hele=1 {

if sekwencja=0{
    if(place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1}
    else {sekwencja=1}
}

if sekwencja=1{
    if  kierunek=1{
        if (place_meeting(x+1,y,obj_wall) or place_meeting(x+1,y,o_pointblock)){kierunek=-1; if grawsek=0 {odbicie=1}}
    }
    else{
        if (place_meeting(x-1,y,obj_wall) or place_meeting(x-1,y,o_pointblock)){kierunek=1; if grawsek=0 {odbicie=1}}
    }
    if odbicie=0{x+=kierunek}
}
if odbicie>0 && odbicie<10 {odbicie+=1; sekwodbicia+=1}
if odbicie>=10 && odbicie<20 {odbicie+=1; sekwodbicia-=1}
if odbicie>=20 {odbicie=0; sekwodbicia=0}

if grawsek=0{
    if !place_meeting(x,y+1,obj_halfground){
    if !place_meeting(x,y+1,o_pointblock) {
    if !place_meeting(x,y+1,obj_wall){
        grawsek=1
    }
    }
    }
}
if grawsek=1{
    if grawitacja<7 {grawitacja+=0.5}
    if grawitacja<0{
        if !place_meeting(x,y-8,obj_wall) && !place_meeting(x,y-8,o_pointblock){
            y+=grawitacja
        }
    }
    if grawitacja>0{y+=grawitacja}
    if (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock))
    {grawsek=2; grawitacja=0; spadaczanim=1}
}

while grawsek=2{
    if(place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock))  {
        y-=1;
        if !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {
            grawsek=0
        }
    }
    else{grawsek=0}
}

if animacja<20 {animacja+=1}
if animacja=20 {animacja=100+random(100)}
if animacja>140 && animacja<=200 {animacja=1000}
if animacja>=100 && animacja<=140 {animacja=0}
if animacja>=1000 && animacja<1008 {animacja+=0.5; animacja2+=0.5}
if animacja>=1008 {animacja=0; animacja2=0}

if spadaczanim=1 {spadaczanim=2; spadaczanim2=0}
if spadaczanim=2 && spadaczanim2<10 {spadaczanim2+=1}
if spadaczanim=2 && spadaczanim2>=10 {spadaczanim=3}
if spadaczanim=3 && spadaczanim2>0 {spadaczanim2-=1}
if spadaczanim=3 && spadaczanim2<=0 {spadaczanim2=0; spadaczanim=0}

// uppercut

if place_meeting(x,y,o_uppercut) && grawsek=0 && sekwencja=1 {grawsek=1; grawitacja=-8}
// niszcz po za ekranem
hele=0
}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if kierunek=-1 {draw_sprite_ext(s_bonusgrzyb,animacja2,x+sekwodbicia*1.6,y+spadaczanim2*1.6,1-sekwodbicia/20,1-spadaczanim2/20,0,c_white,1)}
if kierunek=1 {draw_sprite_ext(s_bonusgrzyb,animacja2,x,y+spadaczanim2*1.6,1-sekwodbicia/20,1-spadaczanim2/20,0,c_white,1)}

hele=1
