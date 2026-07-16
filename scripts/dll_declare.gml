dll="dtbrowser.dll"

global.DTB_ResizeBrowser=external_define(dll,"ResizeBrowser",1,0,2,0,0);
global.DTB_Initialize=external_define(dll,"Initialize",1,0,0);
global.DTB_BrowserVisible=external_define(dll,"BrowserVisible",1,0,1,0);
global.DTB_CreateBrowser=external_define(dll,"CreateBrowser",1,0,4,0,0,0,0);
global.DTB_DestroyBrowser=external_define(dll,"DestroyBrowser",1,0,0);

global.DTB_AddressBarConfig=external_define(dll,"AddressBarConfig",1,0,2,0,0);
global.DTB_AddressBarVisible=external_define(dll,"AddressBarVisible",1,0,1,0);
global.DTB_CreateAddressBar=external_define(dll,"CreateAddressBar",1,0,3,0,0,0);
global.DTB_DestroyAddressBar=external_define(dll,"DestroyAddressBar",1,0,0);
global.DTB_InvokeAddress=external_define(dll,"InvokeAddress",1,1,0);
global.DTB_MoveAddressBar=external_define(dll,"MoveAddressBar",1,0,3,0,0,0);

global.DTB_Back=external_define(dll,"Back",1,0,0);
global.DTB_Forward=external_define(dll,"Forward",1,0,0);
global.DTB_Go=external_define(dll,"Go",1,1,1,1);
global.DTB_Home=external_define(dll,"Home",1,0,0);
global.DTB_Refresh=external_define(dll,"Refresh",1,0,0);
global.DTB_Stop=external_define(dll,"Stop",1,0,0);

global.DTB_PageSetup=external_define(dll,"PageSetup",1,0,0);
global.DTB_Print=external_define(dll,"Print",1,0,0);
global.DTB_PrintMargins=external_define(dll,"PrintMargins",1,0,4,0,0,0,0);
global.DTB_PrintPreview=external_define(dll,"PrintPreview",1,0,0);
global.DTB_PrintSetup=external_define(dll,"PrintSetup",1,0,3,1,1,0);

global.DTB_Find=external_define(dll,"Find",1,0,0);
global.DTB_Search=external_define(dll,"Search",1,0,0);
global.DTB_Options=external_define(dll,"Options",1,0,0);
global.DTB_SaveAs=external_define(dll,"SaveAs",1,0,0);
global.DTB_ClearCache=external_define(dll,"ClearCache",1,0,0);
global.DTB_ClearHistory=external_define(dll,"ClearHistory",1,0,0);
global.DTB_Properties=external_define(dll,"Properties",1,0,0);
global.DTB_ViewSource=external_define(dll,"ViewSource",1,0,0);
global.DTB_SaveFile=external_define(dll,"SaveFile",1,0,1,1);

global.DTB_DownloadConfig1=external_define(dll,"DownloadConfig1",1,0,4,0,0,0,0);
global.DTB_DownloadConfig2=external_define(dll,"DownloadConfig2",1,0,4,0,0,0,0);
global.DTB_DownloadConfig3=external_define(dll,"DownloadConfig3",1,0,4,0,0,0,0);

global.DTB_IsOffline=external_define(dll,"IsOffline",1,0,0);
global.DTB_OfflineOff=external_define(dll,"OfflineOff",1,0,0);
global.DTB_OfflineOn=external_define(dll,"OfflineOn",1,0,0);

global.DTB_SilentMode=external_define(dll,"SilentMode",1,0,1,0);
global.DTB_BrowserVisible=external_define(dll,"BrowserVisible",1,0,1,0);
global.DTB_CleanUp=external_define(dll,"CleanUp",1,0,0);

global.DTB_SetFocus=external_define(dll,"FocusGM",1,0,0);

external_call(global.DTB_Initialize);
