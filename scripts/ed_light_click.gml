/// ed_light_click()
/// 光照图标右键点击判定：命中则翻转对应 lightobject 位（跨格物品用 || 组合命中）。
/// 需在 self=o_edmain 上下文、mouse_check_button_released(mb_right) 内调用。
/// 敌人段沿用 toggle_light_icon（无网络同步，与原行为一致）；其余段用 ed_light_hit/flip（含网络同步）。

// === Marks 类 ===
if option_open = 4 {
    if ed_light_hit(3, 0, 64) {ed_light_flip(1)}            // o_marker
    if ed_light_hit(0, 2, 64) {ed_light_flip(2)}            // o_ice
    if ed_light_hit(0, 3, 384) {ed_light_flip(3)}           // o_windas（整行）
    if ed_light_hit(2, 1, 128) || ed_light_hit(2, 2, 64) {ed_light_flip(10)}  // 部分可顶砖块（两区域）
    if ed_light_hit(4, 1, 128) {ed_light_flip(69)}          // 开关砖阴阳
}

// === 景物类第一页 ===
if option_open = 3 && costawia3b = 0 {
    if ed_light_hit(5, 0, 64) {ed_light_flip(4)}            // Night Tree
    if ed_light_hit(5, 1, 64) {ed_light_flip(5)}            // Big Night Tree
    if ed_light_hit(4, 2, 64) {ed_light_flip(6)}            // Bright Light
    if ed_light_hit(5, 3, 64) {ed_light_flip(7)}            // Potrait
}

// === 景物类第二页 ===
if option_open = 3 && costawia3b = 1 {
    if ed_light_hit(4, 1, 64) {ed_light_flip(8)}            // Lava Fall
    if ed_light_hit(1, 2, 64) {ed_light_flip(9)}            // Roto-disc Center
}

// === Bonus 第一页 ===
if option_open = 5 && o_edmain.bonus_page = 0 {
    if ed_light_hit(0, 0, 384) || ed_light_hit(0, 3, 64) {ed_light_flip(10)}  // 问号砖（顶行+左下角）
    if ed_light_hit(0, 2, 64) {ed_light_flip(11)}           // 红蘑菇
    if ed_light_hit(1, 2, 64) {ed_light_flip(12)}           // 火力花
    if ed_light_hit(2, 2, 64) {ed_light_flip(13)}           // 甜菜
    if ed_light_hit(3, 2, 64) {ed_light_flip(14)}           // 绿果
    if ed_light_hit(4, 2, 64) {ed_light_flip(15)}           // 无敌星
    if ed_light_hit(5, 2, 64) {ed_light_flip(16)}           // 绿蘑菇
    if ed_light_hit(2, 3, 128) {ed_light_flip(17)}          // 普通可碎砖、金砖
    if ed_light_hit(5, 3, 64) {ed_light_flip(18)}           // 金币
}

// === Bonus 第二页（叶子道具）===
if option_open = 5 && o_edmain.bonus_page = 1 {
    if ed_light_hit(0, 0, 64) {ed_light_flip(10)}           // 问号砖叶子（共用 bit 10）
    if ed_light_hit(2, 0, 64) {ed_light_flip(70)}           // 叶子
}

// === 敌人类第一页 ===
if option_open = 2 && o_edmain.costawia2b = 0 {
    toggle_light_icon(0, 0, 19);    // 板栗仔
    toggle_light_icon(1, 0, 20);    // 绿乌龟
    toggle_light_icon(2, 0, 21);    // 红乌龟
    toggle_light_icon(3, 0, 22);    // 绿飞龟
    toggle_light_icon(4, 0, 23);    // 红刺猬
    toggle_light_icon(5, 0, 24);    // 水管绿色食人花（两格）
    toggle_light_icon(0, 1, 24);
    toggle_light_icon(1, 1, 25);    // 水管红色食人花（两格）
    toggle_light_icon(2, 1, 25);
    toggle_light_icon(3, 1, 26);    // 红刺猬云
    toggle_light_icon(4, 1, 27);    // 炮台
    toggle_light_icon(5, 1, 28);    // 红鱼
    toggle_light_icon(0, 2, 29);    // 绿鱼
    toggle_light_icon(1, 2, 30);    // 蓝鱼
    toggle_light_icon(2, 2, 31);    // 黄刺鱼
    toggle_light_icon(3, 2, 32);    // 毒蘑菇
    toggle_light_icon(4, 2, 33);    // 扎地食人花
    toggle_light_icon(5, 2, 34);    // 岩浆
    toggle_light_icon(0, 3, 35);    // 锤子龟
    toggle_light_icon(1, 3, 36);    // 探照灯
    toggle_light_icon(2, 3, 37);    // 火球
    toggle_light_icon(3, 3, 38);    // 地刺（MW样式）
    toggle_light_icon(4, 3, 39);    // 石盾
    toggle_light_icon(5, 3, 40);    // 库巴
}

// === 敌人类第二页 ===
if option_open = 2 && o_edmain.costawia2b = 1 {
    toggle_light_icon(0, 0, 41);    // 灰刺猬
    toggle_light_icon(1, 0, 42);    // 炮台（追踪）
    toggle_light_icon(5, 0, 42);    // 炮台（追踪，倒）
    toggle_light_icon(2, 0, 43);    // 火球龟
    toggle_light_icon(3, 0, 44);    // 岩浆底部
    toggle_light_icon(4, 0, 27);    // 炮台（倒）
    toggle_light_icon(0, 1, 45);    // 布布鬼
    toggle_light_icon(1, 1, 46);    // 硬壳龟
    toggle_light_icon(2, 1, 47);    // 红飞龟
    toggle_light_icon(3, 1, 48);    // 蓝乌龟
    toggle_light_icon(4, 1, 49);    // 蓝飞龟
    toggle_light_icon(5, 1, 50);    // 电珊瑚
    toggle_light_icon(0, 2, 51);    // 地刺（MF样式）
    toggle_light_icon(1, 2, 52);    // 金乌龟
    toggle_light_icon(2, 2, 53);    // 金飞龟
    toggle_light_icon(5, 2, 54);    // 静止探照灯
    toggle_light_icon(0, 3, 55);    // 龟壳
    toggle_light_icon(1, 3, 56);    // 水管蓝色食人花（两格）
    toggle_light_icon(2, 3, 56);
    toggle_light_icon(3, 3, 57);    // 水管灰色食人花（两格）
    toggle_light_icon(4, 3, 57);
    toggle_light_icon(5, 3, 58);    // 灰刺猬云
}
