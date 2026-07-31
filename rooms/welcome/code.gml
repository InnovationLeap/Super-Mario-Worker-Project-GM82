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
instance_create(0,0,o_screenshot)
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
// 编辑器暂停键（空格 / 切换关卡滚动）
global.key_ed_pause=ini_read_real('KeyConfig','ed_pause',vk_space)
// 编辑器删除模式键（Delete）
global.key_ed_delete=ini_read_real('KeyConfig','ed_delete',vk_delete)

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

// God Mode 数字键（默认 1~0，可在设置第二页自定义）
global.godkey_small=ini_read_real('KeyConfig','god_small',ord('1'))
global.godkey_big=ini_read_real('KeyConfig','god_big',ord('2'))
global.godkey_fire=ini_read_real('KeyConfig','god_fire',ord('3'))
global.godkey_fruit=ini_read_real('KeyConfig','god_fruit',ord('4'))
global.godkey_beet=ini_read_real('KeyConfig','god_beet',ord('5'))
global.godkey_raccoon=ini_read_real('KeyConfig','god_raccoon',189)
global.godkey_star=ini_read_real('KeyConfig','god_star',ord('6'))
global.godkey_invincible=ini_read_real('KeyConfig','god_invincible',ord('7'))
global.godkey_fly=ini_read_real('KeyConfig','god_fly',ord('8'))
global.godkey_life=ini_read_real('KeyConfig','god_life',ord('9'))
global.godkey_scroll=ini_read_real('KeyConfig','god_scroll',ord('0'))
global.godkey_cp_prev=ini_read_real('KeyConfig','god_cp_prev',vk_pageup)
global.godkey_cp_next=ini_read_real('KeyConfig','god_cp_next',vk_pagedown)
global.godkey_bowser=ini_read_real('KeyConfig','god_bowser',vk_backspace)

// 编辑器：PgUp/PgDn 跳转到上/下一个 Check Point（默认 PgUp/PgDn）
global.edkey_cp_prev=ini_read_real('KeyConfig','ed_cp_prev',vk_pageup)
global.edkey_cp_next=ini_read_real('KeyConfig','ed_cp_next',vk_pagedown)

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

// 编辑器复制键
global.key_copy=ini_read_real('KeyConfig','copy',ord('C'))

// 编辑器选区模式键
global.key_region_select=ini_read_real('KeyConfig','region_select',ord('U'))
global.key_region_cycle=ini_read_real('KeyConfig','region_cycle',ord('T'))

global.customMusic = ini_read_string('GameConfig','CustomMusicPackage','Example')
global.initiallives = ini_read_real('GameConfig','InitialLives',4)
global.font_render = ini_read_real('GameConfig','2xFontRender',0)
global.compress_save = ini_read_real('GameConfig','CompressSave',1)

// 截图保存路径（GM8.2 UTF-8 环境，file_text 直接读取中文路径）
var _ss_path, _ss_default, _ss_line, _ss_fid;
var _ss_ti, _ss_ch;
_ss_default = working_directory
_ss_path = ''

if (file_exists(_ss_default + '\GameSettings.ini')){
    _ss_fid = file_text_open_read(_ss_default + '\GameSettings.ini')
    while (!file_text_eof(_ss_fid)){
        _ss_line = file_text_read_string(_ss_fid)
        file_text_readln(_ss_fid)
        if (string_pos('ScreenshotPath=', _ss_line) == 1){
            _ss_path = string_copy(_ss_line, string_length('ScreenshotPath=') + 1, string_length(_ss_line))
            // 手动 trim 首尾空白
            _ss_ti = 1
            while (_ss_ti <= string_length(_ss_path)){
                _ss_ch = ord(string_char_at(_ss_path, _ss_ti))
                if (_ss_ch != 32 && _ss_ch != 9 && _ss_ch != 13 && _ss_ch != 10){ break }
                _ss_ti += 1
            }
            _ss_path = string_copy(_ss_path, _ss_ti, string_length(_ss_path))
            _ss_ti = string_length(_ss_path)
            while (_ss_ti >= 1){
                _ss_ch = ord(string_char_at(_ss_path, _ss_ti))
                if (_ss_ch != 32 && _ss_ch != 9 && _ss_ch != 13 && _ss_ch != 10){ break }
                _ss_ti -= 1
            }
            _ss_path = string_copy(_ss_path, 1, _ss_ti)
            break
        }
    }
    file_text_close(_ss_fid)
}

// 配置缺失 → 默认值
if (_ss_path == ''){
    _ss_path = _ss_default
    ini_write_string('GameConfig', 'ScreenshotPath', _ss_default)
}
global.screenshot_path = _ss_path

ini_close()
// 找到下一个可用的截图编号
global.screenshot_count=100
while (file_exists(global.screenshot_path+'\screenshot'+string(global.screenshot_count)+'.png')){
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

// Persistent debug message manager
instance_create(0, 0, o_debugmsg)
