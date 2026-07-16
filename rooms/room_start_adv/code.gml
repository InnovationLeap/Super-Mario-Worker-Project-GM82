/*
file_delete(working_directory+"\temp\bass.dll")
file_delete(working_directory+"\temp\bass_fx.dll")
global.musicfile=''
global.musicfile2=''
global.musicplay=0
global.musicplay2=0
global.nastawielkosc=0
global.zamenowane=0
instance_create(0,0,o_edbrowser)
global.escowanie=0
//Important: Change the version
global.version=1711
global.betanumber=1
global.versiontext='v1.7.11-beta1'
room_caption='Super Mario Worker Project '+global.versiontext

global.saving=0
global.smoothmode=-1
global.levelsmooth=-1
global.autoscrolls = ds_list_create();
if !file_exists(working_directory+'\temp\TempSettings.ini'){
directory_create(working_directory+'\temp\')
tempid = file_text_open_write(working_directory+'\temp\TempSettings.ini')
file_text_write_string(tempid,'CurrentTempNumber=0')
file_text_writeln(tempid)
file_text_write_string(tempid,'MaxTempNumber=100')
file_text_close(tempid)
}
tempid = file_text_open_read(working_directory+'\temp\TempSettings.ini')
tempstr =file_text_read_string(tempid)
global.tempnumber = real(string_digits(tempstr))
file_text_readln(tempid)
tempstr =file_text_read_string(tempid)
global.maxtemp = real(string_digits(tempstr))
file_text_close(tempid)
//读取设置
ini_open('GameSettings.ini')
global.objectoffset=ini_read_real('GameConfig','ObjOffset',0)
global.checkupdate=ini_read_real('GameConfig','AutoCheckUpdates',1)
global.assist=ini_read_real('GameConfig','Assist',0)
global.sterowaniegora=ini_read_real('KeyConfig','up',vk_up)
global.sterowaniedol=ini_read_real('KeyConfig','down',vk_down)
global.sterowanielewo=ini_read_real('KeyConfig','left',vk_left)
global.sterowanieprawo=ini_read_real('KeyConfig','right',vk_right)
global.sterowanieskok=ini_read_real('KeyConfig','jump',ord('Z'))
global.sterowaniebieg=ini_read_real('KeyConfig','fire',ord('X'))
global.key_pick=ini_read_real('KeyConfig','pick',ord('E'))
global.key_select=ini_read_real('KeyConfig','accurate_move',ord('Z'))
global.key_submenu=ini_read_real('KeyConfig','submenu',ord('Q'))
global.customMusic = ini_read_string('GameConfig','CustomMusicPackage','Example')
ini_close()
*/
