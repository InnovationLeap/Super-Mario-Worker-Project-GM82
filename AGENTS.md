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
- **不支持十六进制字面量**（`0xEF`、`0x80` 等）。必须使用十进制数（`239`、`128` 等）。
- **不支持 `trim()` 函数**。需手动实现：逐字符检查首尾空白（空格 `32`、制表符 `9`、CR `13`、LF `10`），用 `string_copy` 裁剪。
- **多行 `if` 条件中 `&&` 跨行续写可能导致解析错误**。改为嵌套 `if` 结构逐层判断，避免在同一 `if` 条件内跨行。

## GM8.2 编码注意事项

> 本项目基于 GM8.2（非 GM8.0），**内部使用 UTF-8 编码**。GM8.0 使用 GBK/GB2312，两者在编码行为上有重大差异。

### 字符串编码模型

- **GM8.2 字符串内部为 UTF-8**。`string_length('中文')` 返回 `2`（字符数），而非 GM8.0 下的 `4`（字节数）。每个中文字符算 1 个字符。
- **`ord()` 返回 UTF-8 首字节**，不是 Unicode 码点。例如 `ord('中')` = `228`（`0xE4`，即 UTF-8 编码 `E4 B8 AD` 的首字节），而非 Unicode 码点 `20013`。
- **文件路径在 GM8.2 中是 UTF-8**。`file_exists`、`directory_create`、`screen_save` 等函数均可接受 UTF-8 中文路径。

### `chr()` 的严重限制

- **`chr(n)` 对 `n > 127` 返回值不可靠**。在 GM8.2 的 UTF-8 环境下，`chr(214)` 返回 `'?'`（`ord=63`），而非原始字节 `214`。
- **禁止用 `file_bin_read_byte()` + `chr()` 组合来"存储原始字节"**。非 ASCII 字节会被破坏为 `?`（63），导致数据完全不可用。
  ```gml
  // ❌ 错误：非 ASCII 字节会被 chr() 破坏
  while (_i < file_bin_size(_fid)){
      _bs += chr(file_bin_read_byte(_fid))
      _i += 1
  }
  ```
- 如需处理二进制/原始字节数据，应使用外部 DLL（如 `EncodingConv.dll`）直接对文件进行操作，而非在 GML 层逐字节中转。

### 字体加载：GM8 没有 `font_add`，TTF 只能走 fw 库

- **GM8 没有 `font_add(filename, size, ...)` 函数**（那是 GMS 1.x 才引入的）。调用 `font_add` 无论传几个参数都会报 `Wrong number of arguments to function or script` 编译错误。
- **GM8 字体资源（`Fonts/fontN.txt`）的 `name=` 字段只能填「系统已安装字体名」（如 `Times New Roman`），不能填 TTF 文件路径**。若填 `name=.\Fonts\message.ttf`：
  - IDE 启动时弹警告 `Warning: this game uses the following fonts, which are not installed: ...message.ttf`
  - 严重时**游戏直接打不开**（编译/加载崩溃）。此路不可行，不要尝试。
- **运行时从 TTF 文件加载字体的唯一途径是 fw 库（FoxWriting_GM82.dll）**：
  ```gml
  testfont = fw_add_font_from_file('.\Fonts\message.ttf', 14.1, false, false, true)
  fw_draw_set_font(testfont)   // 每次绘制前都要设置
  fw_draw_text(x, y, '文本')
  ```
- **fw 库字体 ID 与 GM8 原生字体是两套体系，不可混用**：`draw_set_font(fw字体ID)` + `draw_text()` 会字体错乱（显示成别的字体/乱码），必须 `fw_draw_set_font()` + `fw_draw_text()` 配套使用。
- 同理 `font_add_sprite()`（从精灵建字体）是 GM8 原生函数，可正常配 `draw_set_font()` + `draw_text()` 使用，但只能从精灵资源建字体，不能从 TTF 文件加载。
- 项目内 `testfont` 是 fw 库字体 ID（welcome 房间加载），`cyferkimario`/`cyferki` 等是 `font_add_sprite` 原生字体。

### 文本文件 I/O

- **`file_text_read_string()` / `file_text_write_string()` 原生支持 UTF-8**。读取 UTF-8 编码的文本文件无需额外转码。
  ```gml
  // ✓ 正确：直接读取 UTF-8 文本文件
  _fid = file_text_open_read(working_directory + '\config.ini')
  while (!file_text_eof(_fid)){
      _line = file_text_read_string(_fid)
      file_text_readln(_fid)
      // 处理 _line ...
  }
  file_text_close(_fid)
  ```
- **`ini_read_string()` 使用 Windows ANSI API（`GetPrivateProfileString`）**，不原生支持 UTF-8。若 `GameSettings.ini` 保存为 UTF-8（如 VS Code 默认），中文值会被读取为乱码。
- **读取 UTF-8 INI 中中文值的正解**：用 `file_text_open_read()` + `file_text_read_string()` 逐行读取并匹配键名，提取的值即为 UTF-8 字符串，可直接使用。

### EncodingConv.dll

项目自带 `EncodingConv.dll`，提供编码转换能力（已通过 `ec_init()` 在欢迎房间初始化）：

| 脚本 | 功能 | 调用方式 |
|------|------|---------|
| `ec_convert(str, from, to)` | 字符串编码转换 | `ec_convert(str, 'UTF-8', 'GB2312')` |
| `ec_convert_file(path)` | 文件级 GB2312→UTF-8 转换 | `ec_convert_file(filepath)` |
| `ec_is_cjk(char)` | 判断字符是否为 CJK 宽体字 | `ec_is_cjk(nextChar)` |

- `ec_convert_file` 用于将旧版 GB2312 关卡文件转为 UTF-8，以兼容 GM8.2 的 `file_text_read_string`。
- `ec_convert` 用于内存中字符串编码互转（典型场景：UTF-8 ↔ GB2312）。

### 精灵 PNG 图片格式

- **GM8.2 不支持 8-bit Indexed（调色板/Palette）PNG 格式**。如果精灵帧图的 PNG 为 Indexed/P 模式（常见于从 SMWP2 或其他项目复制的素材），加载时会报错 `couldn't understand format Eight/Indexed for image`。
- **精灵 PNG 必须使用 RGBA（32-bit）或 RGB（24-bit）格式**。现有精灵（如 `s_buzzyshell`）均使用 RGBA 格式。
- 转换方式：用 Python PIL 将 Indexed PNG 转为 RGBA：
  ```python
  from PIL import Image
  img = Image.open('input.png')
  img_rgba = img.convert('RGBA')
  img_rgba.save('output.png')
  ```
- 检查现有精灵格式以确认目标：
  ```python
  from PIL import Image
  img = Image.open('sprites/s_buzzyshell/0.png')
  print(img.mode)  # 应输出 'RGBA'
  ```

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
