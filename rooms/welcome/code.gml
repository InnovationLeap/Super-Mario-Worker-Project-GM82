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

// 编辑器画布滚动键（独立于游戏移动键）
global.key_ed_up=ini_read_real('KeyConfig','ed_up',vk_up)
global.key_ed_down=ini_read_real('KeyConfig','ed_down',vk_down)
global.key_ed_left=ini_read_real('KeyConfig','ed_left',vk_left)
global.key_ed_right=ini_read_real('KeyConfig','ed_right',vk_right)

// 编辑器缩放键
global.key_zoomin=ini_read_real('KeyConfig','zoomin',189)
global.key_zoomout=ini_read_real('KeyConfig','zoomout',187)

// 编辑器功能键
global.key_musictoggle=ini_read_real('KeyConfig','musictoggle',vk_f8)
global.key_autopair=ini_read_real('KeyConfig','autopair',vk_f12)
global.key_bgpanel=ini_read_real('KeyConfig','bgpanel',vk_f6)
global.key_ed_cancel=ini_read_real('KeyConfig','ed_cancel',vk_escape)

// 编辑器画布滚动键 第二绑定（默认 WASD）
global.key_ed_up_2=ini_read_real('KeyConfig','ed_up_2',ord('W'))
global.key_ed_down_2=ini_read_real('KeyConfig','ed_down_2',ord('S'))
global.key_ed_left_2=ini_read_real('KeyConfig','ed_left_2',ord('A'))
global.key_ed_right_2=ini_read_real('KeyConfig','ed_right_2',ord('D'))

// F 键（F6/F8/F12 已被上面的全局变量映射）
global.key_f1=ini_read_real('KeyConfig','f1',vk_f1)
global.key_f2=ini_read_real('KeyConfig','f2',vk_f2)
global.key_f3=ini_read_real('KeyConfig','f3',vk_f3)
global.key_f4=ini_read_real('KeyConfig','f4',vk_f4)
global.key_f5=ini_read_real('KeyConfig','f5',vk_f5)
global.key_f7=ini_read_real('KeyConfig','f7',vk_f7)
global.key_f9=ini_read_real('KeyConfig','f9',vk_f9)
global.key_f10=ini_read_real('KeyConfig','f10',vk_f10)
global.key_f11=ini_read_real('KeyConfig','f11',vk_f11)

// 编辑器保存/读取（Ctrl 组合键的字母部分）
global.key_ed_save=ini_read_real('KeyConfig','ed_save',ord('S'))
global.key_ed_load=ini_read_real('KeyConfig','ed_load',ord('L'))

// 编辑器水位调节键
global.key_waterup=ini_read_real('KeyConfig','waterup',vk_add)
global.key_waterdown=ini_read_real('KeyConfig','waterdown',vk_subtract)

// 编辑器精确移动方向键
global.key_acc_up=ini_read_real('KeyConfig','acc_up',vk_up)
global.key_acc_down=ini_read_real('KeyConfig','acc_down',vk_down)
global.key_acc_left=ini_read_real('KeyConfig','acc_left',vk_left)
global.key_acc_right=ini_read_real('KeyConfig','acc_right',vk_right)

// 编辑器精确移动大步键
global.key_acc_bigup=ini_read_real('KeyConfig','acc_bigup',ord('R'))
global.key_acc_bigdown=ini_read_real('KeyConfig','acc_bigdown',ord('F'))
global.key_acc_bigleft=ini_read_real('KeyConfig','acc_bigleft',ord('D'))
global.key_acc_bigright=ini_read_real('KeyConfig','acc_bigright',ord('G'))

global.customMusic = ini_read_string('GameConfig','CustomMusicPackage','Example')
global.initiallives = ini_read_real('GameConfig','InitialLives',4)
global.font_render = ini_read_real('GameConfig','2xFontRender',0)

ini_close()
// 找到下一个可用的截图编号
global.screenshot_count=0
while (file_exists(working_directory+'\screen_shot_'+string(global.screenshot_count)+'.bmp')){
    global.screenshot_count+=1
}

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
