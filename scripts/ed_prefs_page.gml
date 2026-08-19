/// ed_prefs_page()
/// 可选项界面（prefs）整页渲染+交互：页签背景/翻页箭头/防连点/三页设置项/退出按钮。
/// 需在 self=o_edmain 上下文、if bg_selecting=1000 内调用。
/// 设置项本体已封装为 ed_prefs_bool / ed_prefs_int / ed_prefs_lightbit。


    draw_sprite(s_edadditional,0,view_xview[0],view_yview[0])
    draw_set_color(c_white)
    draw_set_font(cyferkimario)

    if (o_edmain.additionalpage<100) {
        if abs(view_xview[0]+83+443-mouse_x)<16 && abs(view_yview[0]+438-49-mouse_y)<16 {draw_sprite_ext(s_left,0,view_xview[0]+83+443,view_yview[0]+438-49,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_left,0,view_xview[0]+83+443,view_yview[0]+438-49,1,1,0,c_white,1)}
        if abs(view_xview[0]+147+443-mouse_x)<16 && abs(view_yview[0]+438-49-mouse_y)<16 {draw_sprite_ext(s_right,0,view_xview[0]+147+443,view_yview[0]+438-49,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_right,0,view_xview[0]+147+443,view_yview[0]+438-49,1,1,0,c_white,1)}

        if abs(view_xview[0]+83+443-mouse_x)<16 && abs(view_yview[0]+438-49-mouse_y)<16 && mouse_check_button(mb_left) && wahaha=0 {
            if o_edmain.additionalpage=1 {o_edmain.additionalpage=0;wahaha = 1}
        }
        if abs(view_xview[0]+147+443-mouse_x)<16 && abs(view_yview[0]+438-49-mouse_y)<16 && mouse_check_button(mb_left) && wahaha=0 {
            if o_edmain.additionalpage=0 {o_edmain.additionalpage=1;wahaha = 1}
        }
    }

    //防止鼠标连点
    if wahaha = 1 && !mouse_check_button(mb_left) {wahaha=0}

    if o_edmain.additionalpage=0 {

                ed_prefs_bool(1, 'Modified Movement', 100, 'Modified Movement', 0)

//图层设置
        draw_text(view_xview[0]+40,view_yview[0]+130,string_upper('Layer Order'))
        draw_set_halign(fa_right)
        if global.layerord=2 {draw_text(view_xview[0]+405,view_yview[0]+130,string_upper('Modified'))}
        if global.layerord=1 {draw_text(view_xview[0]+405,view_yview[0]+130,string_upper('Water Above (1.5)'))}
        if global.layerord=0 {draw_text(view_xview[0]+405,view_yview[0]+130,string_upper('Classic'))}
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 120, 190, 20)&& clicked=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+120, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {global.layerord=(global.layerord+1) mod 3;clicked=1;ed_net_ops_send_settings('Layer Order')}
        }
                ed_prefs_bool(2, 'Roto-disc Layer', 160, 'Rotodisc Layer', 0)

        ed_prefs_int(1, 'Water Level', 190, 405, 40, 190, 'Set the height of the water level.', 0, 999999, 'Water Level')

        ed_prefs_bool(3, 'Fluid Type', 220, 'Lava/Water', 0)

        ed_prefs_bool(4, 'Auto Fluid', 250, 'Auto Scroll', 0)

        //自动系参数（数字项）

        if(global.auto) {
        ed_prefs_int(2, 'T1', 280, 180, 40, 140, 'Set the height of target 1. The fluid will automatically and repeatedly move between T1 and T2.', -64, 999999, 'Fluid Target 1')

        ed_prefs_int(3, 'T2', 280, 404, 264, 140, 'Set the height of target 2. Enter -64 to disable it, which means the fluid will stop moving after reaching T1', -64, 999999, 'Fluid Target 2')

        ed_prefs_int(4, 'speed', 310, 180, 40, 140, 'Set the speed of the fluid.(0,1,...,9)', 0, 9, 'Fluid Speed')

        ed_prefs_int(5, 'delay', 310, 404, 264, 140, 'Set the delay time before the fluid starts to move.', 0, 999999, 'Fluid Delay')

        }
        ed_prefs_bool(5, 'Advanced Switch', 340, 'Advanced Switch', 0)

        ed_prefs_bool(6, 'fast retry', 370, 'Fast Retry', 0)

        ed_prefs_bool(7, 'MF style beet', 400, 'MF Beet', 0)

        ed_prefs_bool(8, 'Celeste Style Switch', 430, 'Celeste', 0)

        ed_prefs_bool(9, 'MF style pipe exit', 460, 'Pipe Out', 0)

//第一页结束
    }

    // =====第二页=====
    if o_edmain.additionalpage=1 {

                ed_prefs_bool(10, 'Faster Level Pass', 100, 'Fast Pass', 0)

        ed_prefs_bool(11, 'HUD Display', 130, 'HUD Display', 1)

//照明额外设置
        draw_text(view_xview[0]+40,view_yview[0]+160,string_upper('Settings for special luminous objects'))
        if ed_hit(40, 150, 190, 20)&& clicked=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+150, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {o_edmain.additionalpage=100;wahaha = 1;clicked=1}
        }

                ed_prefs_bool(12, 'Thwomp Activate Blocks', 190, 'Stun Block', 0)

        ed_prefs_bool(13, 'Top Death (Downward Scroll)', 220, 'Top Death', 0)

//第二页结束
    }




    // =====额外照明设置=====
    if o_edmain.additionalpage=100 {
        draw_sprite(s_edadditional,2,view_xview[0],view_yview[0])

                ed_prefs_lightbit(59, 'Player Fireball', 100, 20)

        ed_prefs_lightbit(60, 'Player Beetroot', 130, 20)

        ed_prefs_lightbit(61, 'Player Invincible Star', 160, 10)

        ed_prefs_lightbit(62, 'Piranha Plant Fireball', 190, 20)

        ed_prefs_lightbit(63, 'Bullet Bill', 220, 20)

        ed_prefs_lightbit(64, 'Hammer Bro. Hammer', 250, 20)

        ed_prefs_lightbit(65, 'Bowser Flame', 280, 20)

        ed_prefs_lightbit(66, 'Bullet Bill Guided', 310, 20)

        ed_prefs_lightbit(67, 'Fire Bro. Fireball', 340, 20)

        ed_prefs_lightbit(68, 'Fluid Lava Global', 370, 20)

//照明额外设置页面结束
    }

    //退出（照明额外设置）
    if ed_hit(561, 427, 60, 30)&& o_edmain.additionalpage>=100 {
        draw_prefs_highlight(view_xview[0]+561, view_yview[0]+427, 0.5, 1.3, 0.2);
        if mouse_check_button(mb_left) {o_edmain.additionalpage=1;wahaha = 1;clicked=1;}
    }

    //退出（主页面）
    if ed_hit(561, 427, 60, 30)&& o_edmain.additionalpage<100 && wahaha=0 {
        draw_prefs_highlight(view_xview[0]+561, view_yview[0]+427, 0.5, 1.3, 0.2);
        quitadditional=1} else
    {quitadditional=0}
    if mouse_check_button(mb_left) && quitadditional=1 {bg_selecting=0;}