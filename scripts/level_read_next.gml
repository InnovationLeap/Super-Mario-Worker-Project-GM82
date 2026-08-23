// level_read_next() —— 推进游标并返回新当前行
if global.ll_array = 1 {
    o_readsmwpfile.toloadpointer += 1
    return o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]
}
file_text_readln(global.toload)
return file_text_read_string(global.toload)
