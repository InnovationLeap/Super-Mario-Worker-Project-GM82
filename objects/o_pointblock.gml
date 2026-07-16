#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
podbity=0
sekwencja=0
dzwiek=0
stefan=0
lewoprawo=random(5)-random(5)
kierunek=0


niemozna=0
niemozna2=0

aplikacja=0

shaben=0
avoid_change=0

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
/*if (global.stunblock = 1) {

    var collide;
    var hit;

    with (all) {
        fofo = instance_place(x, y - 1, o_zgniatacz)
        if fofo.stun {
            for (i = 0; i < 100; i += 1) {
                collide[i] = self;
                collide[i].hit = true;
            }
        }

        for (j = 0; j < 100; j += 1) {
            if collide[j].hit {
                if collide[j].bonus = 20 { collide[j].aplikacja = 10; }   // 可碎普通砖块
                if collide[j].bonus <> 20 { collide[j].podbity = 1; }     // 问号
            }
        }
    }

}*/

/*with (o_pointblock) {
    if (instance_place(x, y - 1, other).stun) {
        if bonus = 20 { aplikacja = 10; }   // 可碎普通砖块
        if bonus <> 20 { podbity = 1; }     // 问号
    }
}*/

/*with (o_pointblock) {
    if collision_point(x, y - 1, o_zgniatacz, 0, 0) {
        if bonus = 20 { aplikacja = 10; }   // 可碎普通砖块
        if bonus <> 20 { podbity = 1; }     // 问号
    }
}*/

if place_meeting(x, y, o_thwompdetector) {
    if bonus = 20 { aplikacja = 10; }   // 可碎普通砖块
    if bonus <> 20 { podbity = 1; }     // 问号
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


if bonus=20 && podbity=0 {draw_sprite_ext(s_pointblock3,stefan,x,y,1,1,0,c_white,1)}
if bonus=20 && podbity=1 && global.rodzajmaria=0 && shaben=0 {aplikacja=2;instance_create(x,y-32,o_uppercut)}
if bonus=20 && podbity=1 && global.rodzajmaria>0 && shaben=0 {aplikacja=10;instance_create(x,y-32,o_uppercut)}


if aplikacja=2
    {
    if global.sample=1 && dzwiek=0 {fofo=sound_play(snd_burb);sound_volume(snd_burb,global.glosnosc);dzwiek=1}
    draw_sprite_ext(s_pointblock3,0,x,y-niemozna,1,1,0,c_white,1)
    if niemozna2=0 && niemozna<10 {niemozna+=1}
    if niemozna2=0 && niemozna>=10 {niemozna2=1}
    if niemozna2=1 && niemozna>0 {niemozna-=1}
    if niemozna2=1 && niemozna<=0 {niemozna2=0; podbity=0;dzwiek=0;aplikacja=0;}
    }


if aplikacja=10
    {
    if global.sample=1 && dzwiek=0 {fofo=sound_play(snd_break);sound_volume(snd_break,global.glosnosc);dzwiek=1}
    instance_destroy()
        lolo=instance_create(x+8,y+8,o_breakblock)
    lolo.ixor=-3
    lolo.iyor=-6
    lolo.image_xscale=0.5
    lolo.image_yscale=0.5
        lolo=instance_create(x+8+16,y+8,o_breakblock)
    lolo.ixor=3
    lolo.iyor=-6
        lolo.image_xscale=0.5
    lolo.image_yscale=0.5
        lolo=instance_create(x+8+16,y+8+16,o_breakblock)
    lolo.ixor=-2
    lolo.iyor=-4
        lolo.image_xscale=0.5
    lolo.image_yscale=0.5
        lolo=instance_create(x+8,y+8+16,o_breakblock)
    lolo.ixor=2
    lolo.iyor=-4
        lolo.image_xscale=0.5
    lolo.image_yscale=0.5
    }



if podbity=0 && bonus<>20 && bonus<100{draw_sprite(s_pointblock,stefan,x,y)}
if podbity=1 && bonus<>20 && bonus<100
    {
    if global.sample=1 && dzwiek=0 && bonus=0 {fofo=sound_play(snd_coin);sound_volume(snd_coin,global.glosnosc);dzwiek=1}
    if global.sample=1 && dzwiek=0 && bonus>0 && bonus<100 {fofo=sound_play(snd_vine);sound_volume(snd_vine,global.glosnosc);dzwiek=1}
    if bonus=0 {instance_create(x,y,o_coineffect);global.coins+=1;instance_create(x,y-32,o_uppercut);bonus=-1000}

    if bonus=1 && global.rodzajmaria<>0 {instance_create(x,y,o_bonusflower);instance_create(x,y-32,o_uppercut);bonus=-1000}
    if bonus=1 && global.rodzajmaria=0 {instance_create(x,y,o_bonusmush);instance_create(x,y-32,o_uppercut);bonus=-1000}

    if bonus=2 && global.rodzajmaria<>0 {instance_create(x,y,o_bonusburak);instance_create(x,y-32,o_uppercut);bonus=-1000}
    if bonus=2 && global.rodzajmaria=0 {instance_create(x,y,o_bonusmush);instance_create(x,y-32,o_uppercut);bonus=-1000}

    if bonus=3 && global.rodzajmaria<>0 {instance_create(x,y,o_bonuslui);instance_create(x,y-32,o_uppercut);bonus=-1000}
    if bonus=3 && global.rodzajmaria=0 {instance_create(x,y,o_bonusmush);instance_create(x,y-32,o_uppercut);bonus=-1000}

    if bonus=5 {instance_create(x,y,o_bonus1up);instance_create(x,y-32,o_uppercut);bonus=-1000}

    if bonus=6 {instance_create(x,y,o_bonusdead);instance_create(x,y-32,o_uppercut);bonus=-1000}

    if bonus=4 {instance_create(x,y,o_bonusstar);instance_create(x,y-32,o_uppercut);bonus=-1000}

    if sekwencja<10 {draw_sprite_ext(s_pointblock2,stefan,x+16,y+16-sekwencja*2,1,1,0,c_white,1); sekwencja+=1; kierunek+=lewoprawo}
    if sekwencja>=10 && sekwencja<20 {draw_sprite_ext(s_pointblock2,stefan,x+16,y+16-40+sekwencja*2,1,1,0,c_white,1); sekwencja+=1; kierunek-=lewoprawo}
    if sekwencja=20 draw_sprite(s_pointblock2,stefan,x+16,y+16)
    }
stefan=pokazywator.wenhao

//bonus only

if bonus=101 {instance_create(x,y,o_newmush);instance_destroy()}
if bonus=102 {instance_create(x,y,o_bonusflower);instance_destroy()}
if bonus=103 {instance_create(x,y,o_bonusburak);instance_destroy()}
if bonus=104 {instance_create(x,y,o_bonuslui);instance_destroy()}
if bonus=105 {instance_create(x,y,o_bonusstar);instance_destroy()}
if bonus=106 {instance_create(x,y,o_new1up);instance_destroy()}
