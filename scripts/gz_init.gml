global.GZ_DLL = "SMWGzip.dll"
global.GZ_Check = external_define(global.GZ_DLL, "gz_check", dll_stdcall, ty_real, 1, ty_string)
global.GZ_Decompress = external_define(global.GZ_DLL, "gz_decompress", dll_stdcall, ty_real, 2, ty_string, ty_string)
global.GZ_Compress = external_define(global.GZ_DLL, "gz_compress", dll_stdcall, ty_real, 2, ty_string, ty_string)
global.GZ_Selftest = external_define(global.GZ_DLL, "gz_selftest", dll_stdcall, ty_real, 0)
