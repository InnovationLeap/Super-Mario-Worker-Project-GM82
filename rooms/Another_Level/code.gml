room_caption='Super Mario Worker Project '+global.versiontext
room_tile_clear(Play_Room)
room_instance_clear(Play_Room)

global.currentlevel+=1;

if global.lastlev=1{
    room_goto(title)
    mm_stop_all_ext()
}

if global.lastlev=0{


     //复制一份当前文件
    global.path = global.ascii_temp_path+"bass_tmp.smw"
    file_copy(global.mfsfilename,global.path)

    //解密
    if(global.jiami=1 &&global.loadingsav=false) {script_text_crypt(global.path,1)}
    //存档文件专用解密
    if(global.loadingsav=true){script_text_crypt(global.path,2)}

    // DBG: 检查 XOR 解密后的 gzip 魔数
    _tmp_f2 = file_bin_open(global.path,0)
    _tmp_b1 = file_bin_read_byte(_tmp_f2)
    _tmp_b2 = file_bin_read_byte(_tmp_f2)
    file_bin_close(_tmp_f2)
    // DBG: debug_log("DBG_gzip_header: b1=" + string(_tmp_b1) + " b2=" + string(_tmp_b2))

    //记录解压文件
    global.mfsxname = global.ascii_temp_path+"bass_tmpx.smw"
    GZ_DeCompressFile(global.path,global.mfsxname)
    file_delete(global.path)

    if !file_exists(global.mfsxname)
    {
        show_message("ERROR: Decompression failed for " + global.mfsfilename)
        room_goto(welcome)
    }

    // DBG: 检查解压后文件
    // debug_log("DBG_decompressed: exists=" + string(file_exists(global.mfsxname)) + " size=" + string(file_size(global.mfsxname)))
    // _tmp_f3 = file_bin_open(global.mfsxname,0)
    // _tmp_s1 = file_bin_read_byte(_tmp_f3)
    // _tmp_s2 = file_bin_read_byte(_tmp_f3)
    // file_bin_close(_tmp_f3)
    // debug_log("DBG_raw_first_bytes: " + string(_tmp_s1) + "," + string(_tmp_s2))

    // 将旧版 GB2312 文本转为 UTF-8
    ec_convert_file(global.mfsxname)

    _tmp_f = file_text_open_read(global.mfsxname)
    _tmp_s = file_text_read_string(_tmp_f)
    file_text_close(_tmp_f)
    // debug_log("DBG_file: " + string_copy(_tmp_s, 1, 70) + "  first_line_len=" + string(string_length(_tmp_s)))

    global.toload=file_text_open_read(global.mfsxname)

    a=instance_create(0,0,o_readsmwpfile)
    //with(o_readsmwpfile){
    //var toloadtext,toloadpointer,toloadend}
    originalreadmode=0

    while !file_text_eof(global.toload)&&o_readsmwpfile.toloadpointer<31995{
    o_readsmwpfile.toloadpointer+=1
    o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]=file_text_read_string(global.toload)
    file_text_readln(global.toload);
    }

    if o_readsmwpfile.toloadpointer>=31995{with(o_readsmwpfile){instance_destroy()};originalreadmode=1;
    file_text_close(global.toload);
global.toload=file_text_open_read(global.mfsxname)
}//当文件超过31995行时采用原始模式读取。

    if originalreadmode=0{//最新读取模式，无痕的好喝！
    o_readsmwpfile.toloadend=o_readsmwpfile.toloadpointer
    o_readsmwpfile.toloadpointer=1
    file_text_close(global.toload);
    file_delete(global.mfsxname);

    if global.firstlev=1{
        global.zycia=real(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer])
        global.lastzycia = global.zycia
        if global.loadingsav = 1{
            o_readsmwpfile.toloadpointer+=1;
            global.punkty = real(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer])
            //show_message(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]);
            o_readsmwpfile.toloadpointer+=1;
            global.coins = real(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer])
            //show_message(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]);
            o_readsmwpfile.toloadpointer+=1;
            global.rodzajmaria = real(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer])
            //show_message(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]);
            o_readsmwpfile.toloadpointer+=1;
            global.water_height_record = real(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer])
            //show_message(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]);
            o_readsmwpfile.toloadpointer+=1;
            global.background_record = real(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer])
            //show_message(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]);
            o_readsmwpfile.toloadpointer+=1;
            global.music_record = real(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer])
            //show_message(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]);
            o_readsmwpfile.toloadpointer+=1;
            global.checkpoint = real(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer])
            //show_message(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]);
            o_readsmwpfile.toloadpointer+=1;
            checkpointx = o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]
            //show_message(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]);
            for(i=0;i<global.checkpoint;i+=1){
                nextcut = string_pos('|',checkpointx);
                global.check[i+1,0]= real(string_copy(checkpointx,1,nextcut-1));
                //show_message(string(global.check[i+1,0]))
                checkpointx = string_delete(checkpointx,1,nextcut);
                //show_message(checkpointx)
            }
            o_readsmwpfile.toloadpointer+=1;
            checkpointy = o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]
            //show_message(o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]);
            for(i=0;i<global.checkpoint;i+=1){
                nextcut = string_pos('|',checkpointy);
                global.check[i+1,1]= real(string_copy(checkpointy,1,nextcut-1));
                //show_message(string(global.check[i+1,1]))
                checkpointy = string_delete(checkpointy,1,nextcut);
                //show_message(checkpointy)
            }
        }
        global.firstlev=0
    }

    levelcount=0
    while(levelcount<global.currentlevel){
        o_readsmwpfile.toloadpointer+=1
        if levelcount=0 && o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer] != "New Level" {
        global.customMusic=o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer]
        if file_exists(filename_path(global.toload)+global.customMusic+'\'+'ListConfig.ini'){
        global.customMusicDirectory=filename_path(global.toload)
        }
        music_list_update();
        o_readsmwpfile.toloadpointer+=1
        }
        if o_readsmwpfile.toloadtext[o_readsmwpfile.toloadpointer] = "New Level" {
            levelcount+=1;
        }
    }

    Next_level_Load();
    room_instance_add(Play_Room,0,0,o_assist)
    with(o_readsmwpfile){instance_destroy()}
}

    if originalreadmode=1{//原始读取模式
//    show_message("Too big the scenario is!")
    if global.firstlev=1{
        global.zycia=real(file_text_read_string(global.toload))
        global.firstlev=0
    }

    levelcount=0
    while(levelcount<global.currentlevel){
        file_text_readln(global.toload)
        if levelcount=0 && file_text_read_string(global.toload) != "New Level" {
        global.customMusic=file_text_read_string(global.toload)
        if file_exists(filename_path(global.toload)+global.customMusic+'\'+'ListConfig.ini'){
        global.customMusicDirectory=filename_path(global.toload)
        }
        music_list_update();
        }
        if file_text_read_string(global.toload) = "New Level" {
            levelcount+=1;
        }
    }

    Next_level_Load2();
    room_instance_add(Play_Room,0,0,o_assist)

    file_text_close(global.toload);
    file_delete(global.mfsxname);
    }

    global.muzyka=muzykaa
    room_goto(Play_Room)

}
global.beep=1
global.przeszedllevel=0
