window_set_cursor(cr_default)
room_caption='Super Mario Worker Project '+global.versiontext
global.supermode=1
global.bowser_phase=0
global.level_bowser_hp=5
global.przeciwnicyzatrzymani=0
global.pauza=0
global.level_complete=0

global.auto=0
global.lava=0
global.firstbound=0
global.secondebound=-64
global.water_velocity=1
global.water_delay=0
global.advswitch=1
global.fast_retry=0
global.topdeath=0
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
global.lightobject='0000000000000000000000000000000000000000000000000000000000000000000000'
global.stunblock=0

for(i=0;i<8;i+=1) {
    global.yinyang_status[i]=-1;
    global.yinyang_record[i]=-1;
}


global.lava_record=0
global.auto_record=0
//global.key_left=37
//global.key_right=39
//global.key_jump=ord('Z')
//global.key_fire=ord('X')
//global.key_up=38
//global.key_down=40
global.water_level=200
global.coins=0
global.efekty=10
global.sample=1
global.game_volume=1


global.rodzajmaria=0
global.zycia=global.initiallives
global.coins=0
global.score=0
global.lastrodzajmaria=0
global.lastzycia=4
global.lastcoins=0
global.last_score=0


global.combo1=0
global.combo1reset=0
global.toload=''

global.toload=''
while global.toload='' {
    global.toload=get_open_filename('Mario Worker Level (.mfl)|*.mfl','')
    if global.toload='' {
        global.stop_choice=show_question('Do you want to stop loading a level?');
        global.toload=''
        if global.stop_choice=1 {global.entered_editor=1;global.toload='cipas';room_goto(title)}} else {}
}
if global.toload!='' && global.toload!='cipas' {
    room_tile_clear(Play_Room2)
    room_instance_clear(Play_Room2)
    Load_Script_Play2()
    room_instance_add(Play_Room2,0,0,o_assist)
    file_text_close(global.toload)
    global.lastlev=1
    room_goto(Play_Room2)
    global.level_cleared=0


    global.parallax=0
    global.paralax2=0
    global.paralax3=0}
