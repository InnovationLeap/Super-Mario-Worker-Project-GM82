var aaa, bbb, ccc, ddd, eee, fff, frr, fid, stop_choice, src_path, encrypt, bgm, mmm;

//这个变量是新加的，用于保存一份未加密的.smws文件
var orig_file, key_exists;

aaa=0
stop_choice=0

while aaa=0 {
    bbb=get_integer('Please type how many levels you want to put into this Scenario.',5)
    if bbb>=5 or bbb<=32 {aaa=1}
}

aaa=0

for (ccc=1;ccc<=bbb;ccc+=1) {
    aaa=0
    while aaa=0 {
        ddd[ccc]=get_open_filename('All Supported Formats (.smwl;.mfl)|*.smwl;*.mfl|Super Mario Worker Level (.smwl)|*.smwl|Mario Worker Level(.mfl)|*.mfl','Please select the level number '+string(ccc)+'')

    /* File Checking*/
        if file_exists(ddd[ccc]) {
            aaa=1
        } else {stop_choice=show_question('Do you want to stop creating a new scenario?')}
        if stop_choice=1 {exit}
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

// 检测密钥是否存在：未初始化变量为 0 时，若密钥脚本缺失则 crypt_key_arr[0] = 0
get_crypt_key1();
key_exists = (crypt_key_arr[0] != 0);
if key_exists {
    encrypt=show_question('Do you want your scenario to be encrypted?');
} else {
    encrypt=0;
}
fff=''

while fff='' {
    if encrypt=0 {fff=get_save_filename('Mario Worker Scenario (.smws)|*.smws','Scenario.smws')}
    if encrypt=1 {fff=get_save_filename('Protected Mario Worker Scenario (.smwp)|*.smwp','Scenario.smwp')}
    fff=filename_change_ext(fff,'.smwsx')
    src_path=fff
    if fff='' {
        stop_choice=show_question('Do you want to stop creating a new scenario?');
        if stop_choice=1 {exit};
        fff=''
    }
}

show_message('When you press OK button, the scenario file will begin to be generated. It may take few seconds, so please be patient.')
fid=file_text_open_write(fff)
file_text_write_string(fid,string(aaa))
file_text_writeln(fid)
linecount+=1

if mmm != '' {
    file_text_write_string(fid,string(mmm))
    file_text_writeln(fid)
    linecount += 1
}

for (ccc=1;ccc<=bbb;ccc+=1) {
    GZ_DeCompressFile(ddd[ccc],filename_change_ext(ddd[ccc],'.smwlx'))
    ddd[ccc]=filename_change_ext(ddd[ccc],'.smwlx')
    frr=file_text_open_read(ddd[ccc])
    file_text_write_string(fid,'New Level')
    file_text_writeln(fid)
    linecount+=1

    while !file_text_eof(frr) {
        file_text_write_string(fid,file_text_read_string(frr))
        file_text_writeln(fid)
        linecount+=1
        file_text_readln(frr)
        if file_text_eof(frr) {file_text_write_string(fid,file_text_read_string(frr));file_text_writeln(fid)}
    }

    file_text_close(frr)
    file_delete(ddd[ccc])
}

if linecount>31950 {
    show_message('Your Scenario is too big to be encrypted, so it will be saved as an unencrypted file.');
    encrypt=0
}

file_text_close(fid)
GZ_CompressFile(src_path,filename_change_ext(src_path,'.smws'))
newfile=filename_change_ext(src_path,'.smws')
file_delete(src_path)
if encrypt=1 {
    //这里开始直直到show_message()之前都是新加的
    origin = show_question('Do you want to save the original unencrypted scenario?');
    if origin = 1 {
        newfile2=file_copy(newfile,src_path)
    }
    script_text_crypt(newfile,1);
    file_rename(newfile,filename_change_ext(newfile,'.smwp'))

    if origin = 1 {
        file_rename(src_path,filename_change_ext(src_path,'.smws'))
    }
}

show_message('Congratulations!!! Scenario file has been created!')
