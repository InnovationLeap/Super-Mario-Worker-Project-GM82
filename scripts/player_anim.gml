// player_anim.gml —— 小/大/火/绿果/甜菜/浣熊 六形态动画（原 o_marker Step_0 第 991-1306 行）
// 依赖：animator, animator2, dir, hspd, grav, state, image_index, swim_anim, schylanie,
//       shoot_anim, raccoon_fall, raccoon_fly_allowed
// 子脚本：player_anim_body（小/大/火/绿果/甜菜 水上/水下通用段）/ player_anim_raccoon（浣熊）
if global.pauza=0 && shell_lock=0 && global.level_complete=0 && pipe_state=0 {

    // 浣熊动画集特殊（idle/walk/run/jump/fall/fly），单独处理
    if global.rodzajmaria=6 {
        player_anim_raccoon()
    } else {
        // 普通形态（0-4，排除 5 特殊形态）：水上（或岩浆）段 + 水下段，共用 player_anim_body
        if global.rodzajmaria<5 {
            if y<global.water_level || global.lava {player_anim_body(0)}
            if y>=global.water_level && !global.lava {player_anim_body(1)}
        }
    }

} // koniec global.pauza
