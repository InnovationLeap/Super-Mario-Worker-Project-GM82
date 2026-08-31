// player_move.gml —— 蹲下/滑行/冰面/入水/加速度/横向碰撞修正（原 o_marker Step_0 第 304-461 行）
// 依赖实例变量：hspd, slide, stuck, schylanie, uabf, uabff, uabfx, ice_effect, entered_water
// var 声明按 GM8 约束集中在脚本顶部
var nextx, nextx2;
nextx = 0;
nextx2 = 0;
if global.pauza=0 && shell_lock=0 && global.level_complete=0 {

    // SCHYLANIE

    if pipe_state=0 {
        if global.modifiedmov=1 {
            if is_button_pressed('down') && state=0 && schylanie=0 && !global.rodzajmaria=0 && slide=0 { uabfx=x }
            if is_button_pressed('down') && state=0 && !global.rodzajmaria=0 && slide=0 {schylanie=1 ; image_index=0 }
            if !is_button_pressed('down') && !global.rodzajmaria=0 && schylanie = 1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { slide = 1 }
            if !is_button_pressed('down') && !global.rodzajmaria=0 && schylanie = 1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { slide = 2 }
            if !is_button_pressed('down') && !global.rodzajmaria=0 {schylanie=0 ; image_index=1}
            if global.rodzajmaria=0 {schylanie=0 ; image_index=0}
        } else {
            if is_button_pressed('down') && state=0 && !global.rodzajmaria=0 {schylanie=1}
            //if !is_button_pressed('down') && !global.rodzajmaria=0 && schylanie = 1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { huadun = 1 }
            if !is_button_pressed('down') && !global.rodzajmaria=0 {schylanie=0}
            if global.rodzajmaria=0 {schylanie=0}
        }

        if place_meeting(x,y+1,obj_wall) {
            tmp2=instance_place(x,y+1,obj_wall);
            if ice_effect>0 && object_get_name(tmp2.object_index)<>'o_ice' {
                ice_effect=0;
            }
            if ice_effect=0 && object_get_name(tmp2.object_index)='o_ice' {
                ice_effect=0.2;
                if(y>=global.water_level) {hspd=0}
            }
        } else if y>=global.water_level {ice_effect=0;}

        if (place_meeting(x,y+1,o_windas) || place_meeting(x,y+1,o_pointblock)) {ice_effect=0}

        // WPADANIE DO WODY

        if entered_water=1 && (y<global.water_level || global.lava) && global.rodzajmaria<>5 {entered_water=0}
        if entered_water=0 && (y>=global.water_level && !global.lava) && global.rodzajmaria<>5 {entered_water=1; grav=0}

        // CHODZENIE I BIEGANIE

        if (global.lava || y<global.water_level) && global.rodzajmaria<>5 {
            if is_button_pressed('right') && !is_button_pressed('run') && hspd<3 && schylanie=0 && slide=0 && !stuck {hspd+=0.1-0.25*ice_effect}
            if is_button_pressed('left') && !is_button_pressed('run') && hspd>-3 && schylanie=0 && slide=0 && !stuck {hspd-=0.1-0.25*ice_effect}

            if is_button_pressed('right') && is_button_pressed('run') && schylanie=0 && slide=0 && !stuck {hspd+=0.3-ice_effect}
            if is_button_pressed('left') && is_button_pressed('run') && schylanie=0 && slide=0 && !stuck {hspd-=0.3-ice_effect}

            if hspd>8 hspd=8
            if hspd<-8 hspd=-8
        }

        if !global.lava && y>=global.water_level && global.rodzajmaria<>5 {
            if is_button_pressed('right') && !is_button_pressed('run') && hspd<1 && schylanie=0 && slide=0 && ice_effect=0 && !stuck {hspd+=0.05}
            if is_button_pressed('left') && !is_button_pressed('run') && hspd>-1 && schylanie=0 && slide=0 && ice_effect=0 && !stuck {hspd-=0.05}

            if is_button_pressed('right') && is_button_pressed('run') && schylanie=0 && slide=0 && ice_effect=0 && !stuck {hspd+=0.05}
            if is_button_pressed('left') && is_button_pressed('run') && schylanie=0 && slide=0 && ice_effect=0 && !stuck {hspd-=0.05}

            if hspd>3 hspd=3
            if hspd<-3 hspd=-3
        }
        //穿墙强制静止
        if global.bowser_phase>=2 {
            if ds_list_find_index(global.autoscrolls,firstscroll) < ds_list_size(global.autoscrolls) - 2 {
                if x<view_xview[0]+16 && hspd<0 {hspd=0}
                if x>view_xview[0]+624 && hspd>0 {hspd=0}
            }
        }

        if hspd>-0.04 && hspd<0.04 {hspd=0}

        if ((!is_button_pressed('right') && !is_button_pressed('left')) || schylanie=1) && (y<global.water_level || global.lava) && !stuck {hspd=hspd/1.05}
        if ((!is_button_pressed('right') && !is_button_pressed('left')) || schylanie=1) && (y>=global.water_level && !global.lava) && !stuck {hspd=hspd/1.03}

        //这里是横向碰撞判定，注意代码顺序调整

        if global.modifiedmov=1 && global.rodzajmaria != 5 {
            //然而还需要考虑滑蹲的问题
            if slide = 0 && !stuck {
                nextx = x+hspd
                if hspd != 0 && x>=view_xview[0]+16 && x<=view_xview[0]+624 && (place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) && global.rodzajmaria != 5 && teststep3=0 { teststep3 = 1;}
                while teststep3 = 1 {
                    if (place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) { nextx -= sign(hspd);looplimit+=1; } else { teststep3 = 0 ; x = nextx; looplimit=0; }
                    if looplimit>=16 {teststep3=0; stuck=1;looplimit=0;}
                }
                nextx2 = x+wxspeed
                if wxspeed != 0 && x>=view_xview[0]+16 && x<=view_xview[0]+624 && (place_meeting(nextx2,y,obj_wall) || place_meeting(nextx2,y,o_pointblock)) && global.rodzajmaria != 5 && teststep233=0 { teststep233 = 1; }
                while teststep233 = 1 {
                    if (place_meeting(nextx2,y,obj_wall) || place_meeting(nextx2,y,o_pointblock)) { nextx2 -= sign(wxspeed);looplimit+=1; } else { teststep233 = 0 ; x = nextx2;looplimit=0; }
                    if looplimit>=16 {teststep233=0; stuck=1;fuckstuck=1;looplimit=0;}
                }
            } else if slide=1 {
                if uabff=0 { if x<uabfx { uabf=1 } else { uabf=-1 }; uabff=1 }
                if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {hspd=0 ; x+=uabf } else { slide = 0;uabff=0;uabf=0 }
            } else if slide=2 { if !(place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) { slide=0;uabff=0;uabf=0 } }


        }

        if global.modifiedmov=0 {
            if global.bowser_phase<=1 {
                if hspd>0 && x<view_xview[0]+624 {x+=hspd}
                if hspd<0 && x>view_xview[0]+16 {x+=hspd}
            } else {
                if hspd<>0 {x+=hspd}
            }
        } else {
            nextx = x+hspd
            if global.bowser_phase<=1 {
                if hspd>0 && x<view_xview[0]+624 && !(place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) {x+=hspd}
                if hspd<0 && x>view_xview[0]+16 && !(place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) {x+=hspd}
            } else {
                if hspd>0 && !(place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) {x+=hspd}
                if hspd<0 && !(place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) {x+=hspd}
            }}
        if global.rodzajmaria=5 && hspd<>0 {hspd=0}

/*
if szybkosc>0 {

// testowanie stepa "dolnego" - schodzenie z g髍ki

if !place_meeting(x,y+1,obj_wall) && grawitacja=0 {sekwencja=1; teststep=1}
while teststep=1 && place_meeting(x,y+10+szybkosc,obj_wall) && steploop<10+szybkosc
{steploop+=1; if place_meeting(x,y+steploop,obj_wall) {y+=steploop-1; teststep=0; steploop=0; sekwencja=0}}
if teststep=1 && !place_meeting(x,y+10+szybkosc,obj_wall) {teststep=0; testloop=0}

// testowanie stepa "gornego" - wchodzenie pod g髍k?
if grawitacja=0 && place_meeting(x,y,obj_wall) && !place_meeting(x,y-3-szybkosc,obj_wall) && sekwencja=0 && teststep2=0 {teststep2=1}
while teststep2=1 && steploop2<3+szybkosc {steploop2+=1; if !place_meeting(x,y-steploop2,obj_wall) {y-=steploop2; steploop2=0; teststep2=0}}
}

if szybkosc<0
{

if !place_meeting(x,y+1,obj_wall) && grawitacja=0 {sekwencja=1; teststep=1}
while teststep=1 && place_meeting(x,y+10+szybkosc,obj_wall) && steploop<10+szybkosc
{steploop+=1; if place_meeting(x,y+steploop,obj_wall){y+=steploop-1; teststep=0; steploop=0; sekwencja=0}}
if teststep=1 && !place_meeting(x,y+10+szybkosc,obj_wall) {teststep=0; testloop=0}


// testowanie stepa "gornego" - wchodzenie pod g髍k?
if grawitacja=0 && place_meeting(x,y,obj_wall) && !place_meeting(x,y-(3+szybkosc*-1),obj_wall) && sekwencja=0 && teststep2=0 {teststep2=1;}
while teststep2=1 && steploop2<3+szybkosc*-1 {steploop2+=1; if !place_meeting(x,y-steploop2,obj_wall) {y-=steploop2; steploop2=0; teststep2=0}}

}
*/

        // poprawianie pozycji X - tak aby gracz nie wbijal sie w bloki

        if global.modifiedmov=0 {
            if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock))&& teststep3=0 && hspd>0 && global.rodzajmaria<>5 {teststep3=1; steploop3=round(hspd)}
            while teststep3=1 {if (place_meeting(x+steploop3,y,obj_wall) || place_meeting(x+steploop3,y,o_pointblock)) {steploop3-=1;} if !place_meeting(x+steploop3,y,obj_wall) && !place_meeting(x+steploop3,y,o_pointblock){teststep3=0; x+=steploop3}}

            // poprawianie pozycji X - tak aby gracz nie wbijal sie w bloki
            if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock))&& teststep3=0 && hspd<0 && global.rodzajmaria<>5 {teststep3=1; steploop3=hspd}
            while teststep3=1 {if (place_meeting(x+steploop3,y,obj_wall) || place_meeting(x+steploop3,y,o_pointblock)) {steploop3+=1;} if !place_meeting(x+steploop3,y,obj_wall) && !place_meeting(x+steploop3,y,o_pointblock){teststep3=0; x+=steploop3}}
        }

    }

}
