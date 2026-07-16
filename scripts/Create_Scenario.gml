var aaa, bbb, ccc, ddd, eee, fff, frr, tor, czup, dupa, jiami, bgm, mmm;

//这个变量是新加的，用于保存一份未加密的.smws文件
var orig_file;

aaa=0
czup=0
message_button(s_guibutton)

while aaa=0{
    bbb=get_integer('Please type how many levels you want to put into this Scenario.',5)
    if bbb>=5 or bbb<=32 {aaa=1}
}

aaa=0

for (ccc=1;ccc<=bbb;ccc+=1){
    aaa=0
    while aaa=0{
    ddd[ccc]=get_open_filename('All Supported Formats (.smwl;.mfl)|*.smwl;*.mfl|Super Mario Worker Level (.smwl)|*.smwl|Mario Worker Level(.mfl)|*.mfl','Please select the level number '+string(ccc)+'')

    /* File Checking*/
    if file_exists(ddd[ccc]){
    aaa=1
    }
    else {czup=show_question('Do you want to stop creating a new scenario?')}
    if czup=1{exit}
    /*File Checking End*/

    }
}

linecount=0
aaa=0
aaa=get_integer("Please type the number of lives",4)
aaa=floor(aaa)
bgm=show_question('Do you want to use custom music package?');

if bgm=0 {mmm=''}
if bgm=1 {
    mmm=get_string('Enter the name of your custom music package. The package should be a folder placed along with your scenario file',global.customMusic)
}

jiami=show_question('Do you want your scenario to be encrypted?');
fff=''

while fff=''{
    if jiami=0 {fff=get_save_filename('Mario Worker Scenario (.smws)|*.smws','Scenario.smws')}
    if jiami=1 {fff=get_save_filename('Protected Mario Worker Scenario (.smwp)|*.smwp','Scenario.smwp')}
    fff=filename_change_ext(fff,'.smwsx')
    dupa=fff
    if fff='' {
        czup=show_question('Do you want to stop creating a new scenario?');
        if czup=1 {exit};
        fff=''
    }
}

show_message('When you press OK button, the scenario file will begin to be generated. It may take few seconds, so please be patient.')
tor=file_text_open_write(fff)
file_text_write_string(tor,string(aaa))
file_text_writeln(tor)
linecount+=1

if mmm != ''{
    file_text_write_string(tor,string(mmm))
    file_text_writeln(tor)
    linecount += 1
}

for (ccc=1;ccc<=bbb;ccc+=1){
    GZ_DeCompressFile(ddd[ccc],filename_change_ext(ddd[ccc],'.smwlx'))
    ddd[ccc]=filename_change_ext(ddd[ccc],'.smwlx')
    frr=file_text_open_read(ddd[ccc])
    file_text_write_string(tor,'New Level')
    file_text_writeln(tor)
    linecount+=1

    while !file_text_eof(frr){
        file_text_write_string(tor,file_text_read_string(frr))
        file_text_writeln(tor)
        linecount+=1
        file_text_readln(frr)
        if file_text_eof(frr){file_text_write_string(tor,file_text_read_string(frr));file_text_writeln(tor)}
    }

    file_text_close(frr)
    file_delete(ddd[ccc])
}

if linecount>31950 {
    show_message('Your Scenario is too big to be encrypted, so it will be saved as an unencrypted file.');
    jiami=0
}

file_text_close(tor)
GZ_CompressFile(dupa,filename_change_ext(dupa,'.smws'))
newfile=filename_change_ext(dupa,'.smws')
file_delete(dupa)
if jiami=1 {
    //这里开始直直到show_message()之前都是新加的
    origin = show_question('Do you want to save the original unencrypted scenario?');
    if origin = 1 {
        newfile2=file_copy(newfile,dupa)
    }
    script_text_crypt(newfile,'');
    file_rename(newfile,filename_change_ext(newfile,'.smwp'))

    if origin = 1 {
    file_rename(dupa,filename_change_ext(dupa,'.smws'))
    }
}

show_message('Congratulations!!! Scenario file has been created!')
