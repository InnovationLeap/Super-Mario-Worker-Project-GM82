var aa,ab,ac,ad;  //定义四个变量
file_text_write_string(global.script_file,'BlocksDataStart')  //写入blocks数据起始标记
file_text_writeln(global.script_file)
if global.lvlwidth=0{
for(aa=0; aa<=room_height/32; aa+=1){    //aa确定纵坐标并控制换行
    ad=''    //ad记录砖块代码，每记录一行清空一次
    for(ab=0; ab<=room_width/32; ab+=1){    //ab确定横坐标并控制横向循环
        if arrayetapu[ab,aa] <= 99{
        ac=string(arrayetapu[ab,aa])}    //ac负责在edit界面定位并记录单个砖块代码
        if arrayetapu[ab,aa] >=100
        ac=string_char_at("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",floor(arrayetapu[ab,aa]/10)-9)+string(arrayetapu[ab,aa] mod 10)
        if string_length(ac)!=2{ac=string_insert('0',ac,0)}   //如果砖块代码是个位，添0
        ad=string_insert(ac,ad,string_length(ad)+1)    //把ac的内容加到ad中
    }
    file_text_write_string(global.script_file,ad)
    file_text_writeln(global.script_file) //ad内容写入文件，换行
}
}
else{
for(aa=0; aa<=global.lvlheight/32; aa+=1){    //aa确定纵坐标并控制换行
    ad=''    //ad记录砖块代码，每记录一行清空一次
    for(ab=0; ab<=global.lvlwidth/32; ab+=1){    //ab确定横坐标并控制横向循环
        if global.arrayetapu2[ab,aa] <= 99{
        ac=string(global.arrayetapu2[ab,aa])}    //ac负责在edit界面定位并记录单个砖块代码
        if global.arrayetapu2[ab,aa] >=100
        ac=string_char_at("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",floor(global.arrayetapu2[ab,aa]/10)-9)+string(global.arrayetapu2[ab,aa] mod 10)
        if string_length(ac)!=2{ac=string_insert('0',ac,0)}   //如果砖块代码是个位，添0
        ad=string_insert(ac,ad,string_length(ad)+1)    //把ac的内容加到ad中
    }
    file_text_write_string(global.script_file,ad)
    file_text_writeln(global.script_file) //ad内容写入文件，换行
}
global.lvlwidth=0
global.lvlheight=0
}
file_text_write_string(global.script_file,'BlocksEnd')  //写入blocks数据结束标记
file_text_writeln(global.script_file)  //换行
