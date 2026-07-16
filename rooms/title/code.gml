global.punkty=0
global.etapnazwa='Test name'
global.przeszedllevel=0

global.background=1
global.muzyka=1
instance_create(0,0,o_edititle)
room_caption='Super Mario Worker Project '+global.versiontext
global.nastawielkosc=1
global.lastlev=0
global.godmode=0
global.checkpoint=0
global.testmode=0
global.autosavename=''
global.checkpassage=0
global.lvlwidth=0
global.lvlheight=0
global.levelsmooth=-1


global.lastrodzajmaria=0
global.lastzycia=4
global.lastcoins=0
global.lastpunkty=0

var i,j;
i=0
j=0
while i<=19 {
while j<=1 {
global.check[i,j]=0
j+=1}
i+=1
}

ds_list_clear(global.autoscrolls)

global.savelvl=0 //用来记录是否开启存档
global.autosavename_record = 'C:\unknown.smwl'
global.beep=1


global.testout= 0
global.xviewtemp = 0
global.yviewtemp = 0

global.smooth_allowed = 1
global.newsmooth = 0

window_set_cursor(cr_default)

global.customMusicDirectory = '.\Data\Custom\'
ini_open('GameSettings.ini')
global.customMusic = ini_read_string('GameConfig','CustomMusicPackage','Example')
music_list_update()
