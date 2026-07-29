/// background_palette_data()
/// 初始化背景选择面板的全局数据数组
/// 调用后将数据存入 global.background_palette[page, index]
/// page: 0=第一页(backgroundpage=0) 1=第二页(backgroundpage=1) 2=第三页(backgroundpage=2)
/// index: row * 4 + col (row=0~2, col=0~3)
/// 数据为该格被选中时设置的 backselect 值；0 表示该格未启用

var _p, _r, _c, _i;

// 先全部清零
for (_p = 0; _p < 3; _p += 1) {
    for (_i = 0; _i < 12; _i += 1) {
        global.background_palette[_p, _i] = 0;
    }
}

// ================================================================
// 第一页 (page=0, backgroundpage=0)
// ================================================================

// --- 行0: plainsky | bluesky | grassland | grassland paralax ---
_p = 0; _r = 0;
global.background_palette[_p, _r * 4 + 0] = 1;   // plainsky
global.background_palette[_p, _r * 4 + 1] = 11;  // bluesky
global.background_palette[_p, _r * 4 + 2] = 3;   // grassland
global.background_palette[_p, _r * 4 + 3] = 4;   // grassland paralax

// --- 行1: cave | plainsky+cave | underwater | underwater paralax ---
_r = 1;
global.background_palette[_p, _r * 4 + 0] = 5;   // cave
global.background_palette[_p, _r * 4 + 1] = 2;   // plainsky+cave
global.background_palette[_p, _r * 4 + 2] = 7;   // underwater
global.background_palette[_p, _r * 4 + 3] = 8;   // underwater paralax

// --- 行2: night | night+cave | castle | castle paralax ---
_r = 2;
global.background_palette[_p, _r * 4 + 0] = 12;  // night
global.background_palette[_p, _r * 4 + 1] = 13;  // night+cave
global.background_palette[_p, _r * 4 + 2] = 22;  // castle
global.background_palette[_p, _r * 4 + 3] = 9;   // castle paralax


// ================================================================
// 第二页 (page=1, backgroundpage=1)
// ================================================================

// --- 行0: cliff | big clouds | forest | Goomba Party ---
_p = 1; _r = 0;
global.background_palette[_p, _r * 4 + 0] = 6;   // cliff
global.background_palette[_p, _r * 4 + 1] = 23;  // big clouds
global.background_palette[_p, _r * 4 + 2] = 19;  // forest
global.background_palette[_p, _r * 4 + 3] = 26;  // Goomba Party

// --- 行1: desert | desert ruin | snow new | snow old ---
_r = 1;
global.background_palette[_p, _r * 4 + 0] = 16;  // desert
global.background_palette[_p, _r * 4 + 1] = 21;  // desert ruin
global.background_palette[_p, _r * 4 + 2] = 24;  // snow new
global.background_palette[_p, _r * 4 + 3] = 20;  // snow old

// --- 行2: dusk | dark | volcano | lava castle ---
_r = 2;
global.background_palette[_p, _r * 4 + 0] = 15;  // dusk
global.background_palette[_p, _r * 4 + 1] = 17;  // dark
global.background_palette[_p, _r * 4 + 2] = 18;  // volcano
global.background_palette[_p, _r * 4 + 3] = 25;  // lava castle


// ================================================================
// 第三页 (page=2, backgroundpage=2)
// ================================================================

// --- 行0 ---
_p = 2; _r = 0;
global.background_palette[_p, _r * 4 + 0] = 10;
global.background_palette[_p, _r * 4 + 1] = 14;
global.background_palette[_p, _r * 4 + 2] = 27;
global.background_palette[_p, _r * 4 + 3] = 28;

// --- 行1 ---
_r = 1;
global.background_palette[_p, _r * 4 + 0] = 29;
global.background_palette[_p, _r * 4 + 1] = 30;
global.background_palette[_p, _r * 4 + 2] = 31;
global.background_palette[_p, _r * 4 + 3] = 32;

// --- 行2 未启用（原代码注释，保留为 0）---
