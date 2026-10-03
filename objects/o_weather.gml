#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Init
// 镜头瞬移信号基准（计算见 Step_0 顶部）：所有天气粒子共用一次全局位移计算，
// 取代旧版 o_rain/o_snow/o_fallingstar 各自 with(o_rain) 互相广播的 O(n²) 逻辑
global.rain_view_x = view_xview[0] + 320;
global.rain_view_y = view_yview[0] + 240;
global.rain_shift_x = 0;
global.rain_shift_y = 0;

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
// 光源白名单整表在 light_bits_build.gml（位号语义与编辑器灯泡一一对应），这里只负责建表
light_bits_build();
// 岩浆层的那一盏灯是无条件创建的（不受 lightobject 位控制）
instance_create(0, 0, o_lightlava);

#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 镜头瞬移信号：视口单帧位移超过 128（水管传送等）时记录本帧位移量到全局。
// o_weather 先于它创建的所有粒子执行 Step（GM8 实例按 id 升序），粒子在各自 Step 中应用该信号。
global.rain_shift_x = 0;
global.rain_shift_y = 0;
if abs((view_xview[0] + 320) - global.rain_view_x) > 128 { global.rain_shift_x = (view_xview[0] + 320) - global.rain_view_x; }
if abs((view_yview[0] + 240) - global.rain_view_y) > 128 { global.rain_shift_y = (view_yview[0] + 240) - global.rain_view_y; }
global.rain_view_x = view_xview[0] + 320;
global.rain_view_y = view_yview[0] + 240;

// 下雨
if global.rainy > 0 {
    rainy_position_x = view_xview[0] - 32 + random(640 + 160 *2);
    rainy_position_y = view_yview[0] - 32;

    switch (global.rainy) {
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
if global.fallingstars > 0 {
    fallingstars_position_x = view_xview[0] - 32 + random(640 + 160 *2);
    fallingstars_position_y = view_yview[0] - 32;

    switch (global.fallingstars) {
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
if global.snowy > 0 {
    snowy_position_x = view_xview[0] - 32 + random(640 + 480 *2);
    snowy_position_y = view_yview[0] - 32;

    switch (global.snowy) {
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
            case 0: tmp2=sound_play(snd_thunder1); sound_volume(snd_thunder1,global.game_volume); break;
            case 1: tmp2=sound_play(snd_thunder1); sound_volume(snd_thunder1,global.game_volume); break;
            case 2: tmp2=sound_play(snd_thunder1); sound_volume(snd_thunder1,global.game_volume); break;
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
        // ds_list_size 提出循环条件，避免每圈重复查询列表长度
        light_count = ds_list_size(global.light_obj_list);
        for (i = 0; i < light_count; i += 1) {
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
