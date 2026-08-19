/// ed_light_draw()
/// 绘制所有面板（marks/景物/bonus/敌人）的光照图标（s_setlight 灯泡），
/// 每格一个 draw_light_icon(col, row, bit) 调用——数据表形式，一行一格。
/// 需在 self=o_edmain 上下文、scrolla<2 内调用（o_edmain 原 if set_light_mode 块内）。

// === Marks 类 ===
if option_open = 4 {
    draw_light_icon(3, 0, 1);      // o_marker
    draw_light_icon(0, 2, 2);      // o_ice
    draw_light_icon(0, 3, 3);      // o_windas（整行 6 格）
    draw_light_icon(1, 3, 3);
    draw_light_icon(2, 3, 3);
    draw_light_icon(3, 3, 3);
    draw_light_icon(4, 3, 3);
    draw_light_icon(5, 3, 3);
    draw_light_icon(2, 1, 10);     // 部分可顶砖块（信息砖/开关砖/水位砖）
    draw_light_icon(3, 1, 10);
    draw_light_icon(2, 2, 10);
    draw_light_icon(4, 1, 69);     // 开关砖阴阳部分
    draw_light_icon(5, 1, 69);
}

// === 景物类第一页 ===
if option_open = 3 && costawia3b = 0 {
    draw_light_icon(5, 0, 4);      // Night Tree
    draw_light_icon(5, 1, 5);      // Big Night Tree
    draw_light_icon(4, 2, 6);      // Bright Light
    draw_light_icon(5, 3, 7);      // Potrait
}

// === 景物类第二页 ===
if option_open = 3 && costawia3b = 1 {
    draw_light_icon(4, 1, 8);      // Lava Fall
    draw_light_icon(1, 2, 9);      // Roto-disc Center
}

// === Bonus 第一页 ===
if option_open = 5 && o_edmain.bonus_page = 0 {
    draw_light_icon(0, 0, 10);     // 问号砖（顶行 6 格 + 左下角）
    draw_light_icon(1, 0, 10);
    draw_light_icon(2, 0, 10);
    draw_light_icon(3, 0, 10);
    draw_light_icon(4, 0, 10);
    draw_light_icon(5, 0, 10);
    draw_light_icon(0, 3, 10);
    draw_light_icon(0, 2, 11);     // 红蘑菇
    draw_light_icon(1, 2, 12);     // 火力花
    draw_light_icon(2, 2, 13);     // 甜菜
    draw_light_icon(3, 2, 14);     // 绿果
    draw_light_icon(4, 2, 15);     // 无敌星
    draw_light_icon(5, 2, 16);     // 绿蘑菇
    draw_light_icon(2, 3, 17);     // 普通可碎砖、金砖
    draw_light_icon(3, 3, 17);
    draw_light_icon(5, 3, 18);     // 金币
}

// === Bonus 第二页（叶子道具）===
if option_open = 5 && o_edmain.bonus_page = 1 {
    draw_light_icon(0, 0, 10);     // 问号砖叶子（共用 bit 10）
    draw_light_icon(2, 0, 70);     // 叶子
}

// === 敌人类第一页 ===
if option_open = 2 && o_edmain.costawia2b = 0 {
    draw_light_icon(0, 0, 19);     // 板栗仔
    draw_light_icon(1, 0, 20);     // 绿乌龟
    draw_light_icon(2, 0, 21);     // 红乌龟
    draw_light_icon(3, 0, 22);     // 绿飞龟
    draw_light_icon(4, 0, 23);     // 红刺猬
    draw_light_icon(5, 0, 24);     // 水管绿色食人花（两格）
    draw_light_icon(0, 1, 24);
    draw_light_icon(1, 1, 25);     // 水管红色食人花（两格）
    draw_light_icon(2, 1, 25);
    draw_light_icon(3, 1, 26);     // 红刺猬云
    draw_light_icon(4, 1, 27);     // 炮台
    draw_light_icon(5, 1, 28);     // 红鱼
    draw_light_icon(0, 2, 29);     // 绿鱼
    draw_light_icon(1, 2, 30);     // 蓝鱼
    draw_light_icon(2, 2, 31);     // 黄刺鱼
    draw_light_icon(3, 2, 32);     // 毒蘑菇
    draw_light_icon(4, 2, 33);     // 扎地食人花
    draw_light_icon(5, 2, 34);     // 岩浆
    draw_light_icon(0, 3, 35);     // 锤子龟
    draw_light_icon(1, 3, 36);     // 探照灯
    draw_light_icon(2, 3, 37);     // 火球
    draw_light_icon(3, 3, 38);     // 地刺（MW样式）
    draw_light_icon(4, 3, 39);     // 石盾
    draw_light_icon(5, 3, 40);     // 库巴
}

// === 敌人类第二页 ===
if option_open = 2 && o_edmain.costawia2b = 1 {
    draw_light_icon(0, 0, 41);     // 灰刺猬
    draw_light_icon(1, 0, 42);     // 炮台（追踪）
    draw_light_icon(2, 0, 43);     // 火球龟
    draw_light_icon(3, 0, 44);     // 岩浆底部
    draw_light_icon(4, 0, 27);     // 炮台（倒）
    draw_light_icon(5, 0, 42);     // 炮台（追踪，倒）
    draw_light_icon(0, 1, 45);     // 布布鬼
    draw_light_icon(1, 1, 46);     // 硬壳龟
    draw_light_icon(2, 1, 47);     // 红飞龟
    draw_light_icon(3, 1, 48);     // 蓝乌龟
    draw_light_icon(4, 1, 49);     // 蓝飞龟
    draw_light_icon(5, 1, 50);     // 电珊瑚
    draw_light_icon(0, 2, 51);     // 地刺（MF样式）
    draw_light_icon(1, 2, 52);     // 金乌龟
    draw_light_icon(2, 2, 53);     // 金飞龟
    draw_light_icon(5, 2, 54);     // 静止探照灯
    draw_light_icon(0, 3, 55);     // 龟壳
    draw_light_icon(1, 3, 56);     // 水管蓝色食人花（两格）
    draw_light_icon(2, 3, 56);
    draw_light_icon(3, 3, 57);     // 水管灰色食人花（两格）
    draw_light_icon(4, 3, 57);
    draw_light_icon(5, 3, 58);     // 灰刺猬云
}
