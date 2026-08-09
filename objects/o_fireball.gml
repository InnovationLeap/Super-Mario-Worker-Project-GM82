#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ixor=0
vy_offset=0
loop=0
hit_done=0

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
if global.pauza=0 {

/*
if kierunek=1 {kierunek=2; ixor=4}
if kierunek=-1 {kierunek=-2; ixor=-4}

if dobre=0 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {instance_destroy();instance_create(x,y,o_fireexplode); dobre=1} else {dobre=1}

y+=iyor


if (place_meeting(x,y+iyor,obj_wall) || place_meeting(x,y+iyor,o_pointblock)) && dobre=1 && iyor>0 {iyor=-4; loop=1; y=round(y)}
//while loop=1 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1 if !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {loop=0}}

//这里是撞上面的墙的设定
//1.弹下去
//if (place_meeting(x,y+iyor,obj_wall) || place_meeting(x,y+iyor,o_pointblock)) && dobre=1 && iyor<=0 {iyor=0; loop=2; y=round(y)}
//while loop=2 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y+=1 if !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {loop=0}}

//2.炸掉
if (place_meeting(x,y+iyor,obj_wall) || place_meeting(x,y+iyor,o_pointblock)) && dobre=1 && iyor<=0 {instance_destroy(); instance_create(x,y,o_fireexplode)}

image_angle+=10
iyor+=0.5

if iyor>10 iyor=10

x+=ixor
if place_meeting(x+ixor,y-1,obj_wall) || place_meeting(x+ixor,y-1,o_pointblock) {instance_destroy(); instance_create(x,y,o_fireexplode)}
*/

    //上面是大叔的傻贲代码

    //下面是新版代码
    //ixor是x速度 iyor是y速度

    //初始化x速度
    if dir != 233 { ixor = dir*5 ; dir=233 }

    //撞墙(横向)
    if ( instance_place(x+ixor,y,obj_wall) || instance_place(x+ixor,y,o_pointblock) ) {
        tmp=instance_place(x+ixor,y,obj_wall);
        if(object_get_name(tmp.object_index)='o_ice') {
            with(tmp) {
                if(hp>1) {sound_play(snd_icebreak1);} else {sound_play(snd_icebreak2);}
                hp-=1;
            }
        }
        hit_done = 1;
    }

    //y加速度
    vy_offset += 0.5
    if vy_offset > 10 { vy_offset = 10 }

    //弹起
    //弹起
    var nexty;
    nexty=y+vy_offset+1
    if ( instance_place(x,nexty,obj_halfground) || instance_place(x,nexty,obj_wall) || instance_place(x,nexty,o_pointblock) ) && vy_offset > 0 && drink=0 && hit_done=0 {
        tmp=instance_place(x,nexty,obj_wall);
        if(object_get_name(tmp.object_index)='o_ice') {
            with(tmp) {
                if(hp>1) {sound_play(snd_icebreak1);} else {sound_play(snd_icebreak2);}
                hp-=1;
            }
            hit_done=1;
        } else {drink=1}
    }
    while ( drink=1 ) { if ( instance_place(x,nexty,obj_halfground) || instance_place(x,nexty,obj_wall) || instance_place(x,nexty,o_pointblock) ) { nexty-=1 } else { drink=0;y=nexty;vy_offset=-4 }
    }

    //撞墙(纵向)
    if ( instance_place(x,y+vy_offset,obj_wall) || instance_place(x,y+vy_offset,o_pointblock) ) && vy_offset < 0 && hit_done=0 {
        tmp=instance_place(x,y+vy_offset,obj_wall);
        if(object_get_name(tmp.object_index)='o_ice') {
            with(tmp) {
                if(hp>1) {sound_play(snd_icebreak1);} else {sound_play(snd_icebreak2);}
                hp-=1;
            }
        }
        hit_done=1;
    }

    //这里是敌人的攻击判定
    if place_meeting(x,y,o_bowser) && hit_done=0 { tmp=instance_place(x,y,o_bowser) if (tmp.koopa_strength=0 || tmp.hit=0) {tmp.hp-=1;hit_done=1}} //糟比库巴 为什么你加了父对象还要单独写 大叔傻贲
    if place_meeting(x,y,o_goomba) && hit_done=0 { tmp=instance_place(x,y,o_goomba) if(object_get_name(tmp.object_index)<>'o_bowser') { if(object_get_name(tmp.object_index)='o_cannoni' || object_get_name(tmp.object_index)='o_cannonig' || object_get_name(tmp.object_index)='o_groundpiranha') {hit_done=1} else {tmp.kill_type=3 ; hit_done=1} } } //火球，炮弹/扎地免疫伤害但会爆炸
    //爆炸
    if hit_done=1 { instance_destroy(); instance_create(x,y,o_fireexplode) }

    //速度定义
    x += ixor
    y += vy_offset

    //动画
    if ixor>0 { image_angle -= 10 } else { image_angle +=10 }

    // niszcz po za ekranem

    if x>view_xview[0]+650 || x<view_xview[0]-10 || y>view_yview[0]+490 {instance_destroy()}
}
