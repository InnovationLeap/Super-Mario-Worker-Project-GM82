// player_grow_big(bonus) —— 小形态吃大蘑菇/火力花/绿果/甜菜/浣熊叶：变大 + 滑蹲判定 + pauza + 大形态动画
var bonus;
bonus = argument0;
with(bonus) {instance_destroy()}
global.rodzajmaria = 1
if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { slide = 1 }
if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { slide = 2 }
global.pauza=1
if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}
if animkind=0 {animator.sprite_index=global.big_character_run}
if animkind=1 {animator.sprite_index=global.big_character_jump}
if animkind=2 {animator.sprite_index=global.big_character_swim}
