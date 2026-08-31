// player_transform(bonus, new_form, run_sprite, jump_sprite, swim_sprite) —— 转形态：改 rodzajmaria + pauza + 声音 + 动画切换
var bonus;
bonus = argument0;
with(bonus) {instance_destroy()}
global.rodzajmaria = argument1
global.pauza=1
if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}
if animkind=0 {animator.sprite_index=argument2}
if animkind=1 {animator.sprite_index=argument3}
if animkind=2 {animator.sprite_index=argument4}
