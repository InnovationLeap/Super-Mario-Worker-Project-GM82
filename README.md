# Super Mario Worker Project GM82 版

本项目基于 SMWP v1.7.12f，将开发环境升级至 [GameMaker 8.2](https://gm82.cherry-treehouse.com/#Downloads)。

---

## 使用方法

1. 下载并安装 [GameMaker 8.2](https://gm82.cherry-treehouse.com/#Downloads)
2. 下载并安装 [MaizeMusic](https://www.magecorn.com/p/254.shtml) 扩展，也可在 [Mario Forever 社区资源站](https://file.marioforever.net/smwp/MaizeMusic_3.1_20170316.zip) 获取。
3. 其余扩展的 DLL 文件已包含在本项目中，无需额外下载或安装。

---

## 扩展说明

本项目依赖于以下扩展：

| 扩展名称                                                                 | 说明                                                               |
|:-------------------------------------------------------------------- |:---------------------------------------------------------------- |
| Game Maker 8.2 DirectX9                                              | GM8.2 自带扩展（FoxWriting_GM82 依赖 d3d9）                              |
| [MaizeMusic](https://www.magecorn.com/p/254.shtml)                   | 音乐播放扩展，支持多种音频格式及高级播放功能，沿用先前版本。                                   |
| [FoxWriting_GM82](https://github.com/InnovationLeap/FoxWriting_GM82) | 文本渲染扩展，适配 GM8.2 API。兼容原版 FoxWriting 大部分函数名，但由于几乎为完全重写，与原版存在部分差异。 |
| [EncodingConv](https://github.com/InnovationLeap/EncodingConv_GM82)  | 编码转换扩展。GM8.0 使用 GB2312 编码，本扩展可将旧版关卡从 GB2312 转换为 UTF-8，以兼容 GM8.2。 |
| [SMWGzip（新版）](https://github.com/InnovationLeap/SMWGzip_Native)      | 关卡文件解压扩展。此版本使用 C 语言编写，无需用户安装 .NET 运行时。                           |