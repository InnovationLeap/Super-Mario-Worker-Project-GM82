room_caption='Super Mario Worker Project '+global.versiontext

global.przeciwnicyzatrzymani=0
global.pauza=0
global.paralax=0
global.paralax2=0
global.paralax3=0
global.muzyka=1
global.bgp=1
global.musicon=0

global.lava=0
global.auto=0
global.advswitch=0
global.fast_retry=0
global.firstbound=0
global.secondbound=-64
global.velocity=1
global.water_velocity=1
global.delay=0
global.MFbeet=1
global.celeste=1
global.pipeout=0
global.fastpass=0
global.huddisplay=0
global.rainy=0
global.fallingstars=0
global.snowy=0
global.thunder=0
global.windy=0
global.darkness=0
global.brightness=0
global.lightobject='000000000000000000000000000000000000000000000000000000000000000000000'
global.stunblock=0
//global.sterowanielewo=38
//global.sterowanieprawo=40
//global.sterowanieskok=16
//global.sterowaniebieg=90
//global.sterowaniegora=38
//global.sterowaniedol=40
global.poziomwody=800
global.coins=0
global.efekty=10
global.sample=1
global.glosnosc=1


global.rodzajmaria=0
global.zycia=global.initiallives
global.coins=0
global.punkty=0

global.combo1=0
global.combo1reset=0




global.EDtest=0
global.agspeed=1

global.etapnazwa='Level 1'
global.etapautor=''
global.etapczas=600
global.etapgravity=5
global.etapkuppa=5
global.save=0
global.savename='null'
global.wysokoscwody=1000
global.background=0
global.przeszedllevel=0
global.godmode=0
global.levelsmooth=-1
global.beep=1

if variable_global_exists('testmode'){
if global.testmode=1{
Load_Script_Main()
global.testmode=0
file_delete(global.autosavename)
global.autosavename=global.autosavename1
}}
