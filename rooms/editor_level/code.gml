room_caption='Super Mario Worker Project '+global.versiontext

global.przeciwnicyzatrzymani=0
global.pauza=0
global.parallax=0
global.paralax2=0
global.paralax3=0
global.bgm_id=1
global.bgp=1
global.musicon=0

global.lava=0
global.auto=0
global.advswitch=0
global.fast_retry=0
global.topdeath=0
global.firstbound=0
global.secondbound=-64
global.velocity=1
global.water_velocity=1
global.delay=0
global.MFbeet=1
global.celeste=1
global.pipeout=0
global.fastpass=0
global.huddisplay=0
global.rainy=0
global.fallingstars=0
global.snowy=0
global.thunder=0
global.windy=0
global.darkness=0
global.brightness=0
global.lightobject='0000000000000000000000000000000000000000000000000000000000000000000000'
global.stunblock=0
//global.key_left=38
//global.key_right=40
//global.key_jump=16
//global.key_fire=90
//global.key_up=38
//global.key_down=40
global.water_level=800
global.coins=0
global.efekty=10
global.sample=1
global.game_volume=1


global.rodzajmaria=0
global.zycia=global.initiallives
global.coins=0
global.score=0

global.combo1=0
global.combo1reset=0




global.EDtest=0
global.agspeed=1
global.petal_spotlight=0
global.petal_max_promien=200
global.petal_promien_szybkosc=1

global.level_name_edit='Level 1'
global.level_author=''
global.level_time=600
global.level_gravity=5
global.level_bowser_hp=5
global.save=0
global.savename='null'
global.wysokoscwody=1000
global.background=0
global.level_cleared=0
global.godmode=0
global.levelsmooth=-1
global.beep=1

if variable_global_exists('testmode') {
    if global.testmode=1 {
        // NET-SYNC: 返回加载源改回 temp.smwl（testsave）——temp_play 副本已被 Load_Script_Play 删除
        if variable_global_exists('testsave') {
            global.autosavename = global.testsave
        }
        // [R] DBG: 测关返回将加载的文件状态（temp.smwl 缺失/为 0 → 必然塌缩）
        debug_log("[R] editor_level: testsave_exists=" + string(variable_global_exists('testsave')) + " autosavename=" + global.autosavename + " exists=" + string(file_exists(global.autosavename)) + " size=" + string(file_size(global.autosavename)))
        Load_Script_Main()
        global.testmode=0
        file_delete(global.autosavename)
        global.autosavename=global.autosavename1
        // NET-SYNC: 测关返回（room_restart 会重启本房间，重放/广播必须延后到 Load_Script_Masta 数据填充完成）
        // 房主：标记 net_pending_sync，由 o_edmain Step 在数据完整后触发重放+全量广播；
        // 客户端：请求房主重发全量（测关中静默丢弃的增量由此补齐）
        if instance_exists(o_ednet) {
            with(o_ednet) {
                if net_state = 3 {
                    if net_role = 1 {
                        global.net_pending_sync = 1
                    } else {
                        ed_net_ops_request_full(net_sendbuf)
                    }
                }
            }
        }}}
