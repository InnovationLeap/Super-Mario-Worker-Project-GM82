#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
create=1
setonce=0
ani_count=0

// 发光具体位置微调见 o_scenery 的 step 事件
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !setonce {

    with(o_scenery) {

        switch(image_index) {
            //把下面5行复制一份改改就OK
        case 0: //这个值应对应景物编号-1
            {
                sprite_index=s_cloudscenery //景物动画
                image_speed=0.1
                break;
            }

        case 1: //这个值应对应景物编号-1
            {
                sprite_index=s_grass //景物动画
                image_speed=0.1
                break;
            }

        case 6: //这个值应对应景物编号-1
            {
                sprite_index=s_clouddark
                image_speed=0.1
                break;
            }

        case 7: //这个值应对应景物编号-1
            {
                sprite_index=s_grassdark
                image_speed=0.1
                break;
            }

        case 12: //这个值应对应景物编号-1
            {
                sprite_index=s_cloud2 //景物动画
                image_speed=0.1
                break;
            }

        case 13: //这个值应对应景物编号-1
            {
                sprite_index=s_light //景物动画
                image_speed=0.2
                break;
            }

        case 21: //这个值应对应景物编号-1
            {
                sprite_index=s_grassaunt //景物动画
                image_speed=0.1
                break;
            }

        case 24: //这个值应对应景物编号-1
            {
                sprite_index=s_freefuck //景物动画
                image_speed=0.1
                break;
            }

        case 30: //这个值应对应景物编号-1
            {
                sprite_index=s_grassdesert //景物动画
                image_speed=0.1
                break;
            }

        case 33: //这个值应对应景物编号-1
            {
                sprite_index=s_clouddesert //景物动画
                image_speed=0.1
                break;
            }

        case 34: //这个值应对应景物编号-1
            {
                sprite_index=s_lavafall //景物动画
                image_speed=1
                break;
            }

        case 36: //这个值应对应景物编号-1
            {
                sprite_index=s_cloudgrey //景物动画
                image_speed=0.1
                break;
            }

        case 37: //这个值应对应景物编号-1
            {
                sprite_index=s_rotocenter //景物动画
                if global.layerord=0 {depth=-22}
                if global.layerord=1 {depth=-20}
                if global.layerord=2 {depth=-21}//景深（个鬼
                break;
            }

        case 38: //这个值应对应景物编号-1
            {
                sprite_index=s_corala //景物动画
                break;
            }

        case 39: //这个值应对应景物编号-1
            {
                sprite_index=s_coralb //景物动画
                break;
            }

        case 40: //这个值应对应景物编号-1
            {
                sprite_index=s_coralc //景物动画
                break;
            }

        case 43: { sprite_index=s_tankwheel; tk_base=0; image_index=tk_base; image_speed=0; break; } // 坦克轮子-左（景物 44）：帧 0-2
        case 44: { sprite_index=s_tankwheel; tk_base=3; image_index=tk_base; image_speed=0; break; } // 坦克轮子-中（景物 45）：帧 3-5
        case 45: { sprite_index=s_tankwheel; tk_base=6; image_index=tk_base; image_speed=0; break; } // 坦克轮子-右（景物 46）：帧 6-8
        }

    }

    setonce=1
}

// ===== 坦克轮子（景物 44）：默认静止；镜头被 autoscroll 控制时随滚屏速度转动 =====
if !variable_global_exists('tk_prev_vx') {
    global.tk_prev_vx = view_xview[0]
    global.tk_prev_vy = view_yview[0]
    global.tk_phase = 0
    global.tk_cam_spd = 0
}
if !variable_global_exists('bowser_phase') { global.bowser_phase = 0 }
// 本帧镜头位移量
global.tk_cam_spd = point_distance(0, 0, view_xview[0] - global.tk_prev_vx, view_yview[0] - global.tk_prev_vy)
global.tk_prev_vx = view_xview[0]
global.tk_prev_vy = view_yview[0]
// 只有强滚（autoscroll）期间才转动
if global.bowser_phase < 2 { global.tk_cam_spd = 0 }
with (o_scenery) {
    if sprite_index = s_tankwheel {
        image_speed = 0
        // 帧 = 自身固定基底 tk_base(0/3/6) + 全局相位帧。绝不从 image_index 反推窗口基底：
        // 相位一旦跳变，floor(image_index/3)*3 会把轮子永久锁死到别类型的窗口（串帧且不可自愈）。
        image_index = tk_base + floor(global.tk_phase)
    }
}
// 相位累加（3 帧一循环），系数 0.12 ≈ 每 8px 镜头位移走 1 帧
if global.bowser_phase >= 2 {
    global.tk_phase += global.tk_cam_spd * 0.12
    // 规整到 [0,3)：用倍数减，单帧大位移也不会让 floor(tk_phase) 冲出 0/1/2
    global.tk_phase = global.tk_phase - 3 * floor(global.tk_phase / 3)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with(o_bgmchange) {

    if linked=1 {
        tmp2 = instance_place(x-32,y,o_region);
        tmp2.linked=1
        tmp2.bgm_change = bgm_change;
        tmp2.bgm = bgm;
        tmp2.bgp_change = bgp_change;
        tmp2.bgp = bgp;
        tmp2.height = height;
        tmp2.weather_change = weather_change;
        tmp2.rainy = rainy;
        tmp2.fallingstars = fallingstars;
        tmp2.snowy = snowy;
        tmp2.thunder = thunder;
        tmp2.windy = windy;
        tmp2.darkness = darkness;
        tmp2.brightness = brightness;
        instance_destroy();
    }

    if linked=2 {
        tmp2 = instance_place(x-32,y,o_bowser)
        tmp2.bgm_change = bgm_change;
        tmp2.bgm = bgm;
        tmp2.bgp_change = bgp_change;
        tmp2.bgp = bgp;
        tmp2.height = height;
        tmp2.weather_change = weather_change;
        tmp2.rainy = rainy;
        tmp2.fallingstars = fallingstars;
        tmp2.snowy = snowy;
        tmp2.thunder = thunder;
        tmp2.windy = windy;
        tmp2.darkness = darkness;
        tmp2.brightness = brightness;
        instance_destroy();
    };


}

with(o_checkpoint) {

    if a=0 {
        if global.checkpoint>0 {
            for (k=1;k<=global.checkpoint;k+=1) {
                if x=global.check[k,0]-16 && y=global.check[k,1]-32 {sprite_index=s_checkpoint2}
                if k=global.checkpoint {o_marker.x=global.check[k,0];o_marker.y=global.check[k,1];o_marker.checkpointdetect=1;}
            }
            a=1;
        } else {a=1}
    }

}

ani_count+=1;
if ani_count>=30 {ani_count=0;}
/*with(o_marker){

}*/
