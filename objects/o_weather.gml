#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Init
// Rainy
rainy_timer = 0;

// Falling Stars
falling_timer = 0;

// Snowy
snowy_timer = 0;

// Thunder
thunder_timer = 0;
thunder_cd = 150 + irandom(50);

// Windy
wind = instance_create(0, 0, o_wind);
wind_offset_x = 0;

// Darkness - 绘图（Draw）部分详见 o_marker 的 Draw 事件靠前位置
surface_id = surface_create(640, 480);
dark_alpha = global.darkness / 9.0;
//fofo_darkness = instance_create(0, 0, o_darkness);

// Brightness
ds_list_clear(global.light_obj_list);
//global.light_obj_list = ds_list_create();

// Light Object List
if (string_copy(global.lightobject, 1, 1) = '1') {ds_list_add(global.light_obj_list, o_marker);}
if (string_copy(global.lightobject, 2, 1) = '1') {ds_list_add(global.light_obj_list, o_ice);}
if (string_copy(global.lightobject, 3, 1) = '1') {ds_list_add(global.light_obj_list, o_windas);}
if (string_copy(global.lightobject, 4, 1) = '1') {ds_list_add(global.light_obj_list, o_lightnighttree);}
if (string_copy(global.lightobject, 5, 1) = '1') {ds_list_add(global.light_obj_list, o_lightbignighttree);}
if (string_copy(global.lightobject, 6, 1) = '1') {ds_list_add(global.light_obj_list, o_lightbrightlight);}
if (string_copy(global.lightobject, 7, 1) = '1') {ds_list_add(global.light_obj_list, o_lightpotrait);}
if (string_copy(global.lightobject, 8, 1) = '1') {ds_list_add(global.light_obj_list, o_lightlavafall);}
if (string_copy(global.lightobject, 9, 1) = '1') {ds_list_add(global.light_obj_list, o_lightrotocenter);}

if (string_copy(global.lightobject, 10, 1) = '1') {
    ds_list_add(global.light_obj_list, o_pointblock);
    ds_list_add(global.light_obj_list, o_waterchanger);
    ds_list_add(global.light_obj_list, o_messageblock);
    ds_list_add(global.light_obj_list, o_switch);
    //ds_list_add(global.light_obj_list, o_yinyang);
}
if (string_copy(global.lightobject, 11, 1) = '1') {
    ds_list_add(global.light_obj_list, o_bonusmush);
    ds_list_add(global.light_obj_list, o_newmush);
}

if (string_copy(global.lightobject, 12, 1) = '1') {ds_list_add(global.light_obj_list, o_bonusflower);}
if (string_copy(global.lightobject, 13, 1) = '1') {ds_list_add(global.light_obj_list, o_bonusburak);}
if (string_copy(global.lightobject, 14, 1) = '1') {ds_list_add(global.light_obj_list, o_bonuslui);}
if (string_copy(global.lightobject, 15, 1) = '1') {ds_list_add(global.light_obj_list, o_bonusstar);}

if (string_copy(global.lightobject, 16, 1) = '1') {
    ds_list_add(global.light_obj_list, o_bonus1up);
    ds_list_add(global.light_obj_list, o_new1up);
}

if (string_copy(global.lightobject, 17, 1) = '1') {ds_list_add(global.light_obj_list, o_pointblockpodbijacz);}
if (string_copy(global.lightobject, 18, 1) = '1') {ds_list_add(global.light_obj_list, o_point);}
if (string_copy(global.lightobject, 19, 1) = '1') {ds_list_add(global.light_obj_list, o_lightgoomba);}
if (string_copy(global.lightobject, 20, 1) = '1') {ds_list_add(global.light_obj_list, o_troopa);}
if (string_copy(global.lightobject, 21, 1) = '1') {ds_list_add(global.light_obj_list, o_troopared);}
if (string_copy(global.lightobject, 22, 1) = '1') {ds_list_add(global.light_obj_list, o_troopafly);}

if (string_copy(global.lightobject, 23, 1) = '1') {
    ds_list_add(global.light_obj_list, o_kolcozwierz);
    ds_list_add(global.light_obj_list, o_lakitubomb);
}
if (string_copy(global.lightobject, 24, 1) = '1') {
    ds_list_add(global.light_obj_list, o_pirania);
    ds_list_add(global.light_obj_list, o_piraniashot);
}
if (string_copy(global.lightobject, 25, 1) = '1') {
    ds_list_add(global.light_obj_list, o_piraniainv);
    ds_list_add(global.light_obj_list, o_piraniainvshot);
}

if (string_copy(global.lightobject, 26, 1) = '1') {ds_list_add(global.light_obj_list, o_lakitu);}

if (string_copy(global.lightobject, 27, 1) = '1') {
    ds_list_add(global.light_obj_list, o_cannon);
    ds_list_add(global.light_obj_list, o_nonnac);
}
if (string_copy(global.lightobject, 28, 1) = '1') {
    ds_list_add(global.light_obj_list, o_rybeka);
    ds_list_add(global.light_obj_list, o_rybeka2);
    ds_list_add(global.light_obj_list, o_rybeka3);
}
if (string_copy(global.lightobject, 29, 1) = '1') {
    ds_list_add(global.light_obj_list, o_rybekb);
    ds_list_add(global.light_obj_list, o_rybekb2);
    ds_list_add(global.light_obj_list, o_rybekb3);
}
if (string_copy(global.lightobject, 30, 1) = '1') {
    ds_list_add(global.light_obj_list, o_rybekc);
    ds_list_add(global.light_obj_list, o_rybekc3);
}
if (string_copy(global.lightobject, 31, 1) = '1') {
    ds_list_add(global.light_obj_list, o_rybekd3);
    ds_list_add(global.light_obj_list, o_rybekd);
}

if (string_copy(global.lightobject, 32, 1) = '1') {ds_list_add(global.light_obj_list, o_bonusdead);}
if (string_copy(global.lightobject, 33, 1) = '1') {ds_list_add(global.light_obj_list, o_miejscowapirania);}
if (string_copy(global.lightobject, 34, 1) = '1') {ds_list_add(global.light_obj_list, o_lava);}
if (string_copy(global.lightobject, 35, 1) = '1') {ds_list_add(global.light_obj_list, o_hammerbros);}
if (string_copy(global.lightobject, 36, 1) = '1') {ds_list_add(global.light_obj_list, o_wiatrakanim);}
if (string_copy(global.lightobject, 37, 1) = '1') {ds_list_add(global.light_obj_list, o_lavaball);}
if (string_copy(global.lightobject, 38, 1) = '1') {ds_list_add(global.light_obj_list, o_kolec);}
if (string_copy(global.lightobject, 39, 1) = '1') {ds_list_add(global.light_obj_list, o_zgniatacz);}
if (string_copy(global.lightobject, 40, 1) = '1') {ds_list_add(global.light_obj_list, o_kuppa);}

if (string_copy(global.lightobject, 41, 1) = '1') {
    ds_list_add(global.light_obj_list, o_fahlee);
    ds_list_add(global.light_obj_list, o_fakitubomb);
}
if (string_copy(global.lightobject, 42, 1) = '1') {
    ds_list_add(global.light_obj_list, o_cannong);
    ds_list_add(global.light_obj_list, o_gnonnac);
}

if (string_copy(global.lightobject, 43, 1) = '1') {ds_list_add(global.light_obj_list, o_firesister);}
if (string_copy(global.lightobject, 44, 1) = '1') {ds_list_add(global.light_obj_list, o_lavadier);}
if (string_copy(global.lightobject, 45, 1) = '1') {ds_list_add(global.light_obj_list, o_boo);}
if (string_copy(global.lightobject, 46, 1) = '1') {ds_list_add(global.light_obj_list, o_buzzybeetle);}
if (string_copy(global.lightobject, 47, 1) = '1') {ds_list_add(global.light_obj_list, o_troopaflyred);}
if (string_copy(global.lightobject, 48, 1) = '1') {ds_list_add(global.light_obj_list, o_troopablue);}
if (string_copy(global.lightobject, 49, 1) = '1') {ds_list_add(global.light_obj_list, o_troopabluefly);}
if (string_copy(global.lightobject, 50, 1) = '1') {ds_list_add(global.light_obj_list, o_elecoral);}
if (string_copy(global.lightobject, 51, 1) = '1') {ds_list_add(global.light_obj_list, o_mfc);}
if (string_copy(global.lightobject, 52, 1) = '1') {ds_list_add(global.light_obj_list, o_troopagold);}
if (string_copy(global.lightobject, 53, 1) = '1') {ds_list_add(global.light_obj_list, o_troopaflygold);}
if (string_copy(global.lightobject, 54, 1) = '1') {ds_list_add(global.light_obj_list, o_rotostill);}

if (string_copy(global.lightobject, 55, 1) = '1') {
    ds_list_add(global.light_obj_list, o_troopashell);
    ds_list_add(global.light_obj_list, o_troopashell2);
}
if (string_copy(global.lightobject, 56, 1) = '1') {
    ds_list_add(global.light_obj_list, o_piraniablue);
    ds_list_add(global.light_obj_list, o_piraniablueshot);
}
if (string_copy(global.lightobject, 57, 1) = '1') {
    ds_list_add(global.light_obj_list, o_piraniagrey);
    ds_list_add(global.light_obj_list, o_piraniagreyshot);
}

if (string_copy(global.lightobject, 58, 1) = '1') {ds_list_add(global.light_obj_list, o_fakitu);}

if (string_copy(global.lightobject, 59, 1) = '1') {
    ds_list_add(global.light_obj_list, o_fireball);
    ds_list_add(global.light_obj_list, o_fireexplode);
}
if (string_copy(global.lightobject, 60, 1) = '1') {ds_list_add(global.light_obj_list, o_burax);}
if (string_copy(global.lightobject, 61, 1) = '1') {ds_list_add(global.light_obj_list, o_lightmarker);}

if (string_copy(global.lightobject, 62, 1) = '1') {
    ds_list_add(global.light_obj_list, o_enemyfire);
    ds_list_add(global.light_obj_list, o_fireexplode);
}
if (string_copy(global.lightobject, 63, 1) = '1') {ds_list_add(global.light_obj_list, o_cannoni);}
if (string_copy(global.lightobject, 64, 1) = '1') {ds_list_add(global.light_obj_list, o_mlotekmalpki);}
if (string_copy(global.lightobject, 65, 1) = '1') {ds_list_add(global.light_obj_list, o_kuppafire);}
if (string_copy(global.lightobject, 66, 1) = '1') {ds_list_add(global.light_obj_list, o_cannonig);}

if (string_copy(global.lightobject, 67, 1) = '1') {
    ds_list_add(global.light_obj_list, o_fff);
    ds_list_add(global.light_obj_list, o_fireexplode);
}

if (string_length(global.lightobject) >= 68) {
    if (string_copy(global.lightobject, 68, 1) = '1') {ds_list_add(global.light_obj_list, o_lightlava);}
}
instance_create(0, 0, o_lightlava);

if (string_length(global.lightobject) >= 69) {
    if (string_copy(global.lightobject, 69, 1) = '1') {ds_list_add(global.light_obj_list, o_yinyang);}
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 下雨
if global.rainy > 0
{
    rainy_position_x = view_xview[0] - 32 + random(640 + 160 *2);
    rainy_position_y = view_yview[0] - 32;

    switch (global.rainy)
    {
        case 1:
            // Rainy Level 1
            if rainy_timer > 0 { rainy_timer -= 1; }
            if rainy_timer = 0 { instance_create(rainy_position_x, rainy_position_y, o_rain); rainy_timer = 14; }
            break;

        case 2:
            // Rainy Level 2
            if rainy_timer > 0 { rainy_timer -= 1; }
            if rainy_timer = 0 { instance_create(rainy_position_x, rainy_position_y, o_rain); rainy_timer = 4; }
            break;

        case 3:
            // Rainy Level 3
            if rainy_timer > 0 { rainy_timer -= 1; }
            instance_create(rainy_position_x, rainy_position_y, o_rain);
            break;

        case 4:
            // Rainy Level 4
            repeat (6) instance_create(rainy_position_x, rainy_position_y, o_rain);
            break;

        case 5:
            // Rainy Level 5
            repeat (16) instance_create(rainy_position_x + random(640 + 128 *2), rainy_position_y, o_rain);
            break;
    }
}

// 刘醒（流星）
if global.fallingstars > 0
{
    fallingstars_position_x = view_xview[0] - 32 + random(640 + 160 *2);
    fallingstars_position_y = view_yview[0] - 32;

    switch (global.fallingstars)
    {
        case 1:
            // Falling Stars Level 1
            if falling_timer > 0 { falling_timer -= 1; }
            if falling_timer = 0 { instance_create(fallingstars_position_x, fallingstars_position_y, o_fallingstar); falling_timer = 14; }
            break;

        case 2:
            // Falling Stars Level 2
            if falling_timer > 0 { falling_timer -= 1; }
            if falling_timer = 0 { instance_create(fallingstars_position_x, fallingstars_position_y, o_fallingstar); falling_timer = 4; }
            break;

        case 3:
            // Falling Stars Level 3
            if falling_timer > 0 { falling_timer -= 1; }
            instance_create(fallingstars_position_x, fallingstars_position_y, o_fallingstar);
            break;

    }
}

// 下雪
if global.snowy > 0
{
    snowy_position_x = view_xview[0] - 32 + random(640 + 480 *2);
    snowy_position_y = view_yview[0] - 32;

    switch (global.snowy)
    {
        case 1:
            // Snowy Level 1
            if snowy_timer > 0 { snowy_timer -= 1; }
            if snowy_timer = 0 { instance_create(snowy_position_x, snowy_position_y, o_snow); snowy_timer = 14; }
            break;

        case 2:
            // Snowy Level 2
            if snowy_timer > 0 { snowy_timer -= 1; }
            if snowy_timer = 0 { instance_create(snowy_position_x, snowy_position_y, o_snow); snowy_timer = 4; }
            break;

        case 3:
            // Snowy Level 3
            if snowy_timer > 0 { snowy_timer -= 1; }
            instance_create(snowy_position_x, snowy_position_y, o_snow);
            break;

        case 4:
            // Snowy Level 4
            repeat (6) instance_create(snowy_position_x, snowy_position_y, o_snow);
            break;

        case 5:
            // Snowy Level 5
            repeat (16) instance_create(snowy_position_x + random(640 + 128 *2), snowy_position_y, o_snow);
            break;
    }
}

// 闪电
if global.thunder > 0 {
    thunder_timer += 1;
    if (thunder_timer > thunder_cd) {
        thunder_timer = 0;
        thunder_cd = 150 + irandom(50);
        r = irandom(100);
        if (r < 70) {
            fofo_thunder = instance_create(0, 0, o_thunder);
            fofo_thunder.thunder = true;
            random_sound = irandom(2);
            switch (random_sound) {
                case 0: fofo=sound_play(snd_thunder1); sound_volume(snd_thunder1,global.glosnosc); break;
                case 1: fofo=sound_play(snd_thunder1); sound_volume(snd_thunder1,global.glosnosc); break;
                case 2: fofo=sound_play(snd_thunder1); sound_volume(snd_thunder1,global.glosnosc); break;
            }
        }
    }
}

// 刮风
wind.x = view_xview[0] + wind_offset_x;
if (wind_offset_x < -512) {wind_offset_x += 512;}
wind_offset_x -= speed_wind;
wind.y = view_yview[0];

switch (global.windy) {
    case 0: wind.visible = false; break;
    case 1: speed_wind = 3.0; wind.visible = true; break;
    case 2: speed_wind = 8.0; wind.visible = true; break;
    case 3: speed_wind = 18.0; wind.visible = true; break;
}

// 黑暗 & 光照 - 具体代码见 Draw 事件中
//fofo_darkness.x = view_xview[0]; fofo_darkness.y = view_yview[0];
//fofo_darkness.image_alpha = global.darkness / 9.0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// surface 绘制必须在 step 事件内
if (!surface_exists(surface_id)) {
    // 若Surface失效，重新创建并初始化
    surface_id = surface_create(640, 480);
}

var scale;
switch (global.brightness) {
    case 0: scale = 0; break;
    case 1: scale = 0.25; break;
    case 2: scale = 0.5; break;
    case 3: scale = 1; break;
    case 4: scale = 1.8; break;
    case 5: scale = 3; break;
    default: scale = 0;
}

if (fofo_thunder.thunder) {
    dark_alpha = 0.0;
    fofo_thunder.thunder = false;
}
dark_alpha = min(global.darkness / 9.0, dark_alpha + 0.06); // 黑暗透明度

if (global.darkness > 0) {
if surface_exists(surface_id) {
    // 切换到Surface绘图
    surface_set_target(surface_id);
    draw_clear_alpha(c_black, dark_alpha);  // 设置黑暗透明度

    //draw_set_color(c_black);
    draw_set_blend_mode(bm_subtract);
    for (i = 0; i < ds_list_size(global.light_obj_list); i += 1) {
        light_instance = ds_list_find_value(global.light_obj_list, i);
        if instance_exists(light_instance) {
            if (light_instance <> o_lightlava) {
                with (light_instance) {
                    draw_sprite_ext(s_lightcircle, 0, x + light_x - view_xview[0], y + light_y - view_yview[0], scale * light_radius, scale * light_radius, 0, c_white, 1);
                }
            }
            // Fluid Lava Light
            else {
                with (light_instance) {
                    draw_sprite_ext(s_lightlava, 0, x + light_x - view_xview[0], y + light_y - view_yview[0], 1, scale * light_radius, 0, c_white, 1);
                }
                //draw_sprite_ext(s_lightlava, 0, view_xview[0] + 320 - view_xview[0], global.poziomwody - view_yview[0], 1, scale * light_radius, 0, c_white, 1);
            }
        }
    }
    draw_set_blend_mode(bm_normal);
    // 恢复屏幕绘图
    surface_reset_target();
}
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

// 天气/Weather：黑暗等级/Dark Level/Darkness Draw & 光源/照明/Lighting/Brightness

// 可发光物体设置见初始化事件

if (surface_exists(surface_id) && (global.darkness > 0)) {
    draw_surface_ext(surface_id, view_xview[0], view_yview[0], 1, 1, 0, c_white, 1)
}
