// player_combat.gml —— combo 重置 + 浣熊尾巴命中 + 踩踏/龟壳/库巴/受伤判定（原 o_marker Step_0 第 1347-1590 行）
// 依赖脚本：raccoon_tail_hit_check()
// 依赖实例变量：global.combo1, global.combo1reset, star_timer, hit_timer, shield, shell_lock
// var 声明按 GM8 约束集中在脚本顶部
var _tdir, _tsweepX, _ttimer, _ttailX, _ttailY, _tcheckY, _canKick, _stopAbove, _hurtSide;
_tdir = 1;
_tsweepX = 0;
_ttimer = 0;
_ttailX = 0;
_ttailY = 0;
_tcheckY = 0;
_canKick = 1;
_stopAbove = 0;
_hurtSide = 0;

// algorytm ktory resetuje nabijanie combo za zabijanie przeciwnikow, dla rozdeptywania bez dotykania ziemii i zabijania
// muszla.

if global.pauza=0 && shell_lock=0 && global.level_complete=0 {

    if global.combo1>0 {global.combo1reset+=1}
    if global.combo1reset>200 {global.combo1=0;global.combo1reset=0}

}

if global.pauza=0 && shell_lock=0 && global.level_complete=0 && pipe_state=0 {
    // rozdeptywanie wrogow

    // Raccoon tail hit check runs first: mark enemies before stomp so tail takes priority
    // Must calculate tail position from CURRENT frame player data (not stale tail.x/y)
    // because o_raccoon_tail Step runs AFTER o_marker Step, leaving position 1 frame behind
    if instance_exists(o_raccoon_tail) {
        _tdir = 1
        if o_raccoon_tail.dir = 1 { _tdir = -1 }

        _ttimer = o_raccoon_tail.timer
        if _ttimer <= 2 { _tsweepX = 0 } else {
            if _ttimer <= 4 { _tsweepX = (_ttimer - 2) / 2 * 20 * _tdir } else {
                if _ttimer <= 7 { _tsweepX = (20 - (_ttimer - 4) / 3 * 40) * _tdir } else { _tsweepX = (-20 + (_ttimer - 7) / 5 * 20) * _tdir }
            }
        }

        // Tail X: player center + sweep (SMWP2: tail.Position = Vector2.Zero)
        _ttailX = x + _tsweepX
        // Tail Y: align tail bbox_bottom (origin_y=12+11=23) with player bbox_bottom (origin_y=65)
        _ttailY = y - 11

        // Falling offset (SMWP2: offset down by fall speed in open air)
        if grav > 0 {
            _tcheckY = y + grav + 1
            if !place_meeting(x, _tcheckY, obj_wall) && !place_meeting(x, _tcheckY, o_pointblock) && !place_meeting(x, _tcheckY, o_windas) {
                _ttailY = y - 11 + grav
            }
        }

        // Apply calculated position so raccoon_tail_hit_check sees correct self.x/self.y
        o_raccoon_tail.x = _ttailX
        o_raccoon_tail.y = _ttailY

        with(o_raccoon_tail) {
            raccoon_tail_hit_check()
        }
    }

    if global.rodzajmaria<>5 {

        //gwiazdka记录是否为无敌星状态
        if star_timer<=0 {
            //踩或撞普通可踩敌人
            if place_meeting(x,y+max(0,grav+global.level_gravity/5),o_goomba) && !place_meeting(x,y+max(0,grav+global.level_gravity/5),o_troopashell2)  && !place_meeting(x,y+max(0,grav+global.level_gravity/5),o_troopashell) && !place_meeting(x,y+max(0,grav+global.level_gravity/5),o_bowser) /* && muszlowanie>10 */
            {
                tmp=instance_place(x,y+max(0,grav+global.level_gravity/5),o_goomba)
                if tmp.killer=0 && tmp.license <> 1 && tmp.hurt_delay=0 {
                    if tmp.kill_type=0 && grav>0 && y<tmp.y {
                        //lolo.energia-=233333333333333333333; 恶劣变量
                        tmp.kill_type=1;//这里是记录是普通的踩还是无敌星，估计主要是为了计分之类
                        state=1;
                        grav=-8-tmp.knockback
                        if raccoon_flew=1 {raccoon_fly_timer=0}
                        global.combo1+=1
                        global.combo1reset=0
                        //muszlowanie=0
                        if global.sample=1 {tmp2=sound_play(snd_stomp);sound_volume(snd_stomp,global.game_volume)} //sampel
                        if tmp.object_index=o_bowser && dir=0 {hspd+=6}
                        if tmp.object_index=o_bowser && dir=1 {hspd-=6}
                    }
                }
                if tmp.hurt_delay=0 && tmp.killer=0 && hit_timer=0 && y>=tmp.y && shield=0 && tmp.license <> 1 {hit_timer=1}
            }

            //踩或撞炮弹
            if place_meeting(x,y,o_goomba) && !place_meeting(x,y,o_troopashell2) && !place_meeting(x,y,o_bowser) /* && muszlowanie>10 */
            {
                tmp=instance_place(x,y,o_goomba)
                if tmp.killer=0 && tmp.license = 1 {
                    if tmp.kill_type=0 && grav>0 && y<tmp.y {
                        // lolo.energia-=233333333333333333333;
                        tmp.kill_type=1;
                        state=1;
                        grav=-8-tmp.knockback
                        if raccoon_flew=1 {raccoon_fly_timer=0}
                        global.combo1+=1
                        global.combo1reset=0
                        //muszlowanie=0
                        if global.sample=1 {tmp2=sound_play(snd_stomp);sound_volume(snd_stomp,global.game_volume)} //sampel
                        if tmp.object_index=o_bowser && dir=0 {hspd+=6}
                        if tmp.object_index=o_bowser && dir=1 {hspd-=6}
                    } }
                if tmp.killer=0 && hit_timer=0 && y>=tmp.y && shield=0 && tmp.license = 1 {hit_timer=1}
            }

            //踩或撞到危险敌人
            if place_meeting(x,y,o_goomba) && !place_meeting(x,y,o_troopashell2) && !place_meeting(x,y,o_bowser) /* && muszlowanie>10 */
            {
                tmp=instance_place(x,y,o_goomba)
                if tmp.killer=1 && hit_timer=0 && shield=0 {hit_timer=1}//killer=1就是不能踩（刺猬）
            }

            //踢静止龟壳
            if place_meeting(x,y+max(0,grav+global.level_gravity/5),o_troopashell2) /* && muszlowanie>10*/ && shell_lock=0//这个是静止龟壳
            {
                tmp=instance_place(x,y+max(0,grav+global.level_gravity/5),o_troopashell2)
                if tmp.hurt_delay=0 && tmp.kill_type=0 {
                    // spiny shell: kick only on the safe (non-spike) side
                    _canKick = 1;
                    if tmp.shell_kind=4 {
                        if tmp.is_flipped=0 {
                            // spikes on top: player above (y < shell.y) → hurt
                            if y < tmp.y { _canKick = 0; }
                        } else {
                            // spikes on bottom: hurt only when truly below (feet y-1 below shell bottom shell.y+13; same ground = kickable)
                            if y > tmp.y + 14 { _canKick = 0; }
                        }
                        if _canKick=0 && hit_timer=0 && shield=0 { hit_timer=1 }
                    }
                    if _canKick=1 {
                        if x<tmp.x {tmp.dir=1;tmp.kill_type=1}
                        if x>=tmp.x {tmp.dir=-1;tmp.kill_type=1}//这里实现的是踢龟壳（所以为什么要以踩为判定基础……）
                        if state=1 {grav=-8; if raccoon_flew=1 {raccoon_fly_timer=0}}
                        if global.sample=1 {tmp2=sound_play(snd_stomp);sound_volume(snd_stomp,global.game_volume)} //sampel
                    }
                }
            }

            //踩停运动龟壳
            if place_meeting(x,y+max(0,grav+global.level_gravity/5),o_troopashell) {
                tmp=instance_place(x,y+max(0,grav+global.level_gravity/5),o_troopashell)
                // spiny shell (czerwona=4): 移动刺壳 - 碰到即受伤，不可踩停
                _stopAbove = (y<tmp.y);   // normal: above = safe stop
                _hurtSide = (y>=tmp.y);   // normal: below/side = hurt
                if tmp.shell_kind=4 {
                    if tmp.is_flipped=0 {
                        // 刺向上：移动刺壳不可踩停，接触即受伤
                        _stopAbove = 0;
                        _hurtSide = 1;
                    }
                    // is_flipped=1: 倒立刺壳，和普通龟壳无异（保持默认）
                }
                if tmp.kill_type=0 && grav>0 && _stopAbove && tmp.hurt_delay=0 {
                    tmp.kill_type=1;
                    state=1;
                    grav=-8-tmp.knockback
                    if raccoon_flew=1 {raccoon_fly_timer=0}
                    global.combo1+=1
                    global.combo1reset=0
                    if global.sample=1 {tmp2=sound_play(snd_stomp);sound_volume(snd_stomp,global.game_volume)}
                }
                if tmp.hurt_delay=0 && hit_timer=0 && _hurtSide && shield=0 {hit_timer=1}
            }
        }



        else {

            if place_meeting(x,y+max(0,grav+global.level_gravity/5),o_goomba) && !place_meeting(x,y+max(0,grav+global.level_gravity/5),o_bowser) {
                tmp=instance_place(x,y+max(0,grav+global.level_gravity/5),o_goomba)
                if tmp.stomp_proof=0 && tmp.killer=0 && tmp.license <> 1 {
                    if tmp.kill_type=0 && grav>0 && y<tmp.y {
                        // lolo.energia-=233333333333333333333333333333
                        tmp.kill_type=2//这个是无敌星
                        nabijanie+=1
                        tmp2=instance_create(x,y,o_scorepop2)
                        tmp2.image_index=nabijanie-1
                        if nabijanie>6 {nabijanie=0}
                        state=1;
                        grav=-8-tmp.knockback
                        if raccoon_flew=1 {raccoon_fly_timer=0}
                        global.combo1+=1
                        global.combo1reset=0
                        if global.sample=1 {tmp2=sound_play(snd_stomp);sound_volume(snd_stomp,global.game_volume)} //sampel
                    } }
            }

            if place_meeting(x,y,o_goomba) && !place_meeting(x,y,o_bowser) {
                tmp=instance_place(x,y,o_goomba)
                if tmp.stomp_proof=0 && tmp.killer=0 && tmp.license = 1 {
                    if tmp.kill_type=0 && grav>0 && y<tmp.y {
                        //  lolo.energia-=233333333333333333333333333333
                        tmp.kill_type=2
                        nabijanie+=1
                        tmp2=instance_create(x,y,o_scorepop2)
                        tmp2.image_index=nabijanie-1
                        if nabijanie>6 {nabijanie=0}
                        state=1;
                        grav=-8-tmp.knockback
                        if raccoon_flew=1 {raccoon_fly_timer=0}
                        global.combo1+=1
                        global.combo1reset=0
                        if global.sample=1 {tmp2=sound_play(snd_stomp);sound_volume(snd_stomp,global.game_volume)} //sampel
                    } }
            }

            if place_meeting(x,y,o_goomba) && !place_meeting(x,y,o_bowser) {
                tmp=instance_place(x,y,o_goomba)
                if tmp.stomp_proof=0 && tmp.kill_type=0 {//lolo.energia-=233333333333333333333333333333 啊，这个dabusi变量是我以前加的，防止敌人被星死，以及龟壳撞死
                    tmp.kill_type=2
                    nabijanie+=1
                    tmp2=instance_create(x,y,o_scorepop2)
                    tmp2.image_index=nabijanie-1
                    if nabijanie>6 {nabijanie=0}
                }
            }
        }

        if place_meeting(x,y+max(0,grav+global.level_gravity/5),o_bowser) /* && muszlowanie>10 *///库巴咱就不管了
        {
            tmp=instance_place(x,y+max(0,grav+global.level_gravity/5),o_bowser)
            if tmp.killer=0 {
                if tmp.kill_type=0 && grav>0 && y<tmp.y-40 && tmp.hit<=0 {
                    tmp.hp-=114514; //踩一次必然扣HP，但子弹攻击要看库巴的koopa_strength来判断
                    tmp.kill_type=1;
                    state=1;
                    grav=-8//-lolo.odpych
                    if raccoon_flew=1 {raccoon_fly_timer=0}
                    global.combo1+=1
                    global.combo1reset=0
                    //muszlowanie=0

                    if tmp.object_index=o_bowser && dir=0 {hspd+=6}
                    if tmp.object_index=o_bowser && dir=1 {hspd-=6}
                } }
            if tmp.killer=0 && hit_timer=0 && y>=tmp.y-40 && shield=0 && star_timer<=0 {hit_timer=1}
            if tmp.hit>0 && tmp.hit<170 && shield=0 && star_timer<=0 {hit_timer=1}
        }

    }

}
