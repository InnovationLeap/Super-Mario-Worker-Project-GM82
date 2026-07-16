room_caption='Super Mario Worker Project '+global.versiontext


global.aktywowanykuppa=0
global.aktywowanykuppa=0
global.etapkuppa=5
global.przeciwnicyzatrzymani=0
global.pauza=0
global.etappokonany=0

global.auto=0
global.lava=0
global.firstbound=0
global.secondebound=-64
global.water_velocity=1
global.water_delay=0
global.advswitch=1
global.fast_retry=0
global.MFbeet=0
global.celeste=0
global.pipeout=0
global.fastpass=0
global.huddisplay=0
global.rainy=0
global.rainy_record=0
global.fallingstars=0
global.fallingstars_record=0
global.snowy=0
global.snowy_record=0
global.thunder=0
global.thunder_record=0
global.windy=0
global.windy_record=0
global.darkness=0
global.darkness_record=0
global.brightness=0
global.brightness_record=0
global.lightobject='000000000000000000000000000000000000000000000000000000000000000000000'
global.stunblock=0

for(i=0;i<8;i+=1){
    global.yinyang_status[i]=-1;
    global.yinyang_record[i]=-1;
}

global.lava_record=0
global.auto_record=0
//global.sterowanielewo=37
//global.sterowanieprawo=39
//global.sterowanieskok=ord('Z')
//global.sterowaniebieg=ord('X')
//global.sterowaniegora=38
//global.sterowaniedol=40
global.poziomwody=200
global.coins=0
global.efekty=10
global.sample=1
global.glosnosc=1


global.rodzajmaria=0
global.coins=0
global.punkty=0

global.combo1=0
global.combo1reset=0
global.lastlev=0
global.jiami=0
global.toload=''

//select a file to load
while global.toload=''{
    global.toload=get_open_filename('All Supported Formats (.smws;.smwp;.mfs)|*.smws;*.smwp;*.mfs|Super Mario Worker Scenario (.smws)|*.smws|Protected Mario Worker Scenario (.smwp)|*.smwp|Mario Worker Scenario(.mfs)|*.mfs','')
    if global.toload=''{
        global.czup=show_question('Do you want to stop loading a scenario?');global.toload=''
        if global.czup=1{global.zamenowane=1;global.toload='cipas';room_goto(title)}
    }
}

//loading
if global.toload!='' && global.toload!='cipas'{
    room_tile_clear(Play_Room)
    room_instance_clear(Play_Room)

    global.mfsfilename=global.toload

    if filename_ext(global.mfsfilename)='.smwp'{
        global.jiami=1
    }
    //检测是否存在存档文件，若是，则读取存档
    global.loadingsav = false
    if file_exists(filename_change_ext(global.mfsfilename,'.mwsav')) {
        global.loadingsav = show_question('.mwsav file detected. Continue your saved progress?')
        if (global.loadingsav){
            global.mfsfilename = filename_change_ext(global.mfsfilename,'.mwsav');
        }
    }

    //global.mfsxname=working_directory+"\in_qpf.dll"
    //global.mfsxname=filename_change_ext(global.mfsfilename,'.smwsx')

    global.firstlev=1
    global.currentlevel=0
    global.lastlev=0
    room_goto(Another_Level)

    global.przeszedllevel=0
    global.paralax=0
    global.paralax2=0
    global.paralax3=0
}
