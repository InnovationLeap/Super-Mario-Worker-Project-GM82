// player_bonus_score(bonus) —— 已是大形态再吃同类：+1000 分（scorepop3）后销毁奖励
var bonus;
bonus = argument0;
if global.sample=1 {tmp2=sound_play(snd_powerup);sound_volume(snd_powerup,global.game_volume)}
tmp=instance_create(bonus.x,bonus.y,o_scorepop3)
tmp.image_index=3
with(bonus) {instance_destroy()}
