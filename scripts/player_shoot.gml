// player_shoot.gml —— 火球/甜菜发射 + 浣熊尾巴攻击（原 o_marker Step_0 第 1602-1643 行）
// 依赖实例变量：shoot_anim, shoot_anim2, dir, pipe_state
if global.pauza=0 && global.rodzajmaria=2 && shell_lock=0 && global.level_complete=0 && pipe_state=0 {
    if instance_number(o_fireball)<2 {
        if dir=1 && keyboard_check(global.key_fire) && shoot_anim2=0 {shoot_anim2=1; tmp=instance_create(x-10,y-40,o_fireball); tmp.dir=-1; shoot_anim=1;if global.sample=1 {tmp2=sound_play(snd_fire);sound_volume(snd_fire,global.game_volume)}}
        if dir=0 && keyboard_check(global.key_fire) && shoot_anim2=0 {shoot_anim2=1; tmp=instance_create(x+10,y-40,o_fireball); tmp.dir=1; shoot_anim=1;if global.sample=1 {tmp2=sound_play(snd_fire);sound_volume(snd_fire,global.game_volume)}}
    }
    if !keyboard_check(global.key_fire) {shoot_anim2=0}

}

if global.pauza=0 && global.rodzajmaria=4 && shell_lock=0 && pipe_state=0 {
    if instance_number(o_beetroot)<2 {
        if dir=1 && keyboard_check(global.key_fire) && shoot_anim2=0 {shoot_anim2=1; tmp=instance_create(x-10,y-48,o_beetroot); tmp.dir=-1; shoot_anim=1;if global.sample=1 {tmp2=sound_play(snd_fire);sound_volume(snd_fire,global.game_volume)}}
        if dir=0 && keyboard_check(global.key_fire) && shoot_anim2=0 {shoot_anim2=1; tmp=instance_create(x+10-30*global.MFbeet,y-48,o_beetroot); tmp.dir=1; shoot_anim=1;if global.sample=1 {tmp2=sound_play(snd_fire);sound_volume(snd_fire,global.game_volume)}}
    }
    if !keyboard_check(global.key_fire) {shoot_anim2=0}

}

// Raccoon tail attack
if global.pauza=0 && global.rodzajmaria=6 && shell_lock=0 && global.level_complete=0 && pipe_state=0 && schylanie=0 {
    if !instance_exists(o_raccoon_tail) {
        if dir=1 && keyboard_check(global.key_fire) && shoot_anim2=0 {
            shoot_anim2=1;
            tmp=instance_create(x,y-11,o_raccoon_tail);
            tmp.dir=1;
            tmp.timer=0;
            shoot_anim=1;
            animator.image_index=0;
            if global.sample=1 {tmp2=sound_play(snd_spin);sound_volume(snd_spin,global.game_volume)}
        }
        if dir=0 && keyboard_check(global.key_fire) && shoot_anim2=0 {
            shoot_anim2=1;
            tmp=instance_create(x,y-11,o_raccoon_tail);
            tmp.dir=0;
            tmp.timer=0;
            shoot_anim=1;
            animator.image_index=0;
            if global.sample=1 {tmp2=sound_play(snd_spin);sound_volume(snd_spin,global.game_volume)}
        }
    }
    if !keyboard_check(global.key_fire) {shoot_anim2=0}
}
