// Next_level_Load —— Play Scenario（连续关卡）模式：从 o_readsmwpfile 内存数组读取
// 注意：首次 level_read_next 前必须先设模式标志（否则未定义时按文件模式分流会炸）
global.ll_array = 1
level_read_next()
if global.lastlev=1 {/*file_text_close(global.toload);file_delete(global.toloader);*/room_goto(title)}
if global.loadingsav=0 {global.checkpoint=0}
level_next_load_core(1)
global.loadingsav=0
skript=''
