#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
state=1
grav=-5
if(global.MFbeet) {ixor=1} else {ixor=abs(o_marker.hspd)}
dir=0
image_speed=0
use_count=0
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

if !global.MFbeet && global.pauza=0 {

    // initializacja
    if stworzony=0 && (place_meeting(x,y,obj_wall) && place_meeting(x,y,o_pointblock)) {stworzony=2} else {stworzony=1}
    while stworzony=2 {
        if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) && dir=1 {x-=1};
        if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) && dir=-1 {x+=1};
        if !place_meeting(x,y,obj_wall) {stworzony=1}
    }

    // reszta gowien
    image_index+=0.2

    if use_count>4 {grav+=0.5; y+=grav; state=10}
    if state=1 {state=2; grav=-7; use_count+=1}
    if state=2 {
        grav+=0.5
        if !place_meeting(x,y-10,obj_wall) && !place_meeting(x,y-10,o_pointblock) && grav<0 {y+=grav}
        if (place_meeting(x,y,obj_wall) ||  place_meeting(x,y,o_pointblock)) && grav<0 {y+=1}
        if grav>0 {y+=grav}
        if grav>0 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {grav=0; state=3}
    }
    while state=3 && (place_meeting(x,y,obj_halfground) ||place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1; if !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {state=1}}


    // chodzenie gwiazdki

    if dir=-1 && !place_meeting(x-(2+ixor),y,obj_wall) && !place_meeting(x-(2+ixor),y,o_pointblock) && use_count<=4 {x-=2+ixor}
    if dir=1 && !place_meeting(x+(2+ixor),y,obj_wall) && !place_meeting(x+(2+ixor),y,o_pointblock) && use_count<=4 {x+=2+ixor}
    if dir=-1 && use_count>4 {x-=2+ixor}
    if dir=1 && use_count>4 {x+=2+ixor}

    if dir=1 && (place_meeting(x+2+ixor,y,obj_wall) || place_meeting(x+2+ixor,y,o_pointblock)) && use_count<=4 {dir=-1}
    if dir=-1 && (place_meeting(x-(2+ixor),y,obj_wall) || place_meeting(x-(2+ixor),y,o_pointblock) )&& use_count<=4 {dir=1}

    // niszcz po za ekranem
    if x>view_xview[0]+650 || x<view_xview[0]-10 || y>view_yview[0]+490 {instance_destroy()}


    //if place_meeting(x,y,o_kuppa) && uzyto<=4 { uzyto+=100 }
    if place_meeting(x,y,o_bowser) && use_count<=4 { use_count+=100 ; tmp=instance_place(x,y,o_bowser) if (tmp.koopa_strength=0 || tmp.hit=0) {tmp.hp-=1};instance_create(x,y,o_fireexplode) }
    if place_meeting(x,y,o_goomba) && use_count<=4 {use_count+=1; tmp=instance_place(x,y,o_goomba); if(object_get_name(tmp.object_index)<>'o_bowser') {if(object_get_name(tmp.object_index)='o_cannoni' || object_get_name(tmp.object_index)='o_cannonig' || object_get_name(tmp.object_index)='o_groundpiranha') {instance_create(x,y,o_fireexplode)} else {tmp.kill_type=4; instance_create(x,y,o_fireexplode)}}} //甜菜，炮弹/扎地免疫伤害但会爆炸

}


//======================MF Beet============================
if global.MFbeet && global.pauza=0 {
    if use_count<4 {ixor=use_count}
    if use_count=4 {ixor=-1.5}
    // initializacja
    if stworzony=0 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {
        beetroot_hit(x,y);
        use_count=114514;
    }
    stworzony=1

    // reszta gowien
    image_index+=0.2

    if use_count>limit {grav+=0.5; y+=grav; state=10}
    if state=1 {state=2; grav=-9; use_count+=1}
    if state=2 {
        grav+=0.5;
        if !place_meeting(x,y-10,obj_wall) && !place_meeting(x,y-10,o_pointblock) && grav<0 {y+=grav}
        if (place_meeting(x,y,obj_wall) ||  place_meeting(x,y,o_pointblock)) && grav<0 {y+=1;}
        if grav>0 {y+=grav}
        if grav>0 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {beetroot_hit(x,y);grav=-9;dir*=-1;state=3}
    }
    while state=3 && (place_meeting(x,y,obj_halfground) ||place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1; if !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {state=1}}


    // chodzenie gwiazdki

    if dir=-1 && ((!place_meeting(x-(2+ixor),y,obj_wall) && !place_meeting(x-(2+ixor),y,o_pointblock))||global.MFbeet) && use_count<=limit {x-=2+ixor}
    if dir=1 && ((!place_meeting(x+(2+ixor),y,obj_wall) && !place_meeting(x+(2+ixor),y,o_pointblock))||global.MFbeet) && use_count<=limit {x+=2+ixor}
    if dir=-1 && use_count>limit {x-=2+ixor}
    if dir=1 && use_count>limit {x+=2+ixor}


    if dir=1 && (place_meeting(x+2+ixor,y,obj_wall) || place_meeting(x+2+ixor,y,o_pointblock)) && use_count<=limit {dir=-1;beetroot_hit(x+2+ixor,y);use_count+=1;grav=-9}
    if dir=-1 && (place_meeting(x-(2+ixor),y,obj_wall) || place_meeting(x-(2+ixor),y,o_pointblock) )&& use_count<=limit {dir=1;beetroot_hit(x-(2+ixor),y);use_count+=1;grav=-9}
    // niszcz po za ekranem
    if x>view_xview[0]+650 || x<view_xview[0]-10 || y>view_yview[0]+490 {instance_destroy()}


    //if place_meeting(x,y,o_kuppa) && uzyto<=4 { uzyto+=100 }
    if place_meeting(x,y,o_bowser) && use_count<=limit { use_count+=100 ; tmp=instance_place(x,y,o_bowser) if (tmp.koopa_strength=0 || tmp.hit=0) {tmp.hp-=1};instance_create(x,y,o_fireexplode) }
    if place_meeting(x,y,o_goomba) && use_count<=limit {use_count+=1; tmp=instance_place(x,y,o_goomba); if(object_get_name(tmp.object_index)<>'o_bowser') {if(object_get_name(tmp.object_index)='o_cannoni' || object_get_name(tmp.object_index)='o_cannonig' || object_get_name(tmp.object_index)='o_groundpiranha') {instance_create(x,y,o_fireexplode)} else {tmp.kill_type=4; instance_create(x,y,o_fireexplode)}}} //甜菜，炮弹/扎地免疫伤害但会爆炸

}
