/// light_bits_build()
/// 按 global.lightobject 的位号表把发光对象登记进 global.light_obj_list（先清空）。
/// 全部走 light_bit_add(bit, obj)：加一位 = 加一行；一位对多个对象 = 多行同位号。
/// 位号语义与编辑器灯泡一一对应，改这里要同步 scripts/ed_light_draw.gml / ed_light_click.gml。
ds_list_clear(global.light_obj_list);

light_bit_add(1, o_marker)                  // 起始点
light_bit_add(2, o_ice)                     // 冰块
light_bit_add(3, o_windas)                  // 运输桥
light_bit_add(4, o_lightnighttree)          // 夜树
light_bit_add(5, o_lightbignighttree)       // 大夜树
light_bit_add(6, o_lightbrightlight)        // 明亮灯
light_bit_add(7, o_lightpotrait)            // 画像
light_bit_add(8, o_lightlavafall)           // 岩浆瀑布
light_bit_add(9, o_lightrotocenter)         // 探照灯中心

// 第 10 位 = 部分可顶砖块（开关砖阴阳另用第 69 位）
light_bit_add(10, o_pointblock)
light_bit_add(10, o_waterchanger)
light_bit_add(10, o_messageblock)
light_bit_add(10, o_switch)

// 奖励道具
light_bit_add(11, o_bonusmush)
light_bit_add(11, o_newmush)
light_bit_add(12, o_bonusflower)
light_bit_add(13, o_bonusbeetroot)
light_bit_add(14, o_bonuslui)
light_bit_add(15, o_bonusstar)
light_bit_add(16, o_bonus1up)
light_bit_add(16, o_new1up)
light_bit_add(17, o_blockbumper)
light_bit_add(18, o_point)

// 敌人
light_bit_add(19, o_lightgoomba)
light_bit_add(20, o_troopa)
light_bit_add(21, o_troopared)
light_bit_add(22, o_troopafly)
light_bit_add(23, o_spiny)
light_bit_add(23, o_lakitubomb)
light_bit_add(24, o_piranha)
light_bit_add(24, o_piranhaflip)
light_bit_add(25, o_piranhafire)
light_bit_add(25, o_piranhafireflip)
light_bit_add(26, o_lakitu)
light_bit_add(27, o_cannon)
light_bit_add(27, o_cannonflip)
light_bit_add(28, o_fishred)
light_bit_add(28, o_fishred2)
light_bit_add(28, o_fishred3)
light_bit_add(29, o_fishgreen)
light_bit_add(29, o_fishgreen2)
light_bit_add(29, o_fishgreen3)
light_bit_add(30, o_fishblue)
light_bit_add(30, o_fishblue3)
light_bit_add(31, o_fishyellow3)
light_bit_add(31, o_rybekd)
light_bit_add(32, o_bonusdead)
light_bit_add(33, o_groundpiranha)
light_bit_add(34, o_lava)
light_bit_add(35, o_hammerbros)
light_bit_add(36, o_rotoanim)
light_bit_add(37, o_lavaball)
light_bit_add(38, o_spike)
light_bit_add(39, o_thwomp)
light_bit_add(40, o_bowser)
light_bit_add(41, o_fahlee)
light_bit_add(41, o_fahleeball)
light_bit_add(42, o_cannong)
light_bit_add(42, o_cannonfollowflip)
light_bit_add(43, o_firesister)
light_bit_add(44, o_lavabottom)
light_bit_add(45, o_boo)
light_bit_add(46, o_buzzybeetle)
light_bit_add(47, o_troopaflyred)
light_bit_add(48, o_troopablue)
light_bit_add(49, o_troopabluefly)
light_bit_add(50, o_elecoral)
light_bit_add(51, o_mfc)
light_bit_add(52, o_troopagold)
light_bit_add(53, o_troopaflygold)
light_bit_add(54, o_rotostill)
light_bit_add(55, o_troopashell)
light_bit_add(55, o_troopashell2)
light_bit_add(56, o_piranhablue)
light_bit_add(56, o_piranhablueflip)
light_bit_add(57, o_piranhagrey)
light_bit_add(57, o_piranhagreyflip)
light_bit_add(58, o_fakitu)

// 投射物。o_fireexplode 在 59/62/67 三位都登记：沿用原表行为，
// 多个位同时点亮时它会被登记多次，亮度按次数叠加（不是 bug，保持与旧表一致）。
light_bit_add(59, o_fireball)
light_bit_add(59, o_fireexplode)
light_bit_add(60, o_beetroot)
light_bit_add(61, o_lightmarker)
light_bit_add(62, o_enemyfire)
light_bit_add(62, o_fireexplode)
light_bit_add(63, o_cannoni)
light_bit_add(64, o_hammerbro)
light_bit_add(65, o_bowserfire)
light_bit_add(66, o_cannonig)
light_bit_add(67, o_fff)
light_bit_add(67, o_fireexplode)

// 第 68 位 = 岩浆层（o_lightlava 实例本身无条件创建，见 o_weather，只登记「流体里那一盏」）
light_bit_add(68, o_lightlava)

// 第 69 位 = 开关砖阴阳部分
light_bit_add(69, o_yinyang)

// 第 70 位 = 喷火枪的火柱。机关本体 o_flamegun 是实心铁块、本身不发光，
// 发光交给它喷出的火柱：编辑器里点亮喷火枪那格，亮的是喷火时的火。
light_bit_add(70, o_flamegunfire)

// 第 71 位 = 浣熊叶。原先叶子格（Bonus 第二页）误用第 70 位、与喷火枪火柱撞车，
// 且叶子从没被登记进光源表（那格灯泡是死的）；现独占第 71 位。
light_bit_add(71, o_bonusraccoon)
