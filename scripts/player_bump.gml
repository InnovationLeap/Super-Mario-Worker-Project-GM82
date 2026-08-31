// player_bump.gml —— 顶砖/垂直碰撞/移动桥/重力应用/上帝模式移动（原 o_marker Step_0 第 621-813 行）
// 依赖实例变量：bump_block, grav, state, looptest3, looptest233, looplimit, stuck,
//               shift_speed, slide, winduje, windor, windloop, wxspeed, hspd
// 依赖脚本：无（使用 with 内嵌）
// var 声明按 GM8 约束集中在脚本顶部
var nexty, nexty2, nexty3, bump, height;
nexty = 0;
nexty2 = 0;
nexty3 = 0;
bump = 0;
height = 0;
if global.pauza=0 && shell_lock=0 && global.level_complete=0 {

    if bump_block=0 && place_meeting(x,y-8,o_pointblock2) && state=0 && global.rodzajmaria<>5 {bump_block=1}
    if bump_block=0 && place_meeting(x,y-8,o_pointblock2) && state=0 && global.rodzajmaria<>5 {bump_block=1}

    // podbijanie punktu

    if place_meeting(x,y-8,o_pointblock) && grav<0 && global.rodzajmaria<>5 {tmp=instance_place(x,y-8,o_pointblock); tmp.bumped=1; grav=0}
    if place_meeting(x,y-8,o_blockbumper) && grav<0 && global.rodzajmaria<>5 {tmp=instance_place(x,y-8,o_blockbumper); if(!tmp.bumped) {tmp.bumped=1;} grav=0 }

    if global.modifiedmov=0 {
        if place_meeting(x,y-8,o_pointblock2) && grav<0 && global.rodzajmaria<>5 {tmp=instance_place(x,y-8,o_pointblock2); tmp.bumped=1; grav=0 y+=4}
    }

    //喝了这里负责的是顶头（原版代码）

    if global.modifiedmov=0 {

        if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) && grav<0 && global.rodzajmaria<>5 {looptest3=1; grav=0}
        {while looptest3=1 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y+=1};} looptest3=0
    }


    if global.modifiedmov=1 {
        if slide = 0  && !stuck {
            if (grav+global.level_gravity/5) < 0 && state=1 {
                nexty = y+grav+global.level_gravity/5
                if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) && global.rodzajmaria<>5 { looptest3=1; }
                while looptest3=1 {
                    if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) { nexty+=1; looplimit+=1; } else { y=nexty ; looptest3=0 ; grav=0;looplimit=0;
                        //负引力的处理
                        if (global.level_gravity/5)>-13 && (global.level_gravity/5)<0 && abs(global.level_gravity/5) > grav { grav=abs(global.level_gravity/5) }
                    }
                    if looplimit>=16 {looptest3=0; stuck=1;looplimit=0;}
                }
            }
            if shift_speed < 0 && grav = 0 {
                nexty2 = y+shift_speed
                if (place_meeting(x,nexty2,obj_wall) || place_meeting(x,nexty2,o_pointblock)) && global.rodzajmaria<>5 { looptest233=1;}
                while looptest233=1 {
                    if (place_meeting(x,nexty2,obj_wall) || place_meeting(x,nexty2,o_pointblock)) { nexty2+=1;looplimit+=1; } else { y=nexty2 ; looptest233=0 ; grav=0;looplimit=0; }
                    if looplimit>=16 {looptest233=0; stuck=1;looplimit=0;}
                }
            }

            if (grav+global.level_gravity/5+shift_speed) > 0 && state=1 {
                nexty = y+grav+global.level_gravity/5
                if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) && global.rodzajmaria<>5 { looptest3=2;}
                while looptest3=2 {
                    if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) { nexty-=1;looplimit+=1; } else { y=nexty ; looptest3=0 ; grav=0 ; state=0;looplimit=0;}
                    if looplimit>=16 {looptest3=0; stuck=1;looplimit=0;}
                }
            }
            if shift_speed > 0 && grav = 0 {
                nexty2 = y+shift_speed
                if (place_meeting(x,nexty2,obj_wall) || place_meeting(x,nexty2,o_pointblock)) && global.rodzajmaria<>5 { looptest233=1;}
                while looptest233=1 {
                    if (place_meeting(x,nexty2,obj_wall) || place_meeting(x,nexty2,o_pointblock)) { nexty2-=1;looplimit+=1; } else { y=nexty2 ; looptest233=0 ; grav=0;looplimit=0; }
                    if looplimit>=16 {looptest233=0; stuck=1; looplimit=0;}
                }
            }
        } else if slide=2 {
            nexty = y
            if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) && global.rodzajmaria<>5 { looptest3=1 }
            while looptest3=1 {
                if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) { nexty+=1 } else { y=nexty ; looptest3=0 ; grav=0
                    //负引力的处理
                    if (global.level_gravity/5)>-13 && (global.level_gravity/5)<0 && abs(global.level_gravity/5) > grav { grav=abs(global.level_gravity/5) }
                }
            }
        }
    }

    if global.modifiedmov=1 {
        //新版顶隐藏砖，仅在马里奥顶部撞到隐藏砖底部生效
        if grav<0 && instance_place(x,y+grav,o_pointblock2) {
            bump=instance_place(x,y+grav,o_pointblock2)
            if global.rodzajmaria=0 { height=24 } else { height=48 }
            if y >= bump.y+32+height && bump.bumped=0 {
                if (global.level_gravity/5)>-13 && (global.level_gravity/5)<0 && abs(global.level_gravity/5) > grav { grav=abs(global.level_gravity/5) } else { grav=0 }
                bump.bumped=1
            }
        }
    }

    //移动桥相关
    if state<>0 {winduje=0}


    if grav=0 && state=0 && !place_meeting(x,y-2,o_windas) && global.rodzajmaria<>5 // Lapanie windy, gdy mario stoi w miejscu
    {
        o_marker.y=round(o_marker.y)
        windor.x=x
        windor.y=y
        with(windor) {
            if place_meeting(x,y+2,o_windas) && (place_meeting(x,y+o_marker.windloop,o_pointblock) && global.rodzajmaria<>5 || place_meeting(x,y+o_marker.windloop,obj_wall)) && global.rodzajmaria<>5 && !other.stuck {
                getwind=instance_place(x,y+o_marker.windloop,o_windas)
                o_marker.y=getwind.y
                o_marker.grav=0
                o_marker.state=0
                o_marker.windloop=ceil(o_marker.grav+1)
                o_marker.winduje=getwind
            }
        }

    }

    if grav>0 && !place_meeting(x,y-2,o_windas) && global.rodzajmaria<>5 // Lapanie windy
    {
        o_marker.y=round(o_marker.y)
        windor.x=x
        windor.y=y
        with(windor) {

            while o_marker.windloop<ceil(o_marker.grav+1) {
                if place_meeting(x,y+o_marker.windloop,o_windas) && !place_meeting(x,y+o_marker.windloop,o_pointblock) && !place_meeting(x,y+o_marker.windloop,obj_wall) && global.rodzajmaria<>5 && !other.stuck {
                    getwind=instance_place(x,y+o_marker.windloop,o_windas)
                    o_marker.y=getwind.y
                    o_marker.grav=0
                    o_marker.state=0
                    o_marker.windloop=ceil(o_marker.grav+1)
                    o_marker.winduje=getwind
                }
                o_marker.windloop+=1
            }
        }
        windloop=0
    }
    if grav=0 && place_meeting(x,y-2,o_windas) && (place_meeting(x,y-1,obj_wall) && global.rodzajmaria<>5 || place_meeting(x,y-1,o_pointblock)) && global.rodzajmaria<>5 {grav=0; state=1}


    if state=1 && !stuck //dodawaj do Y wspolczynnik grawitacji
    {
        if grav>=0 && global.modifiedmov=0 {y+=grav+global.level_gravity/5}
        if global.modifiedmov=1 {
            nexty3 = y+grav+global.level_gravity/5
            if !(place_meeting(x,nexty3,obj_wall) || place_meeting(x,nexty3,o_pointblock)) {
                y+=grav+global.level_gravity/5 }
        }
        if (y<global.water_level || global.lava) {grav+=1}
        if y>=global.water_level && !global.lava {grav+=0.2}

        if (y<global.water_level || global.lava) && grav>13 {grav=13}
        if y>=global.water_level && !global.lava && grav>6 {grav=6}
    }

    if global.modifiedmov=0 {

        if state=1 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) && grav>0 {state=2; grav=0};

        while state=2 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock) ) {y-=1;};

        if state=2 && (!place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock)) {state=0};

    }

    if global.rodzajmaria=5 {
        grav=0
        state=0
        if keyboard_check(global.key_right) { x += 8; }
        if keyboard_check(global.key_left) { x -= 8; }
        if keyboard_check(global.key_up) { y -= 8; }
        if keyboard_check(global.key_down) { y += 8; }
    }

    //god模式中的CP跳转
    if global.godmode=1 {

        if keyboard_check_released(global.godkey_cp_prev) {
            global.checkpointa=global.checkpoint+1
            o_checkpoint.kk=1
        }

        if keyboard_check_released(global.godkey_cp_next) {
            global.checkpointa=global.checkpoint-1
            o_checkpoint.kk=1
        }
    }

    wxspeed=0
    shift_speed=0

    //尝试性修复非整格实心穿墙
    if (hspd = 0)
    x = round(x);
    if (grav = 0)
    y = round(y);

}
