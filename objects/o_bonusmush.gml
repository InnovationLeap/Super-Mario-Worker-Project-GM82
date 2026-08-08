#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
state=0
ixor=0
dir=1
if dir<0.5 dir=-1
if dir>=0.5 dir=1
grav=0
grav_lock=0
bounce_timer=0
bounce_phase=0

animacja2=0
animacja=0

fall_anim=0
fall_anim2=0

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

    if hele = 1 {

        if state=0 {
            if(place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1} else {state=1}
        }

        if state=1 {
            if  dir=1 {
                if (place_meeting(x+1,y,obj_wall) or place_meeting(x+1,y,o_pointblock)) {dir=-1; if grav_lock=0 {bounce_timer=1}}
            } else {
                if (place_meeting(x-1,y,obj_wall) or place_meeting(x-1,y,o_pointblock)) {dir=1; if grav_lock=0 {bounce_timer=1}}
            }
            if bounce_timer=0 {x+=dir}
        }
        if bounce_timer>0 && bounce_timer<10 {bounce_timer+=1; bounce_phase+=1}
        if bounce_timer>=10 && bounce_timer<20 {bounce_timer+=1; bounce_phase-=1}
        if bounce_timer>=20 {bounce_timer=0; bounce_phase=0}

        if grav_lock=0 && !place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,o_pointblock) {grav_lock=1}
        if grav_lock=1 && grav<7 {grav+=0.5}
        if grav_lock=1 && !place_meeting(x,y-8,obj_wall) && !place_meeting(x,y-8,o_pointblock) && grav<0 y+=grav
        if grav_lock=1 && grav>0 y+=grav
        if grav_lock=1 && (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {grav_lock=2; grav=0; fall_anim=1}
        while grav_lock=2 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1}
        if grav_lock=2 && !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {grav_lock=0}

        if animacja<20 {animacja+=1}
        if animacja=20 {animacja=100+random(100)}
        if animacja>140 && animacja<=200 {animacja=1000}
        if animacja>=100 && animacja<=140 {animacja=0}
        if animacja>=1000 && animacja<1008 {animacja+=0.5; animacja2+=0.5}
        if animacja>=1008 {animacja=0; animacja2=0}

        if fall_anim=1 {fall_anim=2; fall_anim2=0}
        if fall_anim=2 && fall_anim2<10 {fall_anim2+=1}
        if fall_anim=2 && fall_anim2>=10 {fall_anim=3}
        if fall_anim=3 && fall_anim2>0 {fall_anim2-=1}
        if fall_anim=3 && fall_anim2<=0 {fall_anim2=0; fall_anim=0}

        // uppercut

        if place_meeting(x,y,o_uppercut) && grav_lock=0 && state=1 {grav_lock=1; grav=-8}

        // niszcz po za ekranem
        if x>view_xview[0]+650 || x<view_xview[0]-10 || y>view_yview[0]+490 {instance_destroy()}
        hele=0
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if dir=-1 {draw_sprite_ext(s_bonusmush,animacja2,x+bounce_phase*1.6,y+fall_anim2*1.6,1-bounce_phase/20,1-fall_anim2/20,0,c_white,1)}
if dir=1 {draw_sprite_ext(s_bonusmush,animacja2,x,y+fall_anim2*1.6,1-bounce_phase/20,1-fall_anim2/20,0,c_white,1)}

hele=1
