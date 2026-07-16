window_set_cursor(cr_default)
room_caption='Super Mario Worker Project '+global.versiontext
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
global.advswitch=0
global.fast_retry=0
global.MFbeet=0
global.celeste=1
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
global.zycia=global.initiallives
global.coins=0
global.punkty=0
global.lastrodzajmaria=0
global.lastzycia=4
global.lastcoins=0
global.lastpunkty=0

global.combo1=0
global.combo1reset=0
global.toload=''

global.toload=''
if !variable_global_exists("autosavename"){
global.autosavename=''
}
if global.autosavename!=''{
global.toload=global.autosavename
}

if global.smwptas {
    global.smwptas = 0;
    global.toload = working_directory + "\smwptas.smwl";

    if !file_exists(global.toload) {
        show_message("SMWP TAS Level File Not Found: " + global.toload);
        global.toload = '';
    }
}

while global.toload=''{
global.toload=get_open_filename('All Supported Formats (.smwl;.mfl)|*.smwl;*.mfl|Super Mario Worker Level (.smwl)|*.smwl|Mario Worker Level(.mfl)|*.mfl','')
if global.toload=''{
global.czup=show_question('Do you want to stop loading a level?');
global.toload=''
if global.czup=1{global.zamenowane=1;global.toload='cipas';room_goto(title)}} else {}
}
if global.toload!='' && global.toload!='cipas'{
room_tile_clear(Play_Room)
room_instance_clear(Play_Room)
Load_Script_Play()
room_instance_add(Play_Room,0,0,o_assist)
file_text_close(global.toload)
global.lastlev=1
room_goto(Play_Room)
global.przeszedllevel=0


global.paralax=0
global.paralax2=0
global.paralax3=0}
