/// bgm_custom_rebuild()
/// 用自定义音乐列表重建第 7 页条目（区域+编号+文字一体）。
/// 列表由 music_list_update() 读入 global.customMusicFile[1..customMusicTotal]。
/// 编号规则：626 + 列表序号（与 ed_play_bgm / Music_Play 的自定义音乐编号一致），
/// 翻页用 o_edmain 的实例变量 listscroll，因此须在 o_edmain 上下文中调用。
global.bgm_e_n[7] = 0
var _i;
_i = 1
while _i <= 10 {
    if _i + listscroll <= global.customMusicTotal {
        // 判定框规格与普通页面一致：h=12，首行 y=77，行距 30（文字顶部对齐判定框，见 bgm_e_dy[7]=-1）
        bgm_entry(7, 20, 77 + 30 * (_i - 1), 340, 12, 626 + _i + listscroll, string(_i + listscroll) + '  ' + global.customMusicFile[_i + listscroll])
    }
    _i += 1
}
