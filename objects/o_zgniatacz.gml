#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grawitacja=0
sekwencja=0

image_speed=0
kierunek=-1
aktywowany=1
rodzajzabicia=0
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok
xiao=0
alter=0
lilofon=0

iyor=0
starty=y

stun = false;

dabusi=1

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


aktywowany=0
if x>view_xview[0]-100 && x<view_xview[0]+740 && y>view_yview[0]-100 && y<view_yview[0]+580 {aktywowany=1}
if x>o_marker.x-80 && x<o_marker.x+80 && lilofon=0 {lilofon=1}
if lilofon=1 && !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {iyor+=1; y+=iyor}
if lilofon=1 && (place_meeting(x,y,obj_halfground) ||  place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {lilofon=2; iyor=0;if y>view_yview[0]-64 && y<view_yview[0]+480+64 {sound_play(snd_stun2)} }

// 有关砸砖部分的失败内容已经被注释保留，供参考与纪念（
// 根据已有的测试结果，直接拿石盾去做碰撞是有问题的，所以我直接生成了一个宽为石盾宽度、高 1 像素的彩条来作为砸砖判定。——绿糖留

//collide_once_per_frame = true;
//thwomp = self;

while lilofon=2 && (place_meeting(x,y,obj_halfground) ||  place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock))
{
    // 可选项：石盾触发砖块
    /*if global.stunblock = 1 {

    collide_block = instance_place(x,y,o_pointblock);
    if collide_block
    {
        if collide_block.bonus = 20 { collide_block.aplikacja = 10; }   // 可碎普通砖块
        if collide_block.bonus <> 20 { collide_block.podbity = 1; }     // 问号
    }


    //collide_block2 = instance_place(x,y,o_ice);
    lolo = instance_place(x, y, obj_wall);
    if(object_get_name(lolo.object_index)='o_ice') {
        with (lolo) {
            if !hit {
                if (hp>1) {sound_play(snd_icebreak1);}
                else {sound_play(snd_icebreak2);}
            hp -= 1;
            hit = true;
            }
        }
    }

    collide_block3 = instance_place(x,y,o_waterchanger);
    if collide_block3
    {
        collide_block3.podbity = 1;
    }

    collide_block4 = instance_place(x,y,o_messageblock);
    if collide_block4
    {
        collide_block4.podbity = 1;
    }

    collide_block5 = instance_place(x,y,o_switch);
    if collide_block5
    {
        collide_block5.podbity = 1;
    }

    collide_block6 = instance_place(x,y,o_pointblockpodbijacz);
    if collide_block6
    {
        collide_block6.podbity = 1;
    }

    }*/

    y -= 1;

    if global.stunblock {
        instance_create(x, y + 35, o_thwompdetector);
    }

    //stun = true;
}


/*if stun {
    instance_create(x, y + 35, o_thwompdetector);
    stun = false;
}*/


/*if stun {
    with (o_pointblock) {
        if place_meeting(x, y + 1, thwomp) {
            if bonus = 20 { aplikacja = 10; }   // 可碎普通砖块
            if bonus <> 20 { podbity = 1; }     // 问号
        }
    }
}*/


/*brick = instance_place(x, y + 1, o_pointblock)
while (brick != noone) {
    brick.origin_x = x; brick.origin_y = y;
    if ((stun) && (global.stunblock)) {
        if (brick.bonus = 20) { brick.aplikacja = 10; }
        else if (brick.bonus != 20) { brick.podbity = 1; }
    }
    with (brick) {instance_destroy(); }
    brick = instance_place(x, y + 1, o_pointblock);
}*/

//stun = false;


if lilofon=2 {lilofon=3}
if lilofon>=3 && lilofon<100 {lilofon+=1}
if lilofon>=100 && y>starty {
    y -= 1;
    stun = false;
}
if lilofon>=100 && y<=starty {lilofon=0}


// niszcz po za ekranem
if y>room_height[0]+64 {instance_destroy()}


if global.rodzajmaria=0 && o_marker.shield<=2 && place_meeting(x,y,o_marker) && o_marker.animator2.visible=0 && xiao=0 && global.rodzajmaria<>0 && global.rodzajmaria<>5{xiao=1}
if place_meeting(x,y,o_marker)&& global.pauza=2 {xiao=0.5}
if xiao=0.5 && global.pauza=0 {xiao=1}
if xiao=1 {sound_play(snd_zgniatacz);sprite_index=sprite363;image_speed=0.1;xiao=2}
if xiao=2 && !sound_isplaying(snd_zgniatacz) && image_index=11 {image_speed=0;image_index=0;sprite_index=sprite157;xiao=0}
}
