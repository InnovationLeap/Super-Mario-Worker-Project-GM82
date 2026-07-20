# Super Mario Worker Project — GM82 Edition

This project is based on SMWP v1.7.12f and upgrades the development environment to [GameMaker 8.2](https://gm82.cherry-treehouse.com/#Downloads).

---

## How to use

1. Download and install [GameMaker 8.2](https://gm82.cherry-treehouse.com/#Downloads).
2. Download and install the [MaizeMusic](https://www.magecorn.com/p/254.shtml) extension. It can also be obtained from the [Mario Forever CN community resource site](https://file.marioforever.net/smwp/MaizeMusic_3.1_20170316.zip).
3. The DLLs for the remaining extensions are already included in this project — no extra download or installation is required.

---

## Extensions

This project depends on the following extensions:

| Extension                                                                 | Description                                                                                                                                                                                  |
| ------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Game Maker 8.2 DirectX9                                                   | Bundled with GM8.2 (FoxWriting_GM82 depends on d3d9).                                                                                                                                        |
| [MaizeMusic](https://www.magecorn.com/p/254.shtml)                        | Music playback extension supporting multiple audio formats and advanced playback features; carried over from previous versions.                                                              |
| [FoxWriting_GM82](https://github.com/InnovationLeap/FoxWriting_GM82)      | Text-rendering extension adapted to the GM8.2 API. Compatible with most original FoxWriting function names, but since it is almost a full rewrite, some differences from the original exist. |
| [EncodingConv](https://github.com/InnovationLeap/EncodingConv_GM82)       | Encoding-conversion extension. GM8.0 uses GB2312 encoding; this extension converts old levels from GB2312 to UTF-8 for GM8.2 compatibility.                                                  |
| [SMWGzip (new edition)](https://github.com/InnovationLeap/SMWGzip_Native) | Level-file decompression extension. This version is written in C and requires no .NET runtime to be installed by the user.                                                                   |
