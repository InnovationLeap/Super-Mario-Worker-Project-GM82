// ed_resize_level(w, h, tx, ty)
// 关卡尺寸调整执行体（o_edmain 上下文调用；w/h=新尺寸 tiles，tx/ty=平移 tiles）
// 本地调用：弹窗采集参数后调用；远端同步（未来）：消息负载带 w/h/tx/ty 直接调用
// 注意：本脚本含 room_restart 重载流程，执行后编辑器状态被重置并从临时文件重建
var _tx, _ty, _i, _j;
_tx = argument2 * 32
_ty = argument3 * 32
sizechange = 1
with(o_edwallsdrawer) {x += _tx; y += _ty}
with(o_edbonusesblock) {x += _tx; y += _ty}
with(o_edbrowser) {x += _tx; y += _ty}
with(o_edenemyblock) {x += _tx; y += _ty
    if(coto=40||coto=41) {fishendX += _tx; fishendY += _ty}
}
with(o_edmarkerblock) {x += _tx; y += _ty
    if(coto=32) {target = max(target+_ty,-64);if(type=2) {water_endX += _tx; water_endY += _ty}}
    if(coto=33) {if(height>-64)height = max(height+_ty,-63)}
    if(coto=34) {camera_endX += _tx; camera_endY += _ty}
}
with(o_edpassage) {x += _tx; y += _ty; exitx += _tx; exity += _ty}
with(o_edsceneriesblock) {x += _tx; y += _ty}
for(_i = 0; _i < argument0; _i += 1) {
    for(_j = 0; _j < argument1; _j += 1) {
        global.arrayetapu2[_i, _j] = 0
    }
}
for (_i = max(0,argument2) ; _i < min(argument0,floor(room_width/32)+argument2) ; _i += 1) {
    for(_j = max(0,argument3) ; _j < min(argument1,floor(room_height/32)+argument3) ; _j += 1) {
        global.arrayetapu2[_i, _j] = arrayetapu[_i-argument2, _j-argument3]
    }
}
global.water_level += argument3 * 32
if global.auto {
    global.firstbound = max(global.firstbound + argument3 * 32, -64)
    if(global.secondbound > -64)global.secondbound = max(global.secondbound + argument3 * 32, -63)
}
room_set_width(room, argument0 * 32)
room_set_height(room, argument1 * 32)
global.autosavename1 = global.autosavename
global.autosavename = working_directory + ".\temp\TempChangeSize.smwl"
create = file_text_open_write(global.autosavename)
file_text_write_string(create," ")
file_text_close(create)
global.lvlwidth = argument0 * 32
global.lvlheight = argument1 * 32
global.donottemp = 1
Save_Script_Main()
with(o_edwallsdrawer) {instance_destroy()}
with(o_edbonusesblock) {instance_destroy()}
with(o_edbrowser) {instance_destroy()}
with(o_edenemyblock) {instance_destroy()}
with(o_edmarkerblock) {instance_destroy()}
with(o_edpassage) {instance_destroy()}
with(o_edsceneriesblock) {instance_destroy()}
room_restart()
Load_Script_Main()
file_delete(global.autosavename)
global.autosavename = global.autosavename1
// NET-SYNC: 完成点——尺寸修改完成。联机同步钩子：本地（发起者/房主）在此触发全量导出广播（阶段3 export 通道）；
// 远端收到全量包后经 ed_net_import 应用（is_remote=1 直接调本脚本，不经过弹窗）。
// 注意：此时房间已重启、关卡已重载，同步数据必须以「修改后的完整关卡」为准（全量重同步，而非增量）。
