/// bgm_palette_data()
/// 初始化 BGM 选择面板的全局数据数组
/// 调用后将数据存入：
///   global.bgm_palette[page, index] — index = row * 2 + col，存储 muzioj 值（0=空）
///   global.bgm_palette_rows[page] — 该页的行数
///   global.bgm_palette_row_y[page, row] — 该行 hit 测试的 Y 偏移（相对 view_yview[0]）
/// page: 0=MW 1=MFR 2=SMS 3=SMS2 4=Softendo 5=SMWP Original 6=Boss
/// col: 0=左列(x=35) 1=右列(x=240)
/// 所有 hit 区域统一为 w=150, h=12
/// 第 7 页（Custom）为动态数据，不在此脚本中定义

var _p, _r, _c, _i;

// ================================================================
// 全部清零
// ================================================================
for (_p = 0; _p < 7; _p += 1) {
    global.bgm_palette_rows[_p] = 0;
    for (_i = 0; _i < 60; _i += 1) {
        global.bgm_palette[_p, _i] = 0;
    }
    for (_r = 0; _r < 30; _r += 1) {
        global.bgm_palette_row_y[_p, _r] = 0;
    }
}

// ================================================================
// Pages 0-1: 共用同一套不规则 Y 偏移（MW / MFR 音乐页布局一致）
// 以下是原代码中 ed_hit 的 Y 偏移递推序列：
//   间距序列: 20, 19, 19, 15, 15, 17, 20, 20, 20, 20, 14, 17, 17, 17, 17, 17, 21, 18, 18, 18, 18
// ================================================================

var _y00, _y01, _y02, _y03, _y04, _y05, _y06, _y07, _y08, _y09, _y10;
var _y11, _y12, _y13, _y14, _y15, _y16, _y17, _y18, _y19, _y20, _y21;

_y00 = 77;                         // row  0
_y01 = _y00 + 12 + 8;              // row  1: 77+20=97
_y02 = _y01 + 12 + 7;              // row  2: 97+19=116
_y03 = _y02 + 12 + 7;              // row  3: 116+19=135
_y04 = _y03 + 12 + 3;              // row  4: 135+15=150
_y05 = _y04 + 12 + 3;              // row  5: 150+15=165
_y06 = _y05 + 12 + 5;              // row  6: 165+17=182
_y07 = _y06 + 12 + 8;              // row  7: 182+20=202
_y08 = _y07 + 12 + 8;              // row  8: 202+20=222
_y09 = _y08 + 12 + 8;              // row  9: 222+20=242
_y10 = _y09 + 12 + 8;              // row 10: 242+20=262
_y11 = _y10 + 12 + 2;              // row 11: 262+14=276
_y12 = _y11 + 12 + 5;              // row 12: 276+17=293
_y13 = _y12 + 12 + 5;              // row 13: 293+17=310
_y14 = _y13 + 12 + 5;              // row 14: 310+17=327
_y15 = _y14 + 12 + 5;              // row 15: 327+17=344
_y16 = _y15 + 12 + 5;              // row 16: 344+17=361
_y17 = _y16 + 12 + 5 + 4;          // row 17: 361+21=382
_y18 = _y17 + 12 + 6;              // row 18: 382+18=400
_y19 = _y18 + 12 + 6;              // row 19: 400+18=418
_y20 = _y19 + 12 + 6;              // row 20: 418+18=436
_y21 = _y20 + 12 + 6;              // row 21: 436+18=454

// ================================================================
// 设置 pages 0-1 的每行 Y 偏移（两页共用）
// ================================================================
for (_p = 0; _p <= 1; _p += 1) {
    global.bgm_palette_rows[_p] = 22;
    global.bgm_palette_row_y[_p, 0]  = _y00;
    global.bgm_palette_row_y[_p, 1]  = _y01;
    global.bgm_palette_row_y[_p, 2]  = _y02;
    global.bgm_palette_row_y[_p, 3]  = _y03;
    global.bgm_palette_row_y[_p, 4]  = _y04;
    global.bgm_palette_row_y[_p, 5]  = _y05;
    global.bgm_palette_row_y[_p, 6]  = _y06;
    global.bgm_palette_row_y[_p, 7]  = _y07;
    global.bgm_palette_row_y[_p, 8]  = _y08;
    global.bgm_palette_row_y[_p, 9]  = _y09;
    global.bgm_palette_row_y[_p, 10] = _y10;
    global.bgm_palette_row_y[_p, 11] = _y11;
    global.bgm_palette_row_y[_p, 12] = _y12;
    global.bgm_palette_row_y[_p, 13] = _y13;
    global.bgm_palette_row_y[_p, 14] = _y14;
    global.bgm_palette_row_y[_p, 15] = _y15;
    global.bgm_palette_row_y[_p, 16] = _y16;
    global.bgm_palette_row_y[_p, 17] = _y17;
    global.bgm_palette_row_y[_p, 18] = _y18;
    global.bgm_palette_row_y[_p, 19] = _y19;
    global.bgm_palette_row_y[_p, 20] = _y20;
    global.bgm_palette_row_y[_p, 21] = _y21;
}

// ================================================================
// Pages 2-6: 等间距网格布局（Y = 77 + row * 18）
// ================================================================

// --- Page 2: SMS 音乐（22 行，左右两列各有内容）---
_p = 2;
global.bgm_palette_rows[_p] = 22;
for (_r = 0; _r < 22; _r += 1) {
    global.bgm_palette_row_y[_p, _r] = 77 + _r * 18;
    global.bgm_palette[_p, _r * 2 + 0] = _r + 101;     // 左列
    global.bgm_palette[_p, _r * 2 + 1] = _r + 123;     // 右列
}

// --- Page 3: SMS2 音乐（20 行，仅左列）---
_p = 3;
global.bgm_palette_rows[_p] = 20;
for (_r = 0; _r < 20; _r += 1) {
    global.bgm_palette_row_y[_p, _r] = 77 + _r * 18;
    global.bgm_palette[_p, _r * 2 + 0] = _r + 145;     // 左列
    // 右列为空（已在初始化时清零）
}

// --- Page 4: Softendo 音乐（22 行，左列全部，右列仅前 2 行）---
_p = 4;
global.bgm_palette_rows[_p] = 22;
for (_r = 0; _r < 22; _r += 1) {
    global.bgm_palette_row_y[_p, _r] = 77 + _r * 18;
    global.bgm_palette[_p, _r * 2 + 0] = _r + 173;     // 左列
}
global.bgm_palette[_p, 0 * 2 + 1] = 195;                // 右列 row 0
global.bgm_palette[_p, 1 * 2 + 1] = 196;                // 右列 row 1

// --- Page 5: SMWP Original 音乐（13 行，仅左列）---
_p = 5;
global.bgm_palette_rows[_p] = 13;
for (_r = 0; _r < 13; _r += 1) {
    global.bgm_palette_row_y[_p, _r] = 77 + _r * 18;
    global.bgm_palette[_p, _r * 2 + 0] = _r + 301;     // 左列
}

// --- Page 6: Boss 音乐（21 行，仅左列）---
_p = 6;
global.bgm_palette_rows[_p] = 21;
for (_r = 0; _r < 21; _r += 1) {
    global.bgm_palette_row_y[_p, _r] = 77 + _r * 18;
    global.bgm_palette[_p, _r * 2 + 0] = _r + 201;     // 左列
}

// ================================================================
// Page 0: MW 音乐 — 左列 muzioj 值（22 行）
// ================================================================
_p = 0;
global.bgm_palette[_p, 0  * 2 + 0] = 1;
global.bgm_palette[_p, 1  * 2 + 0] = 2;
global.bgm_palette[_p, 2  * 2 + 0] = 3;
global.bgm_palette[_p, 3  * 2 + 0] = 4;
global.bgm_palette[_p, 4  * 2 + 0] = 5;
global.bgm_palette[_p, 5  * 2 + 0] = 27;
global.bgm_palette[_p, 6  * 2 + 0] = 13;
global.bgm_palette[_p, 7  * 2 + 0] = 6;
global.bgm_palette[_p, 8  * 2 + 0] = 7;
global.bgm_palette[_p, 9  * 2 + 0] = 8;
global.bgm_palette[_p, 10 * 2 + 0] = 9;
global.bgm_palette[_p, 11 * 2 + 0] = 10;
global.bgm_palette[_p, 12 * 2 + 0] = 11;
global.bgm_palette[_p, 13 * 2 + 0] = 12;
global.bgm_palette[_p, 14 * 2 + 0] = 23;
global.bgm_palette[_p, 15 * 2 + 0] = 14;
global.bgm_palette[_p, 16 * 2 + 0] = 15;
global.bgm_palette[_p, 17 * 2 + 0] = 16;
global.bgm_palette[_p, 18 * 2 + 0] = 17;
global.bgm_palette[_p, 19 * 2 + 0] = 18;
global.bgm_palette[_p, 20 * 2 + 0] = 19;
global.bgm_palette[_p, 21 * 2 + 0] = 24;

// Page 0: MW 音乐 — 右列 muzioj 值（7 行）
global.bgm_palette[_p, 0 * 2 + 1] = 22;
global.bgm_palette[_p, 1 * 2 + 1] = 20;
global.bgm_palette[_p, 2 * 2 + 1] = 26;
global.bgm_palette[_p, 3 * 2 + 1] = 25;
global.bgm_palette[_p, 4 * 2 + 1] = 28;
global.bgm_palette[_p, 5 * 2 + 1] = 21;
global.bgm_palette[_p, 6 * 2 + 1] = 29;

// ================================================================
// Page 1: MFR 音乐 — 左列 muzioj 值（22 行）
// ================================================================
_p = 1;
global.bgm_palette[_p, 0  * 2 + 0] = 41;
global.bgm_palette[_p, 1  * 2 + 0] = 42;
global.bgm_palette[_p, 2  * 2 + 0] = 43;
global.bgm_palette[_p, 3  * 2 + 0] = 44;
global.bgm_palette[_p, 4  * 2 + 0] = 45;
global.bgm_palette[_p, 5  * 2 + 0] = 46;
global.bgm_palette[_p, 6  * 2 + 0] = 47;
global.bgm_palette[_p, 7  * 2 + 0] = 48;
global.bgm_palette[_p, 8  * 2 + 0] = 49;
global.bgm_palette[_p, 9  * 2 + 0] = 50;
global.bgm_palette[_p, 10 * 2 + 0] = 51;
global.bgm_palette[_p, 11 * 2 + 0] = 52;
global.bgm_palette[_p, 12 * 2 + 0] = 53;
global.bgm_palette[_p, 13 * 2 + 0] = 58;
global.bgm_palette[_p, 14 * 2 + 0] = 54;
global.bgm_palette[_p, 15 * 2 + 0] = 55;
global.bgm_palette[_p, 16 * 2 + 0] = 56;
global.bgm_palette[_p, 17 * 2 + 0] = 57;
global.bgm_palette[_p, 18 * 2 + 0] = 76;
global.bgm_palette[_p, 19 * 2 + 0] = 59;
global.bgm_palette[_p, 20 * 2 + 0] = 60;
global.bgm_palette[_p, 21 * 2 + 0] = 61;

// Page 1: MFR 音乐 — 右列 muzioj 值（15 行）
global.bgm_palette[_p, 0  * 2 + 1] = 62;
global.bgm_palette[_p, 1  * 2 + 1] = 63;
global.bgm_palette[_p, 2  * 2 + 1] = 64;
global.bgm_palette[_p, 3  * 2 + 1] = 65;
global.bgm_palette[_p, 4  * 2 + 1] = 66;
global.bgm_palette[_p, 5  * 2 + 1] = 67;
global.bgm_palette[_p, 6  * 2 + 1] = 68;
global.bgm_palette[_p, 7  * 2 + 1] = 69;
global.bgm_palette[_p, 8  * 2 + 1] = 70;
global.bgm_palette[_p, 9  * 2 + 1] = 71;
global.bgm_palette[_p, 10 * 2 + 1] = 73;
global.bgm_palette[_p, 11 * 2 + 1] = 74;
global.bgm_palette[_p, 12 * 2 + 1] = 75;
global.bgm_palette[_p, 13 * 2 + 1] = 72;
global.bgm_palette[_p, 14 * 2 + 1] = 78;
