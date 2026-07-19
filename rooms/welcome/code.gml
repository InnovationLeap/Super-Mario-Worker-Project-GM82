//Important: Change the version
global.version=1713
global.betanumber=0
global.versiontext='v1.7.13-beta1'

global.musicfile=''
global.musicfile2=''
global.musicplay=0
global.musicplay2=0

//再见 Gzip
//GZ_Init()

//再见 SXMS
//SXMS_I_Init(44000,200,0,0,0,0)
global.nastawielkosc=0
global.zamenowane=0
global.escowanie=0
global.saving=0
global.smoothmode=-1
global.levelsmooth=-1
global.autosolid = 0

//Brightness/照明物体列表
global.light_obj_list = ds_list_create();

//global.welcometime=0
//while global.welcometime<150
//{global.welcometime+=1}
//if !!sound_isplaying(INL){
//room_goto_next()}
instance_create(0,0,o_welcome)
room_caption='Super Mario Worker Project '+global.versiontext
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
// ASCII 临时目录（用于 gzip DLL 中文路径转义）
directory_create("C:\Users\Public\smwptemp\");
global.ascii_temp_path = "C:\Users\Public\smwptemp\";
// cleanup old temp files from previous runs
file_delete(working_directory+"\temp\bass.dll")
file_delete(working_directory+"\temp\bass_fx.dll")
file_delete(global.ascii_temp_path+"bass_tmp.smw")
file_delete(global.ascii_temp_path+"bass_tmpx.smw")
file_delete(global.ascii_temp_path+"bass_sav.smw")
file_delete(global.ascii_temp_path+"bass_savx.smw")

//读取设置
ini_open('GameSettings.ini')
global.objectoffset=ini_read_real('GameConfig','ObjOffset',0)
global.assist=ini_read_real('GameConfig','Assist',0)
global.sterowaniegora=ini_read_real('KeyConfig','up',vk_up)
global.sterowaniedol=ini_read_real('KeyConfig','down',vk_down)
global.sterowanielewo=ini_read_real('KeyConfig','left',vk_left)
global.sterowanieprawo=ini_read_real('KeyConfig','right',vk_right)
global.sterowanieskok=ini_read_real('KeyConfig','jump',ord('Z'))
global.sterowaniebieg=ini_read_real('KeyConfig','fire',ord('X'))
global.restartlevelkey=ini_read_real('KeyConfig','restartlevel',ord('Q'))
global.key_pick=ini_read_real('KeyConfig','pick',ord('E'))
global.key_select=ini_read_real('KeyConfig','accurate_move',ord('Z'))
global.key_submenu=ini_read_real('KeyConfig','submenu',ord('Q'))
global.customMusic = ini_read_string('GameConfig','CustomMusicPackage','Example')
global.initiallives = ini_read_real('GameConfig','InitialLives',4)
global.font_render = ini_read_real('GameConfig','2xFontRender',0)
ini_close()

//EncodingConv init
ec_init();

//SMWGzip init
gz_init();

//Fox Writing init
globalvar testfont;
fw_init();
fw_release_cache();
fw_set_encoding("UTF-8");
testfont = fw_add_font_from_file(".\Fonts\message.ttf", 14.1, false, false, true)
fw_draw_set_font(testfont);
fw_draw_set_halign(fa_left);
fw_draw_set_valign(fa_bottom);
fw_enable_pixel_alignment(true);
draw_set_color(c_white)
fw_draw_set_line_spacing(4)

fw_set_render_scale(1+global.font_render)

//Fox Writing init end
