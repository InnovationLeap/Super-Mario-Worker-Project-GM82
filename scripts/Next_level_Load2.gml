// Next_level_Load2 —— 单关模式：从文件句柄 global.toload 读取
// 注意：首次 level_read_next 前必须先设模式标志
global.ll_array = 0
level_read_next()
if global.lastlev=1 {file_text_close(global.toload);file_delete(global.toloader);room_goto(title)}
global.checkpoint=0
level_next_load_core(0)
skript=''
