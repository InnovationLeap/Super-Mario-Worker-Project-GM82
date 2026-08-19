/// ed_play_bgm(bgm_id)
/// 按 BGM 编号播放对应音乐（数据表驱动，替代 148 个 if 复制链）。
/// 系列：1-29 MW，41-78 MFR，101-144 SMS，145-172 SMS2，173-200 Softendo，
///       201-204 Boss(dll)，205-230 Boss(ogg)，301-400 OM，627+ 自定义音乐。
var _m, _f;
_m = argument0
if _m >= 1 && _m <= 29 {
    // MW 系列（文件名不连续，数据表）
    _f[1] = '.\Data\MW\ktkm1.dll'
    _f[2] = '.\Data\MW\ktkm5.dll'
    _f[3] = '.\Data\MW\ktkm6.dll'
    _f[4] = '.\Data\MW\ktkm7.dll'
    _f[5] = '.\Data\MW\ktkm9.dll'
    _f[6] = '.\Data\MW\ktkm10.dll'
    _f[7] = '.\Data\MW\ktkm12.dll'
    _f[8] = '.\Data\MW\ktkm13.dll'
    _f[9] = '.\Data\MW\ktkm14.dll'
    _f[10] = '.\Data\MW\ktkm15.mp3'
    _f[11] = '.\Data\MW\ktkm16.dll'
    _f[12] = '.\Data\MW\ktkm17.dll'
    _f[13] = '.\Data\MW\ktkm18.mp3'
    _f[14] = '.\Data\MW\ktkm21.dll'
    _f[15] = '.\Data\MW\ktkm22.dll'
    _f[16] = '.\Data\MW\ktkm23.dll'
    _f[17] = '.\Data\MW\ktkm24.dll'
    _f[18] = '.\Data\MW\ktkm25.dll'
    _f[19] = '.\Data\MW\ktkm26.dll'
    _f[20] = '.\Data\MW\ktkm28.dll'
    _f[21] = '.\Data\MW\ktkm36.dll'
    _f[22] = '.\Data\MW\ktkm38.dll'
    _f[23] = '.\Data\MW\ktkm20.dll'
    _f[24] = '.\Data\MW\ktkm27.dll'
    _f[25] = '.\Data\MW\ktkm37.dll'
    _f[26] = '.\Data\MW\ktkm29.dll'
    _f[27] = '.\Data\MW\ktkm35.dll'
    _f[28] = '.\Data\MW\ktkm120.dll'
    _f[29] = '.\Data\MW\ktkm19.dll'
    mm_play_ext(_f[_m], 0)
}
else if _m >= 41 && _m <= 78 {
    // MFR 系列
    _f[41] = '.\Data\MFR\ktkm0.dll'
    _f[42] = '.\Data\MFR\ktkm50.mp3'
    _f[43] = '.\Data\MFR\ktkm51.mp3'
    _f[44] = '.\Data\MFR\ktkm52.mp3'
    _f[45] = '.\Data\MFR\ktkm53.mp3'
    _f[46] = '.\Data\MFR\ktkm55.mp3'
    _f[47] = '.\Data\MFR\ktkm56.mp3'
    _f[48] = '.\Data\MFR\ktkm41.dll'
    _f[49] = '.\Data\MFR\ktkm93.mp3'
    _f[50] = '.\Data\MFR\ktkm94.mp3'
    _f[51] = '.\Data\MFR\ktkm100.mp3'
    _f[52] = '.\Data\MFR\ktkm101.mp3'
    _f[53] = '.\Data\MFR\ktkm103.mp3'
    _f[54] = '.\Data\MFR\ktkm121.mp3'
    _f[55] = '.\Data\MFR\ktkm122.mp3'
    _f[56] = '.\Data\MFR\ktkm123.mp3'
    _f[57] = '.\Data\MFR\ktkm124.mp3'
    _f[58] = '.\Data\MFR\ktkm129.mp3'
    _f[59] = '.\Data\MFR\ktkm130.mp3'
    _f[60] = '.\Data\MFR\ktkm131.mp3'
    _f[61] = '.\Data\MFR\ktkm132.mp3'
    _f[62] = '.\Data\MFR\ktkm133.mp3'
    _f[63] = '.\Data\MFR\ktkm134.mp3'
    _f[64] = '.\Data\MFR\ktkm135.mp3'
    _f[65] = '.\Data\MFR\ktkm210.mp3'
    _f[66] = '.\Data\MFR\ktkm211.mp3'
    _f[67] = '.\Data\MFR\ktkm212.mp3'
    _f[68] = '.\Data\MFR\ktkm213.mp3'
    _f[69] = '.\Data\MFR\ktkm214.mp3'
    _f[70] = '.\Data\MFR\ktkm215.mp3'
    _f[71] = '.\Data\MFR\ktkm2121.mp3'
    _f[72] = '.\Data\MFR\ktkm88.dll'
    _f[73] = '.\Data\MFR\ktkm39.dll'
    _f[74] = '.\Data\MFR\ktkm40.dll'
    _f[75] = '.\Data\MFR\ktkm42.mp3'
    _f[76] = '.\Data\MFR\ktkm125.mp3'
    _f[77] = '.\Data\MFR\ktkm90.mp3'
    _f[78] = '.\Data\MFR\ktkm666.mp3'
    mm_play_ext(_f[_m], 0)
}
else if _m >= 101 && _m <= 144 {mm_play_ext('.\Data\SMS\sms'+string(_m-100)+'.ogg', 0)}
else if _m >= 145 && _m <= 172 {mm_play_ext('.\Data\SMS2\sms'+string(_m-100)+'.ogg', 0)}
else if _m >= 173 && _m <= 200 {mm_play_ext('.\Data\Softendo\std'+string(_m-172)+'.ogg', 0)}
else if _m >= 201 && _m <= 204 {mm_play_ext('.\Data\Bossoss'+string(_m-200)+'.dll', 0)}
else if _m >= 205 && _m <= 230 {mm_play_ext('.\Data\Bossoss'+string(_m-200)+'.ogg', 0)}
else if _m >= 301 && _m <= 400 {mm_play_ext('.\Data\OM\om'+string(_m-300)+'.ogg', 0)}
else if _m >= 627 {
    if variable_global_exists("customMusicTotal") && variable_global_exists("customMusicFile") {
        if _m-626 >= 1 && _m-626 <= global.customMusicTotal {
            mm_play_ext(global.customMusicDirectory+global.customMusic+'\'+global.customMusicFile[_m-626], 0)
        } else {debug_log('o_edmain: BGM '+string(_m)+' 越界（共 '+string(global.customMusicTotal)+' 首），跳过')}
    } else {debug_log('o_edmain: 自定义音乐列表未加载，跳过 BGM '+string(_m))}
}
