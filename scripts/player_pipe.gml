// player_pipe.gml —— 管道进出检测与移动（原 o_marker Step_0 第 248-299 行）
// 依赖实例变量：tele, pipe_state, pipe_delay, hspd, state, prev_x, prev_dx
// 依赖脚本：test_bound()
if global.pauza=0 && shell_lock=0 && global.level_complete=0 {

    if !place_meeting(x,y,o_yinyang) {stuck=0}
    //global.roznica=x-20
    //x-=global.roznica
    // SKRUTY
    if place_meeting(x,y,o_exiter) && global.rodzajmaria<>5 {
        tele=instance_place(x,y,o_exiter)
        //right
        if tele.wejscie=0 && is_button_pressed('right') && x>tele.x+48 && pipe_state=0 && real_time<>0 {pipe_state=1; hspd=0; state=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)} }
        //left
        if tele.wejscie=2 && is_button_pressed('left') && x<tele.x+16 && pipe_state=0 && real_time<>0 {pipe_state=3; hspd=0; state=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)} }
        //up
        if global.rodzajmaria=0 {
            if tele.wejscie=1 && is_button_pressed('up') && y<tele.y+32 && pipe_state=0 && real_time<>0 {pipe_state=4; hspd=0; state=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)} }
        }
        if global.rodzajmaria<>0 {
            if tele.wejscie=1 && is_button_pressed('up') && y<tele.y+64 && pipe_state=0 && real_time<>0 {pipe_state=4; hspd=0; state=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)} }
        }
        //down
        if tele.wejscie=3 && is_button_pressed('down') && y>tele.y+16 && pipe_state=0 && real_time<>0 {pipe_state=5; hspd=0; state=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)} }
    }

    if pipe_state<>0 {

        if pipe_state=1 && pipe_delay<32 {pipe_delay+=0.7; x+=0.7;y=tele.y+64}
        if pipe_state=3 && pipe_delay<32 {pipe_delay+=0.7; x-=0.7;y=tele.y+64}
        if pipe_state=4 && pipe_delay<32 {pipe_delay+=0.7; y-=0.7;x=tele.x+32}
        if pipe_state=5 && pipe_delay<32 {pipe_delay+=0.7; y+=0.7;x=tele.x+32}

        if pipe_delay>=32 && tele.wyjscie=0 {pipe_state=2;test_bound(tele.exitx+64,tele.exity+64); x=tele.exitx+32/* */+16*(global.gameversion>1709); y=tele.exity+64;pipe_delay=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)}}
        if pipe_state=2 && place_meeting(x,y,obj_wall) {x+=0.7;o_marker.dir=0}
        if pipe_state=2 && !place_meeting(x,y,obj_wall) {pipe_delay=0; pipe_state=0; if(!global.pipeout)shield=100; state=0; grav=0}

        if pipe_delay>=32 && tele.wyjscie=1 {pipe_state=20;test_bound(tele.exitx+32,tele.exity);  x=tele.exitx+32; y=tele.exity+32;pipe_delay=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)}}
        if pipe_state=20 && place_meeting(x,y,obj_wall) {y-=0.7}
        if pipe_state=20 && !place_meeting(x,y,obj_wall) {pipe_delay=0; pipe_state=0; if(!global.pipeout)shield=100; state=0; grav=0}

        if pipe_delay>=32 && tele.wyjscie=2 {pipe_state=30;test_bound(tele.exitx-1,tele.exity+64);  x=tele.exitx/* */+16*(global.gameversion>1709); y=tele.exity+64;pipe_delay=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)}}
        if pipe_state=30 && place_meeting(x,y,obj_wall) {x-=0.7;o_marker.dir=1}
        if pipe_state=30 && !place_meeting(x,y,obj_wall) {pipe_delay=0; pipe_state=0; if(!global.pipeout)shield=100; state=0; grav=0}

        if pipe_delay>=32 && tele.wyjscie=3 {pipe_state=40;test_bound(tele.exitx+32,tele.exity+65);  x=tele.exitx+32; y=tele.exity+64;pipe_delay=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)}}
        if pipe_state=40 && place_meeting(x,y,obj_wall) {y+=0.7}
        if pipe_state=40 && !place_meeting(x,y,obj_wall) {if animator.sprite_index=s_bigmariocrouch {y=y+32} pipe_delay=0; pipe_state=0; if(!global.pipeout)shield=100; state=0; grav=0}
    }

    //exitx=110 //- pozycja x exita
    //exity=110 //- pozycja y exita
    //wejscie=0 //- k箃 pod jakim sie wchodzi
    //wyjscie=0 //- k箃 pod jakim si?wychodzi
    //
    if prev_x<>x {prev_dx=prev_x-x; prev_x=x}

}
