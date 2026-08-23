// loader_common_init(argument0=入口模式: 0=F3/.smwl(原Loader房间), 1=.mfl(原Loader2), 2=Scenario(原LoaderScenario))
// 三个加载器房间创建代码的合并主体：全局重置 → 关卡来源选择 → 清场与分发。
// 各模式的差异以最小分支承载，除下列两点外所有语句与各房间原版逐行一致：
//   【归一】原 Scenario 的 bowser_phase 双写、Loader 系的空 else{} —— 合并时去除（无行为影响）
//   【保留的原版怪癖】supermode 仅 .mfl 路径会重置（其余路径沿用旧值）；
//     Scenario 分支不含 window_set_cursor 与 zycia 重置族 —— 均为原版既有行为。
var _filter, _target;

if argument0 <> 2 {window_set_cursor(cr_default)}
room_caption='Super Mario Worker Project '+global.versiontext
if argument0 = 1 {global.supermode=1} //仅 .mfl 路径设置；其余路径原版即不触碰此值
global.bowser_phase=0
global.level_bowser_hp=5
global.przeciwnicyzatrzymani=0
global.pauza=0
global.level_complete=0

global.auto=0
global.lava=0
global.firstbound=0
global.secondebound=-64
global.water_velocity=1
global.water_delay=0
global.fast_retry=0
global.topdeath=0
global.MFbeet=0
global.pipeout=0
global.fastpass=0
global.huddisplay=0
global.rainy=0
global.rainy_record=0
global.fallingstars=0
global.fallingstars_record=0
global.snowy=0
global.snowy_record=0
global.thunder=0
global.thunder_record=0
global.windy=0
global.windy_record=0
global.darkness=0
global.darkness_record=0
global.brightness=0
global.brightness_record=0
global.lightobject='0000000000000000000000000000000000000000000000000000000000000000000000'
global.stunblock=0

for(i=0;i<8;i+=1) {
    global.yinyang_status[i]=-1;
    global.yinyang_record[i]=-1;
}

global.lava_record=0
global.auto_record=0
//global.key_left=37
//global.key_right=39
//global.key_jump=ord('Z')
//global.key_fire=ord('X')
//global.key_up=38
//global.key_down=40
global.water_level=200
global.coins=0
global.efekty=10
global.sample=1
global.game_volume=1


global.rodzajmaria=0
if argument0 <= 1 {
    global.zycia=global.initiallives        //zycia重置族仅 0/1 路径存在（Scenario 原版不做）
    global.lastrodzajmaria=0
    global.lastzycia=4
    global.lastcoins=0
    global.last_score=0
}
global.coins=0
global.score=0

global.combo1=0
global.combo1reset=0

//—— 模式专属预置（独立赋值，位置由原列表中段迁至尾部，终态等价）——
if argument0 = 0 {
    global.advswitch=0
    global.celeste=1
}
if argument0 = 1 {
    global.advswitch=1
    global.celeste=0
}
if argument0 = 2 {
    global.advswitch=1
    global.celeste=0
    global.lastlev=0
    global.encrypt=0
}

global.toload=''

//—— 关卡来源 ——
if argument0 = 0 {
    //自动存档恢复（仅 F3/.smwl 路径）
    if !variable_global_exists("autosavename") {
        global.autosavename=''
    }
    if global.autosavename!='' {
        global.toload=global.autosavename
    }
    //SMWP TAS 入口
    if global.smwptas {
        global.smwptas = 0;
        global.toload = working_directory + "\smwptas.smwl";
        if !file_exists(global.toload) {
            show_message("SMWP TAS Level File Not Found: " + global.toload);
            global.toload = '';
        }
    }
}
if argument0 = 2 {get_crypt_key1()}

if argument0 <= 1 {
    if argument0 = 0 {_filter='All Supported Formats (.smwl;.mfl)|*.smwl;*.mfl|Super Mario Worker Level (.smwl)|*.smwl|Mario Worker Level(.mfl)|*.mfl'}
    else {_filter='Mario Worker Level (.mfl)|*.mfl'}
    while global.toload='' {
        global.toload=get_open_filename(_filter,'')
        if global.toload='' {
            global.stop_choice=show_question('Do you want to stop loading a level?');
            global.toload=''
            if global.stop_choice=1 {global.entered_editor=1;global.toload='cipas';room_goto(title)}
        }
    }
} else {
    while global.toload='' {
        if crypt_key_arr[0] != 0 {
            global.toload=get_open_filename('All Supported Formats (.smws;.smwp;.mfs)|*.smws;*.smwp;*.mfs|Super Mario Worker Scenario (.smws)|*.smws|Protected Mario Worker Scenario (.smwp)|*.smwp|Mario Worker Scenario(.mfs)|*.mfs','')
        } else {
            global.toload=get_open_filename('All Supported Formats (.smws;.mfs)|*.smws;*.mfs|Super Mario Worker Scenario (.smws)|*.smws|Mario Worker Scenario(.mfs)|*.mfs','')
        }
        if global.toload='' {
            global.stop_choice=show_question('Do you want to stop loading a scenario?');global.toload=''
            if global.stop_choice=1 {global.entered_editor=1;global.toload='cipas';room_goto(title)}
        }
    }
}

//—— 清场 + 加载 + 进入 ——
if global.toload!='' && global.toload!='cipas' {
    if argument0 = 2 {
        room_tile_clear(Play_Room)
        room_instance_clear(Play_Room)

        global.mfsfilename=global.toload

        if filename_ext(global.mfsfilename)='.smwp' {
            global.encrypt=1
        }
        //检测存档文件
        global.loadingsav = false
        if file_exists(filename_change_ext(global.mfsfilename,'.mwsav')) {
            global.loadingsav = show_question('.mwsav file detected. Continue your saved progress?')
            if (global.loadingsav) {
                global.mfsfilename = filename_change_ext(global.mfsfilename,'.mwsav');
            }
        }

        global.firstlev=1
        global.currentlevel=0
        global.lastlev=0
        room_goto(Another_Level)

        global.level_cleared=0
        global.parallax=0
        global.paralax2=0
        global.paralax3=0
    } else {
        if argument0 = 1 {_target=Play_Room2} else {_target=Play_Room}
        room_tile_clear(_target)
        room_instance_clear(_target)
        if argument0 = 1 {Load_Script_Play2()} else {Load_Script_Play()}
        room_instance_add(_target,0,0,o_assist)
        file_text_close(global.toload)
        global.lastlev=1
        room_goto(_target)
        global.level_cleared=0


        global.parallax=0
        global.paralax2=0
        global.paralax3=0
    }
}
