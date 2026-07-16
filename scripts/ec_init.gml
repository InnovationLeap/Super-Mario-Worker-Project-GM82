global.EC_DLL = "EncodingConv.dll";

global.EC_ConvertEncoding = external_define(global.EC_DLL, "convert_encoding", dll_stdcall, ty_string, 3, ty_string, ty_string, ty_string);
global.EC_Version = external_define(global.EC_DLL, "encoding_conv_version", dll_stdcall, ty_string, 0);
global.EC_ConvertFile = external_define(global.EC_DLL, "convert_file_gb2312_to_utf8", dll_stdcall, ty_real, 1, ty_string);
global.EC_IsCJK = external_define(global.EC_DLL, "is_cjk", dll_stdcall, ty_real, 1, ty_string);
//global.EC_KeyToByteString = external_define(global.EC_DLL, "key_to_byte_string", dll_stdcall, ty_string, 1, ty_string);
