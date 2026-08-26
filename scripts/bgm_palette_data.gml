/// bgm_palette_data()
/// 初始化 BGM 选择面板数据（曲名来源：SMWP 1.7.13-beta1 的 ListofMusic.xlsx）
/// 每个条目由 bgm_entry() 一次登记「鼠标区域 + BGM 编号 + 显示文字」三位一体：
///   global.bgm_e_n[page]                 该页条目数
///   global.bgm_e_x/y/w/h[page, i]        鼠标命中区域（view 相对坐标）
///   global.bgm_e_id[page, i]             BGM 编号（600=无音乐，>=627=自定义音乐）
///   global.bgm_e_txt[page, i]            显示文字（绘制时转大写）
///   global.bgm_e_center[page]            1=文字在区域内居中(0-6页) 0=左对齐(7自定义页)
///   global.bgm_e_dy[page]                文字绘制 y 相对区域顶部的偏移
/// 页签由 bgm_tab() 登记到 global.bgm_tab_*
/// 页面: 0=MW 1=MFR 2=SMS 3=SMS2 4=Softendo 5=SMWP Original 6=Boss 7=Custom(动态,见 bgm_custom_rebuild)
/// 列布局: 左列 x=10 w=200(中心110) 右列 x=215 w=200(中心315)，与原面板两列文字中心一致

var _p, _i;

for (_p = 0; _p < 8; _p += 1) {
    global.bgm_e_n[_p] = 0
}
for (_p = 0; _p < 8; _p += 1) {
    global.bgm_e_center[_p] = 1
    global.bgm_e_dy[_p] = -1
}
global.bgm_e_center[7] = 0
global.bgm_e_dy[7] = 9

global.bgm_tab_n = 0
for (_i = 0; _i < 20; _i += 1) {
    global.bgm_tab_x[_i] = 0
    global.bgm_tab_y[_i] = 0
    global.bgm_tab_w[_i] = 0
    global.bgm_tab_h[_i] = 0
    global.bgm_tab_page[_i] = 0
    global.bgm_tab_txt[_i] = ''
}

// ==============================================================
// 右侧系列页签（x=460 w=150，y 间距 36，与原面板文字行距一致）
// ==============================================================
bgm_tab(460, 113, 150, 16, 0, 'ORIGINAL MARIO WORKER')
bgm_tab(460, 149, 150, 16, 1, 'MARIO FOREVER REMAKE')
bgm_tab(460, 185, 150, 16, 2, 'SUPER MARIO SERIES (1)')
bgm_tab(460, 221, 150, 16, 3, 'SUPER MARIO SERIES (2)')
bgm_tab(460, 257, 150, 16, 4, 'SOFTENDO SERIES')
bgm_tab(460, 293, 150, 16, 5, 'SMWP ORIGINAL SERIES')
bgm_tab(460, 329, 150, 16, 6, 'BOSS MUSIC')
bgm_tab(460, 365, 150, 16, 7, 'CUSTOM MUSIC')

// ==============================================================
// Page 0: Original Mario Worker（左列 22 项 + 右列 7 项，行距不规则，沿用原面板布局）
// ==============================================================
bgm_entry(0, 10, 77, 200, 12, 1, 'SMW Overworld')
bgm_entry(0, 215, 77, 200, 12, 22, 'SMW Castle')
bgm_entry(0, 10, 97, 200, 12, 2, 'Cave')
bgm_entry(0, 215, 97, 200, 12, 20, 'Apoplexy-Tanks')
bgm_entry(0, 10, 116, 200, 12, 3, 'Rockland')
bgm_entry(0, 215, 116, 200, 12, 26, 'Big Bowser')
bgm_entry(0, 10, 135, 200, 12, 4, 'YI Castle')
bgm_entry(0, 215, 135, 200, 12, 25, 'Federation (Map 8)')
bgm_entry(0, 10, 150, 200, 12, 5, 'Riot (Map 1)')
bgm_entry(0, 215, 150, 200, 12, 28, 'Game Select')
bgm_entry(0, 10, 165, 200, 12, 27, 'SMB2U Overworld')
bgm_entry(0, 215, 165, 200, 12, 21, 'Select Save')
bgm_entry(0, 10, 182, 200, 12, 13, 'SMB1 Underwater')
bgm_entry(0, 215, 182, 200, 12, 29, 'Rockland Yoshi')
bgm_entry(0, 10, 202, 200, 12, 6, 'Ghost House')
bgm_entry(0, 10, 222, 200, 12, 7, 'Holiday Anthem (Map 2)')
bgm_entry(0, 10, 242, 200, 12, 8, 'Starland')
bgm_entry(0, 10, 262, 200, 12, 9, 'Starland Platforms')
bgm_entry(0, 10, 276, 200, 12, 10, 'Underground')
bgm_entry(0, 10, 293, 200, 12, 11, 'One Fine Day (Map 3)')
bgm_entry(0, 10, 310, 200, 12, 12, 'YI Theme 4')
bgm_entry(0, 10, 327, 200, 12, 23, 'Trancoi (Map4)')
bgm_entry(0, 10, 344, 200, 12, 14, 'Interference Ending')
bgm_entry(0, 10, 361, 200, 12, 15, 'Sirens')
bgm_entry(0, 10, 382, 200, 12, 16, 'In the Kitchen (Map 5)')
bgm_entry(0, 10, 400, 200, 12, 17, 'YKY')
bgm_entry(0, 10, 418, 200, 12, 18, 'Yet Bonus (Map 6)')
bgm_entry(0, 10, 436, 200, 12, 19, 'YI Overworld')
bgm_entry(0, 10, 454, 200, 12, 24, 'The Golden Ages (Map 7)')

// ==============================================================
// Page 1: Mario Forever Remake（左列 22 项 + 右列 15 项，行距同 Page 0）
// ==============================================================
bgm_entry(1, 10, 77, 200, 12, 41, 'Hiscore (MFAE Title)')
bgm_entry(1, 215, 77, 200, 12, 62, 'Airship Fortress')
bgm_entry(1, 10, 97, 200, 12, 42, 'MK64 Frappe Snowland')
bgm_entry(1, 215, 97, 200, 12, 63, 'Airship Boss Room')
bgm_entry(1, 10, 116, 200, 12, 43, 'NSMB Overworld')
bgm_entry(1, 215, 116, 200, 12, 64, 'Green Star')
bgm_entry(1, 10, 135, 200, 12, 44, 'Rainbow Desort')
bgm_entry(1, 215, 135, 200, 12, 65, 'Kao the Kangaroo (Map U)')
bgm_entry(1, 10, 150, 200, 12, 45, 'MK64 Farm')
bgm_entry(1, 215, 150, 200, 12, 66, 'SMB2U Underground')
bgm_entry(1, 10, 165, 200, 12, 46, 'SSBB Waluigi')
bgm_entry(1, 215, 165, 200, 12, 67, 'SMW VanillaDome')
bgm_entry(1, 10, 182, 200, 12, 47, 'SMB3 Fortress')
bgm_entry(1, 215, 182, 200, 12, 68, 'Dire Dire Docks')
bgm_entry(1, 10, 202, 200, 12, 48, 'DYNA-K (Map 9)')
bgm_entry(1, 215, 202, 200, 12, 69, 'Zelda 2 Palace')
bgm_entry(1, 10, 222, 200, 12, 49, 'LAVA!')
bgm_entry(1, 215, 222, 200, 12, 70, "Bowser's Road")
bgm_entry(1, 10, 242, 200, 12, 50, 'Justice and Freedom')
bgm_entry(1, 215, 242, 200, 12, 71, 'SM Brinstar')
bgm_entry(1, 10, 262, 200, 12, 51, 'Technique (Map 10)')
bgm_entry(1, 215, 262, 200, 12, 73, 'Underwater Yoshi')
bgm_entry(1, 10, 276, 200, 12, 52, 'Cold Cold Mountain')
bgm_entry(1, 215, 276, 200, 12, 74, 'Mario 3 Water')
bgm_entry(1, 10, 293, 200, 12, 53, 'SSBB Underground')
bgm_entry(1, 215, 293, 200, 12, 75, 'Music Hardcore 1-4')
bgm_entry(1, 10, 310, 200, 12, 58, 'Spiller (Map 12)')
bgm_entry(1, 215, 310, 200, 12, 72, 'Syndrome Land')
bgm_entry(1, 10, 327, 200, 12, 54, 'Running the Desert')
bgm_entry(1, 215, 327, 200, 12, 78, 'Dream off')
bgm_entry(1, 10, 344, 200, 12, 55, 'Sunset Desert')
bgm_entry(1, 10, 361, 200, 12, 56, 'LoZ-ST Underwater')
bgm_entry(1, 10, 382, 200, 12, 57, "Alpaca's Adventure Tense")
bgm_entry(1, 10, 400, 200, 12, 76, 'Haunty Halls Galaxy')
bgm_entry(1, 10, 418, 200, 12, 59, 'The Wind Waker (Map 13)')
bgm_entry(1, 10, 436, 200, 12, 60, 'Chain Link Charge')
bgm_entry(1, 10, 454, 200, 12, 61, 'Dragon Roost Island')

// ==============================================================
// Pages 2-6: 等距网格（行距 18，首行 y=77）
// ==============================================================
// --- Page 2: Super Mario Series（左列 101-122，右列 123-144）---
bgm_entry(2, 10, 77, 200, 12, 101, 'SMB Overworld')
bgm_entry(2, 215, 77, 200, 12, 123, 'SM3DW Hill')
bgm_entry(2, 10, 95, 200, 12, 102, 'SMB Castle')
bgm_entry(2, 215, 95, 200, 12, 124, 'SM3DW Fortress')
bgm_entry(2, 10, 113, 200, 12, 103, 'SM64 Cave Dungeon')
bgm_entry(2, 215, 113, 200, 12, 125, 'SM3DW Starland')
bgm_entry(2, 10, 131, 200, 12, 104, 'SMS Bianco Hills')
bgm_entry(2, 215, 131, 200, 12, 126, 'SM3DW Canyon')
bgm_entry(2, 10, 149, 200, 12, 105, 'SMG Athletics')
bgm_entry(2, 215, 149, 200, 12, 127, 'SM3DW Snow')
bgm_entry(2, 10, 167, 200, 12, 106, 'SMG Battlerock')
bgm_entry(2, 215, 167, 200, 12, 128, 'SM3DW Brigade')
bgm_entry(2, 10, 185, 200, 12, 107, 'SMG Waltz of the Boos')
bgm_entry(2, 215, 185, 200, 12, 129, 'SM3DW Forest')
bgm_entry(2, 10, 203, 200, 12, 108, "SMG Bowser's Galaxy")
bgm_entry(2, 215, 203, 200, 12, 130, 'SM3DW Castle')
bgm_entry(2, 10, 221, 200, 12, 109, 'SMG2 Yoshi Star')
bgm_entry(2, 215, 221, 200, 12, 131, 'SM3DW Champion Road')
bgm_entry(2, 10, 239, 200, 12, 110, 'SMG2 Puzzle Plank')
bgm_entry(2, 215, 239, 200, 12, 132, 'SMO Mount Volbono')
bgm_entry(2, 10, 257, 200, 12, 111, 'SMG2 Freezy Flake')
bgm_entry(2, 215, 257, 200, 12, 133, 'SMO Top-Hat Tower')
bgm_entry(2, 10, 275, 200, 12, 112, 'SMG2 Melty Monster')
bgm_entry(2, 215, 275, 200, 12, 134, 'SMRPG Mushroom Way')
bgm_entry(2, 10, 293, 200, 12, 113, 'SMG2 Generator')
bgm_entry(2, 215, 293, 200, 12, 135, "SMRPG Bandit's Way")
bgm_entry(2, 10, 311, 200, 12, 114, 'NSMBDS Athletics')
bgm_entry(2, 215, 311, 200, 12, 136, 'SMRPG Nimbus Land')
bgm_entry(2, 10, 329, 200, 12, 115, 'NSMBDS Castle')
bgm_entry(2, 215, 329, 200, 12, 137, 'MK64 Snowland')
bgm_entry(2, 10, 347, 200, 12, 116, 'NSMBW Underwater')
bgm_entry(2, 215, 347, 200, 12, 138, 'MKDS Yoshi Falls')
bgm_entry(2, 10, 365, 200, 12, 117, 'NSMBW Castle')
bgm_entry(2, 215, 365, 200, 12, 139, 'MLRPG2 Thwomp Volcano')
bgm_entry(2, 10, 383, 200, 12, 118, 'NSMBW Beach')
bgm_entry(2, 215, 383, 200, 12, 140, 'MLRPG3 Final Boss')
bgm_entry(2, 10, 401, 200, 12, 119, 'NSMBW Forest')
bgm_entry(2, 215, 401, 200, 12, 141, 'PM Mountain')
bgm_entry(2, 10, 419, 200, 12, 120, 'NSMBU Overworld')
bgm_entry(2, 215, 419, 200, 12, 142, 'PM2 Unused2')
bgm_entry(2, 10, 437, 200, 12, 121, 'NSMBU Snow')
bgm_entry(2, 215, 437, 200, 12, 143, 'SSBB Underground')
bgm_entry(2, 10, 455, 200, 12, 122, 'SM3DL Desert')
bgm_entry(2, 215, 455, 200, 12, 144, 'SSBB Desert')

// --- Page 3: Super Mario Series 2（左列 145-164）---
bgm_entry(3, 10, 77, 200, 12, 145, 'YIDS Wildlands')
bgm_entry(3, 10, 95, 200, 12, 146, 'SMG Beach Bowl Galaxy')
bgm_entry(3, 10, 113, 200, 12, 147, 'SMG Buoy Base Galaxy')
bgm_entry(3, 10, 131, 200, 12, 148, 'SMG Space Junk Galaxy')
bgm_entry(3, 10, 149, 200, 12, 149, 'SMG Honeyhive Galaxy')
bgm_entry(3, 10, 167, 200, 12, 150, 'SMB2 Overworld')
bgm_entry(3, 10, 185, 200, 12, 151, 'NSMBW Bonus Stage')
bgm_entry(3, 10, 203, 200, 12, 152, 'CTTT Ruins')
bgm_entry(3, 10, 221, 200, 12, 153, 'SMO Fossil Falls')
bgm_entry(3, 10, 239, 200, 12, 154, 'SMO Steam Gardens')
bgm_entry(3, 10, 257, 200, 12, 155, 'SMO Tostarena Ruins')
bgm_entry(3, 10, 275, 200, 12, 156, 'SMO Forgotten Isle')
bgm_entry(3, 10, 293, 200, 12, 157, 'SMO Moon Caverns')
bgm_entry(3, 10, 311, 200, 12, 158, 'SPM Lineland Road')
bgm_entry(3, 10, 329, 200, 12, 159, 'SPM Gloam Valley')
bgm_entry(3, 10, 347, 200, 12, 160, 'MKWII Mushroom Gorge')
bgm_entry(3, 10, 365, 200, 12, 161, 'MLRPG2 Vim Factory')
bgm_entry(3, 10, 383, 200, 12, 162, 'MLRPG3 Fawful Castle')
bgm_entry(3, 10, 401, 200, 12, 163, 'Rainbow Road Medley')
bgm_entry(3, 10, 419, 200, 12, 164, 'SM3DW World 3 Map')

// --- Page 4: Softendo Series（左列 173-194，右列仅前两行 195/196）---
bgm_entry(4, 10, 77, 200, 12, 173, 'PM2 Petal Meadows')
bgm_entry(4, 10, 95, 200, 12, 174, 'MP5 Happy Seafloor')
bgm_entry(4, 10, 113, 200, 12, 175, 'SMW Castle Remix')
bgm_entry(4, 10, 131, 200, 12, 176, 'Super Meat Boy W1')
bgm_entry(4, 10, 149, 200, 12, 177, 'Super Meat Boy W3')
bgm_entry(4, 10, 167, 200, 12, 178, 'Rayman Origins Opera')
bgm_entry(4, 10, 185, 200, 12, 179, 'NSMF Water Ship')
bgm_entry(4, 10, 203, 200, 12, 180, 'NSMF Cloudy 2')
bgm_entry(4, 10, 221, 200, 12, 181, 'SSBB Battlefield')
bgm_entry(4, 10, 239, 200, 12, 182, 'NSMF World 7 Map')
bgm_entry(4, 10, 257, 200, 12, 183, 'Little Big Planet')
bgm_entry(4, 10, 275, 200, 12, 184, 'MFG Dark')
bgm_entry(4, 10, 293, 200, 12, 185, 'MFG Escape')
bgm_entry(4, 10, 311, 200, 12, 186, 'MFG Ghosts')
bgm_entry(4, 10, 329, 200, 12, 187, 'MFG Hard Squad')
bgm_entry(4, 10, 347, 200, 12, 188, 'MFG Castle Dungeon')
bgm_entry(4, 10, 365, 200, 12, 189, 'MFG Real Battle')
bgm_entry(4, 10, 383, 200, 12, 190, 'Super Jungle Brothers')
bgm_entry(4, 10, 401, 200, 12, 191, 'YI Underground Remix')
bgm_entry(4, 10, 419, 200, 12, 192, 'SMB2 Overworld Remix')
bgm_entry(4, 10, 437, 200, 12, 193, 'Dire Dire Docks Remix')
bgm_entry(4, 10, 455, 200, 12, 194, "Bowser's Road Remix")
bgm_entry(4, 215, 77, 200, 12, 195, 'MFBP Battle')
bgm_entry(4, 215, 95, 200, 12, 196, 'MFBP World Map')

// --- Page 5: SMWP Original Series（左列 301-313）---
bgm_entry(5, 10, 77, 200, 12, 301, 'Boundless Desert, Endless River')
bgm_entry(5, 10, 95, 200, 12, 302, 'Danse des Fleurs')
bgm_entry(5, 10, 113, 200, 12, 303, 'Lava Golem')
bgm_entry(5, 10, 131, 200, 12, 304, 'Legendary Castle')
bgm_entry(5, 10, 149, 200, 12, 305, 'Leisurely Seashore')
bgm_entry(5, 10, 167, 200, 12, 306, 'Stardust')
bgm_entry(5, 10, 185, 200, 12, 307, 'Steps Approaching')
bgm_entry(5, 10, 203, 200, 12, 308, 'Easy day')
bgm_entry(5, 10, 221, 200, 12, 309, 'Ghost Parade')
bgm_entry(5, 10, 239, 200, 12, 310, 'Fastrun for Rebirth')
bgm_entry(5, 10, 257, 200, 12, 311, 'Expedition')
bgm_entry(5, 10, 275, 200, 12, 312, 'Lightning Strikes')
bgm_entry(5, 10, 293, 200, 12, 313, 'Sanctuary')

// --- Page 6: Boss Music（左列 201-221）---
bgm_entry(6, 10, 77, 200, 12, 201, 'Kaosession')
bgm_entry(6, 10, 95, 200, 12, 202, 'SMRPG Bowser Battle')
bgm_entry(6, 10, 113, 200, 12, 203, 'YI Big Boss')
bgm_entry(6, 10, 131, 200, 12, 204, 'SMB Bowser Battle')
bgm_entry(6, 10, 149, 200, 12, 205, 'SMB Final Bowser')
bgm_entry(6, 10, 167, 200, 12, 206, 'SMB2 Wart')
bgm_entry(6, 10, 185, 200, 12, 207, 'SMB3 Boss Battle')
bgm_entry(6, 10, 203, 200, 12, 208, 'SMB3 Bowser Battle')
bgm_entry(6, 10, 221, 200, 12, 209, 'SMW Boss Battle')
bgm_entry(6, 10, 239, 200, 12, 210, 'SMW Evil King Bowser')
bgm_entry(6, 10, 257, 200, 12, 211, 'SM64 Final Bowser')
bgm_entry(6, 10, 275, 200, 12, 212, 'NSMB Boss Battle')
bgm_entry(6, 10, 293, 200, 12, 213, 'NSMBW Bowser 1')
bgm_entry(6, 10, 311, 200, 12, 214, 'NSMBW Bowser 2')
bgm_entry(6, 10, 329, 200, 12, 215, 'NSMBU Bowser 1')
bgm_entry(6, 10, 347, 200, 12, 216, 'NSMBU Bowser 2')
bgm_entry(6, 10, 365, 200, 12, 217, 'SM3DL Final Boss')
bgm_entry(6, 10, 383, 200, 12, 218, 'MLRPG2 Bowser Battle')
bgm_entry(6, 10, 401, 200, 12, 219, 'MLRPG3 Bowser Battle')
bgm_entry(6, 10, 419, 200, 12, 220, 'SMO Madam Broode')
bgm_entry(6, 10, 437, 200, 12, 221, 'Newer Bowser Bridge')
