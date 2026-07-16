instance_activate_all()
global.script_file='' //初始化变量script_file（文件名）
if !variable_global_exists("autosavename"){
global.autosavename=''
}
while global.script_file=''{
    if global.autosavename=''{
        global.script_file=get_save_filename('Super Mario Worker Level (.smwl)|*.smwl','Untitled Level.smwl')
        global.autosavename=global.script_file
        global.autosavename_record = global.autosavename
    }
    else{global.script_file=global.autosavename}
    //if filename_name(filename_change_ext(global.autosavename,''))<>'temp'{global.autosavename_record = global.autosavename}
    global.script_file=filename_change_ext(global.script_file,'.smwlx')
    global.fundel=global.script_file

    if filename_path(global.autosavename) = working_directory+'\Temp\' {
        show_message('Invalid directory!')
        global.script_file=''
        global.autosavename=''
    }
}


 //记录文件名（mflx格式）
global.script_file=file_text_open_write(global.script_file)  //准备写入mflx文件
//show_message(string(global.lvlwidth)+";"+string(global.lvlheight))
if global.lvlwidth=0{file_text_write_string(global.script_file,string(room_width))}
else{file_text_write_string(global.script_file,string(global.lvlwidth))}
file_text_writeln(global.script_file) //关卡长度
if global.lvlheight=0{file_text_write_string(global.script_file,string(room_height))}
else{file_text_write_string(global.script_file,string(global.lvlheight))}
file_text_writeln(global.script_file) //关卡高度
file_text_write_string(global.script_file,global.etapnazwa)
file_text_writeln(global.script_file)  //关卡名
file_text_write_string(global.script_file,global.etapautor)
file_text_writeln(global.script_file)  //关卡作者
file_text_write_string(global.script_file,string(global.etapczas))
file_text_writeln(global.script_file)  //时间
file_text_write_string(global.script_file,string(global.etapgravity))
file_text_writeln(global.script_file)  //重力
file_text_write_string(global.script_file,string(global.etapkuppa))
file_text_writeln(global.script_file)  //库巴血量
file_text_write_string(global.script_file,string(global.poziomwody))
file_text_writeln(global.script_file)  //水面高度
file_text_write_string(global.script_file,string(global.background))
file_text_writeln(global.script_file)  //背景
file_text_write_string(global.script_file,string(global.muzyka))
file_text_writeln(global.script_file)  //音乐
Save_Script_Blocks()  //写入砖块数据
with (o_edenemyblock)     {Save_Script_Enemy()} //写入敌人数据
with (o_edsceneriesblock) {Save_Script_Rest('1')} //写入装饰物类数据
with (o_edmarkerblock)    {Save_Script_Rest('2')} //写入mark类数据
with (o_edbonusesblock)   {Save_Script_Rest('3')} //写入奖励类数据
with (o_edpassage)        {Save_Script_Passage()} //写入管道出入口数据
if global.modifiedmov=1{file_text_write_string(global.script_file,"modifiedmov=1")}
if global.modifiedmov=0{file_text_write_string(global.script_file,"modifiedmov=0")}
file_text_writeln(global.script_file)
if global.rotodisclay=1{file_text_write_string(global.script_file,"rotodisclay=1")}
if global.rotodisclay=0{file_text_write_string(global.script_file,"rotodisclay=0")}
file_text_writeln(global.script_file)
if global.layerord=2{file_text_write_string(global.script_file,"layerord=2")}
if global.layerord=1{file_text_write_string(global.script_file,"layerord=1")}
if global.layerord=0{file_text_write_string(global.script_file,"layerord=0")}
file_text_writeln(global.script_file)
if global.lava=1{file_text_write_string(global.script_file,"lava=1")}
if global.lava=0{file_text_write_string(global.script_file,"lava=0")}
file_text_writeln(global.script_file)
if global.auto=1{file_text_write_string(global.script_file,"auto=1")}
if global.auto=0{file_text_write_string(global.script_file,"auto=0")}
file_text_writeln(global.script_file)
file_text_write_string(global.script_file,"T1="+string(global.firstbound))
file_text_writeln(global.script_file)
file_text_write_string(global.script_file,"T2="+string(global.secondbound))
file_text_writeln(global.script_file)
file_text_write_string(global.script_file,"velocity="+string(global.water_velocity))
file_text_writeln(global.script_file)
file_text_write_string(global.script_file,"delay="+string(global.water_delay))
file_text_writeln(global.script_file)
if global.advswitch=1{file_text_write_string(global.script_file,"advswitch=1")}
if global.advswitch=0{file_text_write_string(global.script_file,"advswitch=0")}
file_text_writeln(global.script_file)
if global.fast_retry=1{file_text_write_string(global.script_file,"fastretry=1")}
if global.fast_retry=0{file_text_write_string(global.script_file,"fastretry=0")}
file_text_writeln(global.script_file)
if global.MFbeet=1{file_text_write_string(global.script_file,"MFbeet=1")}
if global.MFbeet=0{file_text_write_string(global.script_file,"MFbeet=0")}
file_text_writeln(global.script_file)
if global.celeste=1{file_text_write_string(global.script_file,"celeste=1")}
if global.celeste=0{file_text_write_string(global.script_file,"celeste=0")}
file_text_writeln(global.script_file)
if global.pipeout=1{file_text_write_string(global.script_file,"pipeout=1")}
if global.pipeout=0{file_text_write_string(global.script_file,"pipeout=0")}
file_text_writeln(global.script_file)
if global.fastpass=1{file_text_write_string(global.script_file,"fastpass=1")}
if global.fastpass=0{file_text_write_string(global.script_file,"fastpass=0")}
file_text_writeln(global.script_file)
if global.huddisplay=1{file_text_write_string(global.script_file,"huddisplay=1")}
if global.huddisplay=0{file_text_write_string(global.script_file,"huddisplay=0")}
file_text_writeln(global.script_file)
file_text_write_string(global.script_file,"rainy="+string(global.rainy))
file_text_writeln(global.script_file)
file_text_write_string(global.script_file,"fallingstars="+string(global.fallingstars))
file_text_writeln(global.script_file)
file_text_write_string(global.script_file,"snowy="+string(global.snowy))
file_text_writeln(global.script_file)
file_text_write_string(global.script_file,"thunder="+string(global.thunder))
file_text_writeln(global.script_file)
file_text_write_string(global.script_file,"windy="+string(global.windy))
file_text_writeln(global.script_file)
file_text_write_string(global.script_file,"darkness="+string(global.darkness))
file_text_writeln(global.script_file)
file_text_write_string(global.script_file,"brightness="+string(global.brightness))
file_text_writeln(global.script_file)
file_text_write_string(global.script_file,"lightobject="+string(global.lightobject))
file_text_writeln(global.script_file)
file_text_write_string(global.script_file,"stunblock="+string(global.stunblock))
file_text_writeln(global.script_file)
file_text_write_string(global.script_file,"version="+string(global.version))
file_text_close(global.script_file)  //关闭文件
global.script_file=global.fundel  //恢复文件名
if global.saving=0{
    global.tosave = filename_change_ext(global.fundel,'.smwl')
}
else{
    global.tosave = filename_change_ext(global.fundel,'.mfl')
}
GZ_CompressFile(global.fundel,global.tosave);  //gzip压缩成mfl文件
file_delete(global.fundel)  //删除mflx文件
if global.donottemp !=1{
    global.tempnumber+=1;
    tempwarning = 0
    if(global.tempnumber>global.maxtemp){
        tempwarning =1
        ques = show_question ('Out of max number of temporary files. The earlier temporary files will be replaced. Continue?')
        if ques = 1 {global.tempnumber = 1; tempwarning = 0}
    }

    if  tempwarning = 0 {
        //file_copy(global.tosave, '.\temp\temp'+'_'+string(global.tempnumber)+'_'+filename_name(global.tosave))
        date = date_current_datetime();
        file_copy(global.tosave, '.\temp\'+filename_name(filename_change_ext(global.autosavename_record,''))+'_'+string(date_get_year(date))+'_'+string(date_get_month(date))+'_'+string(date_get_day(date))+'_'+string(date_get_hour(date))+'_'+string(date_get_minute(date))+'_'+string(date_get_second(date))+'.smwl')
        //olderfile = file_find_first('.\temp\*.smwl','temp'+'_'+string(global.tempnumber))
        //if olderfile !='' {file_delete(olderfile)}
        tempsetid = file_text_open_write('.\temp\TempSettings.ini')
        file_text_write_string(tempsetid,'CurrentTempNumber='+string(global.tempnumber))
        file_text_writeln(tempsetid)
        file_text_write_string(tempsetid,'MaxTempNumber='+string(global.maxtemp))
        file_text_close(tempsetid)
    }
}
if global.donottemp=1 {global.donottemp =0}
