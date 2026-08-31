// player_anim_raccoon.gml —— 浣熊形态动画（原 player_anim.gml 第 254-321 行）
// 依赖：animator, dir, hspd, grav, state, image_index, swim_anim, schylanie, shoot_anim, raccoon_fall, raccoon_fly_allowed
if y<global.water_level || global.lava {

    if hspd<0 {dir=1}
    if hspd>0 {dir=0}

    if hspd=0 && state=0 && dir=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_idle; animator.image_index=0; animator.image_xscale=1;animkind=0}
    if hspd=0 && state=0 && dir=1 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_idle; animator.image_index=0; animator.image_xscale=-1;animkind=0}

    if hspd>0 && dir=0 && state=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_walk; animator.image_index+=hspd/10; animator.image_xscale=1;animkind=0}
    if hspd<0 && dir=1 && state=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_walk; animator.image_index+=hspd/10; animator.image_xscale=-1;animkind=0}

    // When P-Meter is full and running, use run animation
    if abs(hspd)>6 && raccoon_fly_allowed=1 && state=0 && shoot_anim=0 && dir=0 {animator.sprite_index=global.raccoon_character_run; animator.image_index+=hspd/10; animator.image_xscale=1;animkind=0}
    if abs(hspd)>6 && raccoon_fly_allowed=1 && state=0 && shoot_anim=0 && dir=1 {animator.sprite_index=global.raccoon_character_run; animator.image_index+=hspd/10; animator.image_xscale=-1;animkind=0}

    // Jump animation
    if dir=0 && grav<>0 && raccoon_fall=0 && raccoon_fly_allowed=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_jump; animator.image_xscale=1;animkind=1}
    if dir=1 && grav<>0 && raccoon_fall=0 && raccoon_fly_allowed=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_jump; animator.image_xscale=-1;animkind=1}

    // Fall / parachute animation
    if dir=0 && raccoon_fall=1 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_fall; animator.image_index+=0.2; animator.image_xscale=1;animkind=1}
    if dir=1 && raccoon_fall=1 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_fall; animator.image_index+=0.2; animator.image_xscale=-1;animkind=1}

    // Fly animation (ascending or descending, matches SMWP2 behavior)
    if dir=0 && raccoon_fly_allowed=1 && grav<>0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_fly; animator.image_index+=0.25; animator.image_xscale=1;animkind=1}
    if dir=1 && raccoon_fly_allowed=1 && grav<>0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_fly; animator.image_index+=0.25; animator.image_xscale=-1;animkind=1}

    // Crouch
    if schylanie=1 && dir=0 {animator.sprite_index=global.raccoon_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
    if schylanie=1 && dir=1 {animator.sprite_index=global.raccoon_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
    if !schylanie=1 {image_index=1}

    // Shooting (tail whip) animation — high priority, works in air and on ground
    if schylanie=1 {shoot_anim=0}
    if dir=0 && shoot_anim>0 {animator.sprite_index=global.raccoon_character_shoot; animator.image_index+=0.5; animator.image_xscale=1; shoot_anim+=1;animkind=0}
    if dir=1 && shoot_anim>0 {animator.sprite_index=global.raccoon_character_shoot; animator.image_index+=0.5; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
    if shoot_anim>8 {shoot_anim=0; animator.image_index=0}
}

if y>=global.water_level && !global.lava {

    if hspd<0 {dir=1}
    if hspd>0 {dir=0}

    if hspd=0 && state=0 && dir=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_idle; animator.image_index=0; animator.image_xscale=1;animkind=0}
    if hspd=0 && state=0 && dir=1 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_idle; animator.image_index=0; animator.image_xscale=-1;animkind=0}

    if hspd>0 && dir=0 && state=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_walk; animator.image_index+=hspd/20; animator.image_xscale=1;animkind=0}
    if hspd<0 && dir=1 && state=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_walk; animator.image_index+=hspd/20; animator.image_xscale=-1;animkind=0}

    if dir=0 && grav<>0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_swim; animator.image_index=swim_anim; animator.image_xscale=1;animkind=2}
    if dir=1 && grav<>0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_swim; animator.image_index=swim_anim; animator.image_xscale=-1;animkind=2}
    if swim_anim<9 {swim_anim+=0.2}

    if schylanie=1 && dir=0 {animator.sprite_index=global.raccoon_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
    if schylanie=1 && dir=1 {animator.sprite_index=global.raccoon_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
    if !schylanie=1 {image_index=1}

    // Shooting (tail whip) animation — high priority, works in water too
    if schylanie=1 {shoot_anim=0}
    if dir=0 && shoot_anim>0 {animator.sprite_index=global.raccoon_character_shoot; animator.image_index+=0.5; animator.image_xscale=1; shoot_anim+=1;animkind=0}
    if dir=1 && shoot_anim>0 {animator.sprite_index=global.raccoon_character_shoot; animator.image_index+=0.5; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
    if shoot_anim>8 {shoot_anim=0; animator.image_index=0}

    if global.efekty>5 {tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale}

}
