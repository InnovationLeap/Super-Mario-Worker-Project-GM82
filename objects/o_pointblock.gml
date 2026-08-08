#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bumped=0
state=0
sound_played=0
block_frame=0
bounce_dir=random(5)-random(5)
dir=0


deny_anim=0
deny_phase=0

spawn_delay=0

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
    if bonus = 20 { spawn_delay = 10; }   // 可碎普通砖块
    if bonus <> 20 { bumped = 1; }     // 问号
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


if bonus=20 && bumped=0 {draw_sprite_ext(s_pointblock3,block_frame,x,y,1,1,0,c_white,1)}
if bonus=20 && bumped=1 && global.rodzajmaria=0 && shaben=0 {spawn_delay=2;instance_create(x,y-32,o_uppercut)}
if bonus=20 && bumped=1 && global.rodzajmaria>0 && shaben=0 {spawn_delay=10;instance_create(x,y-32,o_uppercut)}


if spawn_delay=2 {
    if global.sample=1 && sound_played=0 {tmp2=sound_play(snd_burb);sound_volume(snd_burb,global.game_volume);sound_played=1}
    draw_sprite_ext(s_pointblock3,0,x,y-deny_anim,1,1,0,c_white,1)
    if deny_phase=0 && deny_anim<10 {deny_anim+=1}
    if deny_phase=0 && deny_anim>=10 {deny_phase=1}
    if deny_phase=1 && deny_anim>0 {deny_anim-=1}
    if deny_phase=1 && deny_anim<=0 {deny_phase=0; bumped=0;sound_played=0;spawn_delay=0;}
}


if spawn_delay=10 {
    if global.sample=1 && sound_played=0 {tmp2=sound_play(snd_break);sound_volume(snd_break,global.game_volume);sound_played=1}
    instance_destroy()
    tmp=instance_create(x+8,y+8,o_breakblock)
    tmp.ixor=-3
    tmp.vy_offset=-6
    tmp.image_xscale=0.5
    tmp.image_yscale=0.5
    tmp=instance_create(x+8+16,y+8,o_breakblock)
    tmp.ixor=3
    tmp.vy_offset=-6
    tmp.image_xscale=0.5
    tmp.image_yscale=0.5
    tmp=instance_create(x+8+16,y+8+16,o_breakblock)
    tmp.ixor=-2
    tmp.vy_offset=-4
    tmp.image_xscale=0.5
    tmp.image_yscale=0.5
    tmp=instance_create(x+8,y+8+16,o_breakblock)
    tmp.ixor=2
    tmp.vy_offset=-4
    tmp.image_xscale=0.5
    tmp.image_yscale=0.5
}



if bumped=0 && bonus<>20 && bonus<100 {draw_sprite(s_pointblock,block_frame,x,y)}
if bumped=1 && bonus<>20 && bonus<100 {
    if global.sample=1 && sound_played=0 && bonus=0 {tmp2=sound_play(snd_coin);sound_volume(snd_coin,global.game_volume);sound_played=1}
    if global.sample=1 && sound_played=0 && bonus>0 && bonus<100 {tmp2=sound_play(snd_vine);sound_volume(snd_vine,global.game_volume);sound_played=1}
    if bonus=0 {instance_create(x,y,o_coineffect);global.coins+=1;instance_create(x,y-32,o_uppercut);bonus=-1000}

    if bonus=1 && global.rodzajmaria<>0 {instance_create(x,y,o_bonusflower);instance_create(x,y-32,o_uppercut);bonus=-1000}
    if bonus=1 && global.rodzajmaria=0 {instance_create(x,y,o_bonusmush);instance_create(x,y-32,o_uppercut);bonus=-1000}

    if bonus=2 && global.rodzajmaria<>0 {instance_create(x,y,o_bonusbeetroot);instance_create(x,y-32,o_uppercut);bonus=-1000}
    if bonus=2 && global.rodzajmaria=0 {instance_create(x,y,o_bonusmush);instance_create(x,y-32,o_uppercut);bonus=-1000}

    if bonus=3 && global.rodzajmaria<>0 {instance_create(x,y,o_bonuslui);instance_create(x,y-32,o_uppercut);bonus=-1000}
    if bonus=3 && global.rodzajmaria=0 {instance_create(x,y,o_bonusmush);instance_create(x,y-32,o_uppercut);bonus=-1000}

    if bonus=5 {instance_create(x,y,o_bonus1up);instance_create(x,y-32,o_uppercut);bonus=-1000}

    if bonus=6 {instance_create(x,y,o_bonusdead);instance_create(x,y-32,o_uppercut);bonus=-1000}

    if bonus=4 {instance_create(x,y,o_bonusstar);instance_create(x,y-32,o_uppercut);bonus=-1000}

    if bonus=7 && global.rodzajmaria<>0 {instance_create(x+16,y,o_bonusraccoon);instance_create(x,y-32,o_uppercut);bonus=-1000}
    if bonus=7 && global.rodzajmaria=0 {instance_create(x,y,o_bonusmush);instance_create(x,y-32,o_uppercut);bonus=-1000}

    if bonus=8 && global.rodzajmaria<>0 {instance_create(x+16,y,o_bonusraccoon);instance_create(x,y-32,o_uppercut);bonus=-1000}
    if bonus=8 && global.rodzajmaria=0 {instance_create(x,y,o_bonusmush);instance_create(x,y-32,o_uppercut);bonus=-1000}

    if state<10 {draw_sprite_ext(s_pointblock2,block_frame,x+16,y+16-state*2,1,1,0,c_white,1); state+=1; dir+=bounce_dir}
    if state>=10 && state<20 {draw_sprite_ext(s_pointblock2,block_frame,x+16,y+16-40+state*2,1,1,0,c_white,1); state+=1; dir-=bounce_dir}
    if state=20 draw_sprite(s_pointblock2,block_frame,x+16,y+16)
}
block_frame=o_preview.qblock_preview

//bonus only

if bonus=101 {instance_create(x,y,o_newmush);instance_destroy()}
if bonus=102 {instance_create(x,y,o_bonusflower);instance_destroy()}
if bonus=103 {instance_create(x,y,o_bonusbeetroot);instance_destroy()}
if bonus=104 {instance_create(x,y,o_bonuslui);instance_destroy()}
if bonus=105 {instance_create(x,y,o_bonusstar);instance_destroy()}
if bonus=106 {instance_create(x,y,o_new1up);instance_destroy()}
if bonus=107 {instance_create(x+16,y+16,o_bonusraccoon);instance_destroy()}
