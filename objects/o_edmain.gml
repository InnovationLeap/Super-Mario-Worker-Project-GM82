#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

fw_release_cache(); //信息转字体缓存清理
blocks_palette_data();
background_palette_data();
bgm_palette_data();
ed_autopair_data();


/*test = transB(12005)
test2 = transB(23010)
test3 = transB(32000)
test4 = transB(15324)
test5 = transB(2324)*/
sizechange=0
x_trans=0
y_trans=0
x_new=0
y_new=0
global.autopair=1
global.fotel=0
global.fotel2=0
global.deletemode=-1

SXMS_C_Stop()
delay_tick=0
drinkability=0 //当前选择的类型（我就不信有人用这个当变量）
water_alpha=0 //蛤？
cloud_drift=0 //蛤？？
bg_selecting=0
backselect=0
bgm_select=0
bgm_prev=0
bgm_play=0
mousepress=0
defMessage=''
global.picking = false

if variable_global_exists('warpnum') {} else {global.warpnum=0}

wlaczony=1
efekt=0
opcja=0
option_open=0
clicked=0
scroolx=320
scrooly=240
placed=0
place_code=0
place_code2=0
costawia2b=0
place_code3=0
place_code4=0
costawia4b=0
costawia4c=0
place_code5=0
place_code6=0
autopair=0
autopaircheck=0
backgroundpage=0
blockpage=-1
bgmpage=0
bonus_page=0 // raccoon leaf page (0=standard, 1=leaf items)

arrayetapu=0
//initializuj=0

for (i=0; i<room_width/32; i+=1) {
    for (a=0; a<room_height/32; a+=1) {
        arrayetapu[i,a]=0


    }

}
sampelwyboru1=0


tool_mode=0
tmp2=0


menu_open=0


cyferki=font_add_sprite(s_edfonts,ord('!'),1,0) // nastaw fonty


loadcheck1=0 // zmienna do wgrywania
loadcheck2=0 // zmienna do wgrywania
loadcheck3=0
loadcheck4=0
// NET-SYNC: 房主 Load 后待发全量同步标志（全局变量，room_restart 后保留；Load_Script_Masta 完成后触发）
if !variable_global_exists('net_pending_sync') {
    global.net_pending_sync = 0
}
// NET-SYNC: 句柄自愈尝试计数与告警标志（Create 初始化，Step 中用于限制重建次数）
if !variable_global_exists('net_selfheal_try') {
    global.net_selfheal_try = 0
}
if !variable_global_exists('net_selfheal_warned') {
    global.net_selfheal_warned = 0
}
shell_inst2=0

instance_create(0,0,o_edwallsdrawer)
cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0)

scroll=0
drinka=0
drinkb=0
drinkc=0
drinkd=0

global.yinyangcolor=0
global.imitater=1
global.ledge_type = 0
setting_mode=0
resetting = 0
net_water_dirty = 0
net_water_throttle = -1000000
global.background=real(global.background)
global.local_background = global.background
global.local_muzyka = global.bgm_id
inedit=1
global.water_change_type=0
global.preview=-1
show_solid=1
global.shell_type=0
global.spike_type=0

cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0)

draw_set_halign(fa_left)

ed_cp_index=-1 //PageUp/PageDown定位起点/CP的索引

listscroll = 0 //自定义音乐翻页变量

/*
// 天气（场景控制元件参数保留）
foforainy = global.rainy;
fofofallingstars = global.fallingstars;
fofosnowy = global.snowy;
fofothunder = global.thunder;
fofowindy = global.windy;
fofodarkness = global.darkness;
fofobrightness = global.brightness;
*/
globalvar marker_rainy;
globalvar marker_fallingstars;
globalvar marker_snowy;
globalvar marker_thunder;
globalvar marker_windy;
globalvar marker_darkness;
globalvar marker_brightness;

set_light_mode = false;
set_light_icon_alpha = 0.5;

// 视角缩放
zoom_ratio = 1;
ratio_level = 0;
last_ratio_level = ratio_level;

// 选区模式状态
global.ed_region_active = false
global.ed_region_state = 0 // 0=idle, 1=selecting, 2=confirmed, 3=moving
global.ed_region_type = 1 // 1=blocks, 2=buddies, 3=scenery, 4=marks, 5=bonus, 0=all
global.ed_region_mode = 0 // 0=any, 1=full, 2=half
global.ed_region_sx = 0
global.ed_region_sy = 0
global.ed_region_ex = 0
global.ed_region_ey = 0
global.ed_region_mx = 0
global.ed_region_my = 0
global.ed_region_orig_x = 0
global.ed_region_orig_y = 0
global.ed_region_blk_orig = -1
global.ed_region_blk_keys = -1
global.ed_region_blk_keys2 = -1
global.ed_region_scratch = -1
global.ed_region_last_dcol = 0
global.ed_region_last_drow = 0
global.ed_region_list = -1
global.ed_region_blk = -1
global.ed_region_orig_mask = 0
global.ed_region_copymode = false
global.ed_region_block_panel = false
global.ed_region_saved_costawia = 0
global.ed_region_saved_costawia2 = 0
global.ed_region_saved_costawia3 = 0
global.ed_region_saved_costawia4 = 0
global.ed_region_saved_costawia5 = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// NET-SYNC: 测关中 o_edmain 假死存活（数据载体：arrayetapu），Step 空转
if variable_global_exists('testmode') {
    if global.testmode = 1 {
        exit
    }
}
global.bgm_id=real(global.bgm_id)
// 音乐开关：按下时切换状态机，停止时立即 SXMS_C_Stop，恢复时在状态机完成时播放
if keyboard_check_pressed(global.key_musictoggle) && global.musicon=1 {SXMS_C_Stop();global.musicon=2}
if keyboard_check_pressed(global.key_musictoggle) && global.musicon=0 {global.musicon=3}
if global.musicon=2 && !keyboard_check_pressed(global.key_musictoggle) {global.musicon=0;mm_stop_all_ext()}
if global.musicon=3 && !keyboard_check_pressed(global.key_musictoggle) {
    global.musicon=1
    ed_play_bgm(global.local_muzyka)
}

global.autopair=real(global.autopair)
if keyboard_check_pressed(global.key_autopair) && global.autopair=1 {global.autopair=2}
if keyboard_check_pressed(global.key_autopair) && global.autopair=0 {global.autopair=3}
if global.autopair=2 && !keyboard_check_pressed(global.key_autopair) {global.autopair=0}
if global.autopair=3 && !keyboard_check_pressed(global.key_autopair) {global.autopair=1}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.parallax<>view_xview[0]+320 {global.paralax2=view_xview[0]+320-global.parallax ;global.parallax=view_xview[0]+320;
    if view_xview[0]+320>320 && view_xview[0]+320<room_width-320 {global.paralax3+=global.paralax2/10}}



if keyboard_check_pressed(global.key_bgpanel) && global.bgp=1 {global.bgp=2}
if global.bgp=2 && !keyboard_check_pressed(global.key_bgpanel) {global.bgp=0}
if keyboard_check_pressed(global.key_bgpanel) && global.bgp=0 {global.bgp=3}
if global.bgp=3 && !keyboard_check_pressed(global.key_bgpanel) {global.bgp=1}

// F11 平滑模式切换（仅编辑器内有效，平滑模式原本是测试功能）
if keyboard_check_pressed(global.key_f11) {
    global.smoothmode = -global.smoothmode
}


if global.bgp=1 {
    //显示4.4特有的10像素高度条
    background_visible[4]=1
    background_index[4]=background32
    background_htiled[4]=1
    background_vtiled[4]=0
    background_y[4]=room_height
    //显示背景
    background_show()
} else {
    background_index[0]=""
    background_index[1]=""
    background_index[2]=""
    background_index[3]=""
    background_index[4]=""
    background_visible[0]=0
    background_visible[1]=0
    background_visible[2]=0
    background_visible[3]=0
    background_visible[4]=0
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.smoothmode=1 && sizechange=0 {
    instance_deactivate_all(true)
    instance_activate_region(view_xview[0]-999,view_yview[0]-999,640+999*2,480+999*2,true)
    instance_activate_object(o_edwallsdrawer)
    instance_activate_object(o_edpassage)
    instance_activate_object(o_acc)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if set_scenery {
    with(my_scenery) {
        if coto=42 {
            sprite_index = s_blocks
            image_index = block_index
            image_alpha = 1
        } else {
            if coto!=38 {
                sprite_index = s_sceneriesbank
                image_index = coto-1
            } else {depth=5;sprite_index = s_edrotocenter;}
        }
    }
    set_scenery = 0;
}

// 选区模式：进入/退出
if keyboard_check_pressed(global.key_region_select) {
    if o_edmain.option_open == 0 {
        if !global.ed_region_active {
            global.ed_region_active = true
            global.ed_region_block_panel = true
            global.ed_region_state = 0
            global.ed_region_saved_costawia = o_edmain.place_code
            global.ed_region_saved_costawia2 = o_edmain.place_code2
            global.ed_region_saved_costawia3 = o_edmain.place_code3
            global.ed_region_saved_costawia4 = o_edmain.place_code4
            global.ed_region_saved_costawia5 = o_edmain.place_code5
            o_edmain.place_code = 0
            o_edmain.place_code2 = 0
            o_edmain.place_code3 = 0
            o_edmain.place_code4 = 0
            o_edmain.place_code5 = 0
            global.ed_region_sx = 0
            global.ed_region_sy = 0
            global.ed_region_ex = 0
            global.ed_region_ey = 0
            global.ed_region_list = -1
            global.ed_region_blk = -1
            if global.ed_region_blk_orig != -1 {
                ds_list_destroy(global.ed_region_blk_orig)
            }
            global.ed_region_blk_orig = -1
            if global.ed_region_blk_keys != -1 {
                ds_list_destroy(global.ed_region_blk_keys)
            }
            global.ed_region_blk_keys = -1
            if global.ed_region_blk_keys2 != -1 {
                ds_list_destroy(global.ed_region_blk_keys2)
            }
            global.ed_region_blk_keys2 = -1
            global.ed_region_scratch = -1
            global.ed_region_copymode = false
            if global.deletemode == 1 {
                global.ed_region_type = 0
            } else if global.ed_region_saved_costawia != 0 {
                global.ed_region_type = 1
            } else if global.ed_region_saved_costawia2 != 0 {
                global.ed_region_type = 2
            } else if global.ed_region_saved_costawia3 != 0 {
                global.ed_region_type = 3
            } else if global.ed_region_saved_costawia4 != 0 {
                global.ed_region_type = 4
            } else if global.ed_region_saved_costawia5 != 0 {
                global.ed_region_type = 5
            } else {
                global.ed_region_type = 1
            }
            debug_log("Region: Entered, type=" + string(global.ed_region_type) + ", mode=" + string(global.ed_region_mode))
        } else {
            global.ed_region_active = false
            global.ed_region_block_panel = false
            if global.ed_region_state == 3 {
                if global.ed_region_copymode {
                    global.ed_region_copymode = false
                } else if global.ed_region_blk_orig != -1 {
                    ed_region_commit(global.ed_region_last_dcol, global.ed_region_last_drow)
                }
            }
            global.ed_region_state = 0
            if global.ed_region_list != -1 {
                ds_list_destroy(global.ed_region_list)
            }
            if global.ed_region_blk != -1 {
                ds_list_destroy(global.ed_region_blk)
            }
            global.ed_region_list = -1
            global.ed_region_blk = -1
            if global.ed_region_blk_orig != -1 {
                ds_list_destroy(global.ed_region_blk_orig)
            }
            global.ed_region_blk_orig = -1
            if global.ed_region_blk_keys != -1 {
                ds_list_destroy(global.ed_region_blk_keys)
            }
            global.ed_region_blk_keys = -1
            if global.ed_region_blk_keys2 != -1 {
                ds_list_destroy(global.ed_region_blk_keys2)
            }
            global.ed_region_blk_keys2 = -1
            global.ed_region_scratch = -1
            global.ed_region_copymode = false
            global.ed_region_sx = 0
            global.ed_region_sy = 0
            global.ed_region_ex = 0
            global.ed_region_ey = 0
            o_edmain.place_code = global.ed_region_saved_costawia
            o_edmain.place_code2 = global.ed_region_saved_costawia2
            o_edmain.place_code3 = global.ed_region_saved_costawia3
            o_edmain.place_code4 = global.ed_region_saved_costawia4
            o_edmain.place_code5 = global.ed_region_saved_costawia5
            debug_log("Region: Exited")
        }
    }
}

// 选区模式：判定模式循环切换
if keyboard_check_pressed(global.key_region_cycle) {
    if global.ed_region_active {
        global.ed_region_mode = (global.ed_region_mode + 1) mod 3
        debug_log("Region: Mode cycled to " + string(global.ed_region_mode))
        if global.ed_region_state == 2 || global.ed_region_state == 3 {
            if global.ed_region_state == 3 {
                if global.ed_region_copymode {
                    global.ed_region_copymode = false
                    if global.ed_region_blk_orig != -1 {
                        ds_list_destroy(global.ed_region_blk_orig)
                    }
                    global.ed_region_blk_orig = -1
                } else if global.ed_region_blk_orig != -1 {
                    ed_region_commit(global.ed_region_last_dcol, global.ed_region_last_drow)
                }
                global.ed_region_state = 2
            }
            ed_region_recalc()
        }
    } else {
        global.ed_region_mode = (global.ed_region_mode + 1) mod 3
        debug_log("Region: Mode cycled to " + string(global.ed_region_mode))
    }
}

// 选区模式：运行状态机
if global.ed_region_active {
    if o_edmain.option_open == 0 && o_edmain.tool_mode == 0 && o_edmain.setting_mode == 0 {
        ed_region_select()
    } else {
        if global.ed_region_state == 1 {
            global.ed_region_state = 0
            if global.ed_region_list != -1 {
                ds_list_destroy(global.ed_region_list)
            }
            if global.ed_region_blk != -1 {
                ds_list_destroy(global.ed_region_blk)
            }
            global.ed_region_list = -1
            global.ed_region_blk = -1
        }
        if global.ed_region_state == 3 {
            if global.ed_region_copymode {
                global.ed_region_copymode = false
                if global.ed_region_blk_orig != -1 {
                    ds_list_destroy(global.ed_region_blk_orig)
                }
                global.ed_region_blk_orig = -1
            } else if global.ed_region_blk_orig != -1 {
                ed_region_commit(global.ed_region_last_dcol, global.ed_region_last_drow)
            }
            global.ed_region_state = 2
        }
    }
}

// 选区模式：面板键屏蔽
if global.ed_region_block_panel {
    if o_edmain.tool_mode == 0 && o_edmain.setting_mode == 0 && o_edmain.bg_selecting == 0 {
        if o_edmain.option_open > 0 {
            o_edmain.option_open = 0
        }
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if variable_global_exists('testmode') {
    if global.testmode = 1 {
        exit
    }
}
if global.testout=1 {    //自动回到测试前位置
    scroolx = global.xviewtemp
    scrooly = global.yviewtemp
    global.testout=0
}

// 视角缩放
target_zooms[0] = 1;
target_zooms[1] = 2;
target_zooms[2] = 3;
target_zooms[3] = 4;
target_zooms[4] = 5;
target_zooms[5] = 6;
target_zooms[6] = 7;
target_zooms[7] = 8;

if option_open == 0 {
    if (keyboard_check_pressed(global.key_zoomin) || (keyboard_check(vk_control) && mouse_wheel_down())) && ratio_level < 7 {
        next_zoom_ratio = target_zooms[ratio_level + 1];
        next_view_wview = 640 * next_zoom_ratio;
        next_view_hview = 480 * next_zoom_ratio;
        if next_view_wview <= room_width && next_view_hview <= room_height {
            ratio_level += 1;
        }
    } else if (keyboard_check_pressed(global.key_zoomout) || (keyboard_check(vk_control) && mouse_wheel_up())) && ratio_level > 0 {
        ratio_level -= 1;
    }
}

if last_ratio_level != ratio_level {
    var new_zoom, new_w, new_h;
    last_ratio_level = ratio_level;
    new_zoom = target_zooms[ratio_level];
    new_w = 640 * new_zoom;
    new_h = 480 * new_zoom;

    if scroolx < new_w / 2 {
        scroolx = round((new_w / 2) / 32) * 32;
    } else if scroolx > room_width - new_w / 2 {
        scroolx = ((room_width - new_w / 2) / 32) * 32;
    }

    if scrooly < new_h / 2 {
        scrooly = round((new_h / 2) / 32) * 32 - 16;
    } else if scrooly > room_height - new_h / 2 {
        scrooly = ((room_height - new_h / 2) / 32) * 32 - 16;
    }

    sound_play(snd_zoom);
    sound_volume(snd_zoom, global.game_volume);
}

target_zoom = target_zooms[ratio_level];
zoom_ratio += (target_zoom - zoom_ratio) * 0.4;

view_wview[0] = 640 * zoom_ratio;
view_hview[0] = 480 * zoom_ratio;
view_xview[0] = round(min(room_width - 640 * zoom_ratio, max(0, scroolx - 320 * zoom_ratio)) / 32) * 32;
view_yview[0] = round(min(room_height - 480 * zoom_ratio, max(0, scrooly - 240 * zoom_ratio)) / 32) * 32;
if variable_global_exists('script_kile') {
    // 防御：script_kile 必须是数值（文件句柄/0/-1），字符串（取消对话框/GZ 失败残留路径）一律归零，
    // 否则 real() 对空字符串/路径会报 Error in function real()
    if is_string(global.script_kile) {
        global.script_kile = 0
    }
    // 注意：script_kile 是文件句柄（正数），不能假设恒为 1（联机中 send_file/apply_file 的 file_bin_open 会使句柄递增）
    // [S] DBG+自愈：句柄无效但有待同步标记时，按 script_kiler 路径重建句柄（覆盖 F3 返回/open_read 失败=0 场景）
    // GM8 的 && 不短路且未定义全局会读成 0，必须嵌套 if 逐层保护，避免实数对字符串比较
    if real(global.script_kile) <= 0 && global.net_pending_sync = 1 {
        if variable_global_exists('script_kiler') {
            if string(global.script_kiler) != '' {
                if global.net_selfheal_try < 10 {
                    global.net_selfheal_try += 1
                    debug_log("[S] self-heal try#" + string(global.net_selfheal_try) + " kile=" + string(global.script_kile) + " src=" + global.script_kiler + " src_exists=" + string(file_exists(global.script_kiler)) + " smwlx_exists=" + string(file_exists(filename_change_ext(global.script_kiler,'.smwlx'))))
                    if file_exists(filename_change_ext(global.script_kiler,'.smwlx')) = false {
                        GZ_DeCompressFile(global.script_kiler, filename_change_ext(global.script_kiler,'.smwlx'))
                        ec_convert_file(filename_change_ext(global.script_kiler,'.smwlx'))
                    }
                    global.script_kile = file_text_open_read(filename_change_ext(global.script_kiler,'.smwlx'))
                    debug_log("[S] self-heal retry_handle=" + string(global.script_kile))
                }
            }
        }
    }
    if real(global.script_kile) > 0
    {Load_Script_Masta();global.script_kile=-1
        global.net_selfheal_try = 0
        global.net_selfheal_warned = 0
        // NET-SYNC: Masta 填充完成后触发全量同步（数据/设置已完整，规避发送空关卡）
        if global.net_pending_sync = 1 {
            global.net_pending_sync = 0
            // NET-SYNC: 数据加载完成（Load_Script_Masta 已填充）后统一出口：重放测关期间入队的编辑 +
            // 幂等重建 netid 表（队列空时也保证表正确），再全量广播给所有客户端
            with(o_ednet) {
                if net_state = 3 && net_role = 1 {
                    ed_net_replay_pending()
                    ed_net_rebuild_ids()
                }
            }
            ed_net_ops_send_file()
            ed_net_ops_send_settings()
        }
    } else if global.net_pending_sync = 1 && global.net_selfheal_warned = 0 {
        global.net_selfheal_warned = 1
        debug_log("[S] WARN: pending sync but script_kile invalid (empty-broadcast suppressed)")
    }
}

if !first_set_scenery {
    with(o_edsceneriesblock) {
        if coto=42 {
            sprite_index = s_blocks
            image_index = block_index
            image_alpha = 0.4
        } else {
            if coto!=38 {
                sprite_index = s_sceneriesbank
                image_index = coto-1
            } else {depth=5;sprite_index = s_edrotocenter;}
        }
    }
    first_set_scenery=1
}

if place_code3 = 42 && change_alpha = 0 {
    with(o_edsceneriesblock) {if(coto=42)image_alpha = 1}
    change_alpha = 1
}

if place_code3 <> 42 && change_alpha = 1 {
    with(o_edsceneriesblock) {if(coto=42)image_alpha = 0.3}
    change_alpha = 0
}

// 可配置编辑器画布滚动键（Step 检测）- 支持双绑定
if !keyboard_check(global.key_select) {
    if keyboard_check(global.key_ed_left) && keyboard_check(global.key_ed_left_2) {
        if scroolx > view_wview[0] / 2 {scroolx -= 64}
    } else if (keyboard_check(global.key_ed_left) || keyboard_check(global.key_ed_left_2)) {
        if scroolx > view_wview[0] / 2 {scroolx -= 32}
    }
    if keyboard_check(global.key_ed_right) && keyboard_check(global.key_ed_right_2) {
        if scroolx < room_width - view_wview[0] / 2 {scroolx += 64}
    } else if (keyboard_check(global.key_ed_right) || keyboard_check(global.key_ed_right_2)) {
        if scroolx < room_width - view_wview[0] / 2 {scroolx += 32}
    }
    if keyboard_check(global.key_ed_up) && keyboard_check(global.key_ed_up_2) {
        if scrooly > view_hview[0] / 2 && !keyboard_check(vk_shift) {scrooly -= 64}
    } else if (keyboard_check(global.key_ed_up) || keyboard_check(global.key_ed_up_2)) {
        if scrooly > view_hview[0] / 2 && !keyboard_check(vk_shift) {scrooly -= 32}
    }
    if keyboard_check(global.key_ed_down) && keyboard_check(global.key_ed_down_2) {
        if scrooly < room_height - view_hview[0] / 2 && !keyboard_check(vk_shift) {scrooly += 64}
    } else if (keyboard_check(global.key_ed_down) || keyboard_check(global.key_ed_down_2)) {
        if scrooly < room_height - view_hview[0] / 2 && !keyboard_check(vk_shift) {scrooly += 32}
    }
}

// 编辑器：PgUp/PgDn 跳转到上/下一个 Check Point（相机居中到该 CP）
if option_open == 0 {
    if keyboard_check_pressed(global.edkey_cp_prev) || keyboard_check_pressed(global.edkey_cp_next) {
        _i = 0
        _total = 0
        for (_i = 0; _i < instance_number(o_edmarkerblock); _i += 1) {
            _a = instance_find(o_edmarkerblock, _i)
            if _a.coto == 19 || _a.coto == 20 {
                cpinfo[_total, 0] = _a.x
                cpinfo[_total, 1] = _a.y
                cpinfo[_total, 2] = _a.coto
                _total += 1
            }
        }
        if _total > 0 {
            for (_pass = 0; _pass < _total; _pass += 1) {
                for (_idx = 0; _idx < _total - 1; _idx += 1) {
                    _swap = 0
                    if cpinfo[_idx, 2] == 20 && cpinfo[_idx + 1, 2] == 19 {_swap = 1}
                    if cpinfo[_idx, 2] == cpinfo[_idx + 1, 2] {
                        if cpinfo[_idx, 0] > cpinfo[_idx + 1, 0] {_swap = 1}
                        if cpinfo[_idx, 0] == cpinfo[_idx + 1, 0] && cpinfo[_idx, 1] > cpinfo[_idx + 1, 1] {_swap = 1}
                    }
                    if _swap == 1 {
                        _temp = cpinfo[_idx, 0]; cpinfo[_idx, 0] = cpinfo[_idx + 1, 0]; cpinfo[_idx + 1, 0] = _temp
                        _temp = cpinfo[_idx, 1]; cpinfo[_idx, 1] = cpinfo[_idx + 1, 1]; cpinfo[_idx + 1, 1] = _temp
                        _temp = cpinfo[_idx, 2]; cpinfo[_idx, 2] = cpinfo[_idx + 1, 2]; cpinfo[_idx + 1, 2] = _temp
                    }
                }
            }
            if ed_cp_index < 0 || ed_cp_index >= _total {ed_cp_index = 0}
            if keyboard_check_pressed(global.edkey_cp_prev) {
                ed_cp_index -= 1
                if ed_cp_index < 0 {ed_cp_index = _total - 1}
            } else {
                ed_cp_index += 1
                if ed_cp_index >= _total {ed_cp_index = 0}
            }
            scroolx = cpinfo[ed_cp_index, 0]
            scrooly = cpinfo[ed_cp_index, 1] + 16
        }
    }
}

// ESC 键：退出 / 关闭子菜单
if keyboard_check_pressed(global.key_ed_cancel) {
    if option_open=0 {
        _ed_esc_warn=show_question('Do you REALLY want to quit WITHOUT the current level saved???')
        if _ed_esc_warn=1 {
            room_goto(title)
            with(o_edwallsdrawer) {instance_destroy()}
            with(o_edbonusesblock) {instance_destroy()}
            with(o_edbrowser) {instance_destroy()}
            with(o_edenemyblock) {instance_destroy()}
            with(o_edmarkerblock) {instance_destroy()}
            with(o_edpassage) {instance_destroy()}
            with(o_edsceneriesblock) {instance_destroy()}
            SXMS_C_Stop()
            global.autosavename=''
        }
    }
    if option_open>1 && bg_selecting!=1 && bg_selecting!=100 {
        option_open=0
    }
    if bg_selecting=1 {
        bg_selecting=0
    }
    if bg_selecting=100 {
        bg_selecting=0
        SXMS_C_Stop()
    }
}

// 空格：暂停/恢复关卡滚动
if ratio_level == 0 && keyboard_check_pressed(global.key_ed_pause) {
    wlaczony = -wlaczony
}

// Delete：删除模式切换
if keyboard_check_pressed(global.key_ed_delete) {
    if global.deletemode=1 {
        _ed_del_q=show_question('Would you like to turn OFF delete mode? ')
    } else {
        _ed_del_q=show_question('Would you like to turn ON delete mode? ')
    }
    if _ed_del_q=1 {
        global.deletemode = -global.deletemode
    }
}

// F3/F4/F5/F7/F10 编辑器功能键
// F3: 测试关卡
if keyboard_check_pressed(global.key_f3) {
    global.autosavename1=global.autosavename
    global.autosavename=working_directory+"\temp.smwl"
    create=file_text_open_write(global.autosavename)
    file_text_write_string(create," ")
    file_text_close(create)
    Save_Script_Main()
    // NET-SYNC: 数据经文件+队列传输：temp.smwl 是测关返回的数据源（F3 全量存盘，游戏路径不碰它），
    // 复制 temp_play.smwl 给 Loader 加载（游戏路径只使用/删除副本）；o_edmain 不持久化，换房即销毁
    global.testsave=working_directory+"\temp.smwl"
    global.autosavename=working_directory+"\temp_play.smwl"
    file_copy(global.testsave,global.autosavename)
    global.testmode=1
    global.xviewtemp = scroolx
    global.yviewtemp = scrooly
    // NET-SYNC: 测关中 o_edmain 随换房销毁（数据经文件/队列传输，无需常驻），编辑器实例 deactivate 防误跑；
    // 好友编辑消息由 o_ednet 入队，返回后由触发器统一重放+全量广播
    instance_deactivate_object(o_edwallsdrawer)
    instance_deactivate_object(o_edbonusesblock)
    instance_deactivate_object(o_edbrowser)
    instance_deactivate_object(o_edenemyblock)
    instance_deactivate_object(o_edmarkerblock)
    instance_deactivate_object(o_edpassage)
    instance_deactivate_object(o_edsceneriesblock)
    room_goto(Loader)
}
// F4: God Mode 测试
if keyboard_check_pressed(global.key_f4) {
    global.autosavename1=global.autosavename
    global.testmode=1
    global.autosavename=working_directory+"\temp.smwl"
    create=file_text_open_write(global.autosavename)
    file_text_write_string(create," ")
    file_text_close(create)
    Save_Script_Main()
    // NET-SYNC: 数据经文件+队列传输：temp.smwl 是测关返回的数据源（F3 全量存盘，游戏路径不碰它），
    // 复制 temp_play.smwl 给 Loader 加载（游戏路径只使用/删除副本）；o_edmain 不持久化，换房即销毁
    global.testsave=working_directory+"\temp.smwl"
    global.autosavename=working_directory+"\temp_play.smwl"
    file_copy(global.testsave,global.autosavename)
    global.godmode=1
    global.xviewtemp = scroolx
    global.yviewtemp = scrooly
    // NET-SYNC: 测关中 o_edmain 随换房销毁（数据经文件/队列传输，无需常驻），编辑器实例 deactivate 防误跑；
    // 好友编辑消息由 o_ednet 入队，返回后由触发器统一重放+全量广播
    instance_deactivate_object(o_edwallsdrawer)
    instance_deactivate_object(o_edbonusesblock)
    instance_deactivate_object(o_edbrowser)
    instance_deactivate_object(o_edenemyblock)
    instance_deactivate_object(o_edmarkerblock)
    instance_deactivate_object(o_edpassage)
    instance_deactivate_object(o_edsceneriesblock)
    room_goto(Loader)
}
// F5: 实心块显示切换（松开触发）
if keyboard_check_released(global.key_f5) {
    show_solid = 1-show_solid
}
// F7: 关卡尺寸调整
if keyboard_check_pressed(global.key_f7) {
    if instance_exists(o_ednet) && o_ednet.net_state = 3 && o_ednet.net_role = 0 {
        ed_net_notify('Only host can resize the level.')
    } else {
        view_xview[0]=0
        view_yview[0]=0
        _edfv_q=show_question('Do you REALLY want to RESIZE of your level???')
        if _edfv_q=1 {
            _edfv_dupiks=get_integer('Set the size of level. X in tiles - min 20, max 1920',floor(room_width/32))
            _edfv_dupigrek=get_integer('Y in tiles - min 15, max 1920',floor(room_height/32))
            x_trans = get_integer('Move x (in tiles) of (0,0) to:',0)
            y_trans = get_integer('Move y (in tiles) of (0,0) to:',0)
            x_new = min(max(_edfv_dupiks,20),1920)
            y_new = min(max(_edfv_dupigrek,15),1920)
            if room_width+x_trans*32>x_new*32 || room_height+y_trans*32>y_new*32 || x_trans*32<0 || y_trans*32<0 {
                _edfv_q=show_question('Some blocks may be out of the new border, which will be DELETED. Do you want to continue?')
            }
            if _edfv_q=1 {
                ed_net_ops_send_resize(x_new, y_new, x_trans, y_trans)
                ed_resize_level(x_new, y_new, x_trans, y_trans)
                ed_net_rebuild_ids()
                // NET-SYNC: resize 双重重载完成后由 o_edmain Step 触发全量广播，保证所有人关卡一致
                global.net_pending_sync = 1
            }
        }
    }
}
// F10: 水位高度
if keyboard_check_pressed(global.key_f10) {
    _edfv_w=get_integer('Set the height of the water',floor((global.water_level+16)/32))
    global.water_level=floor(_edfv_w*32-16)
    ed_net_ops_send_settings('Water Level')
}
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// 选择面板循环用的临时变量（GM8: var 必须在事件顶部声明，不能放进 if/while 块）
var _er, _ec, _eid, _ex, _ey, _sc_list, _sc_idx, _sc_coto, _bn_list, _bn_idx, _bn_coto, _mk_list, _mk_idx, _mk_coto, _mk_cnt, _mk_c;
if variable_global_exists('testmode') {
    if global.testmode = 1 {
        exit
    }
}
if instance_number(o_marker)>1 {instance_destroy()}




for (i = 0; i < ceil(view_wview[0] / 640); i += 1) {
    if (global.lava) {draw_sprite_ext(s_biglava,0,view_xview[0]+i*640,global.water_level,1,1,0,c_white,0.4)} else {draw_sprite_ext(s_water,0,view_xview[0]+i*640,global.water_level,1,1,0,c_white,0.4)}
}
if keyboard_check(global.key_waterup) {global.water_level-=4;net_water_dirty=1}
if keyboard_check(global.key_waterdown) {global.water_level+=4;net_water_dirty=1}
if keyboard_check(vk_shift) && keyboard_check(global.key_ed_up) {global.water_level-=4;net_water_dirty=1}
if keyboard_check(vk_shift) && keyboard_check(global.key_ed_down) {global.water_level+=4;net_water_dirty=1}
if net_water_dirty=1 && get_timer() - net_water_throttle > 300 {
    net_water_throttle = get_timer()
    ed_net_ops_send_settings()
}
net_water_dirty = 0
/*
// initializacja

if initializuj=0 {initializuj=1;

for (i=0; i<room_width/32; i+=1)
    {
    for (a=0; a<room_height/32; a+=1)
        {
        arrayetapu[i,a]=0


        }

    }
arrayetapu[0,0]=1
arrayetapu[1,0]=1
arrayetapu[2,0]=1
arrayetapu[3,0]=1
arrayetapu[4,0]=1
arrayetapu[5,0]=1
arrayetapu[6,0]=1
arrayetapu[7,0]=1
arrayetapu[8,0]=1
arrayetapu[9,0]=1
arrayetapu[10,0]=1
arrayetapu[11,0]=1
arrayetapu[12,0]=1
arrayetapu[13,0]=1
arrayetapu[14,0]=1
arrayetapu[15,0]=1
arrayetapu[16,0]=1
arrayetapu[17,0]=1
arrayetapu[18,0]=1
arrayetapu[19,0]=1
arrayetapu[20,0]=1
arrayetapu[21,0]=1
arrayetapu[22,0]=1
arrayetapu[23,0]=1
arrayetapu[24,0]=1
arrayetapu[25,0]=1

}
// rysowanie
var i,a, _ed_drag_on;
_ed_drag_on = (global.ed_region_active && global.ed_region_state == 3)
for (i=0; i<20; i+=1)
    {
    for (a=0; a<15; a+=1)
        {
        if !(_ed_drag_on && global.ed_region_orig_mask[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)] == 1) {
        draw_sprite_ext(s_blocks,arrayetapu[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)],view_xview[0]+i*32,view_yview[0]+a*32,1,1,0,c_white,1)
        }
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check_released(global.key_pick) {global.picking = false}

quitbgpselect=0
quitbgmselect=0
quitweatherselect=0

// PREFS
global.save=0  //非保存状态

if scrolla<=1 && scrollb<=1 {
    if option_open=6 && bg_selecting=0  //wlaczonaopcja表示工具栏中block，buddie，scenery，marks，bonus，prefs的某一项，6对应pref
    //czywybieranieback是啥
    {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_edenemiesmask,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_edprefs,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
    }
    place_code6=0
    //costawia6记录pref栏鼠标选中的项目（如关卡名，作者名等，不同的项目用不同的数字代表；相应的，costawia5记录bonus栏鼠标选中的项目，以此类推）
    //下面这一大段，分别实现pref窗口下各个项目被鼠标选中时"高亮"的效果，并且记录"选中状态"，为判断鼠标单击时发生什么事件做准备。
    if option_open=6 && ed_hit(220, 117, 130, 17)&& bg_selecting=0 {
        draw_prefs_highlight(view_xview[0]+220, view_yview[0]+117, 1, 1, 0.2);
        place_code6=1
        place_code=0
        place_code2=0
        //costawia3=0
        =0
        place_code5=0
    }//关卡名栏
    if option_open=6 && ed_hit(220, 140, 130, 17)&& bg_selecting=0 {
        draw_prefs_highlight(view_xview[0]+220, view_yview[0]+140, 1, 1, 0.2);
        place_code6=2
        place_code=0
        place_code2=0
        //costawia3=0
        place_code4=0
        place_code5=0
    }//关卡作者栏
    if option_open=6 && ed_hit(220, 186, 130, 17)&& bg_selecting=0 {
        draw_prefs_highlight(view_xview[0]+220, view_yview[0]+186, 1, 1, 0.2);
        place_code6=3
        place_code=0
        place_code2=0
        //costawia3=0
        place_code4=0
        place_code5=0
    }//
    if option_open=6 && ed_hit(220, 209, 130, 17)&& bg_selecting=0 {
        draw_prefs_highlight(view_xview[0]+220, view_yview[0]+209, 1, 1, 0.2);
        place_code6=4
        place_code=0
        place_code2=0
        //costawia3=0
        place_code4=0
        place_code5=0
    }
    if option_open=6 && ed_hit(220, 232, 130, 16)&& bg_selecting=0 {
        draw_prefs_highlight(view_xview[0]+220, view_yview[0]+232, 1, 1, 0.2);
        place_code6=5
        place_code=0
        place_code2=0
        //costawia3=0
        place_code4=0
        place_code5=0
    }
    if option_open=6 && ed_hit(220, 278, 40, 17)&& bg_selecting=0 {
        draw_prefs_highlight(view_xview[0]+220-5, view_yview[0]+278, 0.4, 1, 0.2);
        place_code6=6
        place_code=0
        place_code2=0
        //costawia3=0
        place_code4=0
        place_code5=0
    }
    if option_open=6 && ed_hit(220, 300, 40, 17)&& bg_selecting=0 {
        draw_prefs_highlight(view_xview[0]+220-12, view_yview[0]+300, 0.5, 1, 0.2);
        place_code6=7
        place_code=0
        place_code2=0
        //costawia3=0
        place_code4=0
        place_code5=0
    }
    if option_open=6 && ed_hit(220, 322, 40, 17)&& bg_selecting=0 {
        draw_prefs_highlight(view_xview[0]+220-5, view_yview[0]+322, 0.4, 1, 0.2);
        place_code6=13
        place_code=0
        place_code2=0
        //costawia3=0
        place_code4=0
        place_code5=0
    }

    if option_open=6 && ed_hit(281, 278, 121, 17)&& bg_selecting=0 {
        draw_prefs_highlight(view_xview[0]+275, view_yview[0]+278, 1.2, 1, 0.2);
        place_code6=9
        place_code=0
        place_code2=0
        //costawia3=0
        place_code4=0
        place_code5=0
    }
    if option_open=6 && ed_hit(281, 300, 121, 17)&& bg_selecting=0 {
        draw_prefs_highlight(view_xview[0]+275, view_yview[0]+300, 1, 1, 0.2);
        place_code6=10
        place_code=0
        place_code2=0
        //costawia3=0
        place_code4=0
        place_code5=0
    }

    if option_open=6 && ed_hit(281, 322, 151, 17)&& bg_selecting=0 {
        draw_prefs_highlight(view_xview[0]+275, view_yview[0]+322, 1.3, 1, 0.2);
        place_code6=11
        place_code=0
        place_code2=0
        //costawia3=0
        place_code4=0
        place_code5=0
    }

    if option_open=6 && ed_hit(220, 346, 40, 18)&& bg_selecting=0 {
        draw_prefs_highlight(view_xview[0]+220-5, view_yview[0]+346, 0.4, 1, 0.2);
        place_code6=8
        place_code=0
        place_code2=0
        //costawia3=0
        place_code4=0
        place_code5=0
    }//这里目测是作者脑抽或者后来补上去的，前面跳过了costawia6=8这项

    if option_open=6 && ed_hit(281, 346, 151, 18)&& bg_selecting=0 {
        draw_prefs_highlight(view_xview[0]+275, view_yview[0]+346, 1.3, 1, 0.2);
        place_code6=14
        place_code=0
        place_code2=0
        //costawia3=0
        place_code4=0
        place_code5=0
    }//联机编辑入口

    if option_open=6 && bg_selecting=0 //这段实现关卡名、重力参数等数据在pref界面上的显示
    {
        draw_set_font(cyferki)
        draw_set_color(c_white)
        if string_length(global.level_name_edit)>32 {draw_text(view_xview[0]+350,view_yview[0]+117,string_insert('(see more)',string_copy(global.level_name_edit,1,32),33))} else {draw_text(view_xview[0]+350,view_yview[0]+117,global.level_name_edit)}
        draw_text(view_xview[0]+350,view_yview[0]+140,global.level_author)

        draw_text(view_xview[0]+350,view_yview[0]+186,global.level_time)
        draw_text(view_xview[0]+350,view_yview[0]+209,global.level_gravity)
        draw_text(view_xview[0]+350,view_yview[0]+232,global.level_bowser_hp)
        draw_text(view_xview[0]+350 - 75,view_yview[0]+346,'Online Edit')
    }
    if place_code6=1 && mouse_check_button(mb_left) &&     clicked=0  //如果鼠标点击关卡名，则弹出窗口设置关卡名
    {
        clicked=1
        global.level_name_edit=get_string('Please type the name of your level.',global.level_name_edit)
        global.level_name_edit=string_copy(global.level_name_edit,0,2000)
        ed_net_ops_send_settings('Level Name')
    }
    if place_code6=2 && mouse_check_button(mb_left) && clicked=0 && bg_selecting=0  //如果鼠标点击关卡作者，则弹出窗口设置作者名，下面同理就不说了
    {
        clicked=1
        global.level_author=get_string('Please type your name. Max 16 lenght.',global.level_author)
        global.level_author=string_copy(global.level_author,0,16)
        ed_net_ops_send_settings('Author')
    }
    if place_code6=3 && mouse_check_button(mb_left) && clicked=0 && bg_selecting=0 {
        clicked=1
        global.level_time=get_integer('Please enter value of time. Max 10000.',global.level_time)
        if global.level_time>10000 global.level_time=10000
        ed_net_ops_send_settings('Time')
    }
    if place_code6=4 && mouse_check_button(mb_left) && clicked=0 && bg_selecting=0 {
        clicked=1
        global.level_gravity=get_integer('Please enter value.',global.level_gravity)
        ed_net_ops_send_settings('Gravity')
    }
    if place_code6=5 && mouse_check_button(mb_left) && clicked=0 && bg_selecting=0 {
        clicked=1
        global.level_bowser_hp=get_integer('Please enter value',global.level_bowser_hp)
        ed_net_ops_send_settings('Kuppa')
    }


    // NAGRYWANIE
    if place_code6=6 && mouse_check_button(mb_left) && clicked=0 && bg_selecting=0 {
        global.dobackup_save=1
        Save_Script_Main()
        if global.autosavename!='' {
            show_message("level saved")}
        place_code6=0
    }
    if place_code6=7 && mouse_check_button(mb_left) && clicked=0 && bg_selecting=0 {
        global.autosavename=''
        global.dobackup_save=1
        Save_Script_Main()
        place_code6=0
    }
    // WGRYWANIE
    if place_code6=13 && mouse_check_button(mb_left) && clicked=0 && bg_selecting=0 {
        clicked=1
        // NET-SYNC: 客户端禁止 Load（只有房主可 Load，客户端会强制接收房主关卡）
        if instance_exists(o_ednet) && o_ednet.net_state = 3 && o_ednet.net_role = 0 {
            show_message('Load is disabled in co-op edit mode. Only the host can use load function.')
        } else {
            var warning; warning=show_question('Do you REALLY want to load a level WITHOUT the current level saved???')
            if warning=1 {
                global.autosavename='';Load_Script_Main()
                // NET-SYNC: 仅加载成功（script_kile=文件句柄>0）才触发全量同步；取消对话框时 script_kile=''，不标记
                // GM8 字符串与数字不能混比较（Cannot compare arguments），且 && 可能不短路，须嵌套 if 逐层保护
                if is_real(global.script_kile) {
                    if global.script_kile > 0 {
                        global.net_pending_sync=1
                    }
                }
            }
            if warning=0 {exit}
        }
    }

    if place_code6=8 && mouse_check_button(mb_left) && clicked=0 && bg_selecting=0
    {var warning2; warning2=show_question('Do you REALLY want to quit WITHOUT the current level saved???')
        if warning2=1 {
            with(o_edwallsdrawer) {instance_destroy()}//抽风什么的都给劳资去死
            with(o_edbonusesblock) {instance_destroy()}
            with(o_edbrowser) {instance_destroy()}
            with(o_edenemyblock) {instance_destroy()}
            with(o_edmarkerblock) {instance_destroy()}
            with(o_edpassage) {instance_destroy()}
            with(o_edsceneriesblock) {instance_destroy()}
            room_goto(title);global.autosavename=''}
        if warning2=0 {exit}
    }
    if place_code6=9 && mouse_check_button(mb_left) && clicked=0 && bg_selecting=0 {
        bg_selecting=1;clicked=1
    }

    if place_code6=10 && mouse_check_button(mb_left) && clicked=0 && bg_selecting=0 {
        bg_selecting=100;clicked=1
    }

    if place_code6=11 && mouse_check_button(mb_left) && clicked=0 && bg_selecting=0 {
        bg_selecting=1000;clicked=1
    }

    if place_code6=14 && mouse_check_button(mb_left) && clicked=0 && bg_selecting=0 {
        clicked=1
        if !instance_exists(o_ednet) {
            instance_create(0, 0, o_ednet)
        }
        bg_selecting=9999
        o_ednet.panel_open=1
    }//打开联机面板


    //o_edadmin.loadcheck1=0
    //loadcheck2=0
    //loadcheck3=0
    //loadcheck4=0
    delay_tick+=1 //此变量防止炮台/实心等摆放失控。什么嘛玩意！意思不能自己猜吗？——WSW留

    // BONUS项
    if option_open=5//下面四行红字用于显示bonus栏的界面
    {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_edenemiesmask,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_edenemies_blank,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
        _bn_list = ""
        if bonus_page=0 {_bn_list = "01 02 03 04 05 06 07 08 09 10 11 12 19 20 21 22 23 24 13 14 15 16 17 18"}
        if bonus_page=1 {_bn_list = "25 26 27"}
        _er = 0
        while (_er < 4) {
            _ec = 0
            while (_ec < 6) {
                _bn_idx = _er * 6 + _ec
                if _bn_idx < string_length(_bn_list) / 3 {
                    _bn_coto = real(string_copy(_bn_list, _bn_idx * 3 + 1, 2))
                    ed_bonus_draw(_bn_coto, view_xview[0]+206+_ec*64, view_yview[0]+110+_er*64, "")
                }
                _ec = _ec + 1
            }
            _er = _er + 1
        }
        // Bonus page arrows (like scenery does)
        if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 {draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+384,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+384,1,1,0,c_white,1)}
        if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+384,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+384,1,1,0,c_white,1)}
        if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 && mouse_check_button(mb_left) && clicked=0 {
            if o_edmain.bonus_page=1 {o_edmain.bonus_page=0; clicked=1}
        }
        if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 && mouse_check_button(mb_left) && clicked=0 {
            if o_edmain.bonus_page=0 {o_edmain.bonus_page=1; clicked=1}
        }
    }
    // 第一行bonus
    if option_open=5 && bonus_page=0 && ed_hit(206, 110, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110,1,1,0,c_white,1)}
    if option_open=5 && bonus_page=0 && ed_hit(206, 110, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=0
        place_code4=0
        place_code5=floor(1+(mouse_x-(view_xview[0]+206))/64)//这里通过计算鼠标坐标判断点中了哪个bonus，并据此计算bonus的代号。（1～6）
        autopair=0 //怨念残留喝了
        place_code6=0
    }//这里解释一下上面提到的几个变量。kliknieto用来记录鼠标是否已经点选，=0表示没有，=1表示有，用来避免按住左键连点的情况（？）；samplewyboru1用来控制点击时产生的音效，ustawiony不是很明白是什么。）
    //第二行bonus
    if option_open=5 && bonus_page=0 && ed_hit(206, 110+64, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64,1,1,0,c_white,1)}
    if option_open=5 && bonus_page=0 && ed_hit(206, 110+64, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=0
        place_code4=0
        place_code5=floor(1+(mouse_x-(view_xview[0]+206))/64)+6//（同理计算代号，这次是第二行，7～12）
        autopair=0 //怨念残留喝了
        place_code6=0
    }
    if option_open=5 && bonus_page=0 && ed_hit(206, 110+64*2, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*2,1,1,0,c_white,1)}
    if option_open=5 && bonus_page=0 && ed_hit(206, 110+64*2, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=0
        place_code4=0
        place_code5=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6+6
        autopair=0 //怨念残留喝了
        place_code6=0
    }

    if option_open=5 && bonus_page=0 && ed_hit(206, 110+64*3, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*3,1,1,0,c_white,1)}
    if option_open=5 && bonus_page=0 && ed_hit(206, 110+64*3, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=0
        place_code4=0
        place_code5=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6
        autopair=0 //怨念残留喝了
        place_code6=0
    }

    // Bonus page 1: Raccoon Leaf items (问号砖叶子 / 隐藏问号砖叶子 / 叶子)
    if option_open=5 && bonus_page=1 && ed_hit(206, 110, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110,1,1,0,c_white,1)}
    if option_open=5 && bonus_page=1 && ed_hit(206, 110, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=0
        place_code4=0
        place_code5=floor(1+(mouse_x-(view_xview[0]+206))/64)+24 // coto 25=问号砖叶子, 26=隐藏问号砖叶子, 27=叶子
        autopair=0
        place_code6=0
    }

    //下面是关键，执行物品放置。
    if place_code5<>0 && delay_tick>15 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_edbonusbank,place_code5-1,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if place_code5<>0 && delay_tick>15 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     tool_mode=0
    && menu_open=0 && option_open=0 && setting_mode == 0 //costawia5<>0表示选中了某个bonus，比如非隐藏绿果（编号是3）
    {
        if self_coto_check(5,place_code5) {
            clicked=1
            tmp2=ed_place_bonus(place_code5,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32)
        }
    }//fofo是作者用来指? 在编辑界面上创建了的bonus（比如非隐藏绿果，给这个fofo定义一个叫做coto的变量来记录他的代号，令coto=costawia5，在本例中绿果的代号是3，所以coto=3）
    //delete bonus only when bonus is selected
    if place_code5<>0 && clicked=0 && mouse_check_button(mb_right) /*&& mouse_x>0 &&  mouse_y>0*/ && instance_position(mouse_x,mouse_y,o_edbonusesblock) && costawia4b=0 && tool_mode=0
    && menu_open=0 && option_open=0 {
        ed_delete_at(1,mouse_x,mouse_y,0)
    }//右键删除



    // SCENERIA 自己类比bonus类，有重要的内容再说，其余的我懒得写了（
    if option_open=3 {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_edenemiesmask,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_set_blend_mode(bm_normal)
        // 空白面板底版（与敌人面板共用 s_edenemies_blank），不再用预渲染的 s_edscenery
        draw_sprite_ext(s_edenemies_blank,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
        // 逐格绘制景物图标 + 说明文字（Impact 斜体白字黑描边）
        _sc_list = "";
        if costawia3b=0 {_sc_list = "01 02 03 04 05 06 07 08 09 10 11 12 13 22 23 24 14 15 19 20 21 16 17 18"}
        if costawia3b=1 {_sc_list = "25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42"}
        _er = 0
        while (_er < 4) {
            _ec = 0
            while (_ec < 6) {
                _sc_idx = _er * 6 + _ec
                if _sc_idx < string_length(_sc_list) / 3 {
                    _sc_coto = real(string_copy(_sc_list, _sc_idx * 3 + 1, 2))
                    ed_scenery_draw(_sc_coto, view_xview[0] + 206 + _ec * 64, view_yview[0] + 110 + _er * 64, ed_scenery_label(_sc_coto))
                }
                _ec = _ec + 1
            }
            _er = _er + 1
        }
        if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 {draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+384,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+384,1,1,0,c_white,1)}
        if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+384,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+384,1,1,0,c_white,1)}
        if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 && mouse_check_button(mb_left) {
            if o_edmain.costawia3b=1 {o_edmain.costawia3b=0}
        }
        if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 && mouse_check_button(mb_left) {
            if o_edmain.costawia3b=0 {o_edmain.costawia3b=1}
        }
        //模仿者预览
        if costawia3b=1 {draw_sprite(s_blocks,global.imitater,view_xview[0]+224+64*5-2,view_yview[0]+128+128-2)}
        if mouse_wheel_up() && global.imitater>1 && costawia3b=1 && mouse_y>view_yview[0]+128+64*2-16 && mouse_y<view_yview[0]+128+64*2+48 {//鼠标滚轮向上
            if(global.imitater=274) {global.imitater-=22} else {global.imitater-=1}
        }
        if mouse_wheel_down() && global.imitater<sprite_get_number(s_blocks) && costawia3b=1 && mouse_y>view_yview[0]+128+64*2-16 && mouse_y<view_yview[0]+128+64*2+48 {//鼠标滚轮向下
            if(global.imitater=252) {global.imitater+=22} else {global.imitater+=1}
        }

    }

    if option_open=3 && costawia3b=0 && ed_hit(206, 110, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110,1,1,0,c_white,1)}
    if option_open=3 && costawia3b=0 && ed_hit(206, 110, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=floor(1+(mouse_x-(view_xview[0]+206))/64)
        autopair=0 //怨念残留喝了
        place_code5=0
        place_code6=0
        place_code4=0
    }
    if option_open=3 && costawia3b=0 && ed_hit(206, 110+64, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64,1,1,0,c_white,1)}
    if option_open=3 && costawia3b=0 && ed_hit(206, 110+64, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=floor(1+(mouse_x-(view_xview[0]+206))/64)+6
        autopair=0 //怨念残留喝了
        place_code4=0
        place_code5=0
        place_code6=0
    }
    if option_open=3 && costawia3b=0 && ed_hit(206, 110+64+64, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64+64,1,1,0,c_white,1)}
    if option_open=3 && costawia3b=0 && ed_hit(206, 110+64+64, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=real(string_copy('13 22 23 24 14 15',floor((mouse_x-(view_xview[0]+206))/64)*3+1,2))
        autopair=0 //怨念残留喝了
        place_code4=0
        place_code5=0
        place_code6=0
    }
    if option_open=3 && costawia3b=0 && ed_hit(206, 110+64+64+64, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64+64+64,1,1,0,c_white,1)}
    if option_open=3 && costawia3b=0 && ed_hit(206, 110+64+64+64, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=real(string_copy('19 20 21 16 17 18',floor((mouse_x-(view_xview[0]+206))/64)*3+1,2))
        autopair=0 //怨念残留喝了
        place_code4=0
        place_code5=0
        place_code6=0
    }


    if option_open=3 && costawia3b=1 && ed_hit(206, 110, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110,1,1,0,c_white,1)}
    if option_open=3 && costawia3b=1 && ed_hit(206, 110, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=floor(1+(mouse_x-(view_xview[0]+206))/64)+24
        autopair=0 //怨念残留喝了
        place_code4=0
        place_code5=0
        place_code6=0
    }

    if option_open=3 && costawia3b=1 && ed_hit(206, 110+64, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64,1,1,0,c_white,1)}
    if option_open=3 && costawia3b=1 && ed_hit(206, 110+64, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=floor(1+(mouse_x-(view_xview[0]+206))/64)+24+6
        autopair=0 //怨念残留喝了
        place_code4=0
        place_code5=0
        place_code6=0
    }
    if option_open=3 && costawia3b=1 && ed_hit(206, 110+64+64, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64+64,1,1,0,c_white,1)}
    if option_open=3 && costawia3b=1 && ed_hit(206, 110+64+64, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=floor(1+(mouse_x-(view_xview[0]+206))/64)+24+6+6
        autopair=0 //怨念残留喝了
        place_code4=0
        place_code5=0
        place_code6=0
    }




/*
if costawia3<>0 && costawia3<>20 && costawia3!=35 && costawia3<42 && kliknieto=0 && mouse_x>0 &&  mouse_y>0 &&  wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_sceneriesbank,costawia3-1,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

if costawia3<>0 && costawia3<>20 && costawia3!=35 && costawia3<42 && kliknieto=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0 && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {
    if self_coto_check(3,costawia3){
        kliknieto=1
        my_scenery=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edsceneriesblock)
        my_scenery.coto=costawia3
        set_scenery=1
    }
    }
*/
    //景物可以连放
    if place_code3<>0 && place_code3<42 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edsceneriesblock) &&  tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15
    {draw_sprite_ext(s_sceneriesbank,place_code3-1,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if place_code3<>0 && place_code3<42 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        if self_coto_check(3,place_code3) {
            clicked=1
            my_scenery=ed_place_scenery(place_code3,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32)
        }
    }

    if place_code3=42 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && tool_mode=0
    && menu_open=0 && option_open=0 {
        draw_sprite_ext(s_blocks,global.imitater,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)
        if mouse_wheel_up() && global.imitater>1 {//鼠标滚轮向上
            if(global.imitater=274) {global.imitater-=22} else {global.imitater-=1}
        }
        if mouse_wheel_down() && global.imitater<sprite_get_number(s_blocks) {//鼠标滚轮向下
            if(global.imitater=252) {global.imitater+=22} else {global.imitater+=1}
        }
        if  keyboard_check_pressed(global.key_pick) && autopair3=0 {
            if arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]>0 {
                if global.sample=1 {tmp4=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)}
                global.imitater = arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]
                autopair = 0
            } else if(instance_position(mouse_x,mouse_y,o_edsceneriesblock)) {
                tmp2 = instance_position(mouse_x,mouse_y,o_edsceneriesblock)
                if tmp2.coto=42 {
                    if global.sample=1 {tmp4=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)}
                    global.imitater = tmp2.block_index
                    autopair = 0
                }
            }
        }
    }


    if place_code3<>0 && place_code3=42 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        if (self_coto_check(3,42)) {
            clicked=1
            my_scenery=ed_place_scenery(42,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32)
        }
    }//imitater

    if place_code3<>0 && clicked=0 && mouse_check_button(mb_right) /*&& mouse_x>0 &&  mouse_y>0*/ && instance_position(mouse_x,mouse_y,o_edsceneriesblock) && tool_mode=0
    && menu_open=0 && option_open=0 {
        ed_delete_at(3,mouse_x,mouse_y,place_code3)
    }





    //         MARKERY 重头戏，marks
    // wyswietlanie tablicy z markerami
    if option_open=4 {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_edenemiesmask,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        if costawia4b=0 {
            draw_sprite_ext(s_edenemies_blank,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
            // 逐格子程序化绘制 marks 图标 + 文字（第0/1/3行6列，第2行5列）
            _mk_list = "01 02 03 04 05 06"
            _mk_c = 0
            while (_mk_c < 6) {
                _mk_coto = real(string_copy(_mk_list, _mk_c * 3 + 1, 2))
                ed_mark_draw(_mk_coto, view_xview[0]+206+_mk_c*64, view_yview[0]+110, ed_mark_label(_mk_coto))
                _mk_c = _mk_c + 1
            }
            _mk_list = "07 08 09 10 11 12"
            _mk_c = 0
            while (_mk_c < 6) {
                _mk_coto = real(string_copy(_mk_list, _mk_c * 3 + 1, 2))
                ed_mark_draw(_mk_coto, view_xview[0]+206+_mk_c*64, view_yview[0]+110+64, ed_mark_label(_mk_coto))
                _mk_c = _mk_c + 1
            }
            _mk_list = "13 14 15 16 17"
            _mk_c = 0
            while (_mk_c < 5) {
                _mk_coto = real(string_copy(_mk_list, _mk_c * 3 + 1, 2))
                ed_mark_draw(_mk_coto, view_xview[0]+206+_mk_c*64, view_yview[0]+110+64*2, ed_mark_label(_mk_coto))
                _mk_c = _mk_c + 1
            }
            _mk_list = "19 20 21 22 23 24"
            _mk_c = 0
            while (_mk_c < 6) {
                _mk_coto = real(string_copy(_mk_list, _mk_c * 3 + 1, 2))
                ed_mark_draw(_mk_coto, view_xview[0]+206+_mk_c*64, view_yview[0]+110+64*3, ed_mark_label(_mk_coto))
                _mk_c = _mk_c + 1
            }
        }
        //if costawia4b=1{draw_sprite_ext(s_edmarkers,1,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)}
        //桥预览（已改由 ed_mark_draw case 19-24 按格子绘制桥条+代码箭头，删除原 s_platformmasks 覆盖层）
        //半实心预览（LEDGE 已改为 ed_mark_draw 用游戏内 s_ledge 绘制，不再使用 s_ledgemasks 覆盖层）
        //水位砖预览
        if(global.water_change_type<2) {draw_sprite(s_waterchangemasks,global.water_change_type+2*global.lava,view_xview[0]+224+128,view_yview[0]+128+128)} else {draw_sprite(s_waterchangemasks,4,view_xview[0]+224+128,view_yview[0]+128+128)}
        //强滚预览
        draw_sprite(s_autoscrollmask,global.scrollorange,view_xview[0]+206,view_yview[0]+110+64)
        //滚轮切换样式设计
        if mouse_wheel_up() && global.platformanime>0 && mouse_y>view_yview[0]+128+64*3-16 && mouse_y<view_yview[0]+128+64*3+48 {//鼠标滚轮向上
            global.platformanime-=1
        }
        if mouse_wheel_down() && global.platformanime<sprite_get_number(s_platforms)-1 && mouse_y>view_yview[0]+128+64*3-16 && mouse_y<view_yview[0]+128+64*3+48 {//鼠标滚轮向下
            global.platformanime+=1
        }

        if mouse_wheel_up() && global.yinyangcolor>0 && mouse_y>view_yview[0]+128+64-16 && mouse_y<view_yview[0]+128+64+48 && mouse_x>view_xview[0]+224+64*2 && mouse_x<view_xview[0]+224+64*5+64 {//鼠标滚轮向上（覆盖 switch/type a/type b 列）
            global.yinyangcolor-=1
        }
        if mouse_wheel_down() && global.yinyangcolor<7 && mouse_y>view_yview[0]+128+64-16 && mouse_y<view_yview[0]+128+64+48 && mouse_x>view_xview[0]+224+64*2 && mouse_x<view_xview[0]+224+64*5+64 {//鼠标滚轮向下
            global.yinyangcolor+=1
        }

        if mouse_wheel_up() && global.ledge_type>0 && mouse_y>view_yview[0]+128+128-16 && mouse_y<view_yview[0]+128+128+48 {//鼠标滚轮向上
            if(mouse_x<view_xview[0]+334)global.ledge_type-=1
        }
        if mouse_wheel_down() && global.ledge_type<sprite_get_number(s_ledge)-1 && mouse_y>view_yview[0]+128+128-16 && mouse_y<view_yview[0]+128+128+48 {//鼠标滚轮向下
            if(mouse_x<view_xview[0]+334)global.ledge_type+=1
        }
        if mouse_wheel_up() && global.water_change_type>0 && mouse_y>view_yview[0]+128+128-16 && mouse_y<view_yview[0]+128+128+48 {//鼠标滚轮向上
            if(mouse_x>view_xview[0]+334)global.water_change_type-=1
        }
        if mouse_wheel_down() && global.water_change_type<2 && mouse_y>view_yview[0]+128+128-16 && mouse_y<view_yview[0]+128+128+48 {//鼠标滚轮向下
            if(mouse_x>view_xview[0]+334)global.water_change_type+=1
        }
        // 强滚滚轮切换
        if mouse_wheel_up() && mouse_y>view_yview[0]+128+64-16 && mouse_y<view_yview[0]+128+64+48 {
            if(mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+206+64) {global.scrollorange=0}
        }
        if mouse_wheel_down() && mouse_y>view_yview[0]+128+64-16 && mouse_y<view_yview[0]+128+64+48 {
            if(mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+206+64) {global.scrollorange=1}
        }
    /*if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 {draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+384,1,1,0,c_yellow,1)}else{draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+384,1,1,0,c_white,1)}
    if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+384,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+384,1,1,0,c_white,1)}
    */
    /*if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 && mouse_check_button(mb_left) {
   if o_edmain.costawia4b=1{o_edmain.costawia4b=0}
   }
   if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 && mouse_check_button(mb_left) {
   if o_edmain.costawia4b=0{o_edmain.costawia4b=1}
   }*/
        // wybor markera
    }

    //注意下面costawia记录的是该物品从左往右数的序号而不是物品号码，我刚才弄错了……比如终点是在2号位，不是17号）这段是第一行

    if option_open=4 && o_edmain.costawia4b=0 && ed_hit(206, 110, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110,1,1,0,c_white,1)}
    if option_open=4 && o_edmain.costawia4b=0 && ed_hit(206, 110, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=0
        place_code4=floor(1+(mouse_x-(view_xview[0]+206))/64)
        autopair=0 //怨念残留喝了
        place_code5=0
        place_code6=0
    }
    //第二行
    if option_open=4 && o_edmain.costawia4b=0 && ed_hit(206, 110+64, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64,1,1,0,c_white,1)}
    if option_open=4 && o_edmain.costawia4b=0 && ed_hit(206, 110+64, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=0
        place_code4=floor(1+(mouse_x-(view_xview[0]+206))/64)+6
        autopair=0 //怨念残留喝了
        place_code5=0
        place_code6=0

    }

    //第三行
    if option_open=4 && o_edmain.costawia4b=0 && ed_hit(206, 110+64*2, 320, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*2,1,1,0,c_white,1)}
    if option_open=4 && o_edmain.costawia4b=0 && ed_hit(206, 110+64*2, 320, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=0
        place_code4=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6
        autopair=0 //怨念残留喝了
        place_code5=0
        place_code6=0
    }

    //第四行
    if option_open=4 && o_edmain.costawia4b=0 && ed_hit(206, 110+64*3, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*3,1,1,0,c_white,1)}
    if option_open=4 && o_edmain.costawia4b=0 && ed_hit(206, 110+64*3, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=0
        place_code3=0
        place_code4=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6+6
        autopair=0 //怨念残留喝了
        place_code5=0
        place_code6=0
    }

    // stawianie kolejnych markerow 然后把costawia记录的号码和物品代号对应起来
    if place_code4=3 || place_code4=6 || place_code4=14 {show_solid = 1}

    if place_code4=2 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edmarkerblock) && tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_markersbank2,16,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    if place_code4=2 && costawia4b=0 && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edmarkerblock) && tool_mode=0
    && menu_open=0 && option_open=0 {
        clicked=1
        tmp2=ed_place_marker(17,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
    }
    if place_code4=3 && costawia4b=0 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edmarkerblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15
    {draw_sprite_ext(s_markersbank3,17,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.2)}
    if place_code4=3 && costawia4b=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15//删去"kliknieto=0"允许我们在按住鼠标的时候拖出一大片实心，delayus修正手感
    {
        if (self_coto_check(4,18)) {
            clicked=1
            tmp2=ed_place_marker(18,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
            autopair=0 //怨念残留喝了
        }
    }
    if place_code4=4 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_markersbank4,18,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    if place_code4=4 && costawia4b=0 && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&   tool_mode=0
    && menu_open=0 && option_open=0 {
        if(self_coto_check(4,19)) {
            clicked=1
            tmp2=ed_place_marker(19,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
            autopair=0 //怨念残留喝了
        }
    }
    if place_code4=5 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_checkpoint,19,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if place_code4=5 && costawia4b=0 && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  tool_mode=0
    && menu_open=0 && option_open=0 {
        if(self_coto_check(4,20)) {
            clicked=1
            tmp2=ed_place_marker(20,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
            autopair=0 //怨念残留喝了
        }
    }
    if place_code4=6 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && mouse_y<32  && tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_sealroof,21,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.2)}
    if place_code4=6 &&costawia4b=0 && clicked=0 && mouse_check_button(mb_left) && mouse_x>0 && mouse_y<32 && mouse_y>0 && tool_mode=0
    && menu_open=0 && option_open=0 {
        if(self_coto_check(4,22)) {
            clicked=1
            tmp2=ed_place_marker(22,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
            autopair=0 //怨念残留喝了
        }
    }
    if place_code4=7 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_scrollcenter,global.scrollorange,floor((mouse_x-16)/32)*32+16,floor((mouse_y)/32)*32,1,1,0,c_white,0.2);
        if global.scrollorange=1 {draw_set_color(c_orange)} else {draw_set_color(c_green)};
        draw_rectangle(floor((mouse_x-16)/32+1)*32-320,floor((mouse_y)/32)*32+16-240,floor((mouse_x-16)/32+1)*32+320,floor((mouse_y)/32)*32+16+240,true)
        draw_rectangle(floor((mouse_x-16)/32+1)*32-319,floor((mouse_y)/32)*32+16-239,floor((mouse_x-16)/32+1)*32+319,floor((mouse_y)/32)*32+16+239,true)
        draw_rectangle(floor((mouse_x-16)/32+1)*32-321,floor((mouse_y)/32)*32+16-241,floor((mouse_x-16)/32+1)*32+321,floor((mouse_y)/32)*32+16+241,true)
        draw_set_color(c_white);
        // 滚轮切换橙/白类型：上滑白，下滑橙
        if mouse_wheel_up() {global.scrollorange=0}
        if mouse_wheel_down() {global.scrollorange=1}
    }
    if place_code4=7 &&costawia4b=0 && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && tool_mode=0
    && menu_open=0 && option_open=0 && global.picking = false {
        clicked=1
        tmp2=ed_place_marker(23,floor((mouse_x-16)/32)*32+16,floor((mouse_y)/32)*32,-1)
        autopair=0 //怨念残留喝了
    }
    if place_code4=8 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_onlyyou,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if place_code4=8 && costawia4b=0 && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && tool_mode=0
    && menu_open=0 && option_open=0 {
        if(self_coto_check(4,24)) {
            clicked=1
            tmp2=ed_place_marker(24,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
            autopair=0 //怨念残留喝了
        }
    }

    if place_code4>18 && place_code4<=24 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_platforms,global.platformanime,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)
        draw_sprite_ext(s_platformlabels,place_code4-19,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)
        //滚轮切换样式设计
        if mouse_wheel_up() && global.platformanime>0 {//鼠标滚轮向上
            global.platformanime-=1
        }
        if mouse_wheel_down() && global.platformanime<sprite_get_number(s_platforms)-1 {//鼠标滚轮向下
            global.platformanime+=1
        }
    }

    if place_code4>18 && place_code4<=24 && costawia4b=0 && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  tool_mode=0
    && menu_open=0 && option_open=0 {
        if(self_coto_check(4,25)) {
            clicked=1
            tmp2=ed_place_marker(25,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,place_code4-19)
            autopair=0 //怨念残留喝了
        }
    }
    /*这里是旧版运输桥，现在已经木有了
    if costawia4=24 && costawia4b=0 && kliknieto=0 && mouse_x>0 &&  mouse_y>0 && !instance_position(mouse_x,mouse_y,o_edmarkerblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_markersbank,17,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
   if costawia4=24 && costawia4b=0 && kliknieto=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0 && !instance_position(mouse_x,mouse_y,o_edmarkerblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
        {
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=21
        autopair=0 //怨念残留喝了
        }
    */
    if place_code4=9 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_pointblock5,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if place_code4=9 && costawia4b=0 && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && tool_mode=0
    && menu_open=0 && option_open=0 {
        if(self_coto_check(4,26)) {
            clicked=1
            tmp2=ed_place_marker(26,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
            autopair=0 //怨念残留喝了
        }
    }

    if place_code4>9 && place_code4<=12 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ tool_mode=0
    && menu_open=0 && option_open=0 {
        //解密砖切换样式设计
        if mouse_wheel_up() && global.yinyangcolor>0 {//鼠标滚轮向上
            global.yinyangcolor-=1
        }
        if mouse_wheel_down() && global.yinyangcolor<7 {//鼠标滚轮向下
            global.yinyangcolor+=1
        }
    }

    if place_code4=10 && costawia4b=0 /*&& mouse_x>0 &&  mouse_y>0*/ && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15
    {draw_sprite_ext(s_pointblock6,global.yinyangcolor+8*global.assist,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if place_code4=10 && costawia4b=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        if(self_coto_check(4,27)) {
            clicked=1
            tmp2=ed_place_marker(27,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
            autopair=0 //怨念残留喝了
        }
    }


    if place_code4=11 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_yinyang,2*global.yinyangcolor+1+16*global.assist,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if place_code4=11 && costawia4b=0 && /*kliknieto=0 &&*/ mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        if(self_coto_check(4,28)) {
            clicked=1
            tmp2=ed_place_marker(28,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
            autopair=0 //
        }
    }

    if place_code4=12 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_yinyang,2*global.yinyangcolor+16*global.assist,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if place_code4=12 && costawia4b=0 && /*kliknieto=0 &&*/ mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        if(self_coto_check(4,29)) {
            clicked=1
            tmp2=ed_place_marker(29,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
            autopair=0 //
        }
    }

    if place_code4=13 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_ice,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if place_code4=13 && costawia4b=0 && /*kliknieto=0 &&*/ mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        if(self_coto_check(4,30)) {
            clicked=1
            tmp2=ed_place_marker(30,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
            autopair=0 //
        }
    }



    if place_code4=14 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ tool_mode=0
    && menu_open=0 && option_open=0 {
        //半实心切换样式设计
        if mouse_wheel_up() && global.ledge_type>0 {//鼠标滚轮向上
            global.ledge_type-=1
        }
        if mouse_wheel_down() && global.ledge_type<sprite_get_number(s_ledge)-1 {//鼠标滚轮向下
            global.ledge_type+=1
        }
        draw_sprite_ext(s_ledge,global.ledge_type,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)
    }

    if place_code4=14 && costawia4b=0 && /*kliknieto=0 &&*/ mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        if(self_coto_check(4,31)) {
            clicked=1
            tmp2=ed_place_marker(31,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
            autopair=0 //
        }
    }

    if place_code4=15 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ tool_mode=0
    && menu_open=0 && option_open=0 {
        if mouse_wheel_up() && global.water_change_type>0 {//鼠标滚轮向上
            global.water_change_type-=1
        }
        if mouse_wheel_down() && global.water_change_type<2 {//鼠标滚轮向下
            global.water_change_type+=1
        }
        if(global.water_change_type=0) {draw_sprite_ext(s_waterchanger,2*global.lava,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
        if(global.water_change_type=1) {draw_sprite_ext(s_waterchanger,1+2*global.lava,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
        if(global.water_change_type=2) {draw_sprite_ext(s_waterbegin,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    }

    if place_code4=15 && costawia4b=0 && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ tool_mode=0
    && menu_open=0 && option_open=0 {
        if(self_coto_check(4,32)) {
            clicked=1
            tmp2=ed_place_marker(32,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
            autopair=0 //怨念残留喝了
            if(tmp2.type=2) {tool_mode=9}
        }
    }


    if place_code4=16 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_bgmchange,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if place_code4=16 && costawia4b=0 && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&   tool_mode=0
    && menu_open=0 && option_open=0 && setting_mode=0 {
        if(self_coto_check(4,33)) {
            clicked=1
            marker_inst=ed_place_marker(33,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
            if(marker_inst.haveset=0) {setting_mode = 1; marker_inst.haveset=1;}
            autopair=0 //
        }
    }

    if(setting_mode=1) {
        marker_inst.bgm_change = show_question('Do you want to change BGM when Mario hit me?');
        if (marker_inst.bgm_change) {bg_selecting=100;setting_mode=2;} else {setting_mode=3-3*resetting;resetting=0;marker_inst.setonce2=0}
    }
    if(setting_mode=3) {
        marker_inst.bgp_change = show_question('Do you want to change BGP when Mario hit me?');
        if (marker_inst.bgp_change) {bg_selecting=1;setting_mode=4;o_edmain.backgroundpage=0;} else {setting_mode=5-5*resetting;resetting=0;marker_inst.setonce2=0}
    }
    if(setting_mode=5) {
        marker_inst.weather_change = show_question('Do you want to change Weather when Mario hit me?');
        if (marker_inst.weather_change) {bg_selecting=1;o_edmain.backgroundpage=100;setting_mode=6;} else {setting_mode=7-7*resetting;resetting=0;marker_inst.setonce2=0}
    }
    if(setting_mode=7) {
        marker_inst.height = min(999999,get_integer('Do you want to change water height INSTANTLY when Mario hit me? If yes, enter the height. If no, leave the number to be NO MORE THAN -64.',marker_inst.height))
        if (marker_inst.bgm_change=0 && marker_inst.bgp_change=0 && marker_inst.weather_change=0 && marker_inst.height<=-64) {ed_net_ops_send_delete(marker_inst);with(marker_inst) {instance_destroy();}} else {ed_net_ops_send_update(marker_inst, 6)}
        setting_mode=0;resetting=0;tool_mode=0;
    }

    if place_code4=17 && costawia4b=0 && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_camerabegin,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if place_code4=17 && costawia4b=0 && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && tool_mode=0
    && menu_open=0 && option_open=0 {
        if(self_coto_check(4,34)) {
            clicked=1
            tmp2=ed_place_marker(34,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,-1)
            autopair=0 //
            tool_mode=8
        }
    }


    if place_code4<>0 && clicked=0 && mouse_check_button(mb_right) /*&& mouse_x>0 &&  mouse_y>0*/ && instance_position(mouse_x,mouse_y,o_edmarkerblock) && costawia4b=0 && tool_mode=0
    && menu_open=0 && option_open=0 && global.picking = false {
        ed_delete_at(4,mouse_x,mouse_y,place_code4)
    }
    //delete passage only when passage is selected
    if place_code4=1 && clicked=0 && mouse_check_button(mb_right) /*&& mouse_x>0 &&  mouse_y>0*/ && instance_position(mouse_x,mouse_y,o_edpassage) && costawia4b=0 && tool_mode=0
    && menu_open=0 && option_open=0 {
        autopair=0 //怨念残留喝了
        ed_delete_at(5,mouse_x,mouse_y,0)
    }


    //下面是水管出入口放置，喝了
    if place_code4=1 && costawia4b=0  //costawia4b=0目测是选中了mark中的水管出入口，这时候下面会出现放置水管的提示文字，就是s_help1和s_help2这两个精灵
    {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_help1,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_help2,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)

        costawia4c+=0.01
        if !keyboard_check(global.key_select) {draw_sprite_ext(s_enemiesblock2,0,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,sin(costawia4c)+1)}
    }

    // stawianie pierwszego markera - passage
    if costawia4b=0 && place_code4=1 && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edpassage) && tool_mode=0
    && menu_open=0 && option_open=0 {
        clicked=1
        tmp2=ed_place_passage(1,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32)
        costawia4b=1
        autopair=0 //怨念残留喝了
    }

    // wybor kierunku dla entrance
    if place_code4=1 && costawia4b=1 {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_help4,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_help3,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)

        costawia4c+=0.01
        draw_sprite_ext(s_entrancedir,0,tmp2.x+32,tmp2.y+32,1,1,floor((point_direction(tmp2.x+32,tmp2.y+32,mouse_x,mouse_y)+45)/90)*90,c_white,1)
    }

    if costawia4b=1 && place_code4=1 && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && tool_mode=0 {
        clicked=1
        costawia4b=2
        ed_place_passage(2,mouse_x,mouse_y)
    }
    // stawianie         exita
    if place_code4=1 && costawia4b=2 {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_help6,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_help5,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)

        costawia4c+=0.05
        if !keyboard_check(global.key_select) {draw_sprite_ext(s_enemiesblock3,0,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,sin(costawia4c)+0.5)}//用余弦变化实现放置exit前exit块渐隐渐显的效果
    }
    //stawianie exita
    if costawia4b=2 && place_code4=1 && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && tool_mode=0 {
        clicked=1
        costawia4b=3
        ed_place_passage(3,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32)
    }
    //iiii.. kierunek
    if place_code4=1 && costawia4b=3 {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_help8,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_help7,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)

        costawia4c+=0.01
        draw_sprite_ext(s_entrancedir,0,tmp2.exitx+32,tmp2.exity+32,1,1,floor((point_direction(tmp2.exitx,tmp2.exity,mouse_x,mouse_y)+45)/90)*90,c_white,1)
    }
    if costawia4b=3 && place_code4=1 && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  tool_mode=0 {
        clicked=1
        costawia4b=0
        ed_place_passage(4,mouse_x,mouse_y)
    }


    //阴阳相互切换
    if place_code4=11 && mouse_check_button_pressed(mb_middle) {
        place_code = 0
        place_code2 = 0
        place_code3 = 0
        place_code4 = 12
        place_code5 = 0
        place_code6 = 0
        autopair = 0
    } else if place_code4=12 && mouse_check_button_pressed(mb_middle) {
        place_code = 0
        place_code2 = 0
        place_code3 = 0
        place_code4 = 11
        place_code5 = 0
        place_code6 = 0
        autopair = 0
    }

    //水管自动配对（ed_autopair_ui 脚本：映射+按钮，行封装 ed_autopair_row/single）
    ed_autopair_ui()

    // block类

    if option_open=1 {
        draw_set_color(c_white)
        draw_set_font(cyferkimario)
        if keyboard_check_pressed(global.key_ed_cancel) {option_open=0}
        //换页
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_edblocksmask,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        if blockpage=-1 {draw_sprite_ext(s_edblocks,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1);}
        if blockpage=0 {draw_sprite_ext(s_edblocks,1,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1);}
        if blockpage=1 {draw_sprite_ext(s_edblocks,2,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1);}
        if blockpage=2 {draw_sprite_ext(s_edblocks,3,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1);}
        if blockpage=-1 {draw_set_color(make_color_rgb(255,255,127))} else {if(abs(view_xview[0]+256+51-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10) {draw_set_color(c_yellow)}}draw_text(view_xview[0]+256+51,view_yview[0]+368,'1');draw_set_color(c_white)
        if blockpage<>-1 && abs(view_xview[0]+256+51-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10 && clicked=0 && mouse_check_button(mb_left) {blockpage=-1}
        if blockpage=0 {draw_set_color(make_color_rgb(255,255,127))} else {if(abs(view_xview[0]+256+51*2-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10) {draw_set_color(c_yellow)}}draw_text(view_xview[0]+256+51*2,view_yview[0]+368,'2');draw_set_color(c_white)
        if blockpage<>0 && abs(view_xview[0]+256+51*2-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10 && clicked=0 && mouse_check_button(mb_left) {blockpage=0}
        if blockpage=1 {draw_set_color(make_color_rgb(255,255,127))} else {if(abs(view_xview[0]+256+51*3-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10) {draw_set_color(c_yellow)}}draw_text(view_xview[0]+256+51*3,view_yview[0]+368,'3');draw_set_color(c_white)
        if blockpage<>1 && abs(view_xview[0]+256+51*3-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10 && clicked=0 && mouse_check_button(mb_left) {blockpage=1}
        if blockpage=2 {draw_set_color(make_color_rgb(255,255,127))} else {if(abs(view_xview[0]+256+51*4-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10) {draw_set_color(c_yellow)}}draw_text(view_xview[0]+256+51*4,view_yview[0]+368,'4');draw_set_color(c_white)
        if blockpage<>2 && abs(view_xview[0]+256+51*4-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10 && clicked=0 && mouse_check_button(mb_left) {blockpage=2}
        if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+368-mouse_y)<16 {draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+364,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+364,1,1,0,c_white,1)}
        if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+368-mouse_y)<16 {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+364,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+364,1,1,0,c_white,1)}
        if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+368-mouse_y)<16 && clicked=0 && mouse_check_button(mb_left) {
            if o_edmain.blockpage=0 {o_edmain.blockpage=-1}
            if o_edmain.blockpage=1 {o_edmain.blockpage=0}
            if o_edmain.blockpage=2 {o_edmain.blockpage=1}
            clicked=1
        }
        if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+368-mouse_y)<16 && clicked=0 && mouse_check_button(mb_left) {
            if o_edmain.blockpage=1 {o_edmain.blockpage=2}
            if o_edmain.blockpage=0 {o_edmain.blockpage=1}
            if o_edmain.blockpage=-1 {o_edmain.blockpage=0}
            clicked=1
        }}

    //第一页
    /*if blockpage=-1{
if wlaczonaopcja=1 && ed_hit(206, 128, 384, 32)&& kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128,1,1,0,c_white,1)}
if wlaczonaopcja=1 && ed_hit(206, 128, 384, 32)&& mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=1+floor((mouse_x-(view_xview[0]+206))/32);autopair=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }
if wlaczonaopcja=1 && ed_hit(206, 128+32, 384, 32)&& kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32,1,1,0,c_white,1)}

if wlaczonaopcja=1 && ed_hit(206, 128+32, 384, 32)&& mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=1+floor((mouse_x-(view_xview[0]+206))/32)+12;autopair=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
    costawia6=0
    }
if wlaczonaopcja=1 && ed_hit(206, 128+32*2, 384, 32)&& kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*2,1,1,0,c_white,1)}
if wlaczonaopcja=1 && ed_hit(206, 128+32*2, 384, 32)&& mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=1+floor((mouse_x-(view_xview[0]+206))/32)+12*2;autopair=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }
if wlaczonaopcja=1 && ed_hit(206, 128+32*3, 384, 32)&& kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*3,1,1,0,c_white,1)}
if wlaczonaopcja=1 && ed_hit(206, 128+32*3, 384, 32)&& mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=1+floor((mouse_x-(view_xview[0]+206))/32)+12*3;autopair=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }
    if wlaczonaopcja=1 && ed_hit(206, 128+32*4, 384, 32)&& kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*4,1,1,0,c_white,1)}
if wlaczonaopcja=1 && ed_hit(206, 128+32*4, 384, 32)&& mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=1+floor((mouse_x-(view_xview[0]+206))/32)+12*4;autopair=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }
if wlaczonaopcja=1 && ed_hit(206, 128+32*5, 384, 32)&& kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*5,1,1,0,c_white,1)}
if wlaczonaopcja=1 && ed_hit(206, 128+32*5, 384, 32)&& mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=1+floor((mouse_x-(view_xview[0]+206))/32)+12*5;autopair=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }
if wlaczonaopcja=1 && ed_hit(206, 128+32*6, 384, 32)&& kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*6,1,1,0,c_white,1)}
if wlaczonaopcja=1 && ed_hit(206, 128+32*6, 384, 32)&& mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=1+floor((mouse_x-(view_xview[0]+206))/32)+12*6;autopair=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }}*/
    //第二页
    if blockpage=-1 {
        if option_open=1 && ed_hit(206, 128, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,0*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32,1,1,0,c_white,1)}

        if option_open=1 && ed_hit(206, 128+32, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,1*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32*2, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*2,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*2, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,2*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32*3, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*3,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*3, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,3*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32*4, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*4,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*4, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,4*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32*5, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*5,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*5, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,5*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32*6, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*6,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*6, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,6*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }}
    //第三页
    if blockpage=0 {
        if option_open=1 && ed_hit(206, 128, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,0*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32,1,1,0,c_white,1)}

        if option_open=1 && ed_hit(206, 128+32, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,1*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32*2, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*2,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*2, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,2*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32*3, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*3,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*3, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,3*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32*4, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*4,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*4, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,4*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32*5, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*5,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*5, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,5*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0;autopair=0
            place_code6=0
        }
        if option_open=1 && ed_hit(206, 128+32*6, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*6,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*6, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,6*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }}

    //第四页
    if blockpage=1 {
        if option_open=1 && ed_hit(206, 128, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,0*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32,1,1,0,c_white,1)}

        if option_open=1 && ed_hit(206, 128+32, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,1*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32*2, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*2,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*2, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,2*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32*3, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*3,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*3, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,3*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32*4, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*4,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*4, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,4*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }
        if option_open=1 && ed_hit(206, 128+32*5, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*5,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*5, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,5*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0;autopair=0
            place_code6=0
        }
        if option_open=1 && ed_hit(206, 128+32*6, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*6,1,1,0,c_white,1)}
        if option_open=1 && ed_hit(206, 128+32*6, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
            clicked=1
            sampelwyboru1=1//smp
            option_open=0;
            placed=0
            place_code=global.blocks_palette[blockpage+1,6*12+floor((mouse_x-(view_xview[0]+206))/32)]
            place_code2=0
            place_code3=0
            place_code4=0
            place_code5=0
            place_code6=0;autopair=0
        }}

    //第五页
    if blockpage=2 {

        //限制鼠标位置，不能点击空白区
        if (ed_hit(206, 128, 384, 192))|| (ed_hit(206, 128+192, 128, 32)) {

            if option_open=1 && ed_hit(206, 128, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128,1,1,0,c_white,1)}
            if option_open=1 && ed_hit(206, 128, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
                clicked=1
                sampelwyboru1=1//smp
                option_open=0;
                placed=0
                place_code=global.blocks_palette[blockpage+1,0*12+floor((mouse_x-(view_xview[0]+206))/32)]
                place_code2=0
                place_code3=0
                place_code4=0
                place_code5=0
                place_code6=0;autopair=0
            }
            if option_open=1 && ed_hit(206, 128+32, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32,1,1,0,c_white,1)}

            if option_open=1 && ed_hit(206, 128+32, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
                clicked=1
                sampelwyboru1=1//smp
                option_open=0;
                placed=0
                place_code=global.blocks_palette[blockpage+1,1*12+floor((mouse_x-(view_xview[0]+206))/32)]
                place_code2=0
                place_code3=0
                place_code4=0
                place_code5=0
                place_code6=0;autopair=0
            }
            if option_open=1 && ed_hit(206, 128+32*2, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*2,1,1,0,c_white,1)}
            if option_open=1 && ed_hit(206, 128+32*2, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
                clicked=1
                sampelwyboru1=1//smp
                option_open=0;
                placed=0
                place_code=global.blocks_palette[blockpage+1,2*12+floor((mouse_x-(view_xview[0]+206))/32)]
                place_code2=0
                place_code3=0
                place_code4=0
                place_code5=0
                place_code6=0;autopair=0
            }
            if option_open=1 && ed_hit(206, 128+32*3, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*3,1,1,0,c_white,1)}
            if option_open=1 && ed_hit(206, 128+32*3, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
                clicked=1
                sampelwyboru1=1//smp
                option_open=0;
                placed=0
                place_code=global.blocks_palette[blockpage+1,3*12+floor((mouse_x-(view_xview[0]+206))/32)]
                place_code2=0
                place_code3=0
                place_code4=0
                place_code5=0
                place_code6=0;autopair=0
            }
            if option_open=1 && ed_hit(206, 128+32*4, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*4,1,1,0,c_white,1)}
            if option_open=1 && ed_hit(206, 128+32*4, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
                clicked=1
                sampelwyboru1=1//smp
                option_open=0;
                placed=0
                place_code=global.blocks_palette[blockpage+1,4*12+floor((mouse_x-(view_xview[0]+206))/32)]
                place_code2=0
                place_code3=0
                place_code4=0
                place_code5=0
                place_code6=0;autopair=0
            }
            if option_open=1 && ed_hit(206, 128+32*5, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*5,1,1,0,c_white,1)}
            if option_open=1 && ed_hit(206, 128+32*5, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
                clicked=1
                sampelwyboru1=1//smp
                option_open=0;
                placed=0
                place_code=global.blocks_palette[blockpage+1,5*12+floor((mouse_x-(view_xview[0]+206))/32)]
                place_code2=0
                place_code3=0
                place_code4=0
                place_code5=0;autopair=0
                place_code6=0
            }
            if option_open=1 && ed_hit(206, 128+32*6, 384, 32)&& clicked=0 {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*6,1,1,0,c_white,1)}
            if option_open=1 && ed_hit(206, 128+32*6, 384, 32)&& mouse_check_button(mb_left) && clicked=0 {
                clicked=1
                sampelwyboru1=1//smp
                option_open=0;
                placed=0
                place_code=global.blocks_palette[blockpage+1,6*12+floor((mouse_x-(view_xview[0]+206))/32)]
                place_code2=0
                place_code3=0
                place_code4=0
                place_code5=0
                place_code6=0;autopair=0
            }}
    }

    autopair3=0
    if autopaircheck>0 && wlaczony=1 {if abs(view_xview[0]+224-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 {autopair3=1};if abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32{autopair3=1};if( abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && autopaircheck<17){autopair3=1};if( abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && autopaircheck<17 ){autopair3=1}}
    // stawianie BLOCZKOW i kasowanie
    if !global.ed_region_active {
        if autopair=0 {
            if place_code<>0 && clicked=0 && autopair3=0
            && menu_open=0 && option_open=0
            {draw_sprite_ext(s_blocks,place_code,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)
                if !keyboard_check(global.key_submenu) {
                    key_submenu_pressed_down = false;
                }
                if keyboard_check(global.key_submenu) && !key_submenu_pressed_down {
                    global.autosolid = 1 - global.autosolid;
                    key_submenu_pressed_down = true;
                    switch (global.autosolid) {
                    case 0: sound_play(snd_lakitu2); break;
                    case 1: sound_play(snd_lakitu1); break;
                    }
                }
            }

            if place_code<>0 && clicked=0 && autopair3=0 && mouse_x>0 &&  mouse_y>0 && mouse_check_button(mb_left)
            && menu_open=0 && option_open=0 {
                tmp2=ed_place_block(place_code,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32)
                if tmp2<>-1 {autopair=0 //怨念残留喝了
                }
            }}
        if (mouse_x>0 && mouse_y>0) {
            if autopair=2 {ed_autopair_place(2);}
            if autopair=3 {ed_autopair_place(3);}
            if autopair=4 {ed_autopair_place(4);}
            if autopair=5 {ed_autopair_place(5);}
            if autopair=6 {ed_autopair_place(6);}
            if autopair=7 {ed_autopair_place(7);}
            if autopair=12 {ed_autopair_place(12);}
            if autopair=13 {ed_autopair_place(13);}
            if autopair=14 {ed_autopair_place(14);}
            if autopair=15 {ed_autopair_place(15);}
            if autopair=16 {ed_autopair_place(16);}
            if autopair=17 {ed_autopair_place(17);}
            if autopair=22 {ed_autopair_place(22);}
            if autopair=23 {ed_autopair_place(23);}
            if autopair=24 {ed_autopair_place(24);}
            if autopair=25 {ed_autopair_place(25);}
            if autopair=26 {ed_autopair_place(26);}
            if autopair=27 {ed_autopair_place(27);}
            if autopair=32 {ed_autopair_place(32);}
            if autopair=33 {ed_autopair_place(33);}
            if autopair=34 {ed_autopair_place(34);}
            if autopair=35 {ed_autopair_place(35);}
            if autopair=36 {ed_autopair_place(36);}
            if autopair=37 {ed_autopair_place(37);}
            if autopair=42 {ed_autopair_place(42);}
            if autopair=43 {ed_autopair_place(43);}
            if autopair=44 {ed_autopair_place(44);}
            if autopair=45 {ed_autopair_place(45);}
            if autopair=46 {ed_autopair_place(46);}
            if autopair=47 {ed_autopair_place(47);}
            if autopair=52 {ed_autopair_place(52);}
            if autopair=53 {ed_autopair_place(53);}
            if autopair=54 {ed_autopair_place(54);}
            if autopair=55 {ed_autopair_place(55);}
            if autopair=56 {ed_autopair_place(56);}
            if autopair=57 {ed_autopair_place(57);}
            if autopair=62 {ed_autopair_place(62);}
            if autopair=63 {ed_autopair_place(63);}
            if autopair=64 {ed_autopair_place(64);}
            if autopair=65 {ed_autopair_place(65);}
            if autopair=66 {ed_autopair_place(66);}
            if autopair=67 {ed_autopair_place(67);}
            if autopair=8 {ed_autopair_place(8);}
            if autopair=68 {ed_autopair_place(68);}

        }
        if place_code<>0 && clicked=0 && autopair3=0 && mouse_check_button(mb_right) && mouse_x>0 &&  mouse_y>0 && tool_mode=0
        && menu_open=0 && option_open=0 {
            ed_delete_at(0,mouse_x,mouse_y,0)
        }
        if  place_code2 = 0 && place_code3 = 0 && place_code4 = 0 && place_code5 = 0 && place_code6 = 0
        && clicked=0 && autopair3=0 &&( /*mouse_check_button(mb_middle) ||*/ keyboard_check_pressed(global.key_pick))
        && mouse_x>0 &&  mouse_y>0 && tool_mode=0 && menu_open=0 && option_open=0 {
            if arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]>0 {
                if global.sample=1 {tmp4=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)}
                place_code = arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]
                place_code2 = 0
                place_code3 = 0
                place_code4 = 0
                place_code5 = 0
                place_code6 = 0
                autopair = 0
            }
        }
    }

    //block 与 模仿者 相互切换
    if place_code<>0 && mouse_check_button_pressed(mb_middle) {
        global.imitater = place_code
        place_code = 0
        place_code2 = 0
        place_code3 = 42
        costawia3b = 1
        place_code4 = 0
        place_code5 = 0
        place_code6 = 0
        autopair = 0
        clicked = 1
        drinkability=3
    }

    if place_code3=42 && mouse_check_button_pressed(mb_middle) && clicked=0 {
        place_code = global.imitater
        place_code2 = 0
        place_code3 = 0
        costawia3b = 0
        place_code4 = 0
        place_code5 = 0
        place_code6 = 0
        autopair = 0
        drinkability=1
    }

    // 敌人


    if option_open=2 {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_edenemiesmask,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        // 空白面板底版（EnemiesSelect2.png），不再用内含图标的 s_edenemies
        draw_sprite_ext(s_edenemies_blank,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
        // 敌人图标用游戏内真实精灵动态绘制到每个格子
        // 逐格循环：6列×4行，每页24个，第2页从 id 25 起。
        _er = 0;
        while (_er < 4) {
            _ec = 0;
            while (_ec < 6) {
                _eid = _er * 6 + _ec + 1 + costawia2b * 24;
                _ex = view_xview[0] + 206 + _ec * 64;
                _ey = view_yview[0] + 110 + _er * 64;
                ed_enemy_draw(_eid, _ex, _ey);
                _ec = _ec + 1;
            }
            _er = _er + 1;
        }
        if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 {draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+384,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+384,1,1,0,c_white,1)}
        if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+384,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+384,1,1,0,c_white,1)}
        if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 && mouse_check_button(mb_left) {
            if o_edmain.costawia2b=1 {o_edmain.costawia2b=0}
        }
        if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 && mouse_check_button(mb_left) {
            if o_edmain.costawia2b=0 {o_edmain.costawia2b=1}
        }

        if costawia2b=0 {
            //鼠标在探照灯格子上时滚轮切换圆形/花瓣，不在格子上时切换 spike_type
            if mouse_x>=view_xview[0]+206+64 && mouse_x<view_xview[0]+206+128 && mouse_y>=view_yview[0]+110+64*3 && mouse_y<view_yview[0]+174+64*3 {
                if mouse_wheel_up() {global.petal_spotlight=0}
                if mouse_wheel_down() {global.petal_spotlight=1}
            } else {
                if mouse_wheel_up() && global.spike_type>0 {global.spike_type-=1}
                if mouse_wheel_down() && global.spike_type<3 {global.spike_type+=1}
            }
            // 17/20/22 的图标已由 ed_enemy_draw 用游戏内精灵绘制（扎地食人花/探照灯/刺），不再使用 mask 覆盖层
        }

        if costawia2b=1 {
            if mouse_wheel_up() && global.shell_type>0 {//鼠标滚轮向上
                global.shell_type-=1
            }
            if mouse_wheel_down() && global.shell_type<11 {//鼠标滚轮向下
                global.shell_type+=1
            }
            // 37/43 的图标已由 ed_enemy_draw 用游戏内精灵绘制（mf刺/龟壳），不再使用 mask 覆盖层
        }
    }

    if option_open=2 && costawia2b=0 && ed_hit(206, 110, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110,1,1,0,c_white,1)}
    if option_open=2 &&costawia2b=0 && ed_hit(206, 110, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=floor(1+(mouse_x-(view_xview[0]+206))/64)
        autopair=0 //怨念残留喝了
        place_code3=0
        place_code4=0
        place_code5=0
        place_code6=0
    }
    if option_open=2 && costawia2b=0 && ed_hit(206, 110+64, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64,1,1,0,c_white,1)}
    if option_open=2 && costawia2b=0 && ed_hit(206, 110+64, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=floor(1+(mouse_x-(view_xview[0]+206))/64)+6
        autopair=0 //怨念残留喝了
        place_code3=0
        place_code4=0
        place_code5=0
        place_code6=0
    }
    if option_open=2 && costawia2b=0 && ed_hit(206, 110+64*2, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*2,1,1,0,c_white,1)}
    if option_open=2 && costawia2b=0 && ed_hit(206, 110+64*2, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6
        autopair=0 //怨念残留喝了
        place_code3=0
        place_code4=0
        place_code5=0
        place_code6=0
    }
    if option_open=2 && costawia2b=0 && ed_hit(206, 110+64*3, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*3,1,1,0,c_white,1)}
    if option_open=2 && costawia2b=0 && ed_hit(206, 110+64*3, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6+6
        autopair=0 //怨念残留喝了
        place_code3=0
        place_code4=0
        place_code5=0
        place_code6=0
    }
    if option_open=2 && costawia2b=1 && ed_hit(206, 110, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110,1,1,0,c_white,1)}
    if option_open=2 &&costawia2b=1 && ed_hit(206, 110, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6+6+6
        autopair=0 //怨念残留喝了
        place_code3=0
        place_code4=0
        place_code5=0
        place_code6=0
    }

    if option_open=2 && costawia2b=1 && ed_hit(206, 110+64, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64,1,1,0,c_white,1)}
    if option_open=2 &&costawia2b=1 && ed_hit(206, 110+64, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6+6+6+6
        autopair=0 //怨念残留喝了
        place_code3=0
        place_code4=0
        place_code5=0
        place_code6=0
    }

    if option_open=2 && costawia2b=1 && ed_hit(206, 110+64*2, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*2,1,1,0,c_white,1)}
    if option_open=2 &&costawia2b=1 && ed_hit(206, 110+64*2, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6+6+6+6+6
        autopair=0 //怨念残留喝了
        place_code3=0
        place_code4=0
        place_code5=0
        place_code6=0
    }

    if option_open=2 && costawia2b=1 && ed_hit(206, 110+64*3, 384, 64)&& clicked=0 {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*3,1,1,0,c_white,1)}
    if option_open=2 &&costawia2b=1 && ed_hit(206, 110+64*3, 384, 64)&& mouse_check_button(mb_left) && clicked=0 {
        delay_tick=0
        clicked=1
        sampelwyboru1=1//smp
        option_open=0;
        placed=0
        place_code=0
        place_code2=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6+6+6+6+6+6
        autopair=0 //怨念残留喝了
        place_code3=0
        place_code4=0
        place_code5=0
        place_code6=0
    }

    //探照灯、金飞龟、跳乌龟
    if place_code2<>0 && (place_code2=20||place_code2=35||place_code2=39) && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) && tool_mode=0
    && menu_open=0 && option_open=0
    && !(place_code2=35 && mouse_y <= 32)
    {draw_sprite_ext(s_enemiesbank,place_code2-1,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

    if place_code2<>0 && (place_code2=20||place_code2=35||place_code2=39) && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/  && !instance_position(mouse_x,mouse_y,o_edenemyblock)&& tool_mode=0
    && menu_open=0 && option_open=0 && setting_mode == 0
    && !(place_code2=35 && mouse_y <= 32) {
        clicked=1
        tmp2=ed_place_enemy(place_code2,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32)
        autopair=0 //怨念残留喝了
        if place_code2=20 {tool_mode=1;tmp2.is_petal=global.petal_spotlight;if global.petal_spotlight {tmp2.rotomr[1]=global.petal_max_promien;tmp2.rotors[1]=global.petal_promien_szybkosc}} //探照灯
        if place_code2=39 {tool_mode=3;global.goldcount=1}// 金飞龟——继承电光绕的优良传统
        if place_code2=35 {tool_mode=5} //可调跳乌龟
    }

    //除去鱼和食人花石盾(所见即所得模式)外的摆放
    if place_code2<>0 && (place_code2<>20 && place_code2<>35 && place_code2<>39 && place_code2<>40 && place_code2<>41 && place_code2<>43 && place_code2<>17 && place_code2<>22 && place_code2<>37) && !((place_code2>=6 && place_code2<=9 || place_code2=23 || place_code2>=44 && place_code2<=47) && global.objectoffset=0)  /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15
    {draw_sprite_ext(s_enemiesbank,place_code2-1,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

    if place_code2<>0 && (place_code2<>20 && place_code2<>35 && place_code2<>39 && place_code2<>40 && place_code2<>41 && place_code2<>43 && place_code2<>17 && place_code2<>22 && place_code2<>37) && !((place_code2>=6 && place_code2<=9 || place_code2=23 || place_code2>=44 && place_code2<=47) && global.objectoffset=0) && mouse_check_button(mb_left)  /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 && setting_mode == 0 {
        if self_coto_check(2,place_code2) {
            clicked=1
            tmp2=ed_place_enemy(place_code2,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32)
            autopair=0 //怨念残留喝了
        }
    }


/*if costawia2=20 && kliknieto=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0 && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {
    kliknieto=1
    fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edenemyblock)
    autopair=0 //怨念残留喝了
    global.fotel=fofo.x
    global.fotel2=fofo.y
    fofo.coto=costawia2
    wiatrak=1
    }*/

    //鱼的摆放
    if (place_code2=40||place_code2=41) && clicked=0 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) && tool_mode=0
    && menu_open=0 && option_open=0
    {draw_sprite_ext(s_enemiesbank,place_code2-1,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

    if (place_code2=40||place_code2=41) && clicked=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && setting_mode == 0 {
        clicked=1
        tmp2=ed_place_enemy(place_code2,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32)
        autopair=0 //怨念残留喝了
        tool_mode=6 //你们要的游鱼
    }

    //正向食人花处理、石盾处理(所见即所得限定)
    if global.objectoffset=0 && place_code2<>0 && (place_code2=6||place_code2=8||place_code2=23||place_code2=44||place_code2=46) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15
    {draw_sprite_ext(s_enemiesbank,place_code2-1,floor((mouse_x-16)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

    if global.objectoffset=0 && place_code2<>0 && (place_code2=6||place_code2=8||place_code2=23||place_code2=44||place_code2=46) && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        clicked=1
        tmp2=ed_place_enemy(place_code2,floor((mouse_x-16)/32)*32+16,floor((mouse_y)/32)*32)
        autopair=0 //怨念残留喝了
    }
    //绿色倒食人花处理(所见即所得限定)
    if global.objectoffset=0 && place_code2<>0 && place_code2=7 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15
    {draw_sprite_ext(s_enemiesbank,place_code2-1,floor((mouse_x-16)/32)*32+32,floor((mouse_y)/32)*32+32+18,1,1,0,c_white,0.5)}

    if global.objectoffset=0 && place_code2<>0 && place_code2=7 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        clicked=1
        tmp2=ed_place_enemy(place_code2,floor((mouse_x-16)/32)*32+16,floor((mouse_y)/32)*32)
        autopair=0 //怨念残留喝了
    }
    //红色倒食人花处理(所见即所得限定)
    if global.objectoffset=0 && place_code2<>0 && place_code2=9 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15
    {draw_sprite_ext(s_enemiesbank,place_code2-1,floor((mouse_x-16)/32)*32+32,floor((mouse_y)/32)*32+32+19,1,1,0,c_white,0.5)}

    if global.objectoffset=0 && place_code2<>0 && place_code2=9 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        clicked=1
        tmp2=ed_place_enemy(place_code2,floor((mouse_x-16)/32)*32+16,floor((mouse_y)/32)*32)
        autopair=0 //怨念残留喝了
    }
    //蓝色倒食人花处理(所见即所得限定)
    if global.objectoffset=0 && place_code2<>0 && place_code2=45 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15
    {draw_sprite_ext(s_enemiesbank,place_code2-1,floor((mouse_x-16)/32)*32+32,floor((mouse_y)/32)*32+32+19,1,1,0,c_white,0.5)}

    if global.objectoffset=0 && place_code2<>0 && place_code2=45 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        clicked=1
        tmp2=ed_place_enemy(place_code2,floor((mouse_x-16)/32)*32+16,floor((mouse_y)/32)*32)
        autopair=0 //怨念残留喝了
    }
    //灰色倒食人花处理(所见即所得限定)
    if global.objectoffset=0 && place_code2<>0 && place_code2=47 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15
    {draw_sprite_ext(s_enemiesbank,place_code2-1,floor((mouse_x-16)/32)*32+32,floor((mouse_y)/32)*32+32+19,1,1,0,c_white,0.5)}

    if global.objectoffset=0 && place_code2<>0 && place_code2=47 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        clicked=1
        tmp2=ed_place_enemy(place_code2,floor((mouse_x-16)/32)*32+16,floor((mouse_y)/32)*32)
        autopair=0 //怨念残留喝了
    }
    //龟壳摆放
    if place_code2=43 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        if mouse_wheel_up() && global.shell_type>0 {//鼠标滚轮向上
            global.shell_type-=1
        }
        if mouse_wheel_down() && global.shell_type<11 {//鼠标滚轮向下
            global.shell_type+=1
        }
        draw_shell(global.shell_type,1);
    }

    if place_code2=43 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 && setting_mode == 0 {
        clicked=1
        tmp2=ed_place_enemy(place_code2,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32)
        autopair=0 //怨念残留喝了
    }
    //扎地摆放
    if place_code2=17 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        if mouse_wheel_up() && global.spike_type>0 {//鼠标滚轮向上
            global.spike_type-=1
        }
        if mouse_wheel_down() && global.spike_type<3 {//鼠标滚轮向下
            global.spike_type+=1
        }
        draw_spike(place_code2,global.spike_type,1);
    }

    if place_code2=17 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 && setting_mode == 0 {
        clicked=1
        tmp2=ed_place_enemy(place_code2,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32)
        autopair=0 //怨念残留喝了
        draw_spike(place_code2,global.spike_type,1);
    }
    //MW刺摆放
    if place_code2=22 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        if mouse_wheel_up() && global.spike_type>0 {//鼠标滚轮向上
            global.spike_type-=1
        }
        if mouse_wheel_down() && global.spike_type<3 {//鼠标滚轮向下
            global.spike_type+=1
        }
        draw_spike(place_code2,global.spike_type,1);
    }

    if place_code2=22 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 && setting_mode == 0 {
        clicked=1
        tmp2=ed_place_enemy(place_code2,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32)
        autopair=0 //怨念残留喝了
    }
    //MF刺摆放
    if place_code2=37 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 {
        if mouse_wheel_up() && global.spike_type>0 {//鼠标滚轮向上
            global.spike_type-=1
        }
        if mouse_wheel_down() && global.spike_type<3 {//鼠标滚轮向下
            global.spike_type+=1
        }
        draw_spike(place_code2,global.spike_type,1);
    }

    if place_code2=37 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0
    && menu_open=0 && option_open=0 && delay_tick>15 && setting_mode == 0 {
        clicked=1
        tmp2=ed_place_enemy(place_code2,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32)
        autopair=0 //怨念残留喝了
    }

    if tool_mode>0 {
        //分步放置工具状态机（中间过程仅本地交互，完成点即落定处含 NET-SYNC 钩子）
        ed_tool_spotlight()
        ed_tool_goldfly()
        ed_tool_jumpturtle()
        ed_tool_fish()
        ed_tool_camera()
        ed_tool_water()
    }
}
//敌人削除

if place_code2<>0 && clicked=0 && mouse_check_button(mb_right) /*&& mouse_x>0 &&  mouse_y>0*/ && instance_position(mouse_x,mouse_y,o_edenemyblock) && tool_mode=0 && global.picking = false
&& menu_open=0 && option_open=0 {
    ed_delete_at(2,mouse_x,mouse_y,place_code2)
}

/*if costawia2 = 20 && kliknieto=0 && mouse_check_button_pressed(mb_right) &&  instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0 && global.picking = false
    && menujesie=0 && wlaczonaopcja=0
    {
    fofo=instance_position(mouse_x,mouse_y,o_edenemyblock)
    if fofo.coto=20
        {
        with(fofo){instance_destroy()}
        }
    }*/










// 右下角图标显示
if !global.ed_region_block_panel {
    if wlaczony=1 {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_edhudmask,0,view_xview[0],view_yview[0],1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_edhud,0,view_xview[0]+5,view_yview[0]+5,1,1,0,c_white,1)
    }

    if place_code<>0 {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_helpusmask,0,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_helpus,0,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
    }
    if place_code2<>0 {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_helpusmask,1,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_helpus,1,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
    }
    if place_code3<>0 {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_helpusmask,2,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_helpus,2,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
    }
    if place_code4<>0 {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_helpusmask,3,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_helpus,3,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
    }
    if place_code5<>0 {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_helpusmask,4,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_helpus,4,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
    }
}
// 选中菜单栏某项后出现的箭头（这玩意有存在感吗？）
menu_open=0
if !global.ed_region_block_panel {
    if wlaczony=1 && costawia4b=0 && tool_mode=0 {
        if ed_hit(40, 97, 120, 43) {
            efekt+=10
            draw_set_blend_mode(bm_subtract)
            draw_sprite_ext(s_edcursormask,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120,1,1,0,c_white,1)
            draw_set_blend_mode(bm_normal)
            draw_sprite_ext(s_edcursor,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120,1,1,0,c_white,1)
            opcja=1
            menu_open=1
        }

        if ed_hit(40, 97+60, 120, 43) {
            efekt+=10
            draw_set_blend_mode(bm_subtract)
            draw_sprite_ext(s_edcursormask,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60,1,1,0,c_white,1)
            draw_set_blend_mode(bm_normal)
            draw_sprite_ext(s_edcursor,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60,1,1,0,c_white,1)
            opcja=2
            menu_open=1
        }
        if ed_hit(40, 97+60+60, 120, 43) {
            efekt+=10
            draw_set_blend_mode(bm_subtract)
            draw_sprite_ext(s_edcursormask,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60,1,1,0,c_white,1)
            draw_set_blend_mode(bm_normal)
            draw_sprite_ext(s_edcursor,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60,1,1,0,c_white,1)
            opcja=3
            menu_open=1
        }
        if ed_hit(40, 97+60+60+60, 120, 43) {
            efekt+=10
            draw_set_blend_mode(bm_subtract)
            draw_sprite_ext(s_edcursormask,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60+60,1,1,0,c_white,1)
            draw_set_blend_mode(bm_normal)
            draw_sprite_ext(s_edcursor,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60+60,1,1,0,c_white,1)
            opcja=4
            menu_open=1
        }
        if ed_hit(40, 97+60+60+60+60, 120, 43) {
            efekt+=10
            draw_set_blend_mode(bm_subtract)
            draw_sprite_ext(s_edcursormask,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60+60+60,1,1,0,c_white,1)
            draw_set_blend_mode(bm_normal)
            draw_sprite_ext(s_edcursor,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60+60+60,1,1,0,c_white,1)
            opcja=5
            menu_open=1
        }
        if ed_hit(40, 97+60+60+60+60+60, 120, 43) {
            efekt+=10
            draw_set_blend_mode(bm_subtract)
            draw_sprite_ext(s_edcursormask,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60+60+60+60,1,1,0,c_white,1)
            draw_set_blend_mode(bm_normal)
            draw_sprite_ext(s_edcursor,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60+60+60+60,1,1,0,c_white,1)
            opcja=6
            menu_open=1
        }
    }
}
if !global.ed_region_block_panel {
    if opcja<>0 && mouse_check_button(mb_left) && clicked=0 && bg_selecting=0 {
        clicked=1
        option_open=opcja
        drinkability=opcja
        autopair=0 //怨念残留喝了
    }
}
// sampel wyboru 这段代码说明，sampelwyboru1=1的时候发出音效
if sampelwyboru1=1 {sampelwyboru1=0; if global.sample=1 {tmp2=sound_play(snd_fire);sound_volume(snd_fire,global.game_volume)}}
// 防止连点
if !mouse_check_button(mb_left) && !mouse_check_button(mb_right) {clicked=0}


// 进入背景选择界面
if bg_selecting=1 && bg_selecting<100 {

    if o_edmain.backgroundpage=0 {draw_sprite(s_edscenario,0,view_xview[0],view_yview[0])}
    if o_edmain.backgroundpage=1 {draw_sprite(s_edscenario,1,view_xview[0],view_yview[0])}
    if o_edmain.backgroundpage=2 {draw_sprite(s_edscenario,2,view_xview[0],view_yview[0])}
    //天气
    if o_edmain.backgroundpage=100 {draw_sprite(s_edscenario,3,view_xview[0],view_yview[0])}

    if o_edmain.backgroundpage<>100 {
        //背景第一页、第二页、第三页按钮
        if abs(view_xview[0]+83-mouse_x)<16 && abs(view_yview[0]+438-mouse_y)<16 {draw_sprite_ext(s_left,0,view_xview[0]+83,view_yview[0]+438,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_left,0,view_xview[0]+83,view_yview[0]+438,1,1,0,c_white,1)}
        if abs(view_xview[0]+147-mouse_x)<16 && abs(view_yview[0]+438-mouse_y)<16 {draw_sprite_ext(s_right,0,view_xview[0]+147,view_yview[0]+438,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_right,0,view_xview[0]+147,view_yview[0]+438,1,1,0,c_white,1)}

        if abs(view_xview[0]+83-mouse_x)<16 && abs(view_yview[0]+438-mouse_y)<16 && mouse_check_button(mb_left) && wahaha=0 {
            if o_edmain.backgroundpage=1 {o_edmain.backgroundpage=0;wahaha = 1}
        }
        if abs(view_xview[0]+83-mouse_x)<16 && abs(view_yview[0]+438-mouse_y)<16 && mouse_check_button(mb_left) && wahaha=0 {
            if o_edmain.backgroundpage=2 {o_edmain.backgroundpage=1;wahaha = 1}
        }
        if abs(view_xview[0]+147-mouse_x)<16 && abs(view_yview[0]+438-mouse_y)<16 && mouse_check_button(mb_left) && wahaha=0 {
            if o_edmain.backgroundpage=0 {o_edmain.backgroundpage=1;wahaha = 1}
        }
        if abs(view_xview[0]+147-mouse_x)<16 && abs(view_yview[0]+438-mouse_y)<16 && mouse_check_button(mb_left) && wahaha=0 {
            if o_edmain.backgroundpage=1 {o_edmain.backgroundpage=2;wahaha = 1}
        }
    }
    //天气按钮
    if ed_hit(462, 420, 60, 30)&& o_edmain.backgroundpage<>100 && setting_mode <> 4 {
        draw_prefs_highlight(view_xview[0]+462, view_yview[0]+420, 0.6, 1.3, 0.2);
        if mouse_check_button(mb_left) && wahaha=0 {o_edmain.backgroundpage=100; wahaha = 1}
    }


    //变量wahaha用于检测鼠标是否已经点击，松开后恢复
    if wahaha = 1 && !mouse_check_button(mb_left) {wahaha=0}

    //背景选择（数据驱动，数据定义见 background_palette_data）
    var _bgp, _bgr, _bgc, _bgx, _bgy, _bgidx, _bgval;
    _bgp = o_edmain.backgroundpage;
    if _bgp = 0 || _bgp = 1 || _bgp = 2 {
        for (_bgr = 0; _bgr < 3; _bgr += 1) {
            for (_bgc = 0; _bgc < 4; _bgc += 1) {
                _bgidx = _bgr * 4 + _bgc;
                _bgval = global.background_palette[_bgp, _bgidx];
                if _bgval > 0 {
                    _bgx = 27 + _bgc * 142;  // 139 + 3 列间距
                    _bgy = 32 + _bgr * 118;  // 102 + 16 行间距
                    if ed_hit(_bgx, _bgy, 139, 103) {
                        draw_prefs_highlight(view_xview[0] + _bgx, view_yview[0] + _bgy + 32, 1.2, 4, 0.2);
                        backselect = _bgval;
                    }
                }
            }
        }
    }

    //天气设置界面
    if o_edmain.backgroundpage=100 {
        draw_set_color(c_white)
        draw_set_font(cyferkimario)

        //Rainy
        draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('Rainy Level'))
        draw_set_halign(fa_right)
        if(setting_mode=6) {
            draw_text(view_xview[0]+405,view_yview[0]+100,string(marker_rainy))
        } else {
            draw_text(view_xview[0]+405,view_yview[0]+100,string(global.rainy))
        }
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 90, 190, 20)&& clicked=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+90, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {
                if(setting_mode=6) { marker_rainy = max(0,min(5,get_integer("Set Rainy Level. Minimum is 0. Maximum is 5.", global.rainy)))
                } else {
                    global.rainy = max(0,min(5,get_integer("Set Rainy Level. Minimum is 0. Maximum is 5.", global.rainy)))
                    ed_net_ops_send_settings('Rainy')
                }
            }
        }

        //Falling Stars
        draw_text(view_xview[0]+40,view_yview[0]+130,string_upper('Falling Stars Level'))
        draw_set_halign(fa_right)
        if(setting_mode=6) {
            draw_text(view_xview[0]+405,view_yview[0]+130,string(marker_fallingstars))
        } else {
            draw_text(view_xview[0]+405,view_yview[0]+130,string(global.fallingstars))
        }
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 120, 190, 20)&& clicked=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+120, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {
                if(setting_mode=6) { marker_fallingstars = max(0,min(3,get_integer("Set Falling Stars Level. Minimum is 0. Maximum is 3.", global.fallingstars)))
                } else {
                    global.fallingstars = max(0,min(5,get_integer("Set Falling Stars Level. Minimum is 0. Maximum is 3.", global.fallingstars)))
                    ed_net_ops_send_settings('Falling Stars')
                }
            }
        }

        //Snowy
        draw_text(view_xview[0]+40,view_yview[0]+160,string_upper('Snowy Level'))
        draw_set_halign(fa_right)
        if(setting_mode=6) {
            draw_text(view_xview[0]+405,view_yview[0]+160,string(marker_snowy))
        } else {
            draw_text(view_xview[0]+405,view_yview[0]+160,string(global.snowy))
        }
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 150, 190, 20)&& clicked=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+150, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {
                if(setting_mode=6) { marker_snowy = max(0,min(5,get_integer("Set Snowy Level. Minimum is 0. Maximum is 5.", global.snowy)))
                } else {
                    global.snowy = max(0,min(5,get_integer("Set Snowy Level. Minimum is 0. Maximum is 5.", global.snowy)))
                    ed_net_ops_send_settings('Snowy')
                }
            }
        }

        //Thunder
        draw_text(view_xview[0]+40,view_yview[0]+190,string_upper('Thunder Level'))
        draw_set_halign(fa_right)
        if(setting_mode=6) {
            draw_text(view_xview[0]+405,view_yview[0]+190,string(marker_thunder))
        } else {
            draw_text(view_xview[0]+405,view_yview[0]+190,string(global.thunder))
        }
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 180, 190, 20)&& clicked=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+180, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {
                if(setting_mode=6) { marker_thunder = max(0,min(1,get_integer("Set Thunder Level. Minimum is 0. Maximum is 1.", global.thunder)))
                } else {
                    global.thunder = max(0,min(1,get_integer("Set Thunder Level. Minimum is 0. Maximum is 1.", global.thunder)))
                    ed_net_ops_send_settings('Thunder')
                }
            }
        }

        //Windy
        draw_text(view_xview[0]+40,view_yview[0]+220,string_upper('Windy Level'))
        draw_set_halign(fa_right)
        if(setting_mode=6) {
            draw_text(view_xview[0]+405,view_yview[0]+220,string(marker_windy))
        } else {
            draw_text(view_xview[0]+405,view_yview[0]+220,string(global.windy))
        }
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 210, 190, 20)&& clicked=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+210, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {
                if(setting_mode=6) { marker_windy = max(0,min(3,get_integer("Set Windy Level. Minimum is 0. Maximum is 3.", global.windy)))
                } else {
                    global.windy = max(0,min(3,get_integer("Set Windy Level. Minimum is 0. Maximum is 3.", global.windy)))
                    ed_net_ops_send_settings('Windy')
                }
            }
        }

        //Darkness
        draw_text(view_xview[0]+40,view_yview[0]+430,string_upper('Dark Level'))
        draw_set_halign(fa_right)
        if(setting_mode=6) {
            draw_text(view_xview[0]+405,view_yview[0]+430,string(marker_darkness))
        } else {
            draw_text(view_xview[0]+405,view_yview[0]+430,string(global.darkness))
        }
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 420, 190, 20)&& clicked=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+420, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {
                if(setting_mode=6) { marker_darkness = max(0,min(9,get_integer("Set Dark Level. Minimum is 0. Maximum is 9.", global.darkness)))
                } else {
                    global.darkness = max(0,min(9,get_integer("Set Dark Level. Minimum is 0. Maximum is 9.", global.darkness)))
                    ed_net_ops_send_settings('Dark')
                }
            }
        }

        //Brightness
        draw_text(view_xview[0]+40,view_yview[0]+460,string_upper('Bright Level'))
        draw_set_halign(fa_right)
        if(setting_mode=6) {
            draw_text(view_xview[0]+405,view_yview[0]+460,string(marker_brightness))
        } else {
            draw_text(view_xview[0]+405,view_yview[0]+460,string(global.brightness))
        }
        draw_set_halign(fa_left)
        draw_set_color(c_white)
        if ed_hit(40, 450, 190, 20)&& clicked=0 {
            draw_prefs_highlight(view_xview[0]+40, view_yview[0]+450, 1.4, 0.8, 0.2);
            if mouse_check_button(mb_left) {
                if(setting_mode=6) { marker_brightness = max(0,min(5,get_integer("Set Bright Level. Minimum is 0. Maximum is 5.", global.brightness)))
                } else {
                    global.brightness = max(0,min(5,get_integer("Set Bright Level. Minimum is 0. Maximum is 5.", global.brightness)))
                    ed_net_ops_send_settings('Bright')
                }
            }
        }

        //天气设置界面结束
    }
    //从天气页按BACK按钮退回到背景选择主页面
    if ed_hit(561, 427, 60, 30)&& o_edmain.backgroundpage=100 {
        draw_prefs_highlight(view_xview[0]+561, view_yview[0]+427, 0.5, 1.3, 0.2);
        if mouse_check_button(mb_left) && wahaha=0 {
            if(setting_mode=6) {
                marker_inst.rainy=marker_rainy;
                marker_inst.fallingstars=marker_fallingstars;
                marker_inst.snowy=marker_snowy;
                marker_inst.thunder=marker_thunder;
                marker_inst.windy=marker_windy;
                marker_inst.darkness=marker_darkness;
                marker_inst.brightness=marker_brightness;
                ed_net_ops_send_update(marker_inst, 6)
                //setting_mode=7-7*resetting;
                //resetting=0;
                setting_mode=7; wahaha = 1;
                marker_inst.setonce2=0;
                o_edmain.backgroundpage=0;
                bg_selecting=0;quitweatherselect=0;clicked=0;tool_mode=0;
            } else {o_edmain.backgroundpage=0; wahaha = 1;}
            // if quitweatherselect=1 {quitweatherselect=0;czywybieranieback=0;kliknieto=1}
        }
    }

    //按选择背景主页面BACK按钮退出
    if ed_hit(530, 420, 60, 30) && o_edmain.backgroundpage<>100 && wahaha = 0 {
        draw_prefs_highlight(view_xview[0]+530, view_yview[0]+420, 0.5, 1.3, 0.2);
        quitbgpselect=1
    } else { quitbgpselect=0 }

    if mouse_check_button(mb_left) && o_edmain.backgroundpage<>100 && wahaha = 0 &&
    ed_hit(530, 420, 60, 30)&&
    quitbgpselect=1
    {if(setting_mode>0) {setting_mode-=1}
        bg_selecting=0;backselect=0;quitbgpselect=0}

    //选择好背景退出
    if mouse_check_button(mb_left) && o_edmain.backgroundpage<>100 &&
    ((mouse_x>view_xview[0]+27 && mouse_x<view_xview[0]+166)||(mouse_x>view_xview[0]+27+139+3 && mouse_x<view_xview[0]+166+139+3)||(mouse_x>view_xview[0]+27+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3)||(mouse_x>view_xview[0]+27+139+3+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3+139+3))
    &&((mouse_y>view_yview[0]+32 && mouse_y<view_yview[0]+135)||(mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16)||(mouse_y>view_yview[0]+32+102+16+102+16 && mouse_y<view_yview[0]+135+102+16+102+16))
    && quitbgpselect=0 && clicked=0 && backselect>0 {
        if(setting_mode=4) {marker_inst.bgp=backselect;ed_net_ops_send_update(marker_inst, 6);setting_mode=5-5*resetting;resetting=0;marker_inst.setonce2=0;costaiwa4=16} else {global.background=backselect;if(global.preview=-1)global.local_background=backselect;ed_net_ops_send_settings('BGP = ' + string(backselect))}
        bg_selecting=0;clicked=1
    }

}



// 进入音乐选择界面
if bg_selecting=100 {
    global.musicon=0

    draw_sprite(s_edscenario2,bgmpage,view_xview[0],view_yview[0])

    for(ii=0;ii<8;ii+=1) {
        if ed_hit(460, 114+35*ii, 150, (114+35*ii+16)-(114+35*ii)) {
            draw_prefs_highlight(view_xview[0]+460, view_yview[0]+114+35*ii, 1.3, 0.8, 0.2);
            if mouse_check_button(mb_left) {bgmpage=ii;}
        }
    }
    /*for(ii=4;ii<8;ii+=1){
        if ed_hit(460, 116+35*ii+, 150, (116+35*ii+12)-(116+35*ii+)){
            draw_prefs_highlight(view_xview[0]+460, view_yview[0]+116+34*ii, 1.3, 0.8, 0.2);
            if mouse_check_button(mb_left){bgmpage=ii;}
        }
    }*/


    bgm_prev=0
    bgm_select=0
    // BGM选择（数据驱动，数据定义见 bgm_palette_data）
    var _bgm_p, _bgm_r, _bgm_c, _bgm_val, _bgm_x, _bgm_y, _bgm_rows;
    _bgm_p = bgmpage;
    if _bgm_p >= 0 && _bgm_p <= 6 {
        _bgm_rows = global.bgm_palette_rows[_bgm_p];
        for (_bgm_r = 0; _bgm_r < _bgm_rows; _bgm_r += 1) {
            _bgm_y = global.bgm_palette_row_y[_bgm_p, _bgm_r];
            for (_bgm_c = 0; _bgm_c < 2; _bgm_c += 1) {
                _bgm_val = global.bgm_palette[_bgm_p, _bgm_r * 2 + _bgm_c];
                if _bgm_val > 0 {
                    _bgm_x = 35 + _bgm_c * 205;
                    if ed_hit(_bgm_x, _bgm_y, 150, 12) {
                        draw_prefs_highlight(view_xview[0] + _bgm_x, view_yview[0] + _bgm_y, 1.3, 0.8, 0.2);
                        bgm_select = _bgm_val;
                    }
                }
            }
        }
    }
    /*custom*/
    if bgmpage=7 {
        draw_set_color(c_white)
        draw_set_font(cyferkimario)

        /*draw_text(160,400,'COMING SOON')*/



        draw_text(view_xview[0] + 80, view_yview[0] + 400, 'PREV')
        draw_text(view_xview[0] + 160, view_yview[0] + 400, 'NEXT')
        draw_text(view_xview[0] + 240, view_yview[0] + 400, 'REFRESH')
        if ed_hit(70, 390, 60, 30) {
            draw_prefs_highlight(view_xview[0]+70, view_yview[0]+390, 0.4, 0.8, 0.2);
            if mouse_check_button_pressed(mb_left) && listscroll>0 {listscroll-=10;}
        }
        if ed_hit(150, 390, 50, 30) {
            draw_prefs_highlight(view_xview[0]+150, view_yview[0]+390, 0.4, 0.8, 0.2);
            if mouse_check_button_pressed(mb_left) && listscroll < global.customMusicTotal - 10 {listscroll+=10;}
        }
        if ed_hit(230, 390, 70, 30) {
            draw_prefs_highlight(view_xview[0]+230, view_yview[0]+390, 0.6, 0.8, 0.2);
            // 点击后刷新音乐列表
            if mouse_check_button_pressed(mb_left) {music_list_update();show_message('Custom music list refreshed.');listscroll=0}
            /*if mouse_check_button_pressed(mb_left){
                global.customMusicName = get_open_filename('custom music|*.ogg;*.mp3','')
                if filename_path(global.customMusicName) != global.currentPath{
                    dir_problem = show_question('The music file is not in the same directory of your level.')
                listscroll=0
            }*/
        }

        // ========== 音乐列表显示 ==========
        // 显示当前页面的10首音乐
        for(i=1;i<=10;i+=1) {
            if i+listscroll<=global.customMusicTotal {
                draw_text(view_xview[0] + 20, view_yview[0] + 60+ 30 * i, string(i+listscroll))
                draw_text(view_xview[0] + 50, view_yview[0] + 60+ 30 * i, string_upper(global.customMusicFile[i+listscroll]))
                if ed_hit(20, 50+30*i, 340, (70+30*i)-(50+30*i)) {
                    draw_prefs_highlight(view_xview[0]+20, view_yview[0]+50+30*i, 2, 0.8, 0.2);
                    bgm_select = 626+i+listscroll
                }
            }
        }
    }

    //no music
    if ed_hit(462, 420, 60, 30) {
        draw_prefs_highlight(view_xview[0]+462, view_yview[0]+420, 0.6, 1.3, 0.2);
        bgm_select = 600  //600对应无音乐
    }

    //quitselect
    if ed_hit(550, 420, 60, 30) {
        draw_prefs_highlight(view_xview[0]+550, view_yview[0]+420, 0.5, 1.3, 0.2);
        quitbgmselect=1} else
    {quitbgmselect=0}



    bgm_prev=bgm_select
    if bgm_select=0 {bgm_prev=0}

    if bgm_play<>bgm_prev && bgm_prev>0 {
        bgm_play=bgm_prev//爽
        ed_play_bgm(bgm_play)
    }

    if mouse_check_button(mb_left) && quitbgmselect=1
    {if(setting_mode>0) {setting_mode-=1}
        bg_selecting=0;mm_stop_all_ext()}

    if mouse_check_button(mb_left) && quitbgmselect=0 && clicked=0 && bgm_select>0 {
        if (setting_mode=2) {marker_inst.bgm=string(bgm_play);ed_net_ops_send_update(marker_inst, 6);setting_mode=3-3*resetting;resetting=0;marker_inst.setonce2=0;costaiwa4=16} else {global.bgm_id=bgm_play;if(global.preview=-1)global.local_muzyka=bgm_play;ed_net_ops_send_settings('BGM = ' + string(bgm_play))}
        bg_selecting=0;clicked=1;mm_stop_all_ext();
    }

            /*
            ktkm1.dll - Mario World 1
ktkm3.dll - Star
ktkm4.dll - End level
ktkm5.dll - Cave
ktkm6.dll - Rockland
ktkm7.dll - Castle
ktkm8.dll - Kuppa
ktkm9.dll - Map 1
ktkm10.dll - Ghost house
ktkm11.dll - End level
ktkm12.dll - map 2
ktkm13.dll - Starland
ktkm14.dll - Starland Rockland
ktkm15.dll - Underground
ktkm16.dll - Map 3
ktkm17.dll - Yoshi Island level 1
ktkm18.dll - Waterlevel
ktkm21.dll - MF5-1
ktkm22.dll - Sirens
ktkm23.dll - In the kitchen
ktkm24.dll - YKY
ktkm25.dll - Yet Bonus
ktkm26.dll - Youshi 2
ktkm28.dll - Apoplexy
ktkm36.dll - Savegame - select level
ktkm38.ogg - Castle
ktkm20.dll - Trancoi(Map 4)
ktkm27.dll - TheGoldenAges
ktkm37.dll - Federation(Map 8)
ktkm29.dll - BigBowser
ktkm35.dll - Overworld - SuperMarioBros2U
ktkm120.dll - GameSelect
ktkm19.dll - Rockland Yoshi*/
    if bgm_select=0 {mm_stop_all_ext(); bgm_prev=0; bgm_play=0}



}
// 进入可选项界面（ed_prefs_page 脚本：翻页/防连点/三页设置项/退出）
if bg_selecting=1000 {
    ed_prefs_page()
}

//if muzior2=0  {muzior2=1; global.muzyka=1}



// Ctrl+S 保存
if keyboard_check(vk_control) && keyboard_check(global.key_ed_save) &&
setting_mode = 0 && tool_mode = 0 {
    global.dobackup_save=1
    Save_Script_Main()
    if global.autosavename!='' { show_message("level saved"); }
}

// Ctrl+L 读取
if keyboard_check(vk_control) && keyboard_check(global.key_ed_load) &&
setting_mode = 0 && tool_mode = 0 {
    // NET-SYNC: 客户端禁止 Load（只有房主可 Load，客户端会强制接收房主关卡）
    if instance_exists(o_ednet) && o_ednet.net_state = 3 && o_ednet.net_role = 0 {
        show_message('Load is disabled in co-op edit mode. Only the host can use load function.')
    } else {
        var warning; warning=show_question('Do you REALLY want to load a level WITHOUT the current level saved???')
        if warning=1 {
            global.autosavename='';Load_Script_Main()
            // NET-SYNC: 仅加载成功（script_kile=文件句柄>0）才触发全量同步；取消对话框时 script_kile=''，不标记
            // GM8 字符串与数字不能混比较（Cannot compare arguments），且 && 可能不短路，须嵌套 if 逐层保护
            if is_real(global.script_kile) {
                if global.script_kile > 0 {
                    global.net_pending_sync=1
                }
            }
        }
        if warning=0 {exit}
    }
}

// 光照系统设置

/*无需中键，直接进入光照设置，所以注释掉
if wlaczonaopcja = 2 || wlaczonaopcja = 3 || wlaczonaopcja = 4 {
    if mouse_check_button_pressed(mb_middle) {
        set_light_mode = true;
    }
}*/

set_light_mode = true;

if set_light_mode {

    // ===绘制灯泡图标（ed_light_draw 脚本内按面板/分页条件绘制）===
    if (scrolla < 2) {
        ed_light_draw()
    } // 滚动条预览时候不显示
    // ===设置点击判定（ed_light_click 脚本内按面板/分页条件处理）===
    if mouse_check_button_released(mb_right) {
        ed_light_click()
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
draw_set_blend_mode(bm_normal)
draw_set_font(font0)
draw_set_alpha(1)
draw_set_color(c_white)
draw_text(view_xview[0]+300,view_yview[0]+300,string(instance_number(o_edenemyblock)))
draw_text(view_xview[0]+400,view_yview[0]+350,string(view_xview[0]))
draw_text(view_xview[0]+400,view_yview[0]+400,string(view_yview[0]))

score=fps


draw_text(view_xview[0]+300,view_yview[0]+400,'mouseX+'+string(mouse_x))
draw_text(view_xview[0]+300,view_yview[0]+420,'mouseY+'+string(mouse_y))*/
opcja=0

//上面的是啥（
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=drawowanie blokow z ARRAYA
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if bg_selecting=0 {
    if scrolla <= 1 {
        if mouse_x >= view_xview[0] && mouse_x <= view_xview[0]+640 && mouse_y >= view_yview[0]+480-16 && mouse_y <= view_yview[0]+480 && !mouse_check_button(vk_anykey) { scrolla=1 ; drinka = 1 } else { scrolla=0 ; drinka = 0 ; drinkaa = 0 }
    }
    if scrolla=1 && drinka=1 && drinkaa<30 { drinkaa+=1 }
    if scrolla=1 && drinka=1 && drinkaa>=30 { drinkaa=0 ; scrolla=2 }

    if scrolla = 2 {
        scrollx = view_xview[0]*((608-608*(640/room_width))/max((room_width-640),1))

        if !(mouse_y >= view_yview[0]+480-16 && mouse_y <= view_yview[0]+480 && mouse_x >= view_xview[0] && mouse_x <= view_xview[0]+640) { scrolla=0 ; drinka = 0 }

        if mouse_x >= view_xview[0]+scrollx+16 && mouse_x <= view_xview[0]+scrollx+16+608*(640/room_width) && mouse_y >= view_yview[0]+480-16 && mouse_y <= view_yview[0]+480 && mouse_check_button(mb_left) {
            scrolla = 3
            scrollam1 = mouse_x - view_xview[0]
            scrollam2 = scrollx
        }
    }

    if scrolla = 3 {
        if !mouse_check_button(mb_left) {
            if !(mouse_y >= view_yview[0]+480-16 && mouse_y <= view_yview[0]+480 && mouse_x >= view_xview[0] && mouse_x <= view_xview[0]+640) { scrolla=0 ; drinka = 0 } else { scrolla = 2 }
        } else {
            scrollx = min(max(scrollam2 + mouse_x - view_xview[0] - scrollam1,0),608-608*(640/room_width))
            scroolx = min((max(((((room_width-640)*(scrollx/max((608-608*(640/room_width)),1))+320) div 32) * 32),320)),room_width-320)
        }

    }

    if scrolla >= 2 && scrolla <= 3 {
        draw_sprite_ext(s_drink1,0,view_xview[0],view_yview[0]+480-16,1,1,0,c_white,1)
        draw_sprite_ext(s_drink,0,view_xview[0]+scrollx+16,view_yview[0]+480-16,608*(640/room_width),1,0,c_white,1)
    }


    if scrollb <= 1 {
        if mouse_x >= view_xview[0]+640-16 && mouse_x <= view_xview[0]+640 && mouse_y >= view_yview[0] && mouse_y <= view_yview[0]+480 && !mouse_check_button(vk_anykey) { scrollb=1 ; drinkb = 1 } else { scrollb=0 ; drinkb = 0 ; drinkbb = 0 }
    }
    if scrollb=1 && drinkb=1 && drinkbb<30 { drinkbb+=1 }
    if scrollb=1 && drinkb=1 && drinkbb>=30 { drinkbb=0 ; scrollb=2 }

    if scrollb = 2 {
        scrolly = view_yview[0]*((448-448*(480/room_height))/max((room_height-480),1))

        if !(mouse_x >= view_xview[0]+640-16 && mouse_x <= view_xview[0]+640 && mouse_y >= view_yview[0] && mouse_y <= view_yview[0]+480) { scrollb=0 ; drinkb = 0 }

        if mouse_y >= view_yview[0]+scrolly+16 && mouse_y <= view_yview[0]+scrolly+16+448*(480/room_height) && mouse_x >= view_xview[0]+640-16 && mouse_x <= view_xview[0]+640 && mouse_check_button(mb_left) {
            scrollb = 3
            scrollbm1 = mouse_y - view_yview[0]
            scrollbm2 = scrolly
        }
    }

    if scrollb = 3 {
        if !mouse_check_button(mb_left) {
            if !(mouse_x >= view_xview[0]+640-16 && mouse_x <= view_xview[0]+640 && mouse_y >= view_yview[0] && mouse_y <= view_yview[0]+480) { scrollb=0 ; drinkb = 0 } else { scrollb = 2 }
        } else {
            scrolly = min(max(scrollbm2 + mouse_y - view_yview[0] - scrollbm1,0),448-448*(480/room_height))
            scrooly = min((max(((((room_height-480)*(scrolly/max((448-448*(480/room_height)),1))+240) div 16) * 16),240)),room_height-240)
            if (scrooly-240) mod 32 != 0 { scrooly += 16 }
            if scrooly > room_height-240 { scrooly = room_height-240 }
        }

    }

    if scrollb >= 2 && scrollb <= 3 {
        draw_sprite_ext(s_drink2,0,view_xview[0]+640-16,view_yview[0],1,1,0,c_white,1)
        draw_sprite_ext(s_drinkk,0,view_xview[0]+640-16,view_yview[0]+scrolly+16,1,448*(480/room_height),0,c_white,1)
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.deletemode=1 && !global.ed_region_active {
    if mouse_check_button(mb_right)&& mouse_x>0 && mouse_y>0 && costawia4b=0 && clicked=0 && tool_mode=0 && menu_open=0 && option_open=0 && global.picking=false {
        arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=0
        ed_net_ops_send_grid(floor((mouse_x)/32),floor((mouse_y)/32),0)
        tmp2 = instance_position(mouse_x,mouse_y,o_edenemyblock); ed_net_ops_send_delete(tmp2); with(tmp2) {instance_destroy()}
        tmp2 = instance_position(mouse_x,mouse_y,o_edsceneriesblock); ed_net_ops_send_delete(tmp2); with(tmp2) {instance_destroy()}
        tmp2 = instance_position(mouse_x,mouse_y,o_edmarkerblock); ed_net_ops_send_delete(tmp2); with(tmp2) {instance_destroy()}
        tmp2 = instance_position(mouse_x,mouse_y,o_edpassage); ed_net_ops_send_delete(tmp2); with(tmp2) {instance_destroy()}
        tmp2 = instance_position(mouse_x,mouse_y,o_edbonusesblock); ed_net_ops_send_delete(tmp2); with(tmp2) {instance_destroy()}
    }
    room_caption='DELETE MODE: ON'
} else {room_caption='Super Mario Worker Project '+global.versiontext}

if !show_solid {
    draw_set_font(cyferkimario)
    draw_set_color(c_white)
    draw_text(view_xview[0]+245,view_yview[0]+16,'INVISIBLE SOLID')
}

if global.ed_region_active {
    ed_region_draw()
}
