// player_skin.gml —— 皮肤精灵表定义 + god 模式形态切换（原 o_marker Step_0 第 836-989 行）
// 依赖：global.skin, global.godmode, global.rodzajmaria, form_backup, star_timer, shield
// 子脚本：player_god_slide（godmode 切形态前的滑蹲判定）
if global.pauza=0 && shell_lock=0 && global.level_complete=0 && pipe_state=0 {

    // 强制使用默认皮肤（马里奥）；skin=1 分支为预留的 Luigi 皮肤
    global.skin = 0

    //马里奥皮肤
    if global.skin = 0 {
        global.character_name = 'MARIO '

        global.character_dead = s_mariodead

        global.small_character_run = s_smallmariorun
        global.small_character_jump = s_smallmariojump
        global.small_character_swim = s_smallmarioswim

        global.big_character_run = s_bigmariorun
        global.big_character_jump = s_bigmariojump
        global.big_character_swim = s_bigmarioswim
        global.big_character_crouch = s_bigmariocrouch

        global.fire_character_run = s_firemariorun
        global.fire_character_jump = s_firemariojump
        global.fire_character_swim = s_firemarioswim
        global.fire_character_crouch = s_firemariocrouch
        global.fire_character_shoot = s_firemarioshot

        global.lui_character_run = s_luimariorun
        global.lui_character_jump = s_luimariojump
        global.lui_character_swim = s_luimarioswim
        global.lui_character_crouch = s_luimariocrouch

        global.beetroot_character_run = s_beetrootmariorun
        global.beetroot_character_jump = s_beetrootmariojump
        global.beetroot_character_swim = s_beetrootmarioswim
        global.beetroot_character_crouch = s_beetrootmariocrouch
        global.beetroot_character_shoot = s_beetrootmarioshot

        global.raccoon_character_idle = s_raccoonmarioidle
        global.raccoon_character_run = s_raccoonmariorun
        global.raccoon_character_jump = s_raccoonmariojump
        global.raccoon_character_crouch = s_raccoonmariocrouch
        global.raccoon_character_shoot = s_raccoonmarioshoot
        global.raccoon_character_swim = s_raccoonmarioswim
        global.raccoon_character_walk = s_raccoonmariowalk
        global.raccoon_character_fall = s_raccoonmariofall
        global.raccoon_character_fly = s_raccoonmariofly
    }

    //WEEGEE皮肤
    if global.skin = 1 {
        global.character_name = 'LUIGI '

        global.character_dead = s_luigidead

        global.small_character_run = s_smallluigirun
        global.small_character_jump = s_smallluigijump
        global.small_character_swim = s_smallluigiswim

        global.big_character_run = s_bigluigirun
        global.big_character_jump = s_bigluigijump
        global.big_character_swim = s_bigluigiswim
        global.big_character_crouch = s_bigluigicrouch

        global.fire_character_run = s_fireluigirun
        global.fire_character_jump = s_fireluigijump
        global.fire_character_swim = s_fireluigiswim
        global.fire_character_crouch = s_fireluigicrouch
        global.fire_character_shoot = s_fireluigishot

        global.lui_character_run = s_luiluigirun
        global.lui_character_jump = s_luiluigijump
        global.lui_character_swim = s_luiluigiswim
        global.lui_character_crouch = s_luiluigicrouch

        global.beetroot_character_run = s_beetrootluigirun
        global.beetroot_character_jump = s_beetrootluigijump
        global.beetroot_character_swim = s_beetrootluigiswim
        global.beetroot_character_crouch = s_beetrootluigicrouch
        global.beetroot_character_shoot = s_beetrootluigishot

        // Luigi uses same raccoon sprites as Mario for now (no Luigi raccoon skin yet)
        global.raccoon_character_idle = s_raccoonmarioidle
        global.raccoon_character_run = s_raccoonmariorun
        global.raccoon_character_jump = s_raccoonmariojump
        global.raccoon_character_crouch = s_raccoonmariocrouch
        global.raccoon_character_shoot = s_raccoonmarioshoot
        global.raccoon_character_swim = s_raccoonmarioswim
        global.raccoon_character_walk = s_raccoonmariowalk
        global.raccoon_character_fall = s_raccoonmariofall
        global.raccoon_character_fly = s_raccoonmariofly
    }


    //下面是与马里奥状态相关的代码
    //godmode
    if global.rodzajmaria<>5 && form_backup<>global.rodzajmaria {form_backup=global.rodzajmaria}
    if global.godmode=1 {
        if keyboard_check(global.godkey_small) {global.rodzajmaria=0;star_timer=0;shield=0} //小个子
        if keyboard_check(global.godkey_big) {player_god_slide();global.rodzajmaria=1;star_timer=0;shield=0} //大个子
        if keyboard_check(global.godkey_fire) {player_god_slide();global.rodzajmaria=2;star_timer=0;shield=0} //花身
        if keyboard_check(global.godkey_fruit) {player_god_slide();global.rodzajmaria=4;star_timer=0;shield=0} //绿果（为啥甜菜在绿果后面……）
        if keyboard_check(global.godkey_beet) {player_god_slide();global.rodzajmaria=3;star_timer=0;shield=0} //甜菜
        if keyboard_check(global.godkey_raccoon) {player_god_slide();global.rodzajmaria=6;star_timer=0;shield=0}
        if keyboard_check(global.godkey_star) {global.rodzajmaria=form_backup;star_timer=500;animator2.visible=1}
        if keyboard_check(global.godkey_invincible) {global.rodzajmaria=form_backup;shield=10000000;star_timer=0;animator2.visible=1}
        if keyboard_check_pressed(global.godkey_fly) {if global.rodzajmaria<>5 {global.rodzajmaria=5} else {global.rodzajmaria=form_backup}}
        if keyboard_check_pressed(global.godkey_life) {
            if global.zycia < 99 {
                fifi=instance_create(x,y-32,o_scorepop3)
                fifi.image_index=6
                if global.sample=1 {
                    tmp2=sound_play(snd_1up);
                    sound_volume(snd_1up,global.game_volume)
                }
                //lobal.zycia+=1
            }}
        if keyboard_check_pressed(global.godkey_scroll) { global.scrollPaused *= -1 } //按0切换滚屏开关
        if global.scrollPaused = 1 && keyboard_check_pressed(global.godkey_bowser) {global.bowser_phase=0}
    }

}
