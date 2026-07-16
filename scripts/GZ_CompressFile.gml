/*
  专业偷懒（
*/
 if file_exists(argument0)
  {
  // 检查路径是否含非 ASCII 字符（中文）
  var _has_cn, _i;
  _has_cn = 0;
  for (_i = 1; _i <= string_length(argument0); _i += 1)
  { if (ord(string_char_at(argument0, _i)) > 127) { _has_cn = 1; break; } }
  if (_has_cn = 0)
  {
      for (_i = 1; _i <= string_length(argument1); _i += 1)
      { if (ord(string_char_at(argument1, _i)) > 127) { _has_cn = 1; break; } }
  }

  if (_has_cn = 1)
  {
      // 含中文：复制到临时 ASCII 路径再压缩，然后复制回目标
      var _tmp1, _tmp2, _tag;
      _tag = string(current_time) + string(random(99999));
      _tmp1 = global.ascii_temp_path + "gzcp_" + _tag + "_src.smwlx";
      _tmp2 = global.ascii_temp_path + "gzcp_" + _tag + "_dst.smwl";
      file_copy(argument0, _tmp1);
      gz_compress(_tmp1, _tmp2);
      file_copy(_tmp2, argument1);
      file_delete(_tmp1);
      file_delete(_tmp2);
  }
  else
  {
      gz_compress(argument0,argument1)
  }
  return argument1;
  }
