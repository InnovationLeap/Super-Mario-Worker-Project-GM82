// player_jump.gml —— 跳跃输入/跳出水/浣熊起飞与飞行计时/落地检测/轻量重力（原 o_marker Step_0 第 464-511 行）
// 依赖实例变量：state, grav, hspd, water_jump_lock, swim_anim, jump_buffer, raccoon_fly_allowed,
//               raccoon_flew, raccoon_fly_timer, p_meter_run_timer, p_meter
if global.pauza=0 && shell_lock=0 && global.level_complete=0 && pipe_state=0 {

    // spadanie i skakanie

    if global.rodzajmaria<>3 && global.rodzajmaria<>5 {
        if is_button_pressed('jump') && state=0 && (y<global.water_level || global.lava) && schylanie=0 && slide=0 && !stuck
        {state=1; grav=-(8+abs(hspd)/5); if global.sample=1 {tmp2=sound_play(snd_jump);sound_volume(snd_jump,global.game_volume)}};}
    if global.rodzajmaria=3 && global.rodzajmaria<>5 {
        if is_button_pressed('jump') && state=0 && (y<global.water_level || global.lava) && schylanie=0 && slide=0 && !stuck
        {state=1; grav=-(9+abs(hspd)/5); if global.sample=1 {tmp2=sound_play(snd_jump);sound_volume(snd_jump,global.game_volume)}};}

    if is_button_pressed('jump') && y>=global.water_level && !global.lava && water_jump_lock=0 && y>global.water_level+32 && schylanie=0 && slide=0 && global.rodzajmaria<>5 && !stuck {if global.sample=1 {tmp2=sound_play(snd_swim);sound_volume(snd_swim,global.game_volume)};swim_anim=0; state=1; grav=-(4+abs(hspd)/10);  water_jump_lock=1};
    if !global.lava && is_button_pressed('jump') && y>=global.water_level && !global.lava && water_jump_lock=0 && y<=global.water_level+32 && schylanie=0 && slide=0 && global.rodzajmaria<>5 && !stuck {if global.sample=1 {tmp2=sound_play(snd_swim);sound_volume(snd_swim,global.game_volume)};state=1; grav=-(6+abs(hspd)/5); water_jump_lock=1};
    if !is_button_pressed('jump') {water_jump_lock=0}

    jump_buffer+=1
    if is_button_pressed('jump') && jump_buffer>1 && grav<0 && (y<global.water_level || global.lava) && global.rodzajmaria<>5 && !stuck {grav-=1.5; jump_buffer=0};

    // Raccoon flight takeoff (P-Meter full + press jump in air)
    // keyboard_check_pressed: must press jump fresh, not just hold it
    // Raccoon flight: takeoff (first press) and mid-air boost (subsequent presses)
    // Both give upward lift, but only first press starts the flight timer counting
    if global.rodzajmaria=6 && raccoon_fly_allowed=1 && grav>0 && keyboard_check_pressed(global.key_jump) && y<global.water_level && state=1 && schylanie=0 && !stuck {
        grav=-9
        hspd = max(-4, min(hspd, 4))
        if raccoon_flew=0 {
            raccoon_flew=1
            p_meter_run_timer=0
        }
        if global.sample=1 {tmp2=sound_play(snd_spin);sound_volume(snd_spin,global.game_volume)}
    }

    // Flight timer: prerequisite -- flight must be allowed (P-Meter full,
    // raccoon_fly_allowed=1), plus not hurt, above water, not on lava.
    // Then the timer counts if EITHER: x speed is below running speed
    // (abs(szybkosc) <= 6) OR the player is in the flew state (flew=1).
    // Running with a full P-Meter recharges it (see P-Meter logic below).
    // At 212 frames the flight state is force-cancelled (raccoon_flew=0,
    // P-Meter reset to 0).
    if raccoon_fly_allowed=1 && shell_lock=0 && global.rodzajmaria=6 && y<global.water_level && !place_meeting(x,y,o_lava) && (abs(hspd) <= 6 || raccoon_flew=1 || p_meter_run_timer > 0) {
        raccoon_fly_timer+=1
        if raccoon_fly_timer>raccoon_fly_time {
            raccoon_flew=0
            raccoon_fly_timer=0
            raccoon_fly_allowed=0
            p_meter=0
        }
    }

    if state=0 && global.rodzajmaria<>5 && !place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,o_pointblock) && !place_meeting(x,y+2,o_windas) {state=1}
    if global.modifiedmov=0 && state=1 && grav<0 && global.rodzajmaria<>5 {y+=grav+global.level_gravity/5; testujstepa=0}

}
