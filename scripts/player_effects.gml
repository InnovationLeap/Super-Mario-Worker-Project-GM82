// player_effects.gml —— 光照跟随偏移（原 o_marker Step_0 第 1311-1331 行）
// 无守卫，每帧执行；仅修改 light_y
if
(
(
global.rodzajmaria = 0 || ( schylanie = 1 && global.rodzajmaria <> 5 )
)
||
(
global.rodzajmaria = 5 &&
(
animator.sprite_index = global.small_character_run ||
animator.sprite_index = global.small_character_jump ||
animator.sprite_index = global.small_character_swim
)
)
)
{
    light_y = -16;
} else {
    light_y = -28;
}
