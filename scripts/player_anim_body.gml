// player_anim_body(in_water) —— 小/大/火/绿果/甜菜 水上(0)/水下(1) 通用动画段
// 原 player_anim.gml 各形态重复段合并。依赖：animator, dir, hspd, grav, state, image_index, swim_anim, schylanie, shoot_anim
var c_run, c_jump, c_swim, c_crouch, c_shoot;
var has_crouch, has_shoot, shoot_thresh, shoot_idle_cond, fx_first, in_water;
in_water = argument0;

// 形态 → 精灵映射（浣熊由 player_anim_raccoon 单独处理）
if global.rodzajmaria=0 {
    c_run=global.small_character_run; c_jump=global.small_character_jump; c_swim=global.small_character_swim
    c_crouch=0; c_shoot=0; has_crouch=0; has_shoot=0; shoot_thresh=3; shoot_idle_cond=0; fx_first=0
}
if global.rodzajmaria=1 {
    c_run=global.big_character_run; c_jump=global.big_character_jump; c_swim=global.big_character_swim
    c_crouch=global.big_character_crouch; c_shoot=0; has_crouch=1; has_shoot=0; shoot_thresh=3; shoot_idle_cond=0; fx_first=0
}
if global.rodzajmaria=2 {
    c_run=global.fire_character_run; c_jump=global.fire_character_jump; c_swim=global.fire_character_swim
    c_crouch=global.fire_character_crouch; c_shoot=global.fire_character_shoot; has_crouch=1; has_shoot=1; shoot_thresh=3; shoot_idle_cond=1; fx_first=0
}
if global.rodzajmaria=3 {
    c_run=global.lui_character_run; c_jump=global.lui_character_jump; c_swim=global.lui_character_swim
    c_crouch=global.lui_character_crouch; c_shoot=0; has_crouch=1; has_shoot=0; shoot_thresh=3; shoot_idle_cond=1; fx_first=0
}
if global.rodzajmaria=4 {
    c_run=global.beetroot_character_run; c_jump=global.beetroot_character_jump; c_swim=global.beetroot_character_swim
    c_crouch=global.beetroot_character_crouch; c_shoot=global.beetroot_character_shoot; has_crouch=1; has_shoot=1; shoot_thresh=3; shoot_idle_cond=1; fx_first=1
}

// 小形态特有：重置 o_marker 自身帧（原代码仅小形态段首有此语句）
if global.rodzajmaria=0 {image_index=0}

// 朝向
if hspd<0 {dir=1}
if hspd>0 {dir=0}

// 站立（水上火/绿果/甜菜射击动画进行中时不允许站姿；水下所有形态无此限制）
if hspd=0 && state=0 && dir=0 && (shoot_idle_cond=0 || in_water=1 || shoot_anim=0) {animator.sprite_index=c_run; animator.image_index=0; animator.image_xscale=1; animkind=0}
if hspd=0 && state=0 && dir=1 && (shoot_idle_cond=0 || in_water=1 || shoot_anim=0) {animator.sprite_index=c_run; animator.image_index=0; animator.image_xscale=-1; animkind=0}

// 行走（水上 /10，水下 /20）
if in_water=0 {
    if hspd>0 && dir=0 && state=0 && (shoot_idle_cond=0 || shoot_anim=0) {animator.sprite_index=c_run; animator.image_index+=hspd/10; animator.image_xscale=1; animkind=0}
    if hspd<0 && dir=1 && state=0 && (shoot_idle_cond=0 || shoot_anim=0) {animator.sprite_index=c_run; animator.image_index+=hspd/10; animator.image_xscale=-1; animkind=0}
} else {
    if hspd>0 && dir=0 && state=0 {animator.sprite_index=c_run; animator.image_index+=hspd/20; animator.image_xscale=1; animkind=0}
    if hspd<0 && dir=1 && state=0 {animator.sprite_index=c_run; animator.image_index+=hspd/20; animator.image_xscale=-1; animkind=0}
}

// 空中：水上 jump / 水下 swim
if in_water=0 {
    if dir=0 && grav<>0 {animator.sprite_index=c_jump; animator.image_xscale=1;animkind=1}
    if dir=1 && grav<>0 {animator.sprite_index=c_jump; animator.image_xscale=-1;animkind=1}
} else {
    if dir=0 && grav<>0 {animator.sprite_index=c_swim; animator.image_index=swim_anim; animator.image_xscale=1;animkind=2}
    if dir=1 && grav<>0 {animator.sprite_index=c_swim; animator.image_index=swim_anim; animator.image_xscale=-1;animkind=2}
    if swim_anim<9 {swim_anim+=0.2}
}

// 下蹲（小形态无）
if has_crouch=1 {
    if schylanie=1 && dir=0 {animator.sprite_index=c_crouch; animator.image_xscale=1;image_index=0;animkind=3}
    if schylanie=1 && dir=1 {animator.sprite_index=c_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
    if !schylanie=1 {image_index=1}
}

// 水下特效（甜菜 fx_first=1：特效在射击前；其余在射击后）
if in_water=1 && global.efekty>5 && fx_first=1 {
    tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale
}

// 射击（火/甜菜）或绿果强制归零
if has_shoot=1 {
    if schylanie=1 || state<>0 {shoot_anim=0}
    if dir=0 && shoot_anim>0 {animator.sprite_index=c_shoot; animator.image_xscale=1; shoot_anim+=1;animkind=0}
    if dir=1 && shoot_anim>0 {animator.sprite_index=c_shoot; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
    if shoot_anim>shoot_thresh {shoot_anim=0}
} else {
    if shoot_idle_cond=1 {shoot_anim=0}
}

// 水下特效（默认顺序：射击后）
if in_water=1 && global.efekty>5 && fx_first=0 {
    tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale
}
