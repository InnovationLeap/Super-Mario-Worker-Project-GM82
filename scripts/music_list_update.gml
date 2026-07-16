listConfig = global.customMusicDirectory+global.customMusic+'\ListConfig.ini'
if file_exists(listConfig){
    musiclist = file_text_open_read(listConfig)
    counter = 0;
    while(!file_text_eof(musiclist)){
        counter+=1;
        global.customMusicFile[counter] = file_text_read_string(musiclist)
        file_text_readln(musiclist)
     }
    file_text_close(musiclist)
}
global.customMusicTotal = counter
/*custom_directory = global.customMusicDirectory+global.customMusic;
current_file = filename_name(file_find_first(custom_directory+'\*.ogg',0));
counter = 0;
while(current_file!=''){
    counter+=1;
    global.customMusicFile[counter] = current_file;
    current_file = file_find_next();
}
file_find_close();
current_file = filename_name(file_find_first(custom_directory+'\*.mp3',0));
while(current_file!=''){
    counter+=1;
    global.customMusicFile[counter] = current_file;
    current_file = file_find_next();
}
file_find_close();
global.customMusicTotal = counter;*/
