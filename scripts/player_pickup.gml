// player_pickup.gml —— 金币/蘑菇/花/1UP/绿果/甜菜/浣熊叶/无敌星拾取 + 受伤死亡 + pauza 动画（原 o_marker Step_0 第 1665-1966 行）
// 依赖实例变量：hit_timer, shield, shieldanim, shell_lock, star_timer, kolor, sizing, collect_delay, animkind
// 子脚本：player_kill / player_grow_big / player_bonus_score / player_transform
if pipe_state=0 {
    if global.pauza=0 && shell_lock=0 && global.level_complete=0 {

        // zdobywanie monety
        if place_meeting(x,y,o_point) && global.rodzajmaria<>5 {
            bonus=instance_place(x,y,o_point)
            with(bonus) {instance_destroy()}
            global.coins+=1
            if global.sample=1 {tmp2=sound_play(snd_coin);sound_volume(snd_coin,global.game_volume)}
        }

        // OBRYWANIE（即死：掉坑/岩浆/毒蘑菇/全局岩浆淹没）
        if y>room_height+30 && hit_timer=0 && global.rodzajmaria<>5 {player_kill()}
        if (global.bowser_phase=2||global.bowser_phase=3)&& y>view_yview+480+30 && hit_timer=0 && global.rodzajmaria<>5 {player_kill()}
        if global.bowser_phase=0 && region_count>0 && view_set=1 && y>view_yview+480+30 && hit_timer=0 && global.rodzajmaria<>5 {player_kill()}
        if place_meeting(x,y,o_lava) && hit_timer=0 && global.rodzajmaria<>5 {player_kill()}
        if place_meeting(x,y,o_bonusdead) && hit_timer=0 && global.rodzajmaria<>5 {player_kill()}
        // 下面一行，SMWP1.7新增：马里奥掉进全局岩浆即死
        if y>=global.water_level+2 && global.lava=1 && hit_timer=0 && global.rodzajmaria<>5 {player_kill()}

        if hit_timer=1 && global.rodzajmaria=5 {hit_timer=0}
        if hit_timer=1 && shield=0 && global.rodzajmaria<>5 {
            if global.rodzajmaria<>0 {shield=200; hit_timer=2; global.pauza=2;}
            if global.rodzajmaria=0 {
                global.zycia-=1; shell_lock=1;
                if(!global.fast_retry) {
                    mm_stop_all_ext();
                    if global.sample=1 {tmp2=sound_play(snd_die);sound_volume(snd_die,global.game_volume)}
                } else {
                    if global.sample=1 {
                        tmp2=sound_play(snd_fastdie);
                        sound_volume(snd_fastdie,global.game_volume);
                    }
                }
                instance_create(x,y,o_mariodead);animator.visible=0;
                // 光照设置
                light_radius = 0;
            }
            if global.rodzajmaria=1 {global.rodzajmaria=0;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)}}
            if global.rodzajmaria>=2 {global.rodzajmaria=1;if global.sample=1 {tmp2=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.game_volume)}}
        }
        if shield>0 && shell_lock=0 {
            shield-=1;
            shieldanim+=1
            if shieldanim>3 && animator.visible=1 {animator.visible=0;shieldanim=0;}
            if shieldanim>3 && animator.visible=0 {animator.visible=1;shieldanim=0;}
        }

        if shield=0 && shell_lock=0 {animator.visible=1}

        // GWIAZDKA
        if place_meeting(x,y,o_bonusstar) && global.rodzajmaria<>5 {
            kafel=instance_place(x,y,o_bonusstar)
            with(kafel) {instance_destroy()}
            star_timer=500
            mm_play_ext('.\Data\MW\ktkm3.dll',0)
            animator2.visible=1
        }

        if /*global.godmode=0 &&*/ keyboard_check(global.key_restart) && hit_timer=0 {instance_create(x,y,o_fireexplode);sound_play(snd_break);player_kill();suicide=1}
        if star_timer<=0 {animator.image_blend=c_white;animator2.visible=0}
        if star_timer>0 {
            star_timer-=1; kolor=make_color_rgb(random(255),random(255),random(255)); animator.image_blend=kolor

        }
        //无敌星音乐重置
        if star_timer=1 && instance_number(object112)<>0 {mm_play_ext('.\Data\MW\ktkm8.dll',0)}
        if star_timer=1 && instance_number(object112)=0 {
            if (string(global.bgm_id) == "600" || string(global.bgm_id) == "0") {
                mm_stop_all_ext();
            } else {
                Music_Play()//大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲
                //你们要改音乐的到Scripts -> Music_Play改
            }
        }

        // zdobywanie grzyba // POWIEKSZENIE od kwiatka i LUI

        if global.rodzajmaria=0 {image_yscale=1}

        // 小形态吃大蘑菇/火力花/绿果/甜菜/浣熊叶 -> 变大
        if place_meeting(x,y,o_bonusmush) && global.rodzajmaria=0 && global.rodzajmaria<>5 {
            bonus=instance_place(x,y,o_bonusmush)
            player_grow_big(bonus)
        }

        if place_meeting(x,y,o_bonusflower) && global.rodzajmaria=0 && global.rodzajmaria<>5 && checkpointdetect=1 {
            bonus=instance_place(x,y,o_bonusflower)
            player_grow_big(bonus)
        }

        if place_meeting(x,y,o_bonus1up) && global.rodzajmaria<>5 && checkpointdetect=1 {
            bonus=instance_place(x,y,o_bonus1up)
            with(bonus) {instance_destroy()}

            fifi=instance_create(x,y-32,o_scorepop3)
            fifi.image_index=6
            if global.sample=1 {tmp2=sound_play(snd_1up);sound_volume(snd_1up,global.game_volume)}

        }

        if place_meeting(x,y,o_bonuslui) && global.rodzajmaria=0 && global.rodzajmaria<>5 && checkpointdetect=1 {
            bonus=instance_place(x,y,o_bonuslui)
            player_grow_big(bonus)
        }

        if place_meeting(x,y,o_bonusbeetroot) && global.rodzajmaria=0 && global.rodzajmaria<>5 && checkpointdetect=1 {
            bonus=instance_place(x,y,o_bonusbeetroot)
            player_grow_big(bonus)
        }

        if place_meeting(x,y,o_bonusraccoon) && global.rodzajmaria=0 && global.rodzajmaria<>5 && checkpointdetect=1 {
            bonus=instance_place(x,y,o_bonusraccoon)
            player_grow_big(bonus)
        }

    }


    // Zdobycie 1000 punktow za grzyba gdy mario nie jest juz maly
    if place_meeting(x,y,o_bonusmush) && global.rodzajmaria>0 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusmush)
        player_bonus_score(bonus)
    }

    // ------------------------------------------------------------------------------------------------------
    // ZDOBYWANIE KWIATKA GDY MARIO JEST DUZY | GDY JEST KWIATKOWY | GDY NIE JEST KWIATKOWY, ALE TEZ NIE MALY
    //
    if place_meeting(x,y,o_bonusflower) && global.rodzajmaria=2 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusflower)
        player_bonus_score(bonus)
    }

    if place_meeting(x,y,o_bonusflower) && global.rodzajmaria<>2 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusflower)
        player_transform(bonus, 2, global.fire_character_run, global.fire_character_jump, global.fire_character_swim)
    }

    // ------------------------------------------------------------------------------------------------------
    // ZDOBYWANIE LUIGDY MARIO JEST DUZY | GDY JEST LUI'WOY | GDY NIE JEST LUI'OWY, ALE TEZ NIE MALY
    //
    if place_meeting(x,y,o_bonuslui) && global.rodzajmaria=3 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonuslui)
        player_bonus_score(bonus)
    }

    if place_meeting(x,y,o_bonuslui) && global.rodzajmaria<>3 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonuslui)
        player_transform(bonus, 3, global.lui_character_run, global.lui_character_jump, global.lui_character_swim)
    }

    // ------------------------------------------------------------------------------------------------------
    // ZDOBYWANIE LUIGDY MARIO JEST DUZY | GDY JEST LUI'WOY | GDY NIE JEST LUI'OWY, ALE TEZ NIE MALY
    //
    if place_meeting(x,y,o_bonusbeetroot) && global.rodzajmaria=4 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusbeetroot)
        player_bonus_score(bonus)
    }

    if place_meeting(x,y,o_bonusbeetroot) && global.rodzajmaria<>4 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusbeetroot)
        player_transform(bonus, 4, global.beetroot_character_run, global.beetroot_character_jump, global.beetroot_character_swim)
    }

    // ------------------------------------------------------------------------------------------------------
    // ZDOBYWANIE RACCOON (small pickup, already raccoon, other state)
    if place_meeting(x,y,o_bonusraccoon) && global.rodzajmaria=6 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusraccoon)
        player_bonus_score(bonus)
    }

    if place_meeting(x,y,o_bonusraccoon) && global.rodzajmaria<>6 && global.rodzajmaria<>0 && global.rodzajmaria<>5 && checkpointdetect=1 {
        bonus=instance_place(x,y,o_bonusraccoon)
        player_transform(bonus, 6, global.raccoon_character_idle, global.raccoon_character_jump, global.raccoon_character_swim)
    }


    if global.pauza=1 {
        if dir=0 {/*animator.image_xscale=1+sin(degtorad(sizing/3 ))/2*/}
        if dir=1 {/*animator.image_xscale=-1-sin(degtorad(sizing/3 ))/2*/}
        animator.image_yscale=1+(sin(degtorad(sizing)))/3
        sizing+=10
        if collect_delay<60 {collect_delay+=1}
        if collect_delay=60 {collect_delay=0; global.pauza=0;animator.image_xscale=1;animator.image_yscale=1}
    }

    if global.pauza=2 {
        if dir=0 {/*animator.image_xscale=1-sin(degtorad(sizing/3 ))/2*/}
        if dir=1 {/*animator.image_xscale=-1-sin(degtorad(sizing/3 ))/2*/}
        animator.image_yscale=1+(sin(degtorad(sizing)))/3
        sizing+=10
        if collect_delay<60 {collect_delay+=1}
        if collect_delay=60 {collect_delay=0; global.pauza=0;animator.image_xscale=1;animator.image_yscale=1; hit_timer=0}
    }

}
