# AGENTS.md – GM8 语法规则 & 项目规范

## GM8 语法规则

- `var` 声明不能同时赋值，必须分开写（`var x; x = value;`），且 `var` 不能出现在 `if`/`while` 等块内部，只能在脚本/函数顶部声明。`var` 声明行末尾**必须加分号**（`var x;` 或 `var x, y;`），否则下一行的赋值会被解析为 `Unexpected symbol` 错误。
- 注册新脚本：新建 `.gml` 文件后，必须在 `scripts/index.yyd` 中添加脚本名（文件名不含扩展名，占一行），同时在 `scripts/tree.yyd` 中添加树节点（`|脚本名` 放在对应分组 `+分组名` 下），才能在 GM8.2 IDE 中显示。
- **脚本文件格式：纯 GML 代码，不能带 `#define` 块和 YYD ACTION 标记**。`#define Create_0` + YYD 标记（`/*"/*'/**//* YYD ACTION`）只适用于**对象事件**（objects/*.gml），如果出现在 scripts/*.gml 中会触发 `Unexpected symbol` 编译错误。脚本文件从第一行开始就是纯代码。
- 注册新对象：在 `objects/index.yyd` 中添加对象名，在 `objects/tree.yyd` 中以 `|对象名` 的形式放在对应分组 `+分组名` 下，并配套 `objects/对象名.gml` 和 `objects/对象名.txt` 两个文件。
- 若使用父子继承结构，子对象的 `.txt` 文件中 `parent=父对象名`，且子对象需要通过 `event_inherited()` 调用父对象的对应事件。
- **GM8 .gml 文件不支持用户事件的代码定义**：`#define User0` / `#define User_0` / `#define Event_User_0` 之类的命名都会触发语法错误，导致整个对象文件加载失败。即使有 `event_user(n)` 调用也是无效的（除非先用 IDE 创建 User Defined Event 才有效）。如果需要多态行为，推荐使用独立脚本搭配 `with()` 切上下文来实现。
- `string_count(substr, str)`：GM8 中参数顺序是「子串在前，字符串在后」，与 `string_pos(substr, str)` 一致。如果想检测字符串是否以某前缀开头，可以用 `string_pos(prefix, str) == 1`。
- 跨对象访问变量使用 `objectName.variableName` 语法（例如 `o_edmain.arrayetapu[x, y] = val`）。
- 在 GM8 中，`with(x) { ... }` 块里调用脚本时，脚本中的 `self` 会变成 `x`。从普通代码（非 with）调用脚本时，`self` 保留为调用者的实例。
- `ds_exists` 是 GMS 1.x/2.x 的函数，GM8 不支持。GM8 替代方案：用 `variable_global_exists("varname")` 检查全局变量是否已定义。

## 项目规则

- 调试输出**必须使用项目自带的 `debug_log("message")` 脚本**，禁止直接调用 `show_message`。`debug_log` 仅在全局变量 `debug_mode=1` 时弹出消息框并追加日志到 `debug_log.txt`。

### 物品中英名称对照表

来源：wiki「代码列表」的物品编号 / 物品中文名，与本地 `scripts/Next_level_Load.gml` 中的 `v_ens[]`（敌人 001–048）及标记 / 奖励解析（代码首位 `2` = 标记、`3` = 奖励）建立对应。

#### 敌人（Enemies，代码 001–048）

| 本地对象               | 中文名称        | Wiki代码 |
| ------------------ | ----------- | ------ |
| o_goomba           | 板栗仔         | 001    |
| o_troopa           | 绿乌龟         | 002    |
| o_troopared        | 红乌龟         | 003    |
| o_troopafly        | 绿飞龟         | 004    |
| o_kolcozwierz      | 红刺猬         | 005    |
| o_pirania          | 水管绿色食人花（正向） | 006    |
| o_piraniashot      | 水管绿色食人花（倒向） | 007    |
| o_piraniainv       | 水管红色食人花（正向） | 008    |
| o_piraniainvshot   | 水管红色食人花（倒向） | 009    |
| o_lakitu           | 红刺猬云        | 010    |
| o_cannon           | 炮台（正向）      | 011    |
| o_rybeka           | 红飞鱼         | 012    |
| o_rybekb           | 绿飞鱼         | 013    |
| o_rybekc           | 蓝飞鱼         | 014    |
| o_rynekd           | 黄刺鱼         | 015    |
| o_bonusdead        | 毒蘑菇         | 016    |
| o_miejscowapirania | 扎地食人花       | 017    |
| o_lava             | 岩浆          | 018    |
| o_hammerbros       | 锤子龟         | 019    |
| o_wiatrak          | 探照灯         | 020    |
| o_lavaball         | 火球          | 021    |
| o_kolec            | 地刺（MW）      | 022    |
| o_zgniatacz        | 石盾          | 023    |
| o_kuppa            | 库巴          | 024    |
| o_fahlee           | 灰刺猬         | 025    |
| o_cannong          | 炮台（追踪）      | 026    |
| o_firesister       | 火球龟         | 027    |
| o_lavadier         | 岩浆底部        | 028    |
| o_nonnac           | 炮台（倒向）      | 029    |
| o_gnonnac          | 炮台（倒向，追踪）   | 030    |
| o_boo              | 布布鬼         | 031    |
| o_buzzybeetle      | 硬壳龟         | 032    |
| o_troopaflyred     | 红飞龟         | 033    |
| o_troopablue       | 蓝乌龟         | 034    |
| o_troopabluefly    | 蓝飞龟         | 035    |
| o_elecoral         | 电珊瑚         | 036    |
| o_mfc              | 地刺（MF）      | 037    |
| o_troopagold       | 金乌龟         | 038    |
| o_goldcenter       | 金飞龟         | 039    |
| o_swimfisharea     | 游鱼区域        | 040    |
| o_flyfisharea      | 飞鱼区域        | 041    |
| o_rotostill        | 静止探照灯       | 042    |
| o_troopashell2     | 龟壳          | 043    |
| o_piraniablue      | 水管蓝色食人花（正向） | 044    |
| o_piraniablueshot  | 水管蓝色食人花（倒向） | 045    |
| o_piraniagrey      | 水管灰色食人花（正向） | 046    |
| o_piraniagreyshot  | 水管灰色食人花（倒向） | 047    |
| o_fakitu           | 灰刺猬云        | 048    |

#### 标记（Marks，代码 2xx）

| 本地对象                                       | 中文名称       | Wiki代码  |
| ------------------------------------------ | ---------- | ------- |
| o_exitar                                   | 通关器        | 217     |
| obj_wall                                   | 实心块        | 218     |
| o_marker                                   | 起始点        | 219     |
| o_checkpoint                               | 中途点        | 220     |
| o_scroll                                   | 强制卷轴元件     | 223     |
| o_messageblock                             | 信息砖        | 226     |
| o_switch                                   | 开关砖（开关）    | 227     |
| o_yinyang                                  | 开关砖（阴/阳）   | 228/229 |
| o_ice                                      | 冰块         | 230     |
| o_waterchanger                             | 流体控制元件（点）  | 232     |
| o_waterregion                              | 流体控制元件（区域） | 232     |
| o_bgmchange                                | 场景控制元件     | 233     |
| o_region                                   | 镜头控制元件     | 234     |
| o_windas                                   | 运输桥系列      | 200–225 |
| obj_waall                                  | 封顶实心块      | 222     |
| obj_halfwall / obj_halfground / obj_static | 特殊实心块      | 231     |

#### 奖励（Bonus，代码 3xx）

| 本地对象          | 中文名称 | Wiki代码 |
| ------------- | ---- | ------ |
| o_bonusflower | 火力花  | 301    |
| o_bonusburak  | 甜菜   | 302    |
| o_bonuslui    | 绿果   | 303    |
| o_bonusstar   | 无敌星  | 304    |
| o_bonus1up    | 绿蘑菇  | 305    |
| o_bonusdead   | 毒蘑菇  | 306    |
| o_pointblock  | 问号砖  | 313    |
| o_breakblock  | 砖头   | 315    |
| o_pointblock2 | 金砖   | 316    |
| o_point       | 金币   | 318    |

> 景物（Scenery，代码 1xx）统一使用 `o_scenery`（`image_single = 代码 - 1`），非一对象一编号，故未列入。
