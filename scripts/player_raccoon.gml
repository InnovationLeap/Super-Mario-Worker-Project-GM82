// player_raccoon.gml —— 浣熊 P-Meter 充能/飞行/缓降 + 状态清理（原 o_marker Step_0 第 514-617、817-830 行）
// 注意：第 817-830 行的清理逻辑不受 shell_lock/pauza 守卫限制，每帧执行
// var 声明按 GM8 约束集中在脚本顶部
var _on_ground, _at_edge, _against_wall, _nextx;
_on_ground = 0;
_at_edge = 0;
_against_wall = 0;
_nextx = 0;
if global.pauza=0 && shell_lock=0 && global.level_complete=0 && pipe_state=0 {

    // Raccoon Mario sync flag
    rodzajmaria_is_raccoon = (global.rodzajmaria = 6)

    // P-Meter logic (Raccoon Mario)
    if global.rodzajmaria = 6 && shell_lock = 0 {
        _on_ground = (state = 0 || place_meeting(x, y+2, o_windas))

        // Disallow flight if P-Meter is not full
        if raccoon_fly_allowed = 1 && p_meter < p_meter_max {
            raccoon_fly_allowed = 0
        }

        // P-Meter charging: running on ground, not in water, not against a wall, not at screen edge
        if abs(hspd) > 6 && !place_meeting(x,y,o_lava) && y < global.water_level && _on_ground {
            _at_edge = (x <= view_xview + 16 || x >= view_xview + 624)
            // Check if running into a solid wall (obj_wall covers obj_waall/obj_halfwall via parent inheritance)
            _nextx = x + sign(hspd) * 2
            _against_wall = (place_meeting(_nextx, y, obj_wall) || place_meeting(_nextx, y, o_pointblock))
            if !_at_edge && !_against_wall {
                p_meter = min(p_meter + 1, p_meter_max)
                if raccoon_fly_allowed = 0 {
                    p_meter_run_timer = min(p_meter_run_timer + 1, p_meter_run_time)
                }
            } else {
                // Running against wall or screen edge: decay like stopped
                if raccoon_fly_allowed = 0 {
                    p_meter = max(p_meter - 1, 0)
                    p_meter_run_timer = max(p_meter_run_timer - 1, 0)
                }
            }
        } else {
            p_meter_run_timer = max(p_meter_run_timer - 1, 0)
            if raccoon_fly_allowed = 0 {
                p_meter = max(p_meter - 1, 0)
            }
        }

        // In water: reset P-Meter
        if y >= global.water_level || place_meeting(x,y,o_lava) {
            p_meter = 0
            raccoon_fly_allowed = 0
        }

        // P-Meter full => allow flight
        if p_meter >= p_meter_max {
            raccoon_fly_allowed = 1
        }

        // Flight time extension: land while running with full P-Meter
        // P-Meter run timer fills up → reset flight timer, recharging full flight duration
        if raccoon_fly_allowed = 1 {
            if abs(hspd) > 6 && _on_ground {
                p_meter_run_timer = min(p_meter_run_timer + 1, p_meter_run_time)
                if p_meter_run_timer >= p_meter_run_time {
                    raccoon_fly_timer = 0
                }
            }
        }

        // P-Meter sound effect (loop while P-meter full / flight ready - SMWP2 behavior)
        if raccoon_fly_allowed = 1 {
            if p_meter_sfx_playing = 0 {
                p_meter_sfx_playing = 1
                if global.sample=1 {sound_loop(snd_pmeter); sound_volume(snd_pmeter, global.game_volume)}
            }
        } else {
            if p_meter_sfx_playing = 1 {
                p_meter_sfx_playing = 0
                if global.sample=1 {sound_stop(snd_pmeter)}
            }
        }
    }

    // Raccoon flight and fall logic
    if global.rodzajmaria = 6 && shell_lock = 0 {
        // Slow fall (raccoon parachute descent)
        // keyboard_check_pressed: must press jump fresh, not just hold it
        if grav > 0 && keyboard_check_pressed(global.key_jump) && !raccoon_fall && y < global.water_level && state = 1 && raccoon_fly_allowed = 0 {
            raccoon_fall = 1
            raccoon_fall_timer = 0
            hspd = max(-4, min(hspd, 4))
            if global.sample=1 {tmp2=sound_play(snd_spin);sound_volume(snd_spin,global.game_volume)}
        }

        if raccoon_fall = 1 {
            if grav > 0 && y < global.water_level {
                grav = min(grav, 2)
                raccoon_fall_timer += 1
                if raccoon_fall_timer > raccoon_fall_time || grav <= 0 {
                    raccoon_fall = 0
                    raccoon_fall_timer = 0
                }
            } else {
                raccoon_fall = 0
                raccoon_fall_timer = 0
            }
        }
        if !is_button_pressed('jump') || state = 0 {
            raccoon_fall = 0
            raccoon_fall_timer = 0
        }
    }
    // Bugort - tlumaczenie w Create Actions
    // who can tell me wtf is this

}

// Raccoon 状态清理：不受 shell_lock/pauza 守卫限制，每帧执行
// （死亡/受伤会置 shell_lock=1 或 pauza=2，守卫块被跳过，
//  若不在此处停掉 snd_pmeter，摔死/受伤后飞行音效会一直残留）
if global.rodzajmaria <> 6 {
    raccoon_fall = 0
    raccoon_fly_allowed = 0
    raccoon_flew = 0
    raccoon_fly_timer = 0
    p_meter = 0
    if p_meter_sfx_playing=1 {
        p_meter_sfx_playing=0
        if global.sample=1 {sound_stop(snd_pmeter)}
    }
}
