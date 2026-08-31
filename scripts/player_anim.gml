// player_anim.gml —— 小/大/火/绿果/甜菜/浣熊 六形态动画（原 o_marker Step_0 第 991-1306 行）
// 依赖：animator, animator2, dir, hspd, grav, state, image_index, swim_anim, schylanie,
//       shoot_anim, raccoon_fall, raccoon_fly_allowed
if global.pauza=0 && shell_lock=0 && global.level_complete=0 {

    // MALY MARIO：小马里奥
    if global.rodzajmaria=0 { //rodazajmaria用来记录马里奥状态，对应表见上。
        if y<global.water_level || global.lava //poziomwody记录水面高度，下面的代码为马里奥在水面上方的动画代码
        {image_index=0

            if hspd<0 {dir=1}//kierunek记录马里奥朝向，1为右，0为左
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 {animator.sprite_index=global.small_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0}
            if hspd=0 && state=0 && dir=1 {animator.sprite_index=global.small_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0}//image_xscale=-1表示把图像反向

            if hspd>0 && dir=0 && state=0 {animator.sprite_index=global.small_character_run; animator.image_index+=hspd/10; animator.image_xscale=1; animkind=0}
            if hspd<0 && dir=1 && state=0 {animator.sprite_index=global.small_character_run; animator.image_index+=hspd/10; animator.image_xscale=-1; animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.small_character_jump; animator.image_xscale=1;animkind=1} //grawitacja记录“重力状况”，也就是是否在空中（因为在地面上相当于“重力”为0）
            if dir=1 && grav<>0 {animator.sprite_index=global.small_character_jump; animator.image_xscale=-1;animkind=1}

        }

        if y>=global.water_level && !global.lava//poziomwody记录水面高度，下面的代码为马里奥在水面下方的动画代码
        {image_index=0

            if hspd<0 {dir=1}//szybkosc记录水平速度状态，0为静止，向左为正
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 {animator.sprite_index=global.small_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0 }
            if hspd=0 && state=0 && dir=1 {animator.sprite_index=global.small_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0 }

            if hspd>0 && dir=0 && state=0 {animator.sprite_index=global.small_character_run; animator.image_index+=hspd/20; animator.image_xscale=1; animkind=0}//image_index表示帧数，通过马里奥运动速度来控制帧的切换速度
            if hspd<0 && dir=1 && state=0 {animator.sprite_index=global.small_character_run; animator.image_index+=hspd/20; animator.image_xscale=-1; animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.small_character_swim; animator.image_index=swim_anim; animator.image_xscale=1;animkind=2}
            if dir=1 && grav<>0 {animator.sprite_index=global.small_character_swim; animator.image_index=swim_anim; animator.image_xscale=-1;animkind=2}
            if swim_anim<9 {swim_anim+=0.2}


            if global.efekty>5 {tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale}


        }}



    // DUZY MARIO
    if global.rodzajmaria=1 {
        if y<global.water_level || global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 {animator.sprite_index=global.big_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0}
            if hspd=0 && state=0 && dir=1 {animator.sprite_index=global.big_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0}

            if hspd>0 && dir=0 && state=0 {animator.sprite_index=global.big_character_run; animator.image_index+=hspd/10; animator.image_xscale=1; animkind=0}
            if hspd<0 && dir=1 && state=0 {animator.sprite_index=global.big_character_run; animator.image_index+=hspd/10; animator.image_xscale=-1; animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.big_character_jump; animator.image_xscale=1;animkind=1}
            if dir=1 && grav<>0 {animator.sprite_index=global.big_character_jump; animator.image_xscale=-1;animkind=1}

            if schylanie=1 && dir=0 {animator.sprite_index=global.big_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.big_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}
        }

        if y>=global.water_level && !global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 {animator.sprite_index=global.big_character_run; animator.image_index=0; animator.image_xscale=1 ; animkind=0}
            if hspd=0 && state=0 && dir=1 {animator.sprite_index=global.big_character_run; animator.image_index=0; animator.image_xscale=-1 ; animkind=0}

            if hspd>0 && dir=0 && state=0 {animator.sprite_index=global.big_character_run; animator.image_index+=hspd/20; animator.image_xscale=1; animkind=0 }
            if hspd<0 && dir=1 && state=0 {animator.sprite_index=global.big_character_run; animator.image_index+=hspd/20; animator.image_xscale=-1; animkind=0 }

            if dir=0 && grav<>0 {animator.sprite_index=global.big_character_swim; animator.image_index=swim_anim; animator.image_xscale=1;animkind=2}
            if dir=1 && grav<>0 {animator.sprite_index=global.big_character_swim; animator.image_index=swim_anim; animator.image_xscale=-1;animkind=2}
            if swim_anim<9 {swim_anim+=0.2}

            if schylanie=1 && dir=0 {animator.sprite_index=global.big_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.big_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            if global.efekty>5 {tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale}


        }}


    // FIRE MARIO
    if global.rodzajmaria=2 {
        if y<global.water_level || global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 && shoot_anim=0 {animator.sprite_index=global.fire_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0}
            if hspd=0 && state=0 && dir=1 && shoot_anim=0 {animator.sprite_index=global.fire_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0}

            if hspd>0 && dir=0 && state=0 && shoot_anim=0 {animator.sprite_index=global.fire_character_run; animator.image_index+=hspd/10; animator.image_xscale=1; animkind=0}
            if hspd<0 && dir=1 && state=0 && shoot_anim=0 {animator.sprite_index=global.fire_character_run; animator.image_index+=hspd/10; animator.image_xscale=-1; animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.fire_character_jump; animator.image_xscale=1;animkind=1}
            if dir=1 && grav<>0 {animator.sprite_index=global.fire_character_jump; animator.image_xscale=-1;animkind=1}

            if schylanie=1 && dir=0 {animator.sprite_index=global.fire_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.fire_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            if schylanie=1 || state<>0 {shoot_anim=0}
            if dir=0 && shoot_anim>0 {animator.sprite_index=global.fire_character_shoot; animator.image_xscale=1; shoot_anim+=1;animkind=0}
            if dir=1 && shoot_anim>0 {animator.sprite_index=global.fire_character_shoot; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
            if shoot_anim>3 {shoot_anim=0}
        }

        if y>=global.water_level && !global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 {animator.sprite_index=global.fire_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0}
            if hspd=0 && state=0 && dir=1 {animator.sprite_index=global.fire_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0}

            if hspd>0 && dir=0 && state=0 {animator.sprite_index=global.fire_character_run; animator.image_index+=hspd/20; animator.image_xscale=1; animkind=0}
            if hspd<0 && dir=1 && state=0 {animator.sprite_index=global.fire_character_run; animator.image_index+=hspd/20; animator.image_xscale=-1; animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.fire_character_swim; animator.image_index=swim_anim; animator.image_xscale=1;animkind=2}
            if dir=1 && grav<>0 {animator.sprite_index=global.fire_character_swim; animator.image_index=swim_anim; animator.image_xscale=-1;animkind=2}
            if swim_anim<9 {swim_anim+=0.2}

            if schylanie=1 && dir=0 {animator.sprite_index=global.fire_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.fire_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            if schylanie=1 || state<>0 {shoot_anim=0}
            if dir=0 && shoot_anim>0 {animator.sprite_index=global.fire_character_shoot; animator.image_xscale=1; shoot_anim+=1;animkind=0}
            if dir=1 && shoot_anim>0 {animator.sprite_index=global.fire_character_shoot; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
            if shoot_anim>3 {shoot_anim=0}

            if global.efekty>5 {tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale}


        }}

    // OGRODNIX MARIO
    if global.rodzajmaria=3 {
        if y<global.water_level || global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 && shoot_anim=0 {animator.sprite_index=global.lui_character_run; animator.image_index=0; animator.image_xscale=1;animkind=0}
            if hspd=0 && state=0 && dir=1 && shoot_anim=0 {animator.sprite_index=global.lui_character_run; animator.image_index=0; animator.image_xscale=-1;animkind=0}

            if hspd>0 && dir=0 && state=0 && shoot_anim=0 {animator.sprite_index=global.lui_character_run; animator.image_index+=hspd/10; animator.image_xscale=1;animkind=0}
            if hspd<0 && dir=1 && state=0 && shoot_anim=0 {animator.sprite_index=global.lui_character_run; animator.image_index+=hspd/10; animator.image_xscale=-1;animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.lui_character_jump; animator.image_xscale=1;animkind=1}
            if dir=1 && grav<>0 {animator.sprite_index=global.lui_character_jump; animator.image_xscale=-1;animkind=1}

            if schylanie=1 && dir=0 {animator.sprite_index=global.lui_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.lui_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            shoot_anim=0 // nie ma strzelania!

        }

        if y>=global.water_level && !global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 {animator.sprite_index=global.lui_character_run; animator.image_index=0; animator.image_xscale=1;animkind=0}
            if hspd=0 && state=0 && dir=1 {animator.sprite_index=global.lui_character_run; animator.image_index=0; animator.image_xscale=-1;animkind=0}

            if hspd>0 && dir=0 && state=0 {animator.sprite_index=global.lui_character_run; animator.image_index+=hspd/20; animator.image_xscale=1;animkind=0}
            if hspd<0 && dir=1 && state=0 {animator.sprite_index=global.lui_character_run; animator.image_index+=hspd/20; animator.image_xscale=-1;animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.lui_character_swim; animator.image_index=swim_anim; animator.image_xscale=1;animkind=2}
            if dir=1 && grav<>0 {animator.sprite_index=global.lui_character_swim; animator.image_index=swim_anim; animator.image_xscale=-1;animkind=2}
            if swim_anim<9 {swim_anim+=0.2}

            if schylanie=1 && dir=0 {animator.sprite_index=global.lui_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.lui_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            shoot_anim=0 // nie ma strzelania!
            if global.efekty>5 {tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale}


        }}

    // BURACZANY MARIO
    if global.rodzajmaria=4 {
        if y<global.water_level || global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 && shoot_anim=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index=0; animator.image_xscale=1;animkind=0}
            if hspd=0 && state=0 && dir=1 && shoot_anim=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index=0; animator.image_xscale=-1;animkind=0}

            if hspd>0 && dir=0 && state=0 && shoot_anim=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index+=hspd/10; animator.image_xscale=1;animkind=0}
            if hspd<0 && dir=1 && state=0 && shoot_anim=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index+=hspd/10; animator.image_xscale=-1;animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.beetroot_character_jump; animator.image_xscale=1;animkind=1}
            if dir=1 && grav<>0 {animator.sprite_index=global.beetroot_character_jump; animator.image_xscale=-1;animkind=1}

            if schylanie=1 && dir=0 {animator.sprite_index=global.beetroot_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.beetroot_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            if schylanie=1 || state<>0 {shoot_anim=0}
            if dir=0 && shoot_anim>0 {animator.sprite_index=global.beetroot_character_shoot; animator.image_xscale=1; shoot_anim+=1;animkind=0}
            if dir=1 && shoot_anim>0 {animator.sprite_index=global.beetroot_character_shoot; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
            if shoot_anim>3 {shoot_anim=0}
        }

        if y>=global.water_level && !global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index=0; animator.image_xscale=1;animkind=0}
            if hspd=0 && state=0 && dir=1 {animator.sprite_index=global.beetroot_character_run; animator.image_index=0; animator.image_xscale=-1;animkind=0}

            if hspd>0 && dir=0 && state=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index+=hspd/20; animator.image_xscale=1;animkind=0}
            if hspd<0 && dir=1 && state=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index+=hspd/20; animator.image_xscale=-1;animkind=0}

            if dir=0 && grav<>0 {animator.sprite_index=global.beetroot_character_swim; animator.image_index=swim_anim; animator.image_xscale=1;animkind=2}
            if dir=1 && grav<>0 {animator.sprite_index=global.beetroot_character_swim; animator.image_index=swim_anim; animator.image_xscale=-1;animkind=2}
            if swim_anim<9 {swim_anim+=0.2}

            if schylanie=1 && dir=0 {animator.sprite_index=global.beetroot_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.beetroot_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}


            if global.efekty>5 {tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale}

            if schylanie=1 || state<>0 {shoot_anim=0}
            if dir=0 && shoot_anim>0 {animator.sprite_index=global.beetroot_character_shoot; animator.image_xscale=1; shoot_anim+=1;animkind=0}
            if dir=1 && shoot_anim>0 {animator.sprite_index=global.beetroot_character_shoot; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
            if shoot_anim>3 {shoot_anim=0}
        }}

    // RACCOON MARIO
    if global.rodzajmaria=6 {
        if y<global.water_level || global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_idle; animator.image_index=0; animator.image_xscale=1;animkind=0}
            if hspd=0 && state=0 && dir=1 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_idle; animator.image_index=0; animator.image_xscale=-1;animkind=0}

            if hspd>0 && dir=0 && state=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_walk; animator.image_index+=hspd/10; animator.image_xscale=1;animkind=0}
            if hspd<0 && dir=1 && state=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_walk; animator.image_index+=hspd/10; animator.image_xscale=-1;animkind=0}

            // When P-Meter is full and running, use run animation
            if abs(hspd)>6 && raccoon_fly_allowed=1 && state=0 && shoot_anim=0 && dir=0 {animator.sprite_index=global.raccoon_character_run; animator.image_index+=hspd/10; animator.image_xscale=1;animkind=0}
            if abs(hspd)>6 && raccoon_fly_allowed=1 && state=0 && shoot_anim=0 && dir=1 {animator.sprite_index=global.raccoon_character_run; animator.image_index+=hspd/10; animator.image_xscale=-1;animkind=0}

            // Jump animation
            if dir=0 && grav<>0 && raccoon_fall=0 && raccoon_fly_allowed=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_jump; animator.image_xscale=1;animkind=1}
            if dir=1 && grav<>0 && raccoon_fall=0 && raccoon_fly_allowed=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_jump; animator.image_xscale=-1;animkind=1}

            // Fall / parachute animation
            if dir=0 && raccoon_fall=1 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_fall; animator.image_index+=0.2; animator.image_xscale=1;animkind=1}
            if dir=1 && raccoon_fall=1 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_fall; animator.image_index+=0.2; animator.image_xscale=-1;animkind=1}

            // Fly animation (ascending or descending, matches SMWP2 behavior)
            if dir=0 && raccoon_fly_allowed=1 && grav<>0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_fly; animator.image_index+=0.25; animator.image_xscale=1;animkind=1}
            if dir=1 && raccoon_fly_allowed=1 && grav<>0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_fly; animator.image_index+=0.25; animator.image_xscale=-1;animkind=1}

            // Crouch
            if schylanie=1 && dir=0 {animator.sprite_index=global.raccoon_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.raccoon_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            // Shooting (tail whip) animation — high priority, works in air and on ground
            if schylanie=1 {shoot_anim=0}
            if dir=0 && shoot_anim>0 {animator.sprite_index=global.raccoon_character_shoot; animator.image_index+=0.5; animator.image_xscale=1; shoot_anim+=1;animkind=0}
            if dir=1 && shoot_anim>0 {animator.sprite_index=global.raccoon_character_shoot; animator.image_index+=0.5; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
            if shoot_anim>8 {shoot_anim=0; animator.image_index=0}
        }

        if y>=global.water_level && !global.lava {

            if hspd<0 {dir=1}
            if hspd>0 {dir=0}

            if hspd=0 && state=0 && dir=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_idle; animator.image_index=0; animator.image_xscale=1;animkind=0}
            if hspd=0 && state=0 && dir=1 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_idle; animator.image_index=0; animator.image_xscale=-1;animkind=0}

            if hspd>0 && dir=0 && state=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_walk; animator.image_index+=hspd/20; animator.image_xscale=1;animkind=0}
            if hspd<0 && dir=1 && state=0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_walk; animator.image_index+=hspd/20; animator.image_xscale=-1;animkind=0}

            if dir=0 && grav<>0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_swim; animator.image_index=swim_anim; animator.image_xscale=1;animkind=2}
            if dir=1 && grav<>0 && shoot_anim=0 {animator.sprite_index=global.raccoon_character_swim; animator.image_index=swim_anim; animator.image_xscale=-1;animkind=2}
            if swim_anim<9 {swim_anim+=0.2}

            if schylanie=1 && dir=0 {animator.sprite_index=global.raccoon_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
            if schylanie=1 && dir=1 {animator.sprite_index=global.raccoon_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
            if !schylanie=1 {image_index=1}

            // Shooting (tail whip) animation — high priority, works in water too
            if schylanie=1 {shoot_anim=0}
            if dir=0 && shoot_anim>0 {animator.sprite_index=global.raccoon_character_shoot; animator.image_index+=0.5; animator.image_xscale=1; shoot_anim+=1;animkind=0}
            if dir=1 && shoot_anim>0 {animator.sprite_index=global.raccoon_character_shoot; animator.image_index+=0.5; animator.image_xscale=-1; shoot_anim+=1;animkind=0}
            if shoot_anim>8 {shoot_anim=0; animator.image_index=0}

            if global.efekty>5 {tmp=instance_create(x,y,o_mariofx); tmp.sprite_index=animator.sprite_index; tmp.image_index=animator.image_index; tmp.image_speed=0;tmp.image_xscale=animator.image_xscale}

        }}

} // koniec global.pauza
