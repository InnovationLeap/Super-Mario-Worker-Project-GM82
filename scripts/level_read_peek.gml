// level_read_peek() —— 读当前行但不推进游标（Next_level_Load 系列专用）
// 分支依据 global.ll_array：1=Play Scenario 内存数组模式(o_readsmwpfile)，0=单关文件句柄模式(global.toload)
if global.ll_array = 1 {return o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]}
return file_text_read_string(global.toload)
