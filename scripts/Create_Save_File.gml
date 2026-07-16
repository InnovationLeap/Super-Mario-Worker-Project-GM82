//此脚本用于生成存档文件

//复制一份当前文件
global.path = working_directory+"\temp\bass.dll"
file_copy(global.mfsfilename,global.path)
if(global.jiami=1) {
if filename_ext(global.mfsfilename)='.mwsav' {script_text_crypt(global.path,'')}
else{script_text_crypt(global.path,"")}
}

//记录已解压文件
global.mfsxname = working_directory+"\temp\bass_fx.dll"
GZ_DeCompressFile(global.path,global.mfsxname)
file_delete(global.path)
global.toload=file_text_open_read(global.mfsxname)

//将mfs数据读入内存
a=instance_create(0,0,o_readsmwpfile)
while !file_text_eof(global.toload)&&o_readsmwpfile.toloadpointer<31995
{
    o_readsmwpfile.toloadpointer+=1
    o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]= file_text_read_string(global.toload)
    file_text_readln(global.toload);
}
o_readsmwpfile.toloadend=o_readsmwpfile.toloadpointer

//判断是否溢出
/*
if o_readsmwpfile.toloadpointer>=31995{
    with(o_readsmwpfile){instance_destroy()};
    originalreadmode=1;
    file_text_close(global.toload);
}*/

//定位
o_readsmwpfile.toloadpointer=1
file_text_close(global.toload);
file_delete(global.mfsxname);
levelcount=0;
while(levelcount<global.currentlevel){
    o_readsmwpfile.toloadpointer+=1
    if o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer] = "New Level" {levelcount+=1;}
}
o_readsmwpfile.tosavepointer = o_readsmwpfile.toloadpointer; //指针指向当前关卡，准备把当前关卡开始的所有信息录入存档

//生成两个临时文件
tosavename = working_directory+"\temp\bass.dll"
tosavename2 = working_directory+"\temp\bass_fx.dll"

newsavename = filename_change_ext(global.mfsfilename,'.mwsav')
tosavefile = file_text_open_write(tosavename)

//写入命数分数金币状态CP等信息
file_text_write_string(tosavefile,string(global.lastzycia));
file_text_writeln(tosavefile);
file_text_write_string(tosavefile,string(global.lastpunkty));
file_text_writeln(tosavefile);
file_text_write_string(tosavefile,string(global.lastcoins));
file_text_writeln(tosavefile);
file_text_write_string(tosavefile,string(global.lastrodzajmaria));
file_text_writeln(tosavefile);
file_text_write_string(tosavefile,string(global.water_height_record));
file_text_writeln(tosavefile);
file_text_write_string(tosavefile,string(global.background_record));
file_text_writeln(tosavefile);
file_text_write_string(tosavefile,string(global.music_record));
file_text_writeln(tosavefile);
file_text_write_string(tosavefile,string(global.checkpoint));
//show_message('checkpoint='+string(global.checkpoint));
for(i=0;i<global.checkpoint;i+=1){
file_text_write_string(tosavefile,string(global.check[i+1,0])+'|')
//show_message('checkpointx'+string(i+1)+'='+string(global.check[i+1,0]));
}
file_text_writeln(tosavefile);
for(i=0;i<global.checkpoint;i+=1){
file_text_write_string(tosavefile,string(global.check[i+1,1])+'|')
//show_message('checkpointy'+string(i+1)+'='+string(global.check[i+1,1]));
}
file_text_writeln(tosavefile);

//写入关卡信息
while o_readsmwpfile.tosavepointer <= o_readsmwpfile.toloadend{
    file_text_write_string(tosavefile,o_readsmwpfile.toloadtext[o_readsmwpfile.tosavepointer]);
    file_text_writeln(tosavefile);
    o_readsmwpfile.tosavepointer+=1;
}
file_text_close(tosavefile)

//压缩与加密
GZ_CompressFile(tosavename,tosavename2)
file_delete(tosavename)
script_text_crypt(tosavename2,'');
file_copy(tosavename2,newsavename)
file_delete(tosavename2)
