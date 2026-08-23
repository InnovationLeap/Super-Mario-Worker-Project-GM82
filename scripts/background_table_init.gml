// background_table_init —— 背景数据表
// 由旧版 background_show 的 switch 实现(32 case + default)逐字段自动转写，规则见 bg_addrow 头注释。
// 与原文的三处约定：
//   1) 背景28 层1 的 y=room_height-320*background_yscale[1]，表内占位、由 background_show 特判还原；
//   2) 背景28 层3 原文即 visible=0，不建行即等价；
//   3) 云漂移/水波渐变旧版仅在背景 4、29 的 case 内执行，对应表尾 bg_fx 两行。
var i, r;
for (i = 0; i < 80; i += 1) {
    global.bg_first[i] = -1
    global.bg_count[i] = 0
    global.bg_fx[i] = 0
}
r = 0

//1 普通天空
r = bg_addrow(r, 1, 0, background5, 0, 0, 0, 0, 0, 0, 1, 1);

//2 白天+地下
r = bg_addrow(r, 2, 0, background11, 1, 0, 480, 0, 0, 0, 1, 0);
r = bg_addrow(r, 2, 1, background12, 0, 0, 480, 0, 0, 0, 1, 0);
r = bg_addrow(r, 2, 2, background5, 0, 0, 0, 0, 0, 0, 1, 0);

//3 白天+草地
r = bg_addrow(r, 3, 0, background5, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 3, 1, background13, 0, 1, 140, 0, 0, 0, 1, 0);

//4 白天+草地（满速滚屏）
r = bg_addrow(r, 4, 0, background5, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 4, 1, background13, 0, 1, 140, 1, 1, 0, 1, 0);
r = bg_addrow(r, 4, 2, background14, 0, 2, 50, 1, 2, 1, -1, 0);
r = bg_addrow(r, 4, 3, background14, 0, 2, 0, 1, 3, 2, -1, 0);

//5 地下
r = bg_addrow(r, 5, 0, background11, 1, 0, 0, 0, 0, 0, 1, 0);

//6 岩石山
r = bg_addrow(r, 6, 0, background5, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 6, 1, background15, 0, 1, 101, 0, 0, 0, 1, 0);

//7 水下
r = bg_addrow(r, 7, 0, background5, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 7, 1, background16, 0, 1, 163, 0, 0, 0, 1, 0);

//8 水下（缓慢滚屏）
r = bg_addrow(r, 8, 0, background5, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 8, 1, background16, 0, 1, 180, 1, 1, 0, 0.2, 0);
r = bg_addrow(r, 8, 2, background16, 0, 1, 160, 1, 2, 0, 0.8, 0);
r = bg_addrow(r, 8, 3, background16, 0, 1, 140, 1, 3, 0, 1, 0);

//9 城堡（缓慢滚屏）
r = bg_addrow(r, 9, 0, background17, 1, 0, 0, 1, 2, 0, 1, 0);

//10 第十背景 喝了
r = bg_addrow(r, 10, 0, background5, 1, 0, 0, 0, 0, 0, 1, 0);

//11 蓝天
r = bg_addrow(r, 11, 0, background6, 0, 0, 0, 0, 0, 0, 1, 1);

//12 夜晚
r = bg_addrow(r, 12, 0, background19, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 12, 1, background21, 0, 1, 178, 0, 0, 0, 1, 0);

//13 夜晚+地下
r = bg_addrow(r, 13, 0, background11, 1, 0, 480, 0, 0, 0, 1, 0);
r = bg_addrow(r, 13, 1, background20, 0, 0, 480, 0, 0, 0, 1, 0);
r = bg_addrow(r, 13, 2, background19, 0, 0, 0, 0, 0, 0, 1, 0);

//14 第十四背景 喝了
r = bg_addrow(r, 14, 0, background6, 1, 0, 0, 0, 0, 0, 1, 0);

//15 黄昏
r = bg_addrow(r, 15, 0, background45, 0, 0, 0, 0, 0, 0, 1, 1);

//16 沙漠
r = bg_addrow(r, 16, 0, background466, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 16, 1, background46, 0, 1, 480, 0, 0, 0, 1, 0);

//17 黑暗天空
r = bg_addrow(r, 17, 0, background47, 0, 0, 0, 0, 0, 0, 1, 1);

//18 火山
r = bg_addrow(r, 18, 0, backgroundv2, 1, 0, 0, 0, 0, 0, 1, 3);
r = bg_addrow(r, 18, 1, backgroundv1, 0, 0, 0, 0, 0, 0, 1, 0);
r = bg_addrow(r, 18, 2, backgroundv3, 0, 1, 168, 0, 0, 0, 1, 0);

//19 绿色天空+青山树林
r = bg_addrow(r, 19, 0, background49shaben, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 19, 1, background49, 0, 1, 480, 0, 0, 0, 1, 0);

//20 雪地
r = bg_addrow(r, 20, 0, background_snowsky, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 20, 1, background_snow, 0, 1, 140, 0, 0, 0, 1, 0);

//21 金字塔
r = bg_addrow(r, 21, 0, background_underdesert, 1, 0, 0, 0, 0, 0, 1, 0);

//22 城堡
r = bg_addrow(r, 22, 0, background17, 1, 0, 0, 0, 0, 0, 1, 0);

//23 蓝天白云
r = bg_addrow(r, 23, 0, background6, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 23, 1, longzongcloud, 0, 1, 320, 0, 0, 0, 1, 0);

//24 船新雪地
r = bg_addrow(r, 24, 0, background_snowskynew, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 24, 1, background_snownew, 0, 1, 416, 0, 0, 0, 1, 0);

//25 又大又粗
r = bg_addrow(r, 25, 0, background_hele1, 0, 0, 0, 0, 0, 0, 1, 0);
r = bg_addrow(r, 25, 1, background_hele2, 0, 0, 240, 0, 0, 0, 1, 1);
r = bg_addrow(r, 25, 2, background_hele4, 0, 0, 0, 0, 0, 0, 1, 2);
r = bg_addrow(r, 25, 3, background_hele3, 0, 1, 130, 0, 0, 0, 1, 0);

//26 GP喝了
r = bg_addrow(r, 26, 0, background_gp, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 26, 1, background13, 0, 1, 140, 0, 0, 0, 1, 0);
r = bg_addrow(r, 26, 2, background_gp2, 0, 0, 0, 0, 0, 0, 1, 0);

//27 海底遗迹
r = bg_addrow(r, 27, 0, background_underwater, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 27, 1, background_underwater2, 0, 1, 192, 0, 0, 0, 0.75, 0);

//28 BGM是das的Rainbow Resort那关
r = bg_addrow(r, 28, 0, background_doesnotLM, 0, 0, 0, 0, 0, 0, 1, 2);
r = bg_addrow(r, 28, 1, background_LM, 0, 0, 0, 0, 0, 0, 1, 4);   //y由background_show特判
r = bg_addrow(r, 28, 2, background16, 0, 1, 160, 0, 0, 0, 1, 0);

//29 One Fine Day
r = bg_addrow(r, 29, 0, background_HL, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 29, 1, background13, 0, 1, 140, 0, 0, 0, 1, 0);
r = bg_addrow(r, 29, 2, background_HLCloud, 0, 0, 18, 0, -35, 0, -1, 0);
r = bg_addrow(r, 29, 3, background_HLCloud, 0, 0, 0, 0, 0, 0, -1, 0);

//30 深秘之森
r = bg_addrow(r, 30, 0, background_deep_forest, 1, 0, -96, 0, 0, 0, 1, 0);

//31 休闲海滩
r = bg_addrow(r, 31, 0, background5, 0, 0, 0, 0, 0, 0, 1, 1);
r = bg_addrow(r, 31, 1, background_seaside_cloud, 0, 1, 320, 0, 0, 0, 1, 0);
r = bg_addrow(r, 31, 2, background_seaside_sea, 0, 1, 224, 0, 0, 0, 1, 0);

//32 深蓝色-红色渐变色背景
r = bg_addrow(r, 32, 0, background_deepblue_red, 0, 0, 0, 0, 0, 0, 1, 1);

//default(与背景1相同，作兜底)
//云漂移与水波渐变开关（严格对应旧版 case 内附加语句）
global.bg_fx[4] = 1
global.bg_fx[29] = 1

global.bg_table_ready = 1
