/*
  专业偷懒（
*/
if file_exists(argument0) {
    // 检查路径是否含非 ASCII 字符（中文）
    var _has_cn, _i, _gzres;
    _gzres = 0;
    _has_cn = 0;
    for (_i = 1; _i <= string_length(argument0); _i += 1) { if (ord(string_char_at(argument0, _i)) > 127) { _has_cn = 1; break; } }
    if (_has_cn = 0) {
        for (_i = 1; _i <= string_length(argument1); _i += 1) { if (ord(string_char_at(argument1, _i)) > 127) { _has_cn = 1; break; } }
    }

    if (_has_cn = 1) {
        // 含中文：复制到临时 ASCII 路径再解压
        var _tmp1, _tmp2, _tag;
        _tag = string(current_time) + string(random(99999));
        _tmp1 = global.ascii_temp_path + "gzdcp_" + _tag + "_src.smwl";
        _tmp2 = global.ascii_temp_path + "gzdcp_" + _tag + "_dst.smwlx";
        file_copy(argument0, _tmp1);
        if (gz_check(_tmp1) = 1) {
            _gzres = gz_decompress(_tmp1, _tmp2);
        } else { file_copy(_tmp1, _tmp2); }
        file_copy(_tmp2, argument1);
        // [GZ] DBG: CN 路径分支（gz 结果 + 输出尺寸）
        debug_log("[GZ] DeCompressFile(CN): gz_src=" + string(gz_check(_tmp1)) + " result=" + string(_gzres) + " dst_size=" + string(file_size(argument1)))
        file_delete(_tmp1);
        file_delete(_tmp2);
    } else {
        if gz_check(argument0) = 1 {
            _gzres = gz_decompress(argument0,argument1)
        } else {
            file_copy(argument0,argument1)
        }
        // [GZ] DBG: ASCII 路径分支（gz 结果 + 输出尺寸）
        debug_log("[GZ] DeCompressFile: gz_src=" + string(gz_check(argument0)) + " result=" + string(_gzres) + " dst_size=" + string(file_size(argument1)))
    }
    return argument1;
} else {
    // [GZ] DBG: 源文件缺失，GZ 静默 no-op（后续 open_read 会得到句柄 0）
    debug_log("[GZ] DeCompressFile: src_MISSING=" + argument0)
}
