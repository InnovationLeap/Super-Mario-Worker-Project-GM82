/// blocks_palette_data()
/// 初始化方块选择面板的全局数据数组
/// 调用后将数据存入 global.blocks_palette[page, index]
/// page: 0=第一页(blockpage=-1) 1=第二页(blockpage=0) 2=第三页(blockpage=1) 3=第四页(blockpage=2)
/// index: row * 12 + col (row=0~6, col=0~11)

var _p, _r, _c, _i;

for (_p = 0; _p < 4; _p += 1) {
    for (_i = 0; _i < 84; _i += 1) {
        global.blocks_palette[_p, _i] = 0;
    }
}

// ================================================================
// 第一页 (page=0, blockpage=-1): 核心地形
// ================================================================

// --- 行0: 绿色草地上排 | 绿色水管上端 | 横向水管上端 | 云砖 | 编辑器网格 | 紫色水管上端 ---
_p = 0; _r = 0;
global.blocks_palette[_p, _r * 12 + 0]  = 1;   // 绿色草地左上
global.blocks_palette[_p, _r * 12 + 1]  = 2;   // 绿色草地中上
global.blocks_palette[_p, _r * 12 + 2]  = 3;   // 绿色草地右上
global.blocks_palette[_p, _r * 12 + 3]  = 5;   // 纵向绿色水管上左
global.blocks_palette[_p, _r * 12 + 4]  = 6;   // 纵向绿色水管上右
global.blocks_palette[_p, _r * 12 + 5]  = 29;  // 横向绿色水管左上
global.blocks_palette[_p, _r * 12 + 6]  = 30;  // 横向绿色水管中上
global.blocks_palette[_p, _r * 12 + 7]  = 32;  // 横向绿色水管右上
global.blocks_palette[_p, _r * 12 + 8]  = 45;  // 云砖
global.blocks_palette[_p, _r * 12 + 9]  = 85;  // EDIT界面网格
global.blocks_palette[_p, _r * 12 + 10] = 105; // 纵向紫色水管上左
global.blocks_palette[_p, _r * 12 + 11] = 106; // 纵向紫色水管上右

// --- 行1: 绿色草地下排 | 绿色水管中段 | 横向水管下端 | 红桥MW | 珊瑚 | 紫色水管中段 ---
_r = 1;
global.blocks_palette[_p, _r * 12 + 0]  = 13;  // 绿色草地左下
global.blocks_palette[_p, _r * 12 + 1]  = 14;  // 绿色草地中下
global.blocks_palette[_p, _r * 12 + 2]  = 15;  // 绿色草地右下
global.blocks_palette[_p, _r * 12 + 3]  = 17;  // 纵向绿色水管中左2
global.blocks_palette[_p, _r * 12 + 4]  = 18;  // 纵向绿色水管中右2
global.blocks_palette[_p, _r * 12 + 5]  = 41;  // 横向绿色水管左下
global.blocks_palette[_p, _r * 12 + 6]  = 42;  // 横向绿色水管中下
global.blocks_palette[_p, _r * 12 + 7]  = 44;  // 横向绿色水管右下
global.blocks_palette[_p, _r * 12 + 8]  = 33;  // 桥（红，MW）
global.blocks_palette[_p, _r * 12 + 9]  = 28;  // 珊瑚
global.blocks_palette[_p, _r * 12 + 10] = 115; // 纵向紫色水管中左
global.blocks_palette[_p, _r * 12 + 11] = 116; // 纵向紫色水管中右

// --- 行2: 平台地面上排 | 绿色水管下端 | 各色桥MF | 水下绿砖 | 紫色水管下端 ---
_r = 2;
global.blocks_palette[_p, _r * 12 + 0]  = 25;  // 平台地面左上
global.blocks_palette[_p, _r * 12 + 1]  = 26;  // 平台地面中上
global.blocks_palette[_p, _r * 12 + 2]  = 27;  // 平台地面右上
global.blocks_palette[_p, _r * 12 + 3]  = 19;  // 纵向绿色水管下左
global.blocks_palette[_p, _r * 12 + 4]  = 20;  // 纵向绿色水管下右
global.blocks_palette[_p, _r * 12 + 5]  = 198; // 桥（红，MF）
global.blocks_palette[_p, _r * 12 + 6]  = 211; // 桥（绿，MF）
global.blocks_palette[_p, _r * 12 + 7]  = 209; // 桥（藕荷，MF）
global.blocks_palette[_p, _r * 12 + 8]  = 204; // 桥（蓝，MF）
global.blocks_palette[_p, _r * 12 + 9]  = 40;  // 砖块（水下，绿色）
global.blocks_palette[_p, _r * 12 + 10] = 127; // 纵向紫色水管下左
global.blocks_palette[_p, _r * 12 + 11] = 128; // 纵向紫色水管下右

// --- 行3: 平台地面下排 | 各色砖块 | 用过问号砖棕 | 横向紫色水管上端 ---
_r = 3;
global.blocks_palette[_p, _r * 12 + 0]  = 37;  // 平台地面左下
global.blocks_palette[_p, _r * 12 + 1]  = 38;  // 平台地面中下
global.blocks_palette[_p, _r * 12 + 2]  = 39;  // 平台地面右下
global.blocks_palette[_p, _r * 12 + 3]  = 4;   // 砖块（棕）1
global.blocks_palette[_p, _r * 12 + 4]  = 130; // 砖块（亮棕）
global.blocks_palette[_p, _r * 12 + 5]  = 212; // 砖块（青）
global.blocks_palette[_p, _r * 12 + 6]  = 84;  // 砖块（绿）
global.blocks_palette[_p, _r * 12 + 7]  = 129; // 砖块（紫红）
global.blocks_palette[_p, _r * 12 + 8]  = 9;   // 用过的问号砖（棕）
global.blocks_palette[_p, _r * 12 + 9]  = 109; // 横向紫色水管左上
global.blocks_palette[_p, _r * 12 + 10] = 110; // 横向紫色水管中上
global.blocks_palette[_p, _r * 12 + 11] = 111; // 横向紫色水管右上

// --- 行4: 水下地面上排 | 夜晚草地上排 | 蓝色砖 | 用过问号砖蓝 | 横向紫色水管下端 ---
_r = 4;
global.blocks_palette[_p, _r * 12 + 0]  = 49;  // 水下地面左上
global.blocks_palette[_p, _r * 12 + 1]  = 50;  // 水下地面中上
global.blocks_palette[_p, _r * 12 + 2]  = 51;  // 水下地面右上
global.blocks_palette[_p, _r * 12 + 3]  = 67;  // 夜晚草地左上
global.blocks_palette[_p, _r * 12 + 4]  = 68;  // 夜晚草地中上
global.blocks_palette[_p, _r * 12 + 5]  = 69;  // 夜晚草地右上
global.blocks_palette[_p, _r * 12 + 6]  = 16;  // 砖块（MW蓝）
global.blocks_palette[_p, _r * 12 + 7]  = 86;  // 砖块（MF蓝）
global.blocks_palette[_p, _r * 12 + 8]  = 119; // 用过的问号砖（蓝）
global.blocks_palette[_p, _r * 12 + 9]  = 121; // 横向紫色水管左下
global.blocks_palette[_p, _r * 12 + 10] = 122; // 横向紫色水管中下
global.blocks_palette[_p, _r * 12 + 11] = 123; // 横向紫色水管右下

// --- 行5: 水下地面中排 | 夜晚草地无阴影 | 夜晚星星无阴影 | 地下地面上排 ---
_r = 5;
global.blocks_palette[_p, _r * 12 + 0]  = 61;  // 水下地面左中
global.blocks_palette[_p, _r * 12 + 1]  = 62;  // 水下地面中中
global.blocks_palette[_p, _r * 12 + 2]  = 63;  // 水下地面右中
global.blocks_palette[_p, _r * 12 + 3]  = 79;  // 夜晚草地左下（无阴影）
global.blocks_palette[_p, _r * 12 + 4]  = 80;  // 夜晚草地中下（无阴影）1
global.blocks_palette[_p, _r * 12 + 5]  = 81;  // 夜晚草地右下（无阴影）
global.blocks_palette[_p, _r * 12 + 6]  = 70;  // 夜晚草地（大号星星，无阴影）
global.blocks_palette[_p, _r * 12 + 7]  = 83;  // 夜晚草地（中号星星，无阴影）
global.blocks_palette[_p, _r * 12 + 8]  = 71;  // 夜晚草地（小号星星，无阴影）
global.blocks_palette[_p, _r * 12 + 9]  = 10;  // 地下地面左上
global.blocks_palette[_p, _r * 12 + 10] = 11;  // 地下地面中上
global.blocks_palette[_p, _r * 12 + 11] = 12;  // 地下地面右上

// --- 行6: 水下地面下排 | 夜晚草地有阴影 | 夜晚星星有阴影 | 地下地面下排 ---
_r = 6;
global.blocks_palette[_p, _r * 12 + 0]  = 73;  // 水下地面左下
global.blocks_palette[_p, _r * 12 + 1]  = 74;  // 水下地面中下
global.blocks_palette[_p, _r * 12 + 2]  = 75;  // 水下地面右下
global.blocks_palette[_p, _r * 12 + 3]  = 93;  // 夜晚草地左下（有阴影）
global.blocks_palette[_p, _r * 12 + 4]  = 94;  // 夜晚草地中下（有阴影）
global.blocks_palette[_p, _r * 12 + 5]  = 95;  // 夜晚草地右下（有阴影）
global.blocks_palette[_p, _r * 12 + 6]  = 98;  // 夜晚草地（小号星星，有阴影）
global.blocks_palette[_p, _r * 12 + 7]  = 97;  // 夜晚草地（中号星星，有阴影）
global.blocks_palette[_p, _r * 12 + 8]  = 96;  // 夜晚草地（大号星星，有阴影）
global.blocks_palette[_p, _r * 12 + 9]  = 22;  // 地下地面左下
global.blocks_palette[_p, _r * 12 + 10] = 23;  // 地下地面中下
global.blocks_palette[_p, _r * 12 + 11] = 24;  // 地下地面右下


// ================================================================
// 第二页 (page=1, blockpage=0): 水管 / 桥 / 沙漠 / 雪地 / 红色草地
// ================================================================

// --- 行0: 深绿草地上排 | 金砖 | 金色水管上端 | 白色水管上端 | 灰白砖 | 红砖 | 红色水管上端 ---
_p = 1; _r = 0;
global.blocks_palette[_p, _r * 12 + 0]  = 213; // 深绿草地左上
global.blocks_palette[_p, _r * 12 + 1]  = 214; // 深绿草地中上
global.blocks_palette[_p, _r * 12 + 2]  = 215; // 深绿草地右上
global.blocks_palette[_p, _r * 12 + 3]  = 220; // 砖块（金）
global.blocks_palette[_p, _r * 12 + 4]  = 136; // 纵向金色水管上左
global.blocks_palette[_p, _r * 12 + 5]  = 137; // 纵向金色水管上右
global.blocks_palette[_p, _r * 12 + 6]  = 140; // 纵向白色水管上左
global.blocks_palette[_p, _r * 12 + 7]  = 141; // 纵向白色水管上右
global.blocks_palette[_p, _r * 12 + 8]  = 107; // 砖块（灰白）
global.blocks_palette[_p, _r * 12 + 9]  = 117; // 砖块（红）
global.blocks_palette[_p, _r * 12 + 10] = 138; // 纵向红色水管上左
global.blocks_palette[_p, _r * 12 + 11] = 139; // 纵向红色水管上右

// --- 行1: 深绿草地下排 | 金桥MF | 金色水管中段 | 白色水管中段 | 白桥MF | 红桥MF | 红色水管中段 ---
_r = 1;
global.blocks_palette[_p, _r * 12 + 0]  = 216; // 深绿草地左下
global.blocks_palette[_p, _r * 12 + 1]  = 217; // 深绿草地中下
global.blocks_palette[_p, _r * 12 + 2]  = 218; // 深绿草地右下
global.blocks_palette[_p, _r * 12 + 3]  = 208; // 桥（金，MF）
global.blocks_palette[_p, _r * 12 + 4]  = 148; // 纵向金色水管中左
global.blocks_palette[_p, _r * 12 + 5]  = 149; // 纵向金色水管中右
global.blocks_palette[_p, _r * 12 + 6]  = 152; // 纵向白色水管中左
global.blocks_palette[_p, _r * 12 + 7]  = 153; // 纵向白色水管中右
global.blocks_palette[_p, _r * 12 + 8]  = 222; // 桥（白，MF）
global.blocks_palette[_p, _r * 12 + 9]  = 198; // 桥（红，MF）
global.blocks_palette[_p, _r * 12 + 10] = 150; // 纵向红色水管中左
global.blocks_palette[_p, _r * 12 + 11] = 151; // 纵向红色水管中右

// --- 行2: 绿砖 | 绿桥MF | SMB1桥 | 亮金砖 | 金色水管下端 | 白色水管下端 | 亮白砖 | 紫红砖 | 红色水管下端 ---
_r = 2;
global.blocks_palette[_p, _r * 12 + 0]  = 84;  // 砖块（绿）
global.blocks_palette[_p, _r * 12 + 1]  = 211; // 桥（绿，MF）
global.blocks_palette[_p, _r * 12 + 2]  = 219; // 桥（SMB1）
global.blocks_palette[_p, _r * 12 + 3]  = 118; // 砖块（亮金）
global.blocks_palette[_p, _r * 12 + 4]  = 160; // 纵向金色水管下左
global.blocks_palette[_p, _r * 12 + 5]  = 161; // 纵向金色水管下右
global.blocks_palette[_p, _r * 12 + 6]  = 164; // 纵向白色水管下左
global.blocks_palette[_p, _r * 12 + 7]  = 165; // 纵向白色水管下右
global.blocks_palette[_p, _r * 12 + 8]  = 221; // 砖块（亮白）
global.blocks_palette[_p, _r * 12 + 9]  = 129; // 砖块（紫红）
global.blocks_palette[_p, _r * 12 + 10] = 162; // 纵向红色水管下左
global.blocks_palette[_p, _r * 12 + 11] = 163; // 纵向红色水管下右

// --- 行3: 用过问号砖棕 | 亮棕砖 | 棕砖 | 横向金色水管上端 | 横向白色水管上端 | 横向红色水管上端 ---
_r = 3;
global.blocks_palette[_p, _r * 12 + 0]  = 9;   // 用过的问号砖（棕）
global.blocks_palette[_p, _r * 12 + 1]  = 130; // 砖块（亮棕）
global.blocks_palette[_p, _r * 12 + 2]  = 4;   // 砖块（棕）1
global.blocks_palette[_p, _r * 12 + 3]  = 87;  // 横向金色水管左上
global.blocks_palette[_p, _r * 12 + 4]  = 88;  // 横向金色水管中上
global.blocks_palette[_p, _r * 12 + 5]  = 89;  // 横向金色水管右上
global.blocks_palette[_p, _r * 12 + 6]  = 112; // 横向白色水管左上
global.blocks_palette[_p, _r * 12 + 7]  = 113; // 横向白色水管中上
global.blocks_palette[_p, _r * 12 + 8]  = 114; // 横向白色水管右上
global.blocks_palette[_p, _r * 12 + 9]  = 90;  // 横向红色水管左上
global.blocks_palette[_p, _r * 12 + 10] = 91;  // 横向红色水管中上
global.blocks_palette[_p, _r * 12 + 11] = 92;  // 横向红色水管右上

// --- 行4: 沙漠地面上排 | 横向金色水管下端 | 横向白色水管下端 | 横向红色水管下端 ---
_r = 4;
global.blocks_palette[_p, _r * 12 + 0]  = 193; // 沙漠地面左上
global.blocks_palette[_p, _r * 12 + 1]  = 194; // 沙漠地面中上
global.blocks_palette[_p, _r * 12 + 2]  = 195; // 沙漠地面右上
global.blocks_palette[_p, _r * 12 + 3]  = 99;  // 横向金色水管左下
global.blocks_palette[_p, _r * 12 + 4]  = 100; // 横向金色水管中下
global.blocks_palette[_p, _r * 12 + 5]  = 101; // 横向金色水管右下
global.blocks_palette[_p, _r * 12 + 6]  = 124; // 横向白色水管左下
global.blocks_palette[_p, _r * 12 + 7]  = 125; // 横向白色水管中下
global.blocks_palette[_p, _r * 12 + 8]  = 126; // 横向白色水管右下
global.blocks_palette[_p, _r * 12 + 9]  = 102; // 横向红色水管左下
global.blocks_palette[_p, _r * 12 + 10] = 103; // 横向红色水管中下
global.blocks_palette[_p, _r * 12 + 11] = 104; // 横向红色水管右下

// --- 行5: 沙漠地面中排 | 雪地红上排 | 雪地蓝上排 | 红色草地上排 ---
_r = 5;
global.blocks_palette[_p, _r * 12 + 0]  = 199; // 沙漠地面左中
global.blocks_palette[_p, _r * 12 + 1]  = 200; // 沙漠地面中中
global.blocks_palette[_p, _r * 12 + 2]  = 201; // 沙漠地面右中
global.blocks_palette[_p, _r * 12 + 3]  = 169; // 雪地左上（红）
global.blocks_palette[_p, _r * 12 + 4]  = 170; // 雪地中上（红）
global.blocks_palette[_p, _r * 12 + 5]  = 171; // 雪地右上（红）
global.blocks_palette[_p, _r * 12 + 6]  = 181; // 雪地左上（蓝）
global.blocks_palette[_p, _r * 12 + 7]  = 182; // 雪地中上（蓝）
global.blocks_palette[_p, _r * 12 + 8]  = 183; // 雪地右上（蓝）
global.blocks_palette[_p, _r * 12 + 9]  = 34;  // 红色草地左上
global.blocks_palette[_p, _r * 12 + 10] = 35;  // 红色草地中上
global.blocks_palette[_p, _r * 12 + 11] = 36;  // 红色草地右上

// --- 行6: 沙漠地面下排 | 雪地红下排 | 雪地蓝下排 | 红色草地下排 ---
_r = 6;
global.blocks_palette[_p, _r * 12 + 0]  = 205; // 沙漠地面左下
global.blocks_palette[_p, _r * 12 + 1]  = 206; // 沙漠地面中下
global.blocks_palette[_p, _r * 12 + 2]  = 207; // 沙漠地面右下
global.blocks_palette[_p, _r * 12 + 3]  = 175; // 雪地左下（红）
global.blocks_palette[_p, _r * 12 + 4]  = 176; // 雪地中下（红）
global.blocks_palette[_p, _r * 12 + 5]  = 177; // 雪地右下（红）
global.blocks_palette[_p, _r * 12 + 6]  = 187; // 雪地左下（蓝）
global.blocks_palette[_p, _r * 12 + 7]  = 188; // 雪地中下（蓝）
global.blocks_palette[_p, _r * 12 + 8]  = 189; // 雪地右下（蓝）
global.blocks_palette[_p, _r * 12 + 9]  = 46;  // 红色草地左下
global.blocks_palette[_p, _r * 12 + 10] = 47;  // 红色草地中下
global.blocks_palette[_p, _r * 12 + 11] = 48;  // 红色草地右下


// ================================================================
// 第三页 (page=2, blockpage=1): 城堡 / 坟墓 / 黑色草地 / 带点水管
// ================================================================

// --- 行0: 褐色城堡地面上排 | 灰色城堡地面上排 | 城堡平台地面上排 | 城堡桥 ---
_p = 2; _r = 0;
global.blocks_palette[_p, _r * 12 + 0]  = 285; // 褐色城堡地面左上
global.blocks_palette[_p, _r * 12 + 1]  = 286; // 褐色城堡地面中上
global.blocks_palette[_p, _r * 12 + 2]  = 287; // 褐色城堡地面右上
global.blocks_palette[_p, _r * 12 + 3]  = 52;  // 灰色城堡地面左上
global.blocks_palette[_p, _r * 12 + 4]  = 53;  // 灰色城堡地面中上
global.blocks_palette[_p, _r * 12 + 5]  = 54;  // 灰色城堡地面右上
global.blocks_palette[_p, _r * 12 + 6]  = 244; // 城堡平台地面左上
global.blocks_palette[_p, _r * 12 + 7]  = 245; // 城堡平台地面中上
global.blocks_palette[_p, _r * 12 + 8]  = 246; // 城堡平台地面右上
global.blocks_palette[_p, _r * 12 + 9]  = 55;  // 城堡桥（左）
global.blocks_palette[_p, _r * 12 + 10] = 56;  // 城堡桥（中）
global.blocks_palette[_p, _r * 12 + 11] = 57;  // 城堡桥（右）

// --- 行1: 褐色城堡地面中排 | 灰色城堡地面中排 | 城堡平台地面中排 | 灰色水管上端 ---
_r = 1;
global.blocks_palette[_p, _r * 12 + 0]  = 288; // 褐色城堡地面左中
global.blocks_palette[_p, _r * 12 + 1]  = 289; // 褐色城堡地面中中
global.blocks_palette[_p, _r * 12 + 2]  = 290; // 褐色城堡地面右中
global.blocks_palette[_p, _r * 12 + 3]  = 64;  // 灰色城堡地面左中
global.blocks_palette[_p, _r * 12 + 4]  = 65;  // 灰色城堡地面中中
global.blocks_palette[_p, _r * 12 + 5]  = 66;  // 灰色城堡地面右中
global.blocks_palette[_p, _r * 12 + 6]  = 247; // 城堡平台地面左中
global.blocks_palette[_p, _r * 12 + 7]  = 248; // 城堡平台地面中中
global.blocks_palette[_p, _r * 12 + 8]  = 249; // 城堡平台地面右中
global.blocks_palette[_p, _r * 12 + 9]  = 142; // 纵向灰色水管上左
global.blocks_palette[_p, _r * 12 + 10] = 143; // 纵向灰色水管上右
global.blocks_palette[_p, _r * 12 + 11] = 144; // 纵向带点灰色水管上左

// --- 行2: 褐色城堡地面下排 | 灰色城堡地面下排 | 城堡平台地面下排 | 灰色水管中段 ---
_r = 2;
global.blocks_palette[_p, _r * 12 + 0]  = 291; // 褐色城堡地面左下
global.blocks_palette[_p, _r * 12 + 1]  = 292; // 褐色城堡地面中下
global.blocks_palette[_p, _r * 12 + 2]  = 293; // 褐色城堡地面右下
global.blocks_palette[_p, _r * 12 + 3]  = 76;  // 灰色城堡地面左下
global.blocks_palette[_p, _r * 12 + 4]  = 77;  // 灰色城堡地面中下
global.blocks_palette[_p, _r * 12 + 5]  = 78;  // 灰色城堡地面右下
global.blocks_palette[_p, _r * 12 + 6]  = 250; // 城堡平台地面左下
global.blocks_palette[_p, _r * 12 + 7]  = 251; // 城堡平台地面中下
global.blocks_palette[_p, _r * 12 + 8]  = 252; // 城堡平台地面右下
global.blocks_palette[_p, _r * 12 + 9]  = 154; // 纵向灰色水管中左
global.blocks_palette[_p, _r * 12 + 10] = 155; // 纵向灰色水管中右
global.blocks_palette[_p, _r * 12 + 11] = 156; // 纵向带点灰色水管中左1

// --- 行3: 褐色城堡衔接 | 灰色城堡衔接 | 黑色草地上排 | 用过问号砖灰 | 灰砖 | 灰色水管下端 | 带点水管中段2 ---
_r = 3;
global.blocks_palette[_p, _r * 12 + 0]  = 295; // 褐色城堡地面左上衔接
global.blocks_palette[_p, _r * 12 + 1]  = 297; // 褐色城堡地面右上衔接
global.blocks_palette[_p, _r * 12 + 2]  = 196; // 灰色城堡地面左上衔接
global.blocks_palette[_p, _r * 12 + 3]  = 197; // 灰色城堡地面右上衔接
global.blocks_palette[_p, _r * 12 + 4]  = 184; // 黑色草地左上
global.blocks_palette[_p, _r * 12 + 5]  = 185; // 黑色草地中上
global.blocks_palette[_p, _r * 12 + 6]  = 186; // 黑色草地右上
global.blocks_palette[_p, _r * 12 + 7]  = 131; // 用过的问号砖（灰）
global.blocks_palette[_p, _r * 12 + 8]  = 72;  // 砖块（灰色）
global.blocks_palette[_p, _r * 12 + 9]  = 166; // 纵向灰色水管下左
global.blocks_palette[_p, _r * 12 + 10] = 167; // 纵向灰色水管下右
global.blocks_palette[_p, _r * 12 + 11] = 223; // 纵向带点灰色水管中左2

// --- 行4: 褐色城堡衔接 | 灰色城堡衔接 | 黑色草地下排 | 锁链 | 横向灰色水管上端 | 带点水管中段3 ---
_r = 4;
global.blocks_palette[_p, _r * 12 + 0]  = 294; // 褐色城堡地面左下衔接
global.blocks_palette[_p, _r * 12 + 1]  = 296; // 褐色城堡地面右下衔接
global.blocks_palette[_p, _r * 12 + 2]  = 202; // 灰色城堡地面左下衔接
global.blocks_palette[_p, _r * 12 + 3]  = 203; // 灰色城堡地面右下衔接
global.blocks_palette[_p, _r * 12 + 4]  = 190; // 黑色草地左下
global.blocks_palette[_p, _r * 12 + 5]  = 191; // 黑色草地中下
global.blocks_palette[_p, _r * 12 + 6]  = 192; // 黑色草地右下
global.blocks_palette[_p, _r * 12 + 7]  = 132; // 锁链
global.blocks_palette[_p, _r * 12 + 8]  = 133; // 横向灰色水管左上
global.blocks_palette[_p, _r * 12 + 9]  = 134; // 横向灰色水管中上
global.blocks_palette[_p, _r * 12 + 10] = 135; // 横向灰色水管右上
global.blocks_palette[_p, _r * 12 + 11] = 224; // 纵向带点灰色水管中左3

// --- 行5: 褐色城堡砖 | 灰色城堡砖 | 坟墓草地上排 | 灰桥MW | 横向灰色水管下端 | 带点水管下端 ---
_r = 5;
global.blocks_palette[_p, _r * 12 + 0]  = 300; // 褐色城堡砖（左）
global.blocks_palette[_p, _r * 12 + 1]  = 301; // 褐色城堡砖（右）
global.blocks_palette[_p, _r * 12 + 2]  = 58;  // 灰色城堡砖（左）
global.blocks_palette[_p, _r * 12 + 3]  = 59;  // 灰色城堡砖（右）
global.blocks_palette[_p, _r * 12 + 4]  = 172; // 坟墓草地左上
global.blocks_palette[_p, _r * 12 + 5]  = 173; // 坟墓草地中上
global.blocks_palette[_p, _r * 12 + 6]  = 174; // 坟墓草地右上
global.blocks_palette[_p, _r * 12 + 7]  = 21;  // 桥（灰，MW自带）
global.blocks_palette[_p, _r * 12 + 8]  = 145; // 横向灰色水管左下
global.blocks_palette[_p, _r * 12 + 9]  = 146; // 横向灰色水管中下
global.blocks_palette[_p, _r * 12 + 10] = 147; // 横向灰色水管右下
global.blocks_palette[_p, _r * 12 + 11] = 168; // 纵向带点灰色水管下左

// --- 行6: 褐色城堡单格/墙砖 | 灰色城堡单格/墙砖 | 坟墓草地下排 | 横向带点水管上端 ---
_r = 6;
global.blocks_palette[_p, _r * 12 + 0]  = 298; // 褐色城堡砖（单格）
global.blocks_palette[_p, _r * 12 + 1]  = 299; // 褐色城堡墙砖
global.blocks_palette[_p, _r * 12 + 2]  = 108; // 灰色城堡砖（单格）
global.blocks_palette[_p, _r * 12 + 3]  = 120; // 灰色城堡墙砖
global.blocks_palette[_p, _r * 12 + 4]  = 178; // 坟墓草地左下
global.blocks_palette[_p, _r * 12 + 5]  = 179; // 坟墓草地中下
global.blocks_palette[_p, _r * 12 + 6]  = 180; // 坟墓草地右下
global.blocks_palette[_p, _r * 12 + 7]  = 157; // 横向带点灰色水管左上
global.blocks_palette[_p, _r * 12 + 8]  = 158; // 横向带点灰色水管中上1
global.blocks_palette[_p, _r * 12 + 9]  = 225; // 横向带点灰色水管中上2
global.blocks_palette[_p, _r * 12 + 10] = 226; // 横向带点灰色水管中上3
global.blocks_palette[_p, _r * 12 + 11] = 159; // 横向带点灰色水管右上


// ================================================================
// 第四页 (page=3, blockpage=2): 蘑菇平台 / 青色草地 / 纯色块 / 白云
// ================================================================

// --- 行0: 蓝色蘑菇平台上排 | 蘑菇柱子上 | 纯色水管-紫 | 纯色块(红/黑/紫/深青) ---
_p = 3; _r = 0;
global.blocks_palette[_p, _r * 12 + 0]  = 227; // 蓝色蘑菇平台左上
global.blocks_palette[_p, _r * 12 + 1]  = 228; // 蓝色蘑菇平台中上
global.blocks_palette[_p, _r * 12 + 2]  = 229; // 蓝色蘑菇平台右上
global.blocks_palette[_p, _r * 12 + 3]  = 230; // 蘑菇柱子上
global.blocks_palette[_p, _r * 12 + 4]  = 302; // 纵向紫色水管中上（纯色）
global.blocks_palette[_p, _r * 12 + 5]  = 303; // 横向紫色水管左中（纯色）
global.blocks_palette[_p, _r * 12 + 6]  = 304; // 横向紫色水管右中（纯色）
global.blocks_palette[_p, _r * 12 + 7]  = 305; // 纵向紫色水管中下（纯色）
global.blocks_palette[_p, _r * 12 + 8]  = 329; // 纯色块（紫色水管）
global.blocks_palette[_p, _r * 12 + 9]  = 327; // 纯色块（纯红）
global.blocks_palette[_p, _r * 12 + 10] = 344; // 纯色块（纯橙）
global.blocks_palette[_p, _r * 12 + 11] = 345; // 纯色块（纯紫）

// --- 行1: 蓝色蘑菇平台下排 | 蘑菇柱子中 | 纯色水管-绿 | 纯色块(绿/绿/深灰/纯黑) ---
_r = 1;
global.blocks_palette[_p, _r * 12 + 0]  = 233; // 蓝色蘑菇平台左下
global.blocks_palette[_p, _r * 12 + 1]  = 234; // 蓝色蘑菇平台中下
global.blocks_palette[_p, _r * 12 + 2]  = 235; // 蓝色蘑菇平台右下
global.blocks_palette[_p, _r * 12 + 3]  = 231; // 蘑菇柱子中
global.blocks_palette[_p, _r * 12 + 4]  = 306; // 纵向绿色水管中上（纯色）
global.blocks_palette[_p, _r * 12 + 5]  = 307; // 横向绿色水管左中（纯色）
global.blocks_palette[_p, _r * 12 + 6]  = 308; // 横向绿色水管右中（纯色）
global.blocks_palette[_p, _r * 12 + 7]  = 309; // 纵向绿色水管中下（纯色）
global.blocks_palette[_p, _r * 12 + 8]  = 326; // 纯色块（绿色水管）
global.blocks_palette[_p, _r * 12 + 9]  = 330; // 纯色块（纯绿）
global.blocks_palette[_p, _r * 12 + 10] = 346; // 纯色块（深青）
global.blocks_palette[_p, _r * 12 + 11] = 328; // 纯色块（纯黑）

// --- 行2: 红色蘑菇平台上排 | 蘑菇柱子下 | 纯色水管-红 | 纯色块(红水管/纯蓝/岩浆/深灰) ---
_r = 2;
global.blocks_palette[_p, _r * 12 + 0]  = 236; // 红色蘑菇平台左上
global.blocks_palette[_p, _r * 12 + 1]  = 237; // 红色蘑菇平台中上
global.blocks_palette[_p, _r * 12 + 2]  = 238; // 红色蘑菇平台右上
global.blocks_palette[_p, _r * 12 + 3]  = 232; // 蘑菇柱子下
global.blocks_palette[_p, _r * 12 + 4]  = 310; // 纵向红色水管中上（纯色）
global.blocks_palette[_p, _r * 12 + 5]  = 311; // 横向红色水管左中（纯色）
global.blocks_palette[_p, _r * 12 + 6]  = 312; // 横向红色水管右中（纯色）
global.blocks_palette[_p, _r * 12 + 7]  = 313; // 纵向红色水管中下（纯色）
global.blocks_palette[_p, _r * 12 + 8]  = 338; // 纯色块（红色水管）
global.blocks_palette[_p, _r * 12 + 9]  = 333; // 纯色块（纯蓝）
global.blocks_palette[_p, _r * 12 + 10] = 334; // 纯色块（岩浆底部）
global.blocks_palette[_p, _r * 12 + 11] = 347; // 纯色块（深灰）

// --- 行3: 红色蘑菇平台下排 | 彩云砖 | 纯色水管-黄 | 纯色块(黄水管/纯青/猫步蓝/中灰) ---
_r = 3;
global.blocks_palette[_p, _r * 12 + 0]  = 239; // 红色蘑菇平台左下
global.blocks_palette[_p, _r * 12 + 1]  = 240; // 红色蘑菇平台中下
global.blocks_palette[_p, _r * 12 + 2]  = 241; // 红色蘑菇平台右下
global.blocks_palette[_p, _r * 12 + 3]  = 280; // 彩云砖
global.blocks_palette[_p, _r * 12 + 4]  = 314; // 纵向黄色水管中上（纯色）
global.blocks_palette[_p, _r * 12 + 5]  = 315; // 横向黄色水管左中（纯色）
global.blocks_palette[_p, _r * 12 + 6]  = 316; // 横向黄色水管右中（纯色）
global.blocks_palette[_p, _r * 12 + 7]  = 317; // 纵向黄色水管中下（纯色）
global.blocks_palette[_p, _r * 12 + 8]  = 341; // 纯色块（黄色水管）
global.blocks_palette[_p, _r * 12 + 9]  = 336; // 纯色块（纯青）
global.blocks_palette[_p, _r * 12 + 10] = 337; // 纯色块（猫步蓝）
global.blocks_palette[_p, _r * 12 + 11] = 348; // 纯色块（中灰）

// --- 行4: 青色草地上排 | SMB1地面红 | 纯色水管-灰 | 纯色块(灰水管/纯品红/数字君粉/浅灰) ---
_r = 4;
global.blocks_palette[_p, _r * 12 + 0]  = 274; // 青色草地左上
global.blocks_palette[_p, _r * 12 + 1]  = 275; // 青色草地中上
global.blocks_palette[_p, _r * 12 + 2]  = 276; // 青色草地右上
global.blocks_palette[_p, _r * 12 + 3]  = 242; // SMB1地面（红）
global.blocks_palette[_p, _r * 12 + 4]  = 318; // 纵向灰色水管中上（纯色）
global.blocks_palette[_p, _r * 12 + 5]  = 319; // 横向灰色水管左中（纯色）
global.blocks_palette[_p, _r * 12 + 6]  = 320; // 横向灰色水管右中（纯色）
global.blocks_palette[_p, _r * 12 + 7]  = 321; // 纵向灰色水管中下（纯色）
global.blocks_palette[_p, _r * 12 + 8]  = 332; // 纯色块（灰色水管）
global.blocks_palette[_p, _r * 12 + 9]  = 339; // 纯色块（纯品红）
global.blocks_palette[_p, _r * 12 + 10] = 340; // 纯色块（数字君粉）
global.blocks_palette[_p, _r * 12 + 11] = 349; // 纯色块（浅灰）

// --- 行5: 青色草地下排 | SMB1地面蓝 | 纯色水管-白 | 纯色块(白水管/纯黄/蜜汁淡黄/纯白) ---
_r = 5;
global.blocks_palette[_p, _r * 12 + 0]  = 277; // 青色草地左下
global.blocks_palette[_p, _r * 12 + 1]  = 278; // 青色草地中下
global.blocks_palette[_p, _r * 12 + 2]  = 279; // 青色草地右下
global.blocks_palette[_p, _r * 12 + 3]  = 243; // SMB1地面（蓝）
global.blocks_palette[_p, _r * 12 + 4]  = 322; // 纵向白色水管中上（纯色）
global.blocks_palette[_p, _r * 12 + 5]  = 323; // 横向白色水管左中（纯色）
global.blocks_palette[_p, _r * 12 + 6]  = 324; // 横向白色水管右中（纯色）
global.blocks_palette[_p, _r * 12 + 7]  = 325; // 纵向白色水管中下（纯色）
global.blocks_palette[_p, _r * 12 + 8]  = 335; // 纯色块（白色水管）
global.blocks_palette[_p, _r * 12 + 9]  = 342; // 纯色块（纯黄）
global.blocks_palette[_p, _r * 12 + 10] = 343; // 纯色块（蜜汁淡黄）
global.blocks_palette[_p, _r * 12 + 11] = 331; // 纯色块（纯白）

// --- 行6: 白云平台（仅4格） ---
_r = 6;
global.blocks_palette[_p, _r * 12 + 0]  = 281; // 白云平台左
global.blocks_palette[_p, _r * 12 + 1]  = 282; // 白云平台中
global.blocks_palette[_p, _r * 12 + 2]  = 283; // 白云平台中（带点）
global.blocks_palette[_p, _r * 12 + 3]  = 284; // 白云平台右
