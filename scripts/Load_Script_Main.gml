global.script_kile=''
if !variable_global_exists("autosavename"){
global.autosavename=''
}
if global.autosavename=''{
global.script_kile=get_open_filename('All Supported Formats (.smwl;.mfl)|*.smwl;*.mfl|Super Mario Worker Level (.smwl)|*.smwl|Mario Worker Level(.mfl)|*.mfl','')
global.autosavename=global.script_kile
}else{
global.script_kile=global.autosavename
}

if filename_path(global.autosavename) = working_directory+'\Temp\' {global.loadingtemp=1}
else{global.loadingtemp=0}

if(!global.testmode)global.autosavename_record = global.autosavename
if global.script_kile!=''
//if global.script_kile!='nofile'
{
with(o_edwallsdrawer){instance_destroy()}//抽风什么的都给劳资去死
with(o_edbonusesblock){instance_destroy()}
with(o_edbrowser){instance_destroy()}
with(o_edenemyblock){instance_destroy()}
with(o_edmarkerblock){instance_destroy()}
with(o_edpassage){instance_destroy()}
with(o_edsceneriesblock){instance_destroy()}
global.script_kiler=global.script_kile
if file_exists(filename_change_ext(global.script_kile,'.smwlx')){file_delete(filename_change_ext(global.script_kile,'.smwlx'))}
GZ_DeCompressFile(global.script_kile,filename_change_ext(global.script_kile,'.smwlx'))

// DLL 自动检测：若文件是 GB2312 则转为 UTF-8，已是 UTF-8 则不操作
ec_convert_file(filename_change_ext(global.script_kiler,'.smwlx'))

global.script_kile=file_text_open_read(filename_change_ext(global.script_kiler,'.smwlx'))

global.warpnum=0
room_set_width(room,real(file_text_read_string(global.script_kile)))
file_text_readln(global.script_kile)
room_set_height(room,real(file_text_read_string(global.script_kile)))
file_text_readln(global.script_kile)
global.currentPath = filename_path(global.script_kile)
room_restart()}
