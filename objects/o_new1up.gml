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

    // v6.13/v6.16：生成器生成的单位在**自身**也做一次出界回收，口径与 o_generator 完全一致——
    //   ① 相对房间左/下/右出界 256px；② 锚点离开可视区域（左/右/下）。都不判上方。
    //   生成器那边的槽位追踪一旦有边角情况，这里仍能兜住。非生成物（gen_tag = 0）不受影响。
    if gen_tag != 0 {
        if x < -256 || x > room_width[0]+256 || y > room_height[0]+256 { instance_destroy() }
        if x < view_xview[0] || x > view_xview[0]+view_wview[0] || y > view_yview[0]+view_hview[0] { instance_destroy() }
    }

    if hele = 1 {

        if state=0 {
            if(place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1} else {state=1}
        }

        if state=1 {
            if  dir=1 {
                if (place_meeting(x+2,y,obj_wall) or place_meeting(x+2,y,o_pointblock)) {dir=-1; if grav_lock=0 {bounce_timer=1}}
            } else {
                if (place_meeting(x-2,y,obj_wall) or place_meeting(x-2,y,o_pointblock)) {dir=1; if grav_lock=0 {bounce_timer=1}}
            }
            if bounce_timer=0 {x+=2*dir}
        }
        if bounce_timer>0 && bounce_timer<10 {bounce_timer+=1; bounce_phase+=1}
        if bounce_timer>=10 && bounce_timer<20 {bounce_timer+=1; bounce_phase-=1}
        if bounce_timer>=20 {bounce_timer=0; bounce_phase=0}

        if grav_lock=0 {
            if !place_meeting(x,y+1,obj_halfground) {
                if !place_meeting(x,y+1,o_pointblock) {
                    if !place_meeting(x,y+1,obj_wall) {
                        grav_lock=1
                    }
                }
            }
        }
        if grav_lock=1 {
            if grav<7 {grav+=0.5}
            if grav<0 {
                if !place_meeting(x,y-8,obj_wall) && !place_meeting(x,y-8,o_pointblock) {
                    y+=grav
                }
            }
            if grav>0 {y+=grav}
            if (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {grav_lock=2; grav=0; fall_anim=1}
        }

        while grav_lock=2 {
            if(place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {
                y-=1;
                if !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {
                    grav_lock=0
                }
            } else {grav_lock=0}
        }

/*if animacja<20 {animacja+=1}
if animacja=20 {animacja=100+random(100)}
if animacja>140 && animacja<=200 {animacja=1000}
if animacja>=100 && animacja<=140 {animacja=0}
if animacja>=1000 && animacja<1008 {animacja+=0.5; animacja2+=0.5}
if animacja>=1008 {animacja=0; animacja2=0}*/

        if fall_anim=1 {fall_anim=2; fall_anim2=0}
        if fall_anim=2 && fall_anim2<10 {fall_anim2+=1}
        if fall_anim=2 && fall_anim2>=10 {fall_anim=3}
        if fall_anim=3 && fall_anim2>0 {fall_anim2-=1}
        if fall_anim=3 && fall_anim2<=0 {fall_anim2=0; fall_anim=0}

        // uppercut

        if place_meeting(x,y,o_uppercut) && grav_lock=0 && state=1 {grav_lock=1; grav=-8}
        // niszcz po za ekranem
        // v6.11（用户反馈"奖命蘑菇似乎没有应用出界销毁"）：本对象是 o_bonus1up 的副本，这一行原来漏抄了
        //   （同族 o_bonus1up / o_bonusdead / o_bonusmush / o_bonusraccoon 都有）。
        //   非生成物沿用原有口径（相对视口）；生成器生成的单位由生成器按"左/下/右出界 256px"统一回收。
        if gen_tag = 0 {
            if x>view_xview[0]+650 || x<view_xview[0]-10 || y>view_yview[0]+490 {instance_destroy()}
        }
        hele=0
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if dir=-1 {draw_sprite_ext(s_bonus1up,animacja2,x+bounce_phase*1.6,y+fall_anim2*1.6,1-bounce_phase/20,1-fall_anim2/20,0,c_white,1)}
if dir=1 {draw_sprite_ext(s_bonus1up,animacja2,x,y+fall_anim2*1.6,1-bounce_phase/20,1-fall_anim2/20,0,c_white,1)}

hele=1
