#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//游戏界面的初始化代码在这里


fangka = 0

aktywowanamoza=0
maria=0
sizingus=0
razujy=0
//WTF，这三个是嘛玩意
global.aktywowanykuppa=0 //翻译为“激活库巴”目测是库巴触发相关，设置为否
prawdziwyczas=0 //初始时间设为0
global.paralax=0
global.paralax2=0
global.paralax3=0 //这三个目测滚屏相关，暂不讨论
global.przeszedllevel=0 //是否为过关状态，初始设置为否
prawdziwyczas=global.etapczas //把初始时间设置为关卡时间
wlaczonykuppa=0 //翻译为”启用库巴“，这个是对象变量不是全局变量，暂时不知道在实质作用上和上面那个有何区别
winduje=0  //翻译为”推升“，不明觉厉
gwiazdka=0  //”明星“，继续懵逼
kolor=0  //颜色，啥颜色
nabijanie=0 //”取笑“ WTH……

monetowanie=0 //翻译器炸了
czasor=0 //翻译器炸了×2
czasoren=0//翻译器炸了×3
rork=0//
rork2=0//这两个玩意是用来辅助实现剩余100时间单位的时候时间字体震动的效果

cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0) // 定义字体

nabija=0  //”开玩笑“，和前面那个应该是一个词的不同词性，这就懵逼了
woder=0 //蛤？
chmurkir=0 //蛤？？
windonip=0
//muzyka负责记录音乐序号
    //大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲
    //你们要改音乐的到Scripts -> Music_Play改

            wyjatek=0 // wyjatkowa zmienna poprawiajaca wysokosc gracza do muru, gdy winda na ktorej siedzi gracz ma wiekszy delay Y spadania, ktory spowodowalby wejscie gracza w mur
barkup=0 // pasek energii dla kuppy a dokladnie jego pozycja Y

teleportacja=0
teledelay=0
tele=0

oberwal=0 ; shield=0 ; shieldanim=0; skusil=0
muszlowanie=0 //specjalny delay, tak aby po rozdeptaniu mario nie rozdeptywal ponownie
zdobywanie=0 // specjalny delay czasu przy zdobywaniu bonusow
sizing=0 // grafika powiekszania maria podczas zdobywania bonusow
schylanie=0 // zmienna daj筩a do wiadomosci ze gracz "probuje" sie schylic
image_speed=0
strzelil=0 // dla animacji strzelania
strzelil2=0 // antyrapid fire
animkind=0 // przy zdobywaniu bonusow animacja mario musi wiedziec z jakiego w jakiego sie zamieniac
bugort=0 // zmienna sprawdzajaca czy gracz stojacy w niewidzialnym punkcie chce go podbic
endscoring=0 // Czyli ile punktow dostane za przejscie etapu

fetor=0
fetor2=0

kuku=0
grawitacja=0;
sekwencja=0;
szybkosc=0;

stepor=0
teststep=0
steploop=0
teststep2=0
steploop2=0

looptest3=0
loopstep3=0

animator2=instance_create(0,0,o_mario2)
animator=instance_create(0,0,o_mario)
windor=instance_create(0,0,o_markerwind)
windloop=0
//animator.visible=0
animacja=0
kierunek=0


stepor=0
teststep=0
steploop=0
teststep2=0
steploop2=0

teststep3=0
steploop3=0
efekt1=0


global.step=0
global.roznica=0
wciskaczwodowy=0 // dla plywania w wodzie
wpadldowody=0
plywakanim=0



numerspritea=0
numerklatki=0

animator2.visible=0

if global.checkpoint=0{checkpointdetect=1}else{checkpointdetect=0}

global.etappokonany=0

global.scrollPaused= -1 //强制滚屏开关，可在god中切换

//smwp1.8
global.koopa_activated = 0 //记录是否触发库巴
global.final_koopa_activated = 0 //记录是否触发关底库巴
global.koopa_freeview = 0 //记录触发库巴后是否允许自由滚屏
global.koopa_scroll_count=0 //记录参与滚屏的库巴数目
global.koopa_bgm=''; //记录库巴用bgm
instance_create(0,0,o_textDrawer)

/*for(i=0;i<5;i+=1){
fofo=instance_create(128+32*i,128,o_switch);fofo.color=i
fofo=instance_create(320+32*i,128,o_yinyang);fofo.color=i
fofo=instance_create(320+32*i,256,o_static);
}
fofo=instance_create(640,32,o_shyguy);
fofo=instance_create(128,256,o_waterchanger)
fofo.target = 0
fofo.velocity = 1
fofo.reuse = 1

fofo=instance_create(256,256,o_waterchanger)
fofo.target = 416
fofo.velocity = 1
fofo.reuse = 1*/


/*for(i=0;i<14;i+=1){
instance_create(128+32*i,384,obj_static);
}*/

/*for(i=0;i<29;i+=1){
fofo=instance_create(64*i,384,o_bgmchange);
fofo.visible=1
fofo.bgm=string(4*i+1)
fofo.bgp=i+1
}*/



global.poziomwody=global.water_height_record;
global.muzyka=global.music_record
global.fuck+=1
global.background=global.background_record
global.lava=global.lava_record
global.auto=global.auto_record
// Weather
global.rainy=global.rainy_record
global.fallingstars=global.fallingstars_record
global.snowy=global.snowy_record
global.thunder=global.thunder_record
global.windy=global.windy_record
global.darkness=global.darkness_record
global.brightness=global.brightness_record



Music_Play()
//附加参数，记得最后去掉
/*global.lava=0
global.auto=0
global.advswitch=1
global.fast_retry=0*/

initial_check=0
view_set=0
inedit=0
stuck=0
sound_text=0
orange_recover=0
spring_vx=0
spring_vy=0
spring_settled_x=0
spring_settled_y=0
prev_osc_dx=0
prev_osc_dy=0
//附加参数，记得最后去掉
//global.MFbeet=1
vvvv=mm_get_volume(global.musicplay)
vvvv2=mm_get_volume(global.musicplay2)

global.enablesave=false


//天气 Weather
instance_create(0,0,o_weather);

fofolight = instance_create(x, y, o_lightmarker);

level_start_disable_jump_timer = 0;

// 发光位置微调
light_x = 0;
light_y = -16;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && skusil=0 && global.etappokonany=0 {

if !place_meeting(x,y,o_yinyang){stuck=0}
//global.roznica=x-20
//x-=global.roznica
// SKRUTY
if place_meeting(x,y,o_exiter) && global.rodzajmaria<>5
    {
    tele=instance_place(x,y,o_exiter)
//right
    if tele.wejscie=0 && is_button_pressed('right') && x>tele.x+48 && teleportacja=0 && prawdziwyczas<>0 {teleportacja=1; szybkosc=0; sekwencja=0;if global.sample=1 {fofo=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.glosnosc)} }
//left
    if tele.wejscie=2 && is_button_pressed('left') && x<tele.x+16 && teleportacja=0 && prawdziwyczas<>0{teleportacja=3; szybkosc=0; sekwencja=0;if global.sample=1 {fofo=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.glosnosc)} }
//up
    if global.rodzajmaria=0{
    if tele.wejscie=1 && is_button_pressed('up') && y<tele.y+32 && teleportacja=0 && prawdziwyczas<>0{teleportacja=4; szybkosc=0; sekwencja=0;if global.sample=1 {fofo=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.glosnosc)} }
}
    if global.rodzajmaria<>0{
    if tele.wejscie=1 && is_button_pressed('up') && y<tele.y+64 && teleportacja=0 && prawdziwyczas<>0{teleportacja=4; szybkosc=0; sekwencja=0;if global.sample=1 {fofo=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.glosnosc)} }
}
//down
    if tele.wejscie=3 && is_button_pressed('down') && y>tele.y+16 && teleportacja=0 && prawdziwyczas<>0{teleportacja=5; szybkosc=0; sekwencja=0;if global.sample=1 {fofo=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.glosnosc)} }
    }

if teleportacja<>0 {

if teleportacja=1 && teledelay<32 {teledelay+=0.7; x+=0.7;y=tele.y+64}
if teleportacja=3 && teledelay<32 {teledelay+=0.7; x-=0.7;y=tele.y+64}
if teleportacja=4 && teledelay<32 {teledelay+=0.7; y-=0.7;x=tele.x+32}
if teleportacja=5 && teledelay<32 {teledelay+=0.7; y+=0.7;x=tele.x+32}

if teledelay>=32 && tele.wyjscie=0 {teleportacja=2;test_bound(tele.exitx+64,tele.exity+64); x=tele.exitx+32/* */+16*(global.gameversion>1709); y=tele.exity+64;teledelay=0;if global.sample=1 {fofo=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.glosnosc)}}
if teleportacja=2 && place_meeting(x,y,obj_wall) {x+=0.7;o_marker.kierunek=0}
if teleportacja=2 && !place_meeting(x,y,obj_wall) {teledelay=0; teleportacja=0; if(!global.pipeout)shield=100; sekwencja=0; grawitacja=0}

if teledelay>=32 && tele.wyjscie=1 {teleportacja=20;test_bound(tele.exitx+32,tele.exity);  x=tele.exitx+32; y=tele.exity+32;teledelay=0;if global.sample=1 {fofo=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.glosnosc)}}
if teleportacja=20 && place_meeting(x,y,obj_wall) {y-=0.7}
if teleportacja=20 && !place_meeting(x,y,obj_wall) {teledelay=0; teleportacja=0; if(!global.pipeout)shield=100; sekwencja=0; grawitacja=0}

if teledelay>=32 && tele.wyjscie=2 {teleportacja=30;test_bound(tele.exitx-1,tele.exity+64);  x=tele.exitx/* */+16*(global.gameversion>1709); y=tele.exity+64;teledelay=0;if global.sample=1 {fofo=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.glosnosc)}}
if teleportacja=30 && place_meeting(x,y,obj_wall) {x-=0.7;o_marker.kierunek=1}
if teleportacja=30 && !place_meeting(x,y,obj_wall) {teledelay=0; teleportacja=0; if(!global.pipeout)shield=100; sekwencja=0; grawitacja=0}

if teledelay>=32 && tele.wyjscie=3 {teleportacja=40;test_bound(tele.exitx+32,tele.exity+65);  x=tele.exitx+32; y=tele.exity+64;teledelay=0;if global.sample=1 {fofo=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.glosnosc)}}
if teleportacja=40 && place_meeting(x,y,obj_wall) {y+=0.7}
if teleportacja=40 && !place_meeting(x,y,obj_wall) {if animator.sprite_index=s_bigmariocrouch {y=y+32} teledelay=0; teleportacja=0; if(!global.pipeout)shield=100; sekwencja=0; grawitacja=0}
}


//exitx=110 //- pozycja x exita
//exity=110 //- pozycja y exita
//wejscie=0 //- k箃 pod jakim sie wchodzi
//wyjscie=0 //- k箃 pod jakim si?wychodzi
//
if fetor<>x {fetor2=fetor-x; fetor=x}




// SCHYLANIE

if teleportacja=0 {
if global.modifiedmov=1 {
if is_button_pressed('down') && sekwencja=0 && schylanie=0 && !global.rodzajmaria=0 && huadun=0 { uabfx=x }
if is_button_pressed('down') && sekwencja=0 && !global.rodzajmaria=0 && huadun=0 {schylanie=1 ; image_index=0 }
if !is_button_pressed('down') && !global.rodzajmaria=0 && schylanie = 1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas))  { huadun = 1 }
if !is_button_pressed('down') && !global.rodzajmaria=0 && schylanie = 1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas))  { huadun = 2 }
if !is_button_pressed('down') && !global.rodzajmaria=0 {schylanie=0 ; image_index=1}
if global.rodzajmaria=0 {schylanie=0 ; image_index=0}
} else {
if is_button_pressed('down') && sekwencja=0 && !global.rodzajmaria=0 {schylanie=1}
//if !is_button_pressed('down') && !global.rodzajmaria=0 && schylanie = 1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { huadun = 1 }
if !is_button_pressed('down') && !global.rodzajmaria=0 {schylanie=0}
if global.rodzajmaria=0 {schylanie=0}
}

if place_meeting(x,y+1,obj_wall) {
    fofo=instance_place(x,y+1,obj_wall);
    if ice_effect>0 && object_get_name(fofo.object_index)<>'o_ice'{
        ice_effect=0;
    }
    if ice_effect=0 && object_get_name(fofo.object_index)='o_ice'{
        ice_effect=0.2;
        if(y>=global.poziomwody){szybkosc=0}
    }
}
else if y>=global.poziomwody{ice_effect=0;}

if (place_meeting(x,y+1,o_windas) || place_meeting(x,y+1,o_pointblock)) {ice_effect=0}

// WPADANIE DO WODY

if wpadldowody=1 && (y<global.poziomwody || global.lava) && global.rodzajmaria<>5 {wpadldowody=0}
if wpadldowody=0 && (y>=global.poziomwody && !global.lava) && global.rodzajmaria<>5 {wpadldowody=1; grawitacja=0}

// CHODZENIE I BIEGANIE

if (global.lava || y<global.poziomwody) && global.rodzajmaria<>5
{
if is_button_pressed('right') && !is_button_pressed('run') && szybkosc<3 && schylanie=0 && huadun=0 && !stuck  {szybkosc+=0.1-0.25*ice_effect}
if is_button_pressed('left') && !is_button_pressed('run') && szybkosc>-3 && schylanie=0 && huadun=0 && !stuck  {szybkosc-=0.1-0.25*ice_effect}

if is_button_pressed('right') && is_button_pressed('run') && schylanie=0 && huadun=0 && !stuck  {szybkosc+=0.3-ice_effect}
if is_button_pressed('left') && is_button_pressed('run') && schylanie=0 && huadun=0 && !stuck  {szybkosc-=0.3-ice_effect}

if szybkosc>8 szybkosc=8
if szybkosc<-8 szybkosc=-8
}

if !global.lava && y>=global.poziomwody && global.rodzajmaria<>5
{
if is_button_pressed('right') && !is_button_pressed('run') && szybkosc<1 && schylanie=0 && huadun=0 && ice_effect=0 && !stuck  {szybkosc+=0.05}
if is_button_pressed('left') && !is_button_pressed('run') && szybkosc>-1 && schylanie=0 && huadun=0 && ice_effect=0 && !stuck  {szybkosc-=0.05}

if is_button_pressed('right') && is_button_pressed('run') && schylanie=0 && huadun=0 && ice_effect=0 && !stuck  {szybkosc+=0.05}
if is_button_pressed('left') && is_button_pressed('run') && schylanie=0 && huadun=0 && ice_effect=0 && !stuck   {szybkosc-=0.05}

if szybkosc>3 szybkosc=3
if szybkosc<-3 szybkosc=-3
}
//穿墙强制静止
if global.aktywowanykuppa>=2 {
    if ds_list_find_index(global.autoscrolls,firstscroll) < ds_list_size(global.autoscrolls) - 2{
        if x<view_xview[0]+16 && szybkosc<0{szybkosc=0}
        if x>view_xview[0]+624 && szybkosc>0{szybkosc=0}
    }
}

if szybkosc>-0.04 && szybkosc<0.04 {szybkosc=0}

if ((!is_button_pressed('right') && !is_button_pressed('left')) || schylanie=1) && (y<global.poziomwody || global.lava) && !stuck {szybkosc=szybkosc/1.05}
if ((!is_button_pressed('right') && !is_button_pressed('left')) || schylanie=1) && (y>=global.poziomwody && !global.lava) && !stuck {szybkosc=szybkosc/1.03}

//这里是横向碰撞判定，注意代码顺序调整

if global.modifiedmov=1 && global.rodzajmaria != 5{
//然而还需要考虑滑蹲的问题
if huadun = 0 && !stuck  {
  var nextx;
  nextx = x+szybkosc
  if szybkosc != 0 && x>=view_xview[0]+16 && x<=view_xview[0]+624 && (place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) && global.rodzajmaria != 5 && teststep3=0 { teststep3 = 1;}
  while teststep3 = 1{
    if (place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) { nextx -= sign(szybkosc);looplimit+=1; }
    else { teststep3 = 0 ; x = nextx; looplimit=0; }
    if looplimit>=16{teststep3=0; stuck=1;looplimit=0;}
    }
  var nextx2;
  nextx2 = x+wxspeed
  if wxspeed != 0 && x>=view_xview[0]+16 && x<=view_xview[0]+624 && (place_meeting(nextx2,y,obj_wall) || place_meeting(nextx2,y,o_pointblock)) && global.rodzajmaria != 5 && teststep233=0 { teststep233 = 1; }
  while teststep233 = 1 {
    if (place_meeting(nextx2,y,obj_wall) || place_meeting(nextx2,y,o_pointblock)) { nextx2 -= sign(wxspeed);looplimit+=1; }
    else { teststep233 = 0 ; x = nextx2;looplimit=0; }
    if looplimit>=16{teststep233=0; stuck=1;fuckstuck=1;looplimit=0;}
    }
} else if huadun=1 {
   if uabff=0 { if x<uabfx { uabf=1 } else { uabf=-1 }; uabff=1 }
   if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {szybkosc=0 ; x+=uabf } else { huadun = 0;uabff=0;uabf=0 }
} else if huadun=2 { if !(place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) { huadun=0;uabff=0;uabf=0 } }


}

if global.modifiedmov=0 {
if global.aktywowanykuppa<=1{
if szybkosc>0 && x<view_xview[0]+624 {x+=szybkosc}
if szybkosc<0 && x>view_xview[0]+16 {x+=szybkosc}
}else{
if szybkosc<>0 {x+=szybkosc}
}
} else {
  var nextx;
  nextx = x+szybkosc
  if global.aktywowanykuppa<=1{
  if szybkosc>0 && x<view_xview[0]+624 && !(place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock))  {x+=szybkosc}
  if szybkosc<0 && x>view_xview[0]+16 && !(place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) {x+=szybkosc}
  }else{
  if szybkosc>0 && !(place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock))  {x+=szybkosc}
  if szybkosc<0 && !(place_meeting(nextx,y,obj_wall) || place_meeting(nextx,y,o_pointblock)) {x+=szybkosc}
  }}
if global.rodzajmaria=5 && szybkosc<>0 {szybkosc=0}

/*
if szybkosc>0 {

// testowanie stepa "dolnego" - schodzenie z g髍ki

if !place_meeting(x,y+1,obj_wall) && grawitacja=0 {sekwencja=1; teststep=1}
while teststep=1 && place_meeting(x,y+10+szybkosc,obj_wall) && steploop<10+szybkosc
{steploop+=1; if place_meeting(x,y+steploop,obj_wall) {y+=steploop-1; teststep=0; steploop=0; sekwencja=0}}
if teststep=1 && !place_meeting(x,y+10+szybkosc,obj_wall) {teststep=0; testloop=0}

// testowanie stepa "gornego" - wchodzenie pod g髍k?
if grawitacja=0 && place_meeting(x,y,obj_wall) && !place_meeting(x,y-3-szybkosc,obj_wall) && sekwencja=0 && teststep2=0 {teststep2=1}
while teststep2=1 && steploop2<3+szybkosc {steploop2+=1; if !place_meeting(x,y-steploop2,obj_wall) {y-=steploop2; steploop2=0; teststep2=0}}
}

if szybkosc<0
{

if !place_meeting(x,y+1,obj_wall) && grawitacja=0 {sekwencja=1; teststep=1}
while teststep=1 && place_meeting(x,y+10+szybkosc,obj_wall) && steploop<10+szybkosc
{steploop+=1; if place_meeting(x,y+steploop,obj_wall){y+=steploop-1; teststep=0; steploop=0; sekwencja=0}}
if teststep=1 && !place_meeting(x,y+10+szybkosc,obj_wall) {teststep=0; testloop=0}


// testowanie stepa "gornego" - wchodzenie pod g髍k?
if grawitacja=0 && place_meeting(x,y,obj_wall) && !place_meeting(x,y-(3+szybkosc*-1),obj_wall) && sekwencja=0 && teststep2=0 {teststep2=1;}
while teststep2=1 && steploop2<3+szybkosc*-1 {steploop2+=1; if !place_meeting(x,y-steploop2,obj_wall) {y-=steploop2; steploop2=0; teststep2=0}}

}
*/

// poprawianie pozycji X - tak aby gracz nie wbijal sie w bloki

if global.modifiedmov=0 {
if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock))&& teststep3=0 && szybkosc>0 && global.rodzajmaria<>5 {teststep3=1; steploop3=round(szybkosc)}
while teststep3=1 {if (place_meeting(x+steploop3,y,obj_wall) || place_meeting(x+steploop3,y,o_pointblock)) {steploop3-=1;} if !place_meeting(x+steploop3,y,obj_wall) && !place_meeting(x+steploop3,y,o_pointblock) {teststep3=0; x+=steploop3}}

// poprawianie pozycji X - tak aby gracz nie wbijal sie w bloki
if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock))&& teststep3=0 && szybkosc<0 && global.rodzajmaria<>5 {teststep3=1; steploop3=szybkosc}
while teststep3=1 {if (place_meeting(x+steploop3,y,obj_wall) || place_meeting(x+steploop3,y,o_pointblock)) {steploop3+=1;} if !place_meeting(x+steploop3,y,obj_wall) && !place_meeting(x+steploop3,y,o_pointblock) {teststep3=0; x+=steploop3}}
}


// spadanie i skakanie

if global.rodzajmaria<>3 && global.rodzajmaria<>5 {
if is_button_pressed('jump') && sekwencja=0 && (y<global.poziomwody || global.lava) && schylanie=0 && huadun=0 && !stuck
{sekwencja=1; grawitacja=-(8+abs(szybkosc)/5); if global.sample=1 {fofo=sound_play(snd_jump);sound_volume(snd_jump,global.glosnosc)}};}
if global.rodzajmaria=3 && global.rodzajmaria<>5 {
if is_button_pressed('jump') && sekwencja=0 && (y<global.poziomwody || global.lava) && schylanie=0 && huadun=0 && !stuck
{sekwencja=1; grawitacja=-(9+abs(szybkosc)/5); if global.sample=1 {fofo=sound_play(snd_jump);sound_volume(snd_jump,global.glosnosc)}};}

if is_button_pressed('jump') && y>=global.poziomwody && !global.lava && wciskaczwodowy=0 && y>global.poziomwody+32 && schylanie=0 && huadun=0 && global.rodzajmaria<>5 && !stuck
{if global.sample=1 {fofo=sound_play(snd_plywak);sound_volume(snd_plywak,global.glosnosc)};plywakanim=0; sekwencja=1; grawitacja=-(4+abs(szybkosc)/10);  wciskaczwodowy=1};
if !global.lava && is_button_pressed('jump') && y>=global.poziomwody && !global.lava && wciskaczwodowy=0 && y<=global.poziomwody+32 && schylanie=0 && huadun=0 && global.rodzajmaria<>5 && !stuck
{if global.sample=1 {fofo=sound_play(snd_plywak);sound_volume(snd_plywak,global.glosnosc)};sekwencja=1; grawitacja=-(6+abs(szybkosc)/5); wciskaczwodowy=1};
if !is_button_pressed('jump') {wciskaczwodowy=0}

kuku+=1
if is_button_pressed('jump') && kuku>1 && grawitacja<0 && (y<global.poziomwody || global.lava) && global.rodzajmaria<>5 && !stuck {grawitacja-=1.5; kuku=0};

if sekwencja=0 &&  global.rodzajmaria<>5 && !place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,o_pointblock) && !place_meeting(x,y+2,o_windas) {sekwencja=1}
if global.modifiedmov=0 && sekwencja=1 && grawitacja<0 && global.rodzajmaria<>5 {y+=grawitacja+global.etapgravity/5; testujstepa=0}

// Bugort - tlumaczenie w Create Actions
// who can tell me wtf is this

if bugort=0 && place_meeting(x,y-8,o_pointblock2) && sekwencja=0 && global.rodzajmaria<>5 {bugort=1}
if bugort=0 && place_meeting(x,y-8,o_pointblock2) && sekwencja=0 && global.rodzajmaria<>5 {bugort=1}

// podbijanie punktu

if place_meeting(x,y-8,o_pointblock) && grawitacja<0 && global.rodzajmaria<>5
{lolo=instance_place(x,y-8,o_pointblock); lolo.podbity=1; grawitacja=0}
if place_meeting(x,y-8,o_pointblockpodbijacz) && grawitacja<0 && global.rodzajmaria<>5
{lolo=instance_place(x,y-8,o_pointblockpodbijacz); if(!lolo.podbity){lolo.podbity=1;} grawitacja=0 }

if global.modifiedmov=0 {
if place_meeting(x,y-8,o_pointblock2) && grawitacja<0 && global.rodzajmaria<>5
{lolo=instance_place(x,y-8,o_pointblock2); lolo.podbity=1; grawitacja=0 y+=4}
}

//喝了这里负责的是顶头（原版代码）

if global.modifiedmov=0 {

if (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) && grawitacja<0 && global.rodzajmaria<>5 {looptest3=1; grawitacja=0}
{while looptest3=1 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y+=1};} looptest3=0
}


if global.modifiedmov=1 {
 if huadun = 0  && !stuck {
  if (grawitacja+global.etapgravity/5) < 0 && sekwencja=1{
  var nexty;
  nexty = y+grawitacja+global.etapgravity/5
  if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) && global.rodzajmaria<>5 { looptest3=1; }
  while looptest3=1 {
    if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) { nexty+=1; looplimit+=1; }
    else { y=nexty ; looptest3=0 ; grawitacja=0;looplimit=0;
//负引力的处理
           if (global.etapgravity/5)>-13 && (global.etapgravity/5)<0 && abs(global.etapgravity/5) > grawitacja { grawitacja=abs(global.etapgravity/5) }
         }
    if looplimit>=16{looptest3=0; stuck=1;looplimit=0;}
  }
  }
  if wyspeed < 0 && grawitacja = 0{
  var nexty2;
  nexty2 = y+wyspeed
  if (place_meeting(x,nexty2,obj_wall) || place_meeting(x,nexty2,o_pointblock)) && global.rodzajmaria<>5 { looptest233=1;}
  while looptest233=1 {
    if (place_meeting(x,nexty2,obj_wall) || place_meeting(x,nexty2,o_pointblock)) { nexty2+=1;looplimit+=1; }
    else { y=nexty2 ; looptest233=0 ; grawitacja=0;looplimit=0; }
    if looplimit>=16{looptest233=0; stuck=1;looplimit=0;}
  }
  }

  if (grawitacja+global.etapgravity/5+wyspeed) > 0 && sekwencja=1{
  var nexty;
  nexty = y+grawitacja+global.etapgravity/5
  if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) && global.rodzajmaria<>5 { looptest3=2;}
  while looptest3=2 {
    if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) { nexty-=1;looplimit+=1; }
    else { y=nexty ; looptest3=0 ; grawitacja=0 ; sekwencja=0;looplimit=0;}
    if looplimit>=16{looptest3=0; stuck=1;looplimit=0;}
  }
  }
  if wyspeed > 0 && grawitacja = 0 {
  var nexty2;
  nexty2 = y+wyspeed
  if (place_meeting(x,nexty2,obj_wall) || place_meeting(x,nexty2,o_pointblock)) && global.rodzajmaria<>5 { looptest233=1;}
  while looptest233=1 {
    if (place_meeting(x,nexty2,obj_wall) || place_meeting(x,nexty2,o_pointblock)) { nexty2-=1;looplimit+=1; }
    else { y=nexty2 ; looptest233=0 ; grawitacja=0;looplimit=0; }
    if looplimit>=16{looptest233=0; stuck=1; looplimit=0;}
  }
  }
 } else if huadun=2 {
  var nexty;
  nexty = y
  if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) && global.rodzajmaria<>5 { looptest3=1 }
  while looptest3=1 {
    if (place_meeting(x,nexty,obj_wall) || place_meeting(x,nexty,o_pointblock)) { nexty+=1 }
else { y=nexty ; looptest3=0 ; grawitacja=0
//负引力的处理
if (global.etapgravity/5)>-13 && (global.etapgravity/5)<0 && abs(global.etapgravity/5) > grawitacja { grawitacja=abs(global.etapgravity/5) }
}
  }
 }
}

if global.modifiedmov=1 {
//新版顶隐藏砖，仅在马里奥顶部撞到隐藏砖底部生效
  if grawitacja<0 && instance_place(x,y+grawitacja,o_pointblock2) {
    var bump;
    bump=instance_place(x,y+grawitacja,o_pointblock2)
    var height;
    if global.rodzajmaria=0 { height=24 } else { height=48 }
    if y >= bump.y+32+height && bump.podbity=0 {
if (global.etapgravity/5)>-13 && (global.etapgravity/5)<0 && abs(global.etapgravity/5) > grawitacja { grawitacja=abs(global.etapgravity/5) } else { grawitacja=0 }
bump.podbity=1
}
  }
}

//移动桥相关
if sekwencja<>0 {winduje=0}


if grawitacja=0 && sekwencja=0 && !place_meeting(x,y-2,o_windas) && global.rodzajmaria<>5 // Lapanie windy, gdy mario stoi w miejscu
    {
    o_marker.y=round(o_marker.y)
    windor.x=x
    windor.y=y
    with(windor)
        {
        if place_meeting(x,y+2,o_windas) && (place_meeting(x,y+o_marker.windloop,o_pointblock) && global.rodzajmaria<>5 || place_meeting(x,y+o_marker.windloop,obj_wall)) && global.rodzajmaria<>5 && !other.stuck
                {
                getwind=instance_place(x,y+o_marker.windloop,o_windas)
                o_marker.y=getwind.y
                o_marker.grawitacja=0
                o_marker.sekwencja=0
                o_marker.windloop=ceil(o_marker.grawitacja+1)
                o_marker.winduje=getwind
                }
        }

    }

if grawitacja>0 && !place_meeting(x,y-2,o_windas) && global.rodzajmaria<>5 // Lapanie windy
    {
    o_marker.y=round(o_marker.y)
    windor.x=x
    windor.y=y
    with(windor)
        {

        while o_marker.windloop<ceil(o_marker.grawitacja+1)
            {
            if place_meeting(x,y+o_marker.windloop,o_windas) && !place_meeting(x,y+o_marker.windloop,o_pointblock) && !place_meeting(x,y+o_marker.windloop,obj_wall) && global.rodzajmaria<>5 && !other.stuck
                {
                getwind=instance_place(x,y+o_marker.windloop,o_windas)
                o_marker.y=getwind.y
                o_marker.grawitacja=0
                o_marker.sekwencja=0
                o_marker.windloop=ceil(o_marker.grawitacja+1)
                o_marker.winduje=getwind
                }
            o_marker.windloop+=1
            }
        }
    windloop=0
    }
if grawitacja=0 && place_meeting(x,y-2,o_windas) && (place_meeting(x,y-1,obj_wall) && global.rodzajmaria<>5 || place_meeting(x,y-1,o_pointblock)) && global.rodzajmaria<>5 {grawitacja=0; sekwencja=1}


if sekwencja=1 && !stuck //dodawaj do Y wspolczynnik grawitacji
    {
    if grawitacja>=0 && global.modifiedmov=0 {y+=grawitacja+global.etapgravity/5}
if global.modifiedmov=1 {
var nexty3;
nexty3 = y+grawitacja+global.etapgravity/5
if !(place_meeting(x,nexty3,obj_wall) || place_meeting(x,nexty3,o_pointblock)) {
y+=grawitacja+global.etapgravity/5  }
}
    if (y<global.poziomwody || global.lava) {grawitacja+=1}
    if y>=global.poziomwody && !global.lava {grawitacja+=0.2}

    if (y<global.poziomwody || global.lava) && grawitacja>13 {grawitacja=13}
    if y>=global.poziomwody && !global.lava && grawitacja>6 {grawitacja=6}
    }

if global.modifiedmov=0 {

if sekwencja=1 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) && grawitacja>0 {sekwencja=2; grawitacja=0};

while sekwencja=2 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock) )  {y-=1;};

if sekwencja=2 && (!place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock)) {sekwencja=0};

}

if global.rodzajmaria=5 {
grawitacja=0
sekwencja=0
if keyboard_check(global.sterowanieprawo) { x += 8; }
if keyboard_check(global.sterowanielewo) { x -= 8; }
if keyboard_check(global.sterowaniegora) { y -= 8; }
if keyboard_check(global.sterowaniedol) { y += 8; }
}

//god模式中的CP跳转
if global.godmode=1 {

if keyboard_check_released(vk_pageup){
global.checkpointa=global.checkpoint+1
o_checkpoint.kk=1
}

if keyboard_check_released(vk_pagedown){
global.checkpointa=global.checkpoint-1
o_checkpoint.kk=1
}
}

wxspeed=0
wyspeed=0

//尝试性修复非整格实心穿墙
if (szybkosc = 0)
x = round(x);
if (grawitacja = 0)
y = round(y);

}}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && skusil=0 && global.etappokonany=0 {


//定义一系列全局变量作为玩家的皮肤
global.skin = 0

global.character_name = 'MARIO '

global.character_dead = s_skuszak

global.small_character_run = s_smallmariorun
global.small_character_jump = s_smallmariojump
global.small_character_swim = s_smallmarioswim

global.big_character_run = s_bigmariorun
global.big_character_jump = s_bigmariojump
global.big_character_swim = s_bigmarioswim
global.big_character_crouch = s_bigmariocrouch

global.fire_character_run = s_firemariorun
global.fire_character_jump = s_firemariojump
global.fire_character_swim = s_firemarioswim
global.fire_character_crouch = s_firemariocrouch
global.fire_character_shoot = s_firemarioshot

global.lui_character_run = s_luimariorun
global.lui_character_jump = s_luimariojump
global.lui_character_swim = s_luimarioswim
global.lui_character_crouch = s_luimariocrouch

global.beetroot_character_run = s_burakmariorun
global.beetroot_character_jump = s_burakmariojump
global.beetroot_character_swim = s_burakmarioswim
global.beetroot_character_crouch = s_burakmariocrouch
global.beetroot_character_shoot = s_burakmarioshot

//马里奥皮肤
if global.skin = 0 {
    global.character_name = 'MARIO '

    global.character_dead = s_skuszak

    global.small_character_run = s_smallmariorun
    global.small_character_jump = s_smallmariojump
    global.small_character_swim = s_smallmarioswim

    global.big_character_run = s_bigmariorun
    global.big_character_jump = s_bigmariojump
    global.big_character_swim = s_bigmarioswim
    global.big_character_crouch = s_bigmariocrouch

    global.fire_character_run = s_firemariorun
    global.fire_character_jump = s_firemariojump
    global.fire_character_swim = s_firemarioswim
    global.fire_character_crouch = s_firemariocrouch
    global.fire_character_shoot = s_firemarioshot

    global.lui_character_run = s_luimariorun
    global.lui_character_jump = s_luimariojump
    global.lui_character_swim = s_luimarioswim
    global.lui_character_crouch = s_luimariocrouch

    global.beetroot_character_run = s_burakmariorun
    global.beetroot_character_jump = s_burakmariojump
    global.beetroot_character_swim = s_burakmarioswim
    global.beetroot_character_crouch = s_burakmariocrouch
    global.beetroot_character_shoot = s_burakmarioshot
}

//WEEGEE皮肤
if global.skin = 1 {
    global.character_name = 'LUIGI '

    global.character_dead = s_skuszak_luigi

    global.small_character_run = s_smallluigirun
    global.small_character_jump = s_smallluigijump
    global.small_character_swim = s_smallluigiswim

    global.big_character_run = s_bigluigirun
    global.big_character_jump = s_bigluigijump
    global.big_character_swim = s_bigluigiswim
    global.big_character_crouch = s_bigluigicrouch

    global.fire_character_run = s_fireluigirun
    global.fire_character_jump = s_fireluigijump
    global.fire_character_swim = s_fireluigiswim
    global.fire_character_crouch = s_fireluigicrouch
    global.fire_character_shoot = s_fireluigishot

    global.lui_character_run = s_luiluigirun
    global.lui_character_jump = s_luiluigijump
    global.lui_character_swim = s_luiluigiswim
    global.lui_character_crouch = s_luiluigicrouch

    global.beetroot_character_run = s_burakluigirun
    global.beetroot_character_jump = s_burakluigijump
    global.beetroot_character_swim = s_burakluigiswim
    global.beetroot_character_crouch = s_burakluigicrouch
    global.beetroot_character_shoot = s_burakluigishot
}


//下面是与马里奥状态相关的代码
//godmode
if global.rodzajmaria<>5 && maria<>global.rodzajmaria {maria=global.rodzajmaria}
if global.godmode=1{
if keyboard_check(ord('1')){global.rodzajmaria=0;gwiazdka=0;shield=0} //小个子
if keyboard_check(ord('2')){if global.modifiedmov=1 && global.rodzajmaria=0 && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { huadun = 1 };if global.modifiedmov=1 && global.rodzajmaria=0 && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { huadun = 2 };global.rodzajmaria=1;gwiazdka=0;shield=0} //大个子
if keyboard_check(ord('3')){if global.modifiedmov=1 && global.rodzajmaria=0 && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { huadun = 1 };if global.modifiedmov=1 && global.rodzajmaria=0 && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { huadun = 2 };global.rodzajmaria=2;gwiazdka=0;shield=0} //花身
if keyboard_check(ord('4')){if global.modifiedmov=1 && global.rodzajmaria=0 && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { huadun = 1 };if global.modifiedmov=1 && global.rodzajmaria=0 && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { huadun = 2 };global.rodzajmaria=4;gwiazdka=0;shield=0} //绿果（为啥甜菜在绿果后面……）
if keyboard_check(ord('5')){if global.modifiedmov=1 && global.rodzajmaria=0 && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { huadun = 1 };if global.modifiedmov=1 && global.rodzajmaria=0 && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { huadun = 2 };global.rodzajmaria=3;gwiazdka=0;shield=0} //甜菜
if keyboard_check(ord('6')){global.rodzajmaria=maria
gwiazdka=500
    animator2.visible=1
 }
if keyboard_check(ord('7')){global.rodzajmaria=maria;shield=10000000;gwiazdka=0}
if keyboard_check_pressed(ord('8')){if global.rodzajmaria<>5{global.rodzajmaria=5} else{global.rodzajmaria=maria}}
if keyboard_check_pressed(ord('9')){
    if global.zycia < 99{
    fifi=instance_create(x,y-32,o_punkciornik3)
    fifi.image_index=6
    if global.sample=1 {
    fofo=sound_play(snd_1up);
    sound_volume(snd_1up,global.glosnosc)
    }
    //lobal.zycia+=1
    }}
if keyboard_check_pressed(ord('0')){ global.scrollPaused *= -1 } //按0切换滚屏开关
if global.scrollPaused = 1 && keyboard_check_pressed(vk_backspace) {global.aktywowanykuppa=0}
}

// MALY MARIO：小马里奥
if global.rodzajmaria=0 { //rodazajmaria用来记录马里奥状态，对应表见上。
if y<global.poziomwody || global.lava //poziomwody记录水面高度，下面的代码为马里奥在水面上方的动画代码
{image_index=0

if szybkosc<0 {kierunek=1}//kierunek记录马里奥朝向，1为右，0为左
if szybkosc>0 {kierunek=0}

if szybkosc=0 && sekwencja=0 && kierunek=0 {animator.sprite_index=global.small_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0}
if szybkosc=0 && sekwencja=0 && kierunek=1 {animator.sprite_index=global.small_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0}//image_xscale=-1表示把图像反向

if szybkosc>0 && kierunek=0 && sekwencja=0 {animator.sprite_index=global.small_character_run; animator.image_index+=szybkosc/10; animator.image_xscale=1; animkind=0}
if szybkosc<0 && kierunek=1 && sekwencja=0 {animator.sprite_index=global.small_character_run; animator.image_index+=szybkosc/10; animator.image_xscale=-1; animkind=0}

if kierunek=0 && grawitacja<>0 {animator.sprite_index=global.small_character_jump; animator.image_xscale=1;animkind=1} //grawitacja记录“重力状况”，也就是是否在空中（因为在地面上相当于“重力”为0）
if kierunek=1 && grawitacja<>0 {animator.sprite_index=global.small_character_jump; animator.image_xscale=-1;animkind=1}

}

if y>=global.poziomwody && !global.lava//poziomwody记录水面高度，下面的代码为马里奥在水面下方的动画代码
{image_index=0

if szybkosc<0 {kierunek=1}//szybkosc记录水平速度状态，0为静止，向左为正
if szybkosc>0 {kierunek=0}

if szybkosc=0 && sekwencja=0 && kierunek=0 {animator.sprite_index=global.small_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0 }
if szybkosc=0 && sekwencja=0 && kierunek=1 {animator.sprite_index=global.small_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0 }

if szybkosc>0 && kierunek=0 && sekwencja=0 {animator.sprite_index=global.small_character_run; animator.image_index+=szybkosc/20; animator.image_xscale=1; animkind=0}//image_index表示帧数，通过马里奥运动速度来控制帧的切换速度
if szybkosc<0 && kierunek=1 && sekwencja=0 {animator.sprite_index=global.small_character_run; animator.image_index+=szybkosc/20; animator.image_xscale=-1; animkind=0}

if kierunek=0 && grawitacja<>0 {animator.sprite_index=global.small_character_swim; animator.image_index=plywakanim; animator.image_xscale=1;animkind=2}
if kierunek=1 && grawitacja<>0 {animator.sprite_index=global.small_character_swim; animator.image_index=plywakanim; animator.image_xscale=-1;animkind=2}
if plywakanim<9 {plywakanim+=0.2}


if global.efekty>5 {lolo=instance_create(x,y,o_marioeffektor); lolo.sprite_index=animator.sprite_index; lolo.image_index=animator.image_index; lolo.image_speed=0;lolo.image_xscale=animator.image_xscale}


}}



// DUZY MARIO
if global.rodzajmaria=1 {
if y<global.poziomwody || global.lava
{

if szybkosc<0 {kierunek=1}
if szybkosc>0 {kierunek=0}

if szybkosc=0 && sekwencja=0 && kierunek=0 {animator.sprite_index=global.big_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0}
if szybkosc=0 && sekwencja=0 && kierunek=1 {animator.sprite_index=global.big_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0}

if szybkosc>0 && kierunek=0 && sekwencja=0 {animator.sprite_index=global.big_character_run; animator.image_index+=szybkosc/10; animator.image_xscale=1; animkind=0}
if szybkosc<0 && kierunek=1 && sekwencja=0 {animator.sprite_index=global.big_character_run; animator.image_index+=szybkosc/10; animator.image_xscale=-1; animkind=0}

if kierunek=0 && grawitacja<>0 {animator.sprite_index=global.big_character_jump; animator.image_xscale=1;animkind=1}
if kierunek=1 && grawitacja<>0 {animator.sprite_index=global.big_character_jump; animator.image_xscale=-1;animkind=1}

if schylanie=1 && kierunek=0 {animator.sprite_index=global.big_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
if schylanie=1 && kierunek=1 {animator.sprite_index=global.big_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
if !schylanie=1 {image_index=1}
}

if y>=global.poziomwody && !global.lava
{

if szybkosc<0 {kierunek=1}
if szybkosc>0 {kierunek=0}

if szybkosc=0 && sekwencja=0 && kierunek=0 {animator.sprite_index=global.big_character_run; animator.image_index=0; animator.image_xscale=1 ; animkind=0}
if szybkosc=0 && sekwencja=0 && kierunek=1 {animator.sprite_index=global.big_character_run; animator.image_index=0; animator.image_xscale=-1 ; animkind=0}

if szybkosc>0 && kierunek=0 && sekwencja=0 {animator.sprite_index=global.big_character_run; animator.image_index+=szybkosc/20; animator.image_xscale=1; animkind=0 }
if szybkosc<0 && kierunek=1 && sekwencja=0 {animator.sprite_index=global.big_character_run; animator.image_index+=szybkosc/20; animator.image_xscale=-1; animkind=0 }

if kierunek=0 && grawitacja<>0 {animator.sprite_index=global.big_character_swim; animator.image_index=plywakanim; animator.image_xscale=1;animkind=2}
if kierunek=1 && grawitacja<>0 {animator.sprite_index=global.big_character_swim; animator.image_index=plywakanim; animator.image_xscale=-1;animkind=2}
if plywakanim<9 {plywakanim+=0.2}

if schylanie=1 && kierunek=0 {animator.sprite_index=global.big_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
if schylanie=1 && kierunek=1 {animator.sprite_index=global.big_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
if !schylanie=1 {image_index=1}

if global.efekty>5 {lolo=instance_create(x,y,o_marioeffektor); lolo.sprite_index=animator.sprite_index; lolo.image_index=animator.image_index; lolo.image_speed=0;lolo.image_xscale=animator.image_xscale}


}}


// FIRE MARIO
if global.rodzajmaria=2 {
if y<global.poziomwody || global.lava
{

if szybkosc<0 {kierunek=1}
if szybkosc>0 {kierunek=0}

if szybkosc=0 && sekwencja=0 && kierunek=0 && strzelil=0 {animator.sprite_index=global.fire_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0}
if szybkosc=0 && sekwencja=0 && kierunek=1 && strzelil=0 {animator.sprite_index=global.fire_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0}

if szybkosc>0 && kierunek=0 && sekwencja=0 && strzelil=0 {animator.sprite_index=global.fire_character_run; animator.image_index+=szybkosc/10; animator.image_xscale=1; animkind=0}
if szybkosc<0 && kierunek=1 && sekwencja=0 && strzelil=0 {animator.sprite_index=global.fire_character_run; animator.image_index+=szybkosc/10; animator.image_xscale=-1; animkind=0}

if kierunek=0 && grawitacja<>0 {animator.sprite_index=global.fire_character_jump; animator.image_xscale=1;animkind=1}
if kierunek=1 && grawitacja<>0 {animator.sprite_index=global.fire_character_jump; animator.image_xscale=-1;animkind=1}

if schylanie=1 && kierunek=0 {animator.sprite_index=global.fire_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
if schylanie=1 && kierunek=1 {animator.sprite_index=global.fire_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
if !schylanie=1 {image_index=1}

if schylanie=1 || sekwencja<>0 {strzelil=0}
if kierunek=0 && strzelil>0 {animator.sprite_index=global.fire_character_shoot; animator.image_xscale=1; strzelil+=1;animkind=0}
if kierunek=1 && strzelil>0 {animator.sprite_index=global.fire_character_shoot; animator.image_xscale=-1; strzelil+=1;animkind=0}
if strzelil>3 {strzelil=0}
}

if y>=global.poziomwody && !global.lava
{

if szybkosc<0 {kierunek=1}
if szybkosc>0 {kierunek=0}

if szybkosc=0 && sekwencja=0 && kierunek=0 {animator.sprite_index=global.fire_character_run; animator.image_index=0; animator.image_xscale=1; animkind=0}
if szybkosc=0 && sekwencja=0 && kierunek=1 {animator.sprite_index=global.fire_character_run; animator.image_index=0; animator.image_xscale=-1; animkind=0}

if szybkosc>0 && kierunek=0 && sekwencja=0 {animator.sprite_index=global.fire_character_run; animator.image_index+=szybkosc/20; animator.image_xscale=1; animkind=0}
if szybkosc<0 && kierunek=1 && sekwencja=0 {animator.sprite_index=global.fire_character_run; animator.image_index+=szybkosc/20; animator.image_xscale=-1; animkind=0}

if kierunek=0 && grawitacja<>0 {animator.sprite_index=global.fire_character_swim; animator.image_index=plywakanim; animator.image_xscale=1;animkind=2}
if kierunek=1 && grawitacja<>0 {animator.sprite_index=global.fire_character_swim; animator.image_index=plywakanim; animator.image_xscale=-1;animkind=2}
if plywakanim<9 {plywakanim+=0.2}

if schylanie=1 && kierunek=0 {animator.sprite_index=global.fire_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
if schylanie=1 && kierunek=1 {animator.sprite_index=global.fire_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
if !schylanie=1 {image_index=1}

if schylanie=1 || sekwencja<>0 {strzelil=0}
if kierunek=0 && strzelil>0 {animator.sprite_index=global.fire_character_shoot; animator.image_xscale=1; strzelil+=1;animkind=0}
if kierunek=1 && strzelil>0 {animator.sprite_index=global.fire_character_shoot; animator.image_xscale=-1; strzelil+=1;animkind=0}
if strzelil>3 {strzelil=0}

if global.efekty>5 {lolo=instance_create(x,y,o_marioeffektor); lolo.sprite_index=animator.sprite_index; lolo.image_index=animator.image_index; lolo.image_speed=0;lolo.image_xscale=animator.image_xscale}


}}

// OGRODNIX MARIO
if global.rodzajmaria=3 {
if y<global.poziomwody || global.lava
{

if szybkosc<0 {kierunek=1}
if szybkosc>0 {kierunek=0}

if szybkosc=0 && sekwencja=0 && kierunek=0 && strzelil=0 {animator.sprite_index=global.lui_character_run; animator.image_index=0; animator.image_xscale=1;animkind=0}
if szybkosc=0 && sekwencja=0 && kierunek=1 && strzelil=0 {animator.sprite_index=global.lui_character_run; animator.image_index=0; animator.image_xscale=-1;animkind=0}

if szybkosc>0 && kierunek=0 && sekwencja=0 && strzelil=0 {animator.sprite_index=global.lui_character_run; animator.image_index+=szybkosc/10; animator.image_xscale=1;animkind=0}
if szybkosc<0 && kierunek=1 && sekwencja=0 && strzelil=0 {animator.sprite_index=global.lui_character_run; animator.image_index+=szybkosc/10; animator.image_xscale=-1;animkind=0}

if kierunek=0 && grawitacja<>0 {animator.sprite_index=global.lui_character_jump; animator.image_xscale=1;animkind=1}
if kierunek=1 && grawitacja<>0 {animator.sprite_index=global.lui_character_jump; animator.image_xscale=-1;animkind=1}

if schylanie=1 && kierunek=0 {animator.sprite_index=global.lui_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
if schylanie=1 && kierunek=1 {animator.sprite_index=global.lui_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
if !schylanie=1 {image_index=1}

strzelil=0 // nie ma strzelania!

}

if y>=global.poziomwody && !global.lava
{

if szybkosc<0 {kierunek=1}
if szybkosc>0 {kierunek=0}

if szybkosc=0 && sekwencja=0 && kierunek=0 {animator.sprite_index=global.lui_character_run; animator.image_index=0; animator.image_xscale=1;animkind=0}
if szybkosc=0 && sekwencja=0 && kierunek=1 {animator.sprite_index=global.lui_character_run; animator.image_index=0; animator.image_xscale=-1;animkind=0}

if szybkosc>0 && kierunek=0 && sekwencja=0 {animator.sprite_index=global.lui_character_run; animator.image_index+=szybkosc/20; animator.image_xscale=1;animkind=0}
if szybkosc<0 && kierunek=1 && sekwencja=0 {animator.sprite_index=global.lui_character_run; animator.image_index+=szybkosc/20; animator.image_xscale=-1;animkind=0}

if kierunek=0 && grawitacja<>0 {animator.sprite_index=global.lui_character_swim; animator.image_index=plywakanim; animator.image_xscale=1;animkind=2}
if kierunek=1 && grawitacja<>0 {animator.sprite_index=global.lui_character_swim; animator.image_index=plywakanim; animator.image_xscale=-1;animkind=2}
if plywakanim<9 {plywakanim+=0.2}

if schylanie=1 && kierunek=0 {animator.sprite_index=global.lui_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
if schylanie=1 && kierunek=1 {animator.sprite_index=global.lui_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
if !schylanie=1 {image_index=1}

strzelil=0 // nie ma strzelania!
if global.efekty>5 {lolo=instance_create(x,y,o_marioeffektor); lolo.sprite_index=animator.sprite_index; lolo.image_index=animator.image_index; lolo.image_speed=0;lolo.image_xscale=animator.image_xscale}


}}

// BURACZANY MARIO
if global.rodzajmaria=4 {
if y<global.poziomwody || global.lava
{

if szybkosc<0 {kierunek=1}
if szybkosc>0 {kierunek=0}

if szybkosc=0 && sekwencja=0 && kierunek=0 && strzelil=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index=0; animator.image_xscale=1;animkind=0}
if szybkosc=0 && sekwencja=0 && kierunek=1 && strzelil=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index=0; animator.image_xscale=-1;animkind=0}

if szybkosc>0 && kierunek=0 && sekwencja=0 && strzelil=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index+=szybkosc/10; animator.image_xscale=1;animkind=0}
if szybkosc<0 && kierunek=1 && sekwencja=0 && strzelil=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index+=szybkosc/10; animator.image_xscale=-1;animkind=0}

if kierunek=0 && grawitacja<>0 {animator.sprite_index=global.beetroot_character_jump; animator.image_xscale=1;animkind=1}
if kierunek=1 && grawitacja<>0 {animator.sprite_index=global.beetroot_character_jump; animator.image_xscale=-1;animkind=1}

if schylanie=1 && kierunek=0 {animator.sprite_index=global.beetroot_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
if schylanie=1 && kierunek=1 {animator.sprite_index=global.beetroot_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
if !schylanie=1 {image_index=1}

if schylanie=1 || sekwencja<>0 {strzelil=0}
if kierunek=0 && strzelil>0 {animator.sprite_index=global.beetroot_character_shoot; animator.image_xscale=1; strzelil+=1;animkind=0}
if kierunek=1 && strzelil>0 {animator.sprite_index=global.beetroot_character_shoot; animator.image_xscale=-1; strzelil+=1;animkind=0}
if strzelil>3 {strzelil=0}
}

if y>=global.poziomwody && !global.lava
{

if szybkosc<0 {kierunek=1}
if szybkosc>0 {kierunek=0}

if szybkosc=0 && sekwencja=0 && kierunek=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index=0; animator.image_xscale=1;animkind=0}
if szybkosc=0 && sekwencja=0 && kierunek=1 {animator.sprite_index=global.beetroot_character_run; animator.image_index=0; animator.image_xscale=-1;animkind=0}

if szybkosc>0 && kierunek=0 && sekwencja=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index+=szybkosc/20; animator.image_xscale=1;animkind=0}
if szybkosc<0 && kierunek=1 && sekwencja=0 {animator.sprite_index=global.beetroot_character_run; animator.image_index+=szybkosc/20; animator.image_xscale=-1;animkind=0}

if kierunek=0 && grawitacja<>0 {animator.sprite_index=global.beetroot_character_swim; animator.image_index=plywakanim; animator.image_xscale=1;animkind=2}
if kierunek=1 && grawitacja<>0 {animator.sprite_index=global.beetroot_character_swim; animator.image_index=plywakanim; animator.image_xscale=-1;animkind=2}
if plywakanim<9 {plywakanim+=0.2}

if schylanie=1 && kierunek=0 {animator.sprite_index=global.beetroot_character_crouch; animator.image_xscale=1;image_index=0;animkind=3}
if schylanie=1 && kierunek=1 {animator.sprite_index=global.beetroot_character_crouch; animator.image_xscale=-1;image_index=0;animkind=3}
if !schylanie=1 {image_index=1}


if global.efekty>5 {lolo=instance_create(x,y,o_marioeffektor); lolo.sprite_index=animator.sprite_index; lolo.image_index=animator.image_index; lolo.image_speed=0;lolo.image_xscale=animator.image_xscale}

if schylanie=1 || sekwencja<>0 {strzelil=0}
if kierunek=0 && strzelil>0 {animator.sprite_index=global.beetroot_character_shoot; animator.image_xscale=1; strzelil+=1;animkind=0}
if kierunek=1 && strzelil>0 {animator.sprite_index=global.beetroot_character_shoot; animator.image_xscale=-1; strzelil+=1;animkind=0}
if strzelil>3 {strzelil=0}
}}

} // koniec global.pauza


// 光照设置
if
(
    (
        global.rodzajmaria = 0 || ( schylanie = 1 && global.rodzajmaria <> 5 )
    )
    ||
    (
        global.rodzajmaria = 5 &&
        (
            animator.sprite_index = global.small_character_run ||
            animator.sprite_index = global.small_character_jump ||
            animator.sprite_index = global.small_character_swim
        )
    )
)
{
    light_y = -16;
} else {
    light_y = -28;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=combo
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

// algorytm ktory resetuje nabijanie combo za zabijanie przeciwnikow, dla rozdeptywania bez dotykania ziemii i zabijania
// muszla.

if global.pauza=0 && skusil=0 && global.etappokonany=0 {

if global.combo1>0 {global.combo1reset+=1}
if global.combo1reset>200 {global.combo1=0;global.combo1reset=0}

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=kick
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && skusil=0 && global.etappokonany=0 && teleportacja=0 {
// rozdeptywanie wrogow

if global.rodzajmaria<>5 {

//gwiazdka记录是否为无敌星状态
if gwiazdka<=0 {
//踩或撞普通可踩敌人
if place_meeting(x,y+max(0,grawitacja+global.etapgravity/5),o_goomba) && !place_meeting(x,y+max(0,grawitacja+global.etapgravity/5),o_troopashell2)  && !place_meeting(x,y+max(0,grawitacja+global.etapgravity/5),o_troopashell) && !place_meeting(x,y+max(0,grawitacja+global.etapgravity/5),o_kuppa) /* && muszlowanie>10 */
    {
    lolo=instance_place(x,y+max(0,grawitacja+global.etapgravity/5),o_goomba)
    if lolo.killer=0 && lolo.license <> 1 && lolo.hurt_delay=0{
        if grawitacja>0 && y<lolo.y
        {
        //lolo.energia-=233333333333333333333; 恶劣变量
        lolo.rodzajzabicia=1;//这里是记录是普通的踩还是无敌星，估计主要是为了计分之类
        sekwencja=1;
        grawitacja=-8-lolo.odpych
        global.combo1+=1
        global.combo1reset=0
        //muszlowanie=0
        if global.sample=1 {fofo=sound_play(snd_rozdeptanie);sound_volume(snd_rozdeptanie,global.glosnosc)} //sampel
        if lolo.object_index=o_kuppa && kierunek=0 {szybkosc+=6}
        if lolo.object_index=o_kuppa && kierunek=1 {szybkosc-=6}
        }
    }
    if lolo.hurt_delay=0 && lolo.killer=0 && oberwal=0 && y>=lolo.y && shield=0 && lolo.license <> 1 {oberwal=1}
    }

//踩或撞炮弹
if place_meeting(x,y,o_goomba) && !place_meeting(x,y,o_troopashell2) && !place_meeting(x,y,o_kuppa) /* && muszlowanie>10 */
    {
    lolo=instance_place(x,y,o_goomba)
    if lolo.killer=0 && lolo.license = 1 {
    if grawitacja>0 && y<lolo.y
        {
       // lolo.energia-=233333333333333333333;
        lolo.rodzajzabicia=1;
        sekwencja=1;
        grawitacja=-8-lolo.odpych
        global.combo1+=1
        global.combo1reset=0
        //muszlowanie=0
        if global.sample=1 {fofo=sound_play(snd_rozdeptanie);sound_volume(snd_rozdeptanie,global.glosnosc)} //sampel
        if lolo.object_index=o_kuppa && kierunek=0 {szybkosc+=6}
        if lolo.object_index=o_kuppa && kierunek=1 {szybkosc-=6}
        } }
    if lolo.killer=0 && oberwal=0 && y>=lolo.y && shield=0 && lolo.license = 1 {oberwal=1}
    }

//踩或撞到危险敌人
if place_meeting(x,y,o_goomba) && !place_meeting(x,y,o_troopashell2) && !place_meeting(x,y,o_kuppa) /* && muszlowanie>10 */
    {
    lolo=instance_place(x,y,o_goomba)
    if lolo.killer=1 && oberwal=0 && shield=0 {oberwal=1}//killer=1就是不能踩（刺猬）
    }

//踢静止龟壳
if place_meeting(x,y+max(0,grawitacja+global.etapgravity/5),o_troopashell2) /* && muszlowanie>10*/ && skusil=0//这个是静止龟壳
    {
    lolo=instance_place(x,y+max(0,grawitacja+global.etapgravity/5),o_troopashell2)
        if lolo.hurt_delay=0{
        if x<lolo.x {lolo.kierunek=1;lolo.rodzajzabicia=1}
        if x>=lolo.x {lolo.kierunek=-1;lolo.rodzajzabicia=1}//这里实现的是踢龟壳（所以为什么要以踩为判定基础……）
        if sekwencja=1 {grawitacja=-8}
        if global.sample=1 {fofo=sound_play(snd_rozdeptanie);sound_volume(snd_rozdeptanie,global.glosnosc)} //sampel
        }
    }

//踩停运动龟壳
if place_meeting(x,y+max(0,grawitacja+global.etapgravity/5),o_troopashell)
    {
    lolo=instance_place(x,y+max(0,grawitacja+global.etapgravity/5),o_troopashell)
    if grawitacja>0 && y<lolo.y && lolo.hurt_delay=0
        {
        //lolo.energia-=233333333333333333333; 恶劣变量
        lolo.rodzajzabicia=1;//这里是记录是普通的踩还是无敌星，估计主要是为了计分之类
        sekwencja=1;
        grawitacja=-8-lolo.odpych
        global.combo1+=1
        global.combo1reset=0
        //muszlowanie=0
        if global.sample=1 {fofo=sound_play(snd_rozdeptanie);sound_volume(snd_rozdeptanie,global.glosnosc)} //sampel
        }
    if lolo.hurt_delay=0 && oberwal=0 && y>=lolo.y && shield=0  {oberwal=1}
    }
}



else {

if place_meeting(x,y+max(0,grawitacja+global.etapgravity/5),o_goomba) && !place_meeting(x,y+max(0,grawitacja+global.etapgravity/5),o_kuppa)
    {
    lolo=instance_place(x,y+max(0,grawitacja+global.etapgravity/5),o_goomba)
    if lolo.dabusi=0 && lolo.killer=0 && lolo.license <> 1 {
    if grawitacja>0 && y<lolo.y
        {
       // lolo.energia-=233333333333333333333333333333
        lolo.rodzajzabicia=2//这个是无敌星
        nabijanie+=1
        fofo=instance_create(x,y,o_punkciornik2)
        fofo.image_index=nabijanie-1
        if nabijanie>6 {nabijanie=0}
        sekwencja=1;
        grawitacja=-8-lolo.odpych
        global.combo1+=1
        global.combo1reset=0
        if global.sample=1 {fofo=sound_play(snd_rozdeptanie);sound_volume(snd_rozdeptanie,global.glosnosc)} //sampel
        } }
    }

if place_meeting(x,y,o_goomba) && !place_meeting(x,y,o_kuppa)
    {
    lolo=instance_place(x,y,o_goomba)
    if lolo.dabusi=0 && lolo.killer=0 && lolo.license = 1 {
    if grawitacja>0 && y<lolo.y
        {
      //  lolo.energia-=233333333333333333333333333333
        lolo.rodzajzabicia=2
        nabijanie+=1
        fofo=instance_create(x,y,o_punkciornik2)
        fofo.image_index=nabijanie-1
        if nabijanie>6 {nabijanie=0}
        sekwencja=1;
        grawitacja=-8-lolo.odpych
        global.combo1+=1
        global.combo1reset=0
        if global.sample=1 {fofo=sound_play(snd_rozdeptanie);sound_volume(snd_rozdeptanie,global.glosnosc)} //sampel
        } }
    }

    if place_meeting(x,y,o_goomba) && !place_meeting(x,y,o_kuppa)
    {
    lolo=instance_place(x,y,o_goomba)
    if lolo.dabusi=0 {//lolo.energia-=233333333333333333333333333333 啊，这个dabusi变量是我以前加的，防止敌人被星死，以及龟壳撞死
    lolo.rodzajzabicia=2
    nabijanie+=1
    fofo=instance_create(x,y,o_punkciornik2)
    fofo.image_index=nabijanie-1
    if nabijanie>6 {nabijanie=0}
    }
    }
}

if place_meeting(x,y+max(0,grawitacja+global.etapgravity/5),o_kuppa) /* && muszlowanie>10 *///库巴咱就不管了
    {
    lolo=instance_place(x,y+max(0,grawitacja+global.etapgravity/5),o_kuppa)
    if lolo.killer=0 {
    if grawitacja>0 && y<lolo.y-40 && lolo.oberw<=0
        {
        lolo.energia-=114514; //踩一次必然扣HP，但子弹攻击要看库巴的koopa_strength来判断
        lolo.rodzajzabicia=1;
        sekwencja=1;
        grawitacja=-8//-lolo.odpych
        global.combo1+=1
        global.combo1reset=0
        //muszlowanie=0

        if lolo.object_index=o_kuppa && kierunek=0 {szybkosc+=6}
        if lolo.object_index=o_kuppa && kierunek=1 {szybkosc-=6}
        } }
    if lolo.killer=0 && oberwal=0 && y>=lolo.y-40 && shield=0 && gwiazdka<=0 {oberwal=1}
    if lolo.oberw>0 && lolo.oberw<170 && shield=0 && gwiazdka<=0 {oberwal=1}
    }

}

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=fireball
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.rodzajmaria=2 && skusil=0 && global.etappokonany=0 && teleportacja=0 {
if instance_number(o_fireball)<2
    {
    if kierunek=1 && keyboard_check(global.sterowaniebieg) && strzelil2=0 {strzelil2=1; lolo=instance_create(x-10,y-40,o_fireball); lolo.kierunek=-1; strzelil=1;if global.sample=1 {fofo=sound_play(snd_fire);sound_volume(snd_fire,global.glosnosc)}}
    if kierunek=0 && keyboard_check(global.sterowaniebieg) && strzelil2=0 {strzelil2=1; lolo=instance_create(x+10,y-40,o_fireball); lolo.kierunek=1; strzelil=1;if global.sample=1 {fofo=sound_play(snd_fire);sound_volume(snd_fire,global.glosnosc)}}
    }
if !keyboard_check(global.sterowaniebieg) {strzelil2=0}

}

if global.pauza=0 && global.rodzajmaria=4 && skusil=0 && teleportacja=0 {
if instance_number(o_burax)<2
    {
    if kierunek=1 && keyboard_check(global.sterowaniebieg) && strzelil2=0 {strzelil2=1; lolo=instance_create(x-10,y-48,o_burax); lolo.kierunek=-1; strzelil=1;if global.sample=1 {fofo=sound_play(snd_fire);sound_volume(snd_fire,global.glosnosc)}}
    if kierunek=0 && keyboard_check(global.sterowaniebieg) && strzelil2=0 {strzelil2=1; lolo=instance_create(x+10-30*global.MFbeet,y-48,o_burax); lolo.kierunek=1; strzelil=1;if global.sample=1 {fofo=sound_play(snd_fire);sound_volume(snd_fire,global.glosnosc)}}
    }
if !keyboard_check(global.sterowaniebieg) {strzelil2=0}

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=bonus
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//fast retry 恢复背景音量;关于死亡时降低音量请访问马里奥狗带物件

if(global.muzyka='146') && !instance_exists(o_skuszak){
    if vvvv<1 && !setonce {vvvv=0.2;setonce=true;}
    surface_volume = 0.01*(global.poziomwody - y + 50)
    mm_set_volume(global.musicplay,vvvv*(surface_volume))
    mm_set_volume(global.musicplay2,vvvv*(1-surface_volume))
    if vvvv<1 {vvvv+=0.05;}
}
else{ if vvvv<1{vvvv+=0.05; mm_set_volume(global.musicplay,vvvv)}}

if teleportacja=0 {
if global.pauza=0 && skusil=0 && global.etappokonany=0 {

// zdobywanie monety



if place_meeting(x,y,o_point) && global.rodzajmaria<>5
    {
    bonus=instance_place(x,y,o_point)
    with(bonus){instance_destroy()}
    global.coins+=1
    if global.sample=1 {fofo=sound_play(snd_coin);sound_volume(snd_coin,global.glosnosc)}
    }

//特殊音乐


// OBRYWANIE

if y>room_height+30 && oberwal=0 && global.rodzajmaria<>5 {oberwal=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white}
if (global.aktywowanykuppa=2||global.aktywowanykuppa=3)&& y>view_yview+480+30 && oberwal=0 && global.rodzajmaria<>5 {
    oberwal=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white
}
if global.aktywowanykuppa=0 && region_count>0 && view_set=1 && y>view_yview+480+30 && oberwal=0 && global.rodzajmaria<>5 {
    oberwal=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white
}
if place_meeting(x,y,o_lava) && oberwal=0 && global.rodzajmaria<>5 {
    oberwal=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white
}

if place_meeting(x,y,o_bonusdead) && oberwal=0 && global.rodzajmaria<>5 {oberwal=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white}
//下面一行，SMWP1.7新增：马里奥掉进全局岩浆即死
if y>=global.poziomwody+2 && global.lava=1  && oberwal=0 && global.rodzajmaria<>5 {
    oberwal=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white
}

if oberwal=1 && global.rodzajmaria=5 {oberwal=0}
if oberwal=1 && shield=0 && global.rodzajmaria<>5
    {
    if global.rodzajmaria<>0 {shield=200; oberwal=2; global.pauza=2;}
    if global.rodzajmaria=0{
        global.zycia-=1; skusil=1;
        if(!global.fast_retry){
            mm_stop_all_ext();
            if global.sample=1 {fofo=sound_play(snd_die);sound_volume(snd_die,global.glosnosc)}
        }
        else{
            if global.sample=1 {
                fofo=sound_play(snd_fastdie);
                sound_volume(snd_fastdie,global.glosnosc);
            }
        }
        instance_create(x,y,o_skuszak);animator.visible=0;
        // 光照设置
        light_radius = 0;
    }
    if global.rodzajmaria=1 {global.rodzajmaria=0;if global.sample=1 {fofo=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.glosnosc)}}
    if global.rodzajmaria>=2 {global.rodzajmaria=1;if global.sample=1 {fofo=sound_play(snd_powerdown);sound_volume(snd_powerdown,global.glosnosc)}}
    }
if shield>0 && skusil=0
    {
    shield-=1;
    shieldanim+=1
        if shieldanim>3 && animator.visible=1 {animator.visible=0;shieldanim=0;}
        if shieldanim>3 && animator.visible=0 {animator.visible=1;shieldanim=0;}
    }




if shield=0 && skusil=0 {animator.visible=1}


// GWIAZDKA

if place_meeting(x,y,o_bonusstar) && global.rodzajmaria<>5
    {
    kafel=instance_place(x,y,o_bonusstar)
    with(kafel){instance_destroy()}
    gwiazdka=500
    mm_play_ext('.\Data\MW\ktkm3.dll',0)
    animator2.visible=1
    }




if /*global.godmode=0 &&*/ keyboard_check(global.restartlevelkey) && oberwal=0 {instance_create(x,y,o_fireexplode);sound_play(snd_break)oberwal=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white;suicide=1}
if gwiazdka<=0 {animator.image_blend=c_white;animator2.visible=0}
if gwiazdka>0
    {
    gwiazdka-=1; kolor=make_color_rgb(random(255),random(255),random(255)); animator.image_blend=kolor

    }
    //无敌星音乐重置
    if gwiazdka=1 && instance_number(object112)<>0 {mm_play_ext('.\Data\MW\ktkm8.dll',0)}
    if gwiazdka=1 && instance_number(object112)=0 {
        if (global.muzyka == "600" || global.muzyka == "0") {
            mm_stop_all_ext();
        } else {
            Music_Play()//大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲大叔傻贲
            //你们要改音乐的到Scripts -> Music_Play改
        }
    }

// zdobywanie grzyba // POWIEKSZENIE od kwiatka i LUI

if global.rodzajmaria=0 {image_yscale=1}

if place_meeting(x,y,o_bonusmush) && global.rodzajmaria=0 && global.rodzajmaria<>5
    {
    bonus=instance_place(x,y,o_bonusmush)
    with(bonus){instance_destroy()}
    global.rodzajmaria=1
if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { huadun = 1 };if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { huadun = 2 }    global.pauza=1
    if global.sample=1 {fofo=sound_play(snd_powerup);sound_volume(snd_powerup,global.glosnosc)}

    if animkind=0 {animator.sprite_index=global.big_character_run}
    if animkind=1 {animator.sprite_index=global.big_character_jump}
    if animkind=2 {animator.sprite_index=global.big_character_swim}
    }


if place_meeting(x,y,o_bonusflower) && global.rodzajmaria=0 && global.rodzajmaria<>5 && checkpointdetect=1
    {
    bonus=instance_place(x,y,o_bonusflower)
    with(bonus){instance_destroy()}
    global.rodzajmaria=1
if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { huadun = 1 };if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { huadun = 2 }    global.pauza=1
    if global.sample=1 {fofo=sound_play(snd_powerup);sound_volume(snd_powerup,global.glosnosc)}

    if animkind=0 {animator.sprite_index=global.big_character_run}
    if animkind=1 {animator.sprite_index=global.big_character_jump}
    if animkind=2 {animator.sprite_index=global.big_character_swim}
    }


if place_meeting(x,y,o_bonus1up) && global.rodzajmaria<>5 && checkpointdetect=1
    {
    bonus=instance_place(x,y,o_bonus1up)
    with(bonus){instance_destroy()}

    fifi=instance_create(x,y-32,o_punkciornik3)
    fifi.image_index=6
    if global.sample=1 {fofo=sound_play(snd_1up);sound_volume(snd_1up,global.glosnosc)}

    }



if place_meeting(x,y,o_bonuslui) && global.rodzajmaria=0 && global.rodzajmaria<>5 && checkpointdetect=1
    {
    bonus=instance_place(x,y,o_bonuslui)
    with(bonus){instance_destroy()}
    global.rodzajmaria=1
if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { huadun = 1 };if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { huadun = 2 }    global.pauza=1
    if global.sample=1 {fofo=sound_play(snd_powerup);sound_volume(snd_powerup,global.glosnosc)}

    if animkind=0 {animator.sprite_index=global.big_character_run}
    if animkind=1 {animator.sprite_index=global.big_character_jump}
    if animkind=2 {animator.sprite_index=global.big_character_swim}
    }

if place_meeting(x,y,o_bonusburak) && global.rodzajmaria=0 && global.rodzajmaria<>5 && checkpointdetect=1
    {
    bonus=instance_place(x,y,o_bonusburak)
    with(bonus){instance_destroy()}
    global.rodzajmaria=1
if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { huadun = 1 };if global.modifiedmov=1 && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) { huadun = 2 }    global.pauza=1
    if global.sample=1 {fofo=sound_play(snd_powerup);sound_volume(snd_powerup,global.glosnosc)}

    if animkind=0 {animator.sprite_index=global.big_character_run}
    if animkind=1 {animator.sprite_index=global.big_character_jump}
    if animkind=2 {animator.sprite_index=global.big_character_swim}
    }

}


// Zdobycie 1000 punktow za grzyba gdy mario nie jest juz maly
if place_meeting(x,y,o_bonusmush) && global.rodzajmaria>0 && global.rodzajmaria<>5 && checkpointdetect=1
    {
    bonus=instance_place(x,y,o_bonusmush)
    if global.sample=1 {fofo=sound_play(snd_powerup);sound_volume(snd_powerup,global.glosnosc)}
    lolo=instance_create(bonus.x,bonus.y,o_punkciornik3)
    lolo.image_index=3
    with(bonus){instance_destroy()}
    }

// ------------------------------------------------------------------------------------------------------
// ZDOBYWANIE KWIATKA GDY MARIO JEST DUZY | GDY JEST KWIATKOWY | GDY NIE JEST KWIATKOWY, ALE TEZ NIE MALY
//
if place_meeting(x,y,o_bonusflower) && global.rodzajmaria=2 && global.rodzajmaria<>5 && checkpointdetect=1
    {
    bonus=instance_place(x,y,o_bonusflower)
    if global.sample=1 {fofo=sound_play(snd_powerup);sound_volume(snd_powerup,global.glosnosc)}
    lolo=instance_create(bonus.x,bonus.y,o_punkciornik3)
    lolo.image_index=3
    with(bonus){instance_destroy()}
    }

if place_meeting(x,y,o_bonusflower) && global.rodzajmaria<>2 && global.rodzajmaria<>5 && checkpointdetect=1
    {
    bonus=instance_place(x,y,o_bonusflower)
    with(bonus){instance_destroy()}
    global.rodzajmaria=2
    global.pauza=1
    if global.sample=1 {fofo=sound_play(snd_powerup);sound_volume(snd_powerup,global.glosnosc)}

    if animkind=0 {animator.sprite_index=global.fire_character_run}
    if animkind=1 {animator.sprite_index=global.fire_character_jump}
    if animkind=2 {animator.sprite_index=global.fire_character_swim}
    }

// ------------------------------------------------------------------------------------------------------
// ZDOBYWANIE LUIGDY MARIO JEST DUZY | GDY JEST LUI'WOY | GDY NIE JEST LUI'OWY, ALE TEZ NIE MALY
//
if place_meeting(x,y,o_bonuslui) && global.rodzajmaria=3 && global.rodzajmaria<>5 && checkpointdetect=1
    {
    bonus=instance_place(x,y,o_bonuslui)
    if global.sample=1 {fofo=sound_play(snd_powerup);sound_volume(snd_powerup,global.glosnosc)}
    lolo=instance_create(bonus.x,bonus.y,o_punkciornik3)
    lolo.image_index=3
    with(bonus){instance_destroy()}
    }

if place_meeting(x,y,o_bonuslui) && global.rodzajmaria<>3 && global.rodzajmaria<>5 && checkpointdetect=1
    {
    bonus=instance_place(x,y,o_bonuslui)
    with(bonus){instance_destroy()}
    global.rodzajmaria=3
    global.pauza=1
    if global.sample=1 {fofo=sound_play(snd_powerup);sound_volume(snd_powerup,global.glosnosc)}

    if animkind=0 {animator.sprite_index=global.lui_character_run}
    if animkind=1 {animator.sprite_index=global.lui_character_jump}
    if animkind=2 {animator.sprite_index=global.lui_character_swim}
    }

// ------------------------------------------------------------------------------------------------------
// ZDOBYWANIE LUIGDY MARIO JEST DUZY | GDY JEST LUI'WOY | GDY NIE JEST LUI'OWY, ALE TEZ NIE MALY
//
if place_meeting(x,y,o_bonusburak) && global.rodzajmaria=4 && global.rodzajmaria<>5 && checkpointdetect=1
    {
    bonus=instance_place(x,y,o_bonusburak)
    if global.sample=1 {fofo=sound_play(snd_powerup);sound_volume(snd_powerup,global.glosnosc)}
    lolo=instance_create(bonus.x,bonus.y,o_punkciornik3)
    lolo.image_index=3
    with(bonus){instance_destroy()}
    }

if place_meeting(x,y,o_bonusburak) && global.rodzajmaria<>4 && global.rodzajmaria<>5 && checkpointdetect=1
    {
    bonus=instance_place(x,y,o_bonusburak)
    with(bonus){instance_destroy()}
    global.rodzajmaria=4
    global.pauza=1
    if global.sample=1 {fofo=sound_play(snd_powerup);sound_volume(snd_powerup,global.glosnosc)}

    if animkind=0 {animator.sprite_index=global.beetroot_character_run}
    if animkind=1 {animator.sprite_index=global.beetroot_character_jump}
    if animkind=2 {animator.sprite_index=global.beetroot_character_swim}
    }


if global.pauza=1
    {
    if kierunek=0 {/*animator.image_xscale=1+sin(degtorad(sizing/3 ))/2*/}
    if kierunek=1 {/*animator.image_xscale=-1-sin(degtorad(sizing/3 ))/2*/}
    animator.image_yscale=1+(sin(degtorad(sizing)))/3
    sizingus+=1
    if sizingus>1 {sizing+=20; sizingus=0}
    if zdobywanie<60 {zdobywanie+=1}
    if zdobywanie=60 {zdobywanie=0; global.pauza=0;animator.image_xscale=1;animator.image_yscale=1}
    }

if global.pauza=2
    {
    if kierunek=0 {/*animator.image_xscale=1-sin(degtorad(sizing/3 ))/2*/}
    if kierunek=1 {/*animator.image_xscale=-1-sin(degtorad(sizing/3 ))/2*/}
    animator.image_yscale=1+(sin(degtorad(sizing)))/3
    sizingus+=1
    if sizingus>1 {sizing+=20; sizingus=0}
    if zdobywanie<60 {zdobywanie+=1}
    if zdobywanie=60 {zdobywanie=0; global.pauza=0;animator.image_xscale=1;animator.image_yscale=1; oberwal=0}
    }


}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=fish area
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//SMWP 1.6+
//用于控制鱼的生成
if place_meeting(x,y,o_swimfisharea){
    fisharea=instance_place(x,y,o_swimfisharea)
    fishcounter+=1
    if fisharea.type=0{
        if fishcounter = 50{
            fishcreateY=max(view_yview-60,global.poziomwody+38)+random(300)
            if instance_number(o_rybeka2)<8{
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_rybeka2)
                fish.aktywowany=1; fish.kierunek=fisharea.fishdir
            }
        }
        if fishcounter >= 100{
            fishcounter=0
            fishcreateY=max(view_yview-60,global.poziomwody+38)+300+random(300)
            if instance_number(o_rybeka2)<8{
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_rybeka2)
                fish.aktywowany=1; fish.kierunek=fisharea.fishdir
            }
        }
    }
    if fisharea.type=1{
        if fishcounter = 38{
            fishcreateY=max(view_yview-60,global.poziomwody+38)+random(300)
            if instance_number(o_rybeka2)<10{
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_rybeka2)
                fish.aktywowany=1; fish.kierunek=fisharea.fishdir
            }
        }
        if fishcounter >= 75{
            fishcounter=0
            fishcreateY=max(view_yview-60,global.poziomwody+38)+300+random(300)
            if instance_number(o_rybeka2)<10{
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_rybeka2)
                fish.aktywowany=1; fish.kierunek=fisharea.fishdir
            }
        }
    }
    if fisharea.type=2{
        if fishcounter = 50{
            fishcreateY=max(view_yview-60,global.poziomwody+38)+random(300)
            if instance_number(o_rybekb2)<10{
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_rybekb2)
                fish.aktywowany=1; fish.kierunek=fisharea.fishdir
            }
        }
        if fishcounter >= 100{
            fishcounter=0
            fishcreateY=max(view_yview-60,global.poziomwody+38)+300+random(300)
            if instance_number(o_rybekb2)<10{
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_rybekb2)
                fish.aktywowany=1; fish.kierunek=fisharea.fishdir
            }
        }
    }
}
if place_meeting(x,y,o_flyfisharea){
    fisharea2=instance_place(x,y,o_flyfisharea)
    fishcounter2+=1
    if fisharea2.type=0{
        if fishcounter2 >= 25 && fisharea2.fishdir*szybkosc>=0{
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_rybeka3)<3{
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_rybeka3)
                fish.aktywowany=1; fish.kierunek=fisharea2.fishdir
            }
        }
        if fishcounter2 >= 13 && fisharea2.fishdir*szybkosc<0{
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_rybeka3)<3{
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_rybeka3)
                fish.aktywowany=1; fish.kierunek=fisharea2.fishdir
            }
        }
    }
    if fisharea2.type=1{
        if fishcounter2 >= 10 && fisharea2.fishdir*szybkosc>=0{
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_rybeka3)<3{
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_rybeka3)
                fish.aktywowany=1; fish.kierunek=fisharea2.fishdir
            }
        }
        if fishcounter2 >= 4 && fisharea2.fishdir*szybkosc<0{
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_rybeka3)<3{
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_rybeka3)
                fish.aktywowany=1; fish.kierunek=fisharea2.fishdir
            }
        }
    }
    if fisharea2.type=2{
        if fishcounter2 >= 25 && fisharea2.fishdir*szybkosc>=0{
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_rybekc3)<3{
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_rybekc3)
                fish.aktywowany=1; fish.kierunek=fisharea2.fishdir
            }
        }
        if fishcounter2 >= 13 && fisharea2.fishdir*szybkosc<0{
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_rybekc3)<3{
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_rybekc3)
                fish.aktywowany=1; fish.kierunek=fisharea2.fishdir
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=goal reached
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && teleportacja=0 /*&& prawdziwyczas>0*/ && oberwal=0 && global.rodzajmaria<>5
    {
    if place_meeting(x,y,o_exitar2) && global.etappokonany=0
        {
        global.etappokonany=1
        lolo=instance_place(x,y,o_exitar2)
        endscoring=lolo.iyor
        lolo.zabity=1
        if endscoring>=0 && endscoring<10
            {
            lolo=instance_create(x,y,o_punkciornik)
            lolo.image_index=7
            global.punkty+=10000
            }
        if endscoring>=10 && endscoring<30
            {
            lolo=instance_create(x,y,o_punkciornik)
            lolo.image_index=5
            }
        if endscoring>=30 && endscoring<50
            {
            lolo=instance_create(x,y,o_punkciornik)
            lolo.image_index=4
            }
        if endscoring>=50 && endscoring<70
            {
            lolo=instance_create(x,y,o_punkciornik)
            lolo.image_index=3
            }
        if endscoring>=70 && endscoring<100
            {
            lolo=instance_create(x,y,o_punkciornik)
            lolo.image_index=2
            }
        if endscoring>=100 && endscoring<140
            {
            lolo=instance_create(x,y,o_punkciornik)
            lolo.image_index=1
            }
        if endscoring>=140 && endscoring<=200
            {
            lolo=instance_create(x,y,o_punkciornik)
            lolo.image_index=0
            }
        }






    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=scroll
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !initial_check {test_bound(x,y);initial_check=1}

if global.aktywowanykuppa=0{//普通状态
    view_xview=min(max(0,x-320,left_bound),max(0,right_bound),room_width-640)
    view_yview=min(max(0,y-240,top_bound),max(0,bottom_bound),room_height-480)
    if region_count=1 && view_set=0 {view_set = 1}
    //滚屏状态
    if ds_list_size(global.autoscrolls)>0 && global.scrollPaused = -1{
        firstscroll=ds_list_find_value(global.autoscrolls,0)
        if x>firstscroll.x+16-320&&x<firstscroll.x+16+320&&y>firstscroll.y+16-240&&y<firstscroll.y+16+240&&checkpointdetect=1{
            global.aktywowanykuppa=2
            if scrolldetect2=0{
                xcenter=firstscroll.x+16
                ycenter=firstscroll.y+16
            }else{
                xcenter=view_xview+320
                ycenter=view_yview+240
            }
        }
    }

    //CP后强滚
    if global.checkpoint=0{scrolldetect=1}
    if global.checkpoint<>0&&checkpointdetect=1 && scrolldetect=0 && ds_list_size(global.autoscrolls)>0{
        for(i=0;i<ds_list_size(global.autoscrolls);i+=1){
            tmpscroll=ds_list_find_value(global.autoscrolls,i)
            if x>tmpscroll.x+16-320&&x<tmpscroll.x+16+320&&y>tmpscroll.y+16-240&&y<tmpscroll.y+16+240{
                global.aktywowanykuppa=2
                firstscroll=tmpscroll
                if scrolldetect2=0{
                    xcenter=firstscroll.x+16
                    ycenter=firstscroll.y+16
                }else{
                    xcenter=view_xview+320
                    ycenter=view_yview+240
                }
                break;
            }
        }
    scrolldetect=1//本变量负责防止马里奥未传送到CP即停止CP强滚检测
    }
    if checkpointdetect<>0{scrolldetect2=1}//本变量负责判断是否开场在强滚区域内
}

if global.koopa_scroll_count>0 {global.aktywowanykuppa=1}

if global.scrollPaused = -1{

if global.aktywowanykuppa=1//库巴状态，触发库巴见库巴对应object代码
{
if instance_exists(o_kuppa) {if view_xview<o_kuppa.ixornik-320 && instance_number(o_skuszak)=0 && view_xview<room_width-640 {view_xview+=1;if x<=view_xview[0]+16 {x+=1; if place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock) {oberwal=1 ; shield=0 ; global.rodzajmaria=0}}}}
if instance_exists(o_kuppa) {if view_xview>o_kuppa.ixornik-320 && instance_number(o_skuszak)=0 && view_xview>0 {view_xview-=1;if x>=view_xview[0]+624 {x-=1; if place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock) {oberwal=1 ; shield=0 ; global.rodzajmaria=0}}}}
view_yview=min(max(y-240,0),room_height-480)
}

if global.aktywowanykuppa=2 && instance_number(o_skuszak)=0//滚屏至第一个滚屏obj
{
    //if tttest=0{show_message("bingo");tttest=1}
    xcenter+=cos(point_direction(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)/360*2*pi)*firstscroll.scrollspeed
    ycenter-=sin(point_direction(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)/360*2*pi)*firstscroll.scrollspeed
    view_xview=min(max(xcenter-320,0),room_width-640)
    view_yview=min(max(ycenter-240,0),room_height-480)
    if point_distance(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)<=firstscroll.scrollspeed*1.5{
        xcenter=firstscroll.x+16;ycenter=firstscroll.y+16
        global.aktywowanykuppa=3}
}

if global.aktywowanykuppa=3//好了开始激动人心的滚屏环节了
{
    if orange_recover=0 && ds_list_find_index(global.autoscrolls,firstscroll) < ds_list_size(global.autoscrolls) - 1 && instance_number(o_skuszak)=0
    {
        nextscroll = ds_list_find_value(global.autoscrolls,ds_list_find_index(global.autoscrolls,firstscroll)+1)
        xcenter+=cos(point_direction(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)/360*2*pi)*firstscroll.scrollspeed
        ycenter-=sin(point_direction(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)/360*2*pi)*firstscroll.scrollspeed
        if point_distance(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)<=firstscroll.scrollspeed*1.5{
        xcenter=nextscroll.x+16;ycenter=nextscroll.y+16
        if firstscroll.is_orange=1 && nextscroll.is_orange=0{
            // 橙→绿过渡：xcenter停在绿色节点，镜头平滑追上后再继续
            orange_recover=1
        }
        firstscroll=nextscroll
        }
    }else{
    nextscroll=firstscroll;
    }
    if instance_number(o_skuszak)=0{
    if orange_recover=1{
        // 橙→绿过渡：镜头以滚屏速度平滑移向绿色节点（xcenter已在节点位置等待）
        var rec_dir;
        rec_dir=point_direction(view_xview+320,view_yview+240,xcenter,ycenter)
        view_xview=min(max(view_xview+cos(rec_dir/360*2*pi)*firstscroll.scrollspeed,0),room_width-640)
        view_yview=min(max(view_yview-sin(rec_dir/360*2*pi)*firstscroll.scrollspeed,0),room_height-480)
        // 单轴对齐：某轴接近节点时直接赋值
        if abs(view_xview+320-xcenter)<=firstscroll.scrollspeed{view_xview=xcenter-320}
        if abs(view_yview+240-ycenter)<=firstscroll.scrollspeed{view_yview=ycenter-240}
        if point_distance(view_xview+320,view_yview+240,xcenter,ycenter)<=firstscroll.scrollspeed*1.5{
            view_xview=xcenter-320;view_yview=ycenter-240
            orange_recover=0
        }
    }else{
    // 橙色强滚：镜头X跟随玩家，Y由穿过xcenter的垂线约束（玩家Y不参与计算）
    if firstscroll.is_orange=1{
        if nextscroll!=firstscroll{
            osc_dx=nextscroll.x-firstscroll.x
            osc_dy=nextscroll.y-firstscroll.y
        }else{
            // 末尾节点：方向 = 上一→当前，控件不动但镜头继续锁此方向
            osc_dx=0;osc_dy=0
            osc_idx=ds_list_find_index(global.autoscrolls,firstscroll)
            if osc_idx>0{
                osc_prev=ds_list_find_value(global.autoscrolls,osc_idx-1)
                osc_dx=firstscroll.x-osc_prev.x
                osc_dy=firstscroll.y-osc_prev.y
            }
        }
        // 自适应阻尼弹簧过渡：仅用于初次追上玩家，收束后切回直接跟随
        // 检测滚屏方向是否改变 → 重置收束状态
        if osc_dx!=prev_osc_dx or osc_dy!=prev_osc_dy{
            spring_settled_x=0
            spring_settled_y=0
            prev_osc_dx=osc_dx
            prev_osc_dy=osc_dy
        }
        var k_safe,k_emergency,margin;
        k_safe=0.02
        k_emergency=0.20
        margin=80
        var screen_x,screen_y,danger_x,danger_y,k,d,target;
        screen_x=x-view_xview
        screen_y=y-view_yview
        danger_x=0
        danger_y=0
        if screen_x<margin{danger_x=1-screen_x/margin}
        if screen_x>640-margin{danger_x=max(danger_x,(screen_x-(640-margin))/margin)}
        if screen_y<margin{danger_y=1-screen_y/margin}
        if screen_y>480-margin{danger_y=max(danger_y,(screen_y-(480-margin))/margin)}
        if osc_dx!=0 and osc_dy!=0{
            // 一般斜向：X自由（弹簧→收束后直接跟），Y由垂线约束
            if spring_settled_x=0{
                target=clamp(x-320,0,room_width-640)
                k=k_safe+(k_emergency-k_safe)*danger_x
                d=2*sqrt(k)
                spring_vx+=k*(target-view_xview)-d*spring_vx
                view_xview+=spring_vx
                if abs(target-view_xview)<1 && abs(spring_vx)<1{
                    view_xview=target;spring_vx=0;spring_settled_x=1
                }
            }else{
                view_xview=clamp(x-320,0,room_width-640)
            }
            view_yview=clamp(ycenter-((view_xview+320-xcenter)*osc_dx)/osc_dy-240,0,room_height-480)
            spring_vy=0
        }else if osc_dy==0{
            // 纯水平：X锁定，Y自由（弹簧→收束后直接跟）
            view_xview=clamp(xcenter-320,0,room_width-640)
            spring_vx=0
            if spring_settled_y=0{
                target=clamp(y-240,0,room_height-480)
                k=k_safe+(k_emergency-k_safe)*danger_y
                d=2*sqrt(k)
                spring_vy+=k*(target-view_yview)-d*spring_vy
                view_yview+=spring_vy
                if abs(target-view_yview)<1 && abs(spring_vy)<1{
                    view_yview=target;spring_vy=0;spring_settled_y=1
                }
            }else{
                view_yview=clamp(y-240,0,room_height-480)
            }
        }else{
            // 纯垂直(dx==0)：X自由（弹簧→收束后直接跟），Y锁定
            if spring_settled_x=0{
                target=clamp(x-320,0,room_width-640)
                k=k_safe+(k_emergency-k_safe)*danger_x
                d=2*sqrt(k)
                spring_vx+=k*(target-view_xview)-d*spring_vx
                view_xview+=spring_vx
                if abs(target-view_xview)<1 && abs(spring_vx)<1{
                    view_xview=target;spring_vx=0;spring_settled_x=1
                }
            }else{
                view_xview=clamp(x-320,0,room_width-640)
            }
            view_yview=clamp(ycenter-240,0,room_height-480)
            spring_vy=0
        }
        view_xview=clamp(view_xview,0,room_width-640)
        view_yview=clamp(view_yview,0,room_height-480)
    }else{
        view_xview=min(max(xcenter-320,0),room_width-640)
        view_yview=min(max(ycenter-240,0),room_height-480)
    }
    }
}
}

if (global.aktywowanykuppa=2 && global.rodzajmaria<>5){//位置矫正1
    if instance_number(o_skuszak)=0 {if x<=view_xview[0] && !(place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock)) {x+=cos(point_direction(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)/360*2*pi)*firstscroll.scrollspeed}
        if x<view_xview[0]-16 && teleportacja=0 {oberwal=1 ; shield=0 ; global.rodzajmaria=0}}
    if instance_number(o_skuszak)=0 {if x>=view_xview[0]+640 && !(place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock)) {x+=cos(point_direction(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)/360*2*pi)*firstscroll.scrollspeed}
        if x>view_xview[0]+656 && teleportacja=0 {oberwal=1 ; shield=0 ; global.rodzajmaria=0}}
    if x>view_xview[0]+624 && !(place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock)){x=view_xview[0]+624;}
    if x<view_xview[0]+16 && !(place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock)){x=view_xview[0]+16;}
    if teledelay>=31{global.aktywowanykuppa=0}
}
if (global.aktywowanykuppa=3 && global.rodzajmaria<>5){//位置矫正2
    if instance_number(o_skuszak)=0 {if x<=view_xview[0] && !(place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock)) {x+=cos(point_direction(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)/360*2*pi)*firstscroll.scrollspeed}
        if x<view_xview[0]-16 && teleportacja=0 {oberwal=1 ; shield=0 ; global.rodzajmaria=0}}
    if instance_number(o_skuszak)=0 {if x>=view_xview[0]+640 && !(place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock)) {x+=cos(point_direction(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)/360*2*pi)*firstscroll.scrollspeed}
        if x>view_xview[0]+656 && teleportacja=0 {oberwal=1 ; shield=0 ; global.rodzajmaria=0}}
    if x>view_xview[0]+624 && !(place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock)){x=view_xview[0]+624;}
    if x<view_xview[0]+16 && !(place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock)){x=view_xview[0]+16;}
    if teledelay>=31{global.aktywowanykuppa=0}
}

}

if global.aktywowanykuppa=4{ //道中库巴战结束后的滚屏修正过程
    centerset=0{xcenter = view_xview+320;ycenter = view_yview+240;centerset=1}
    xcenter+=cos(point_direction(xcenter,ycenter,x,y)/360*2*pi)*3
    ycenter-=sin(point_direction(xcenter,ycenter,x,y)/360*2*pi)*3
    if point_distance(xcenter,ycenter,x,y)<=3*1.5{
        xcenter=x;ycenter=y
        global.pauza=0;
        global.aktywowanykuppa=0;
    }
    view_xview=min(max(xcenter-320,0),room_width-640)
    view_yview=min(max(ycenter-240,0),room_height-480)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=background
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
background_show()
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=level completed
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {

    // Normal Level Pass
    if global.fastpass=0 || global.gameversion <= 1711 {
        fast_time = 0;
    }
    // Faster Level Pass
    if global.fastpass=1 {
        fast_time = 300;
    }

if global.przeszedllevel>0 && global.przeszedllevel<1000-fast_time {global.przeszedllevel+=1}
if global.przeszedllevel>450-fast_time && prawdziwyczas>0 {prawdziwyczas-=1; global.punkty+=100;nabija+=1}
if global.przeszedllevel>500-fast_time && prawdziwyczas>9 {prawdziwyczas-=10; global.punkty+=1000;nabija+=1}
if global.przeszedllevel>650-fast_time && prawdziwyczas>99 {prawdziwyczas-=100; global.punkty+=10000;nabija+=1}

if nabija>5 {nabija=0; if global.sample=1 {fofo=sound_play(snd_nabija);sound_volume(snd_nabija,global.glosnosc)}}

if global.przeszedllevel>450-fast_time && global.przeszedllevel<1000-fast_time && prawdziwyczas<=0 {global.przeszedllevel=2000-fast_time}
if global.przeszedllevel>=2000-fast_time global.przeszedllevel+=1
if global.przeszedllevel>=2050-fast_time {global.etappokonany=0;
    if global.testmode=1{
    global.godmode=0;
    room_goto(editor_level)
    }else{
    room_goto(Another_Level)
    }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=NIE MA DWOCH MARIOW!
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_number(o_marker)>1 {instance_destroy()}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Pause
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Pause
if global.escowanie=0 && keyboard_check(vk_escape) {

if !variable_global_exists("testmode") {
    global.testmode=0
}

warning2=0;
warning3=0;

if global.testmode=0{
    warning2=show_question('Do you REALLY want to quit the level and go back to title screen???')
}
else{
    warning2=show_question('Do you REALLY want to quit the level and go back to edit screen???')
}

if warning2=1{
    if global.testmode=1{
        global.godmode=0;
        global.testout=1;
        file_text_close(global.toload);
        file_delete(global.toloader)
        room_goto(editor_level)
    }
    else{
        if global.currentlevel>0 && global.enablesave{warning3 = show_question('SAVE Progress?')}
        if warning3=1{Create_Save_File();}
        global.escowanie=1;
        file_text_close(global.toload);
        file_delete(global.toloader);
        room_goto(title);
        mm_stop_all_ext()
    }
}
else{exit}

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=light
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fofolight.x = x;
fofolight.y = y;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Energia Kuppy
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//血条：有最终koopa出现时才出现
if global.koopa_activated=2 {
  aktywowanamoza=1
  if instance_number(object112)=0 {fofoxx=instance_create(view_xview[0]+500,view_yview[0]-100,object112)} //object112是库巴血量条
  fofoxx.x=view_xview[0]+480
  fofoxx.y=view_yview[0]+barkup-60
  if barkup<120 barkup+=1

  if (global.huddisplay = 1) { fofoxx.visible = false;} else { fofoxx.visible = true; }
}

//库巴音乐：库巴滚屏启动时才播放，根据koopa_activated决定播放道中boss音乐还是最终boss音乐
/*if wlaczonykuppa=0 && global.aktywowanykuppa=1{
   wlaczonykuppa=1;
   if gwiadzka<=0{mm_stop_all_ext();global.muzyka=global.koopa_bgm;Music_Play();}
}*/


if global.paralax<>x {
    fangka = 1
    global.paralax2=x-global.paralax ;global.paralax=x;
    if x>320 && x<room_width-320 {global.paralax3+=global.paralax2/10}
    }
animator.x=x
animator.y=y


animator2.sprite_index=animator.sprite_index
animator2.image_index=animator.image_index
animator2.x=animator.x
animator2.y=animator.y
animator2.image_xscale=animator.image_xscale
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
if global.escowanie=0 && keyboard_check(vk_escape) {

if !variable_global_exists("testmode") {
    global.testmode=0
}

warning2=0;
warning3=0;

if global.testmode=0{
    warning2=show_question('Do you REALLY want to quit the level and go back to title screen???')
}
else{
    warning2=show_question('Do you REALLY want to quit the level and go back to edit screen???')
}

if warning2=1{
    if global.testmode=1{
        global.godmode=0;
        global.testout=1;
        file_text_close(global.toload);
        file_delete(global.toloader)
        room_goto(editor_level)
    }
    else{
        if global.currentlevel>0 && global.enablesave{warning3 = show_question('SAVE Progress?')}
        if warning3=1{Create_Save_File();}
        global.escowanie=1;
        file_text_close(global.toload);
        file_delete(global.toloader);
        room_goto(title);
        mm_stop_all_ext()
    }
}
else{exit}

}
*/


//cyferkimario是刚才定义的字体，下面这段显示关卡信息栏
draw_set_font(cyferkimario)
draw_set_color(c_white)

if global.huddisplay=0 || global.gameversion <= 1711
{
if global.godmode=0 && !global.levelsmooth=1 {draw_text(view_xview[0]+40,view_yview[0]+20,string(global.character_name)+string(global.zycia)) }//zycia是生命数
if global.godmode=1 && !global.levelsmooth=1 {draw_text(view_xview[0]+40,view_yview[0]+20,'GOD   '+string(global.zycia))}
if global.godmode=0 && global.levelsmooth=1 {draw_text(view_xview[0]+40,view_yview[0]+20,'SMOOTH '+string(global.zycia))}
if global.godmode=1 && global.levelsmooth=1 {draw_text(view_xview[0]+40,view_yview[0]+20,'GOD '+string(global.zycia))
draw_text(view_xview[0]+40,view_yview[0]+35,"(SMOOTH)")}
if global.godmode=1 && global.levelsmooth=1 {draw_text(view_xview[0]+40,view_yview[0]+50,string(global.punkty))}
else{draw_text(view_xview[0]+40,view_yview[0]+35,string(global.punkty))}//punkty是分数
if global.scrollPaused = 1 {draw_text(view_xview[0]+40,view_yview[0]+464,'SCROLL DISABLED ')}
else{draw_text(view_xview[0]+40,view_yview[0]+464,'')} //关闭滚屏的提示
if instance_exists(o_kuppa){
iii = 0;
  while(iii<instance_number(o_kuppa)){
      fofofo = instance_find(o_kuppa,iii)
      if fofofo.koopa_midboss_hp>0{
          draw_text(fofofo.x,fofofo.y-32,string(fofofo.koopa_midboss_hp));
      }
      iii+=1;
  }
}


draw_sprite(txt_coins,monetowanie,view_xview[0]+200,view_yview[0]+20)
draw_text(view_xview[0]+220,view_yview[0]+20,string(global.coins))  //金币不解释
monetowanie+=0.2  //上面那个金币小图案是动画，通过不断改变帧来实现动画

// v1.7.11.16 及以后开始支持自由 Level Title

if global.gameversion <= 1711 {
    // 旧版标题
    draw_text(view_xview[0]+400,view_yview[0]+20,'WORLD')

    draw_set_halign(fa_center)
    draw_text(view_xview[0]+430,view_yview[0]+35,string_upper(global.etapnazw))
    draw_set_halign(fa_left)
}
else {
    // 标题中“WORLD”一行可自定义修改
    var len, i, result0, result1;
    len = string_length(global.etapnazw);

    // 不使用array_create，直接初始化数组元素
    result0 = "";
    result1 = "";

    i = 1;

    // 直接内联拆分逻辑
    // 直接内联拆分逻辑
    while (i <= len) {
        if (string_char_at(global.etapnazw, i) == "#") {
            // 处理单独的#符号（排除被反斜杠转义的\#）
            // 检查当前#的前一个字符是否为反斜杠，如果是则视为转义，不拆分
            if (i == 1) {
                // 第一个字符是#，不可能有反斜杠前缀，直接视为单独#
                result0 = string_copy(global.etapnazw, 1, i-1); // 空字符串（因为i=1）
                result1 = string_copy(global.etapnazw, i+1, len - i);
                break;
            } else {
                // 非第一个字符，检查前一个字符是否为反斜杠
                if (string_char_at(global.etapnazw, i-1) != "\") {
                    // 前一个字符不是反斜杠，视为单独#
                    result0 = string_copy(global.etapnazw, 1, i-1);
                    result1 = string_copy(global.etapnazw, i+1, len - i);
                    break;
                }
            }
        }
    i += 1;
}

    // 如果未找到单独的#，使用完整标题作为第一行
    if (i > len) {
        result0 = global.etapnazw;
    }

    // 存储结果到全局变量
    global.level_title_new0 = result0;
    global.level_title_new1 = result1;

    // 绘制标题
    draw_set_halign(fa_center)
    draw_text(view_xview[0]+430-2,view_yview[0]+20,string_upper(global.level_title_new0))
    draw_set_halign(fa_left)

    if string_length(global.level_title_new1) > 0 {
        draw_set_halign(fa_center)
        draw_text(view_xview[0]+430,view_yview[0]+35,string_upper(global.level_title_new1))
        draw_set_halign(fa_left)
    }
}

if prawdziwyczas>=0{
draw_text(view_xview[0]+580+rork2,view_yview[0]+20+rork2,'TIME')

draw_set_halign(fa_center) //prawdziwyczas显示时间，那个rork和rork2是用来实现100单位的时候时间字体震动效果的
if prawdziwyczas>-1{
draw_text(view_xview[0]+600+rork2,view_yview[0]+35+rork2,string(prawdziwyczas))} else
{
draw_text(view_xview[0]+600+rork2,view_yview[0]+35+rork2,string(0))}
draw_set_halign(fa_left)
}

rork2=random(rork)-random(rork)
}

if teleportacja=0 {czasor+=1} //czasor是基本计时单位，每个绘制周期czasor增加1
if rork>0 rork-=0.1
if czasor>15 && prawdziwyczas>0 && global.przeszedllevel=0 && instance_number(o_skuszak)=0 && global.pauza!=3{czasor=0; prawdziwyczas-=1;} //每过16个绘制周期，czasor增加到16，这时候时间-1，然后czasor归零循环）
if prawdziwyczas>0&&prawdziwyczas<100 && czasoren=0 && global.przeszedllevel=0 {rork=10;czasoren=1;if global.sample=1 {fofo=sound_play(snd_timeover);sound_volume(snd_timeover,global.glosnosc)}} //100时间单位警报
if global.coins>99 {global.coins=0; global.zycia+=1;if global.sample=1 {fofo=sound_play(snd_1up);sound_volume(snd_1up,global.glosnosc)}} //100金币奖命音效
if prawdziwyczas=0 && global.przeszedllevel=0 {global.rodzajmaria=0; oberwal=1 ; shield=0} //时间归零死亡


if keyboard_check_pressed(vk_f2){
    global.beep=1-global.beep
    sound_text = 1
}

if sound_text>0{
    if !global.beep{draw_text(view_xview[0]+460,view_yview[0]+464,'SWITCH SOUND: OFF')}
    else{draw_text(view_xview[0]+460,view_yview[0]+464,'SWITCH SOUND: ON')}
    sound_text+=1;
}

if sound_text>60 {sound_text=0}

if keyboard_check_pressed(vk_f11) && global.smooth_allowed{
    global.newsmooth=1-global.newsmooth
    smooth_text = 1
}

if smooth_text>0{
    if !global.newsmooth{draw_text(view_xview[0]+32,view_yview[0]+464,'ENEMY OPTIMIZATION: OFF')}
    else{draw_text(view_xview[0]+32,view_yview[0]+464,'ENEMY OPTIMIZATION: ON')}
    smooth_text+=1;
}

if smooth_text>60 {smooth_text=0}

var line_spacing;
line_spacing = 24;
if keyboard_check(vk_f1){
    room_caption = '[Level Author]: ' + global.etapautor + ' (' + string(global.gameversion) + ')'
    draw_text(view_xview[0]+32,view_yview[0]+464 - line_spacing * 6, 'MODIFIED MOVEMENT: ' + yes_no(global.modifiedmov))
    draw_text(view_xview[0]+32,view_yview[0]+464 - line_spacing * 5, 'ADVANCED SWITCH: ' + yes_no(global.advswitch))
    draw_text(view_xview[0]+32,view_yview[0]+464 - line_spacing * 4, 'MF STYLE BEET: ' + yes_no(global.MFbeet))
    draw_text(view_xview[0]+32,view_yview[0]+464 - line_spacing * 3, 'CELESTE STYLE SWITCH: ' + yes_no(global.celeste))
    draw_text(view_xview[0]+32,view_yview[0]+464 - line_spacing * 2, 'ENEMY OPTIMIZATION: ' + yes_no(global.newsmooth))
    draw_text(view_xview[0]+32,view_yview[0]+464 - line_spacing * 1, 'MF STYLE PIPE EXIT: ' + yes_no(global.pipeout))
}
else{
    room_caption='Super Mario Worker Project '+global.versiontext;
}

// 上帝模式摄像机模式下显示玩家坐标
if (global.rodzajmaria=5) {
    draw_set_halign(fa_right)
    draw_text(view_xview[0]+640,view_yview[0]+468,'('+string(x)+','+string(y)+')')
    draw_set_halign(fa_left)
}
