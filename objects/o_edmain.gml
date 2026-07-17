#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

fw_release_cache(); //信息转字体缓存清理


/*test = transB(12005)
test2 = transB(23010)
test3 = transB(32000)
test4 = transB(15324)
test5 = transB(2324)*/
sizechange=0
x_trans=0
y_trans=0
x_new=0
y_new=0
global.autopair=1
global.fotel=0
global.fotel2=0
global.deletemode=-1

SXMS_C_Stop()
delayus=0
drinkability=0 //当前选择的类型（我就不信有人用这个当变量）
woder=0 //蛤？
chmurkir=0 //蛤？？
czywybieranieback=0
backselect=0
muzioj=0
muzior=0
muzior2=0
mousepress=0
defMessage=''
global.picking = false

if variable_global_exists('warpnum'){}
else
{global.warpnum=0}

wlaczony=1
efekt=0
opcja=0
wlaczonaopcja=0
kliknieto=0
scroolx=320
scrooly=240
ustawiony=0
costawia=0
costawia2=0
costawia2b=0
costawia3=0
costawia4=0
costawia4b=0
costawia4c=0
costawia5=0
costawia6=0
autopair=0
autopaircheck=0
backgroundpage=0
blockpage=-1
bgmpage=0

arrayetapu=0
//initializuj=0

for (i=0; i<room_width/32; i+=1)
    {
    for (a=0; a<room_height/32; a+=1)
        {
        arrayetapu[i,a]=0


        }

    }
sampelwyboru1=0


wiatrak=0
fofo=0


menujesie=0


cyferki=font_add_sprite(s_edfonts,ord('!'),1,0) // nastaw fonty


loadcheck1=0 // zmienna do wgrywania
loadcheck2=0 // zmienna do wgrywania
loadcheck3=0
loadcheck4=0
koko=0

instance_create(0,0,o_edwallsdrawer)
cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0)

scroll=0
drinka=0
drinkb=0
drinkc=0
drinkd=0

global.yinyangcolor=0
global.imitater=1
global.ledge_type = 0
setting_mode=0
resetting = 0
global.background=real(global.background)
global.local_background = global.background
global.local_muzyka = global.muzyka
inedit=1
global.water_change_type=0
global.preview=-1
show_solid=1
global.shell_type=0
global.spike_type=0

cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0)

draw_set_halign(fa_left)

listscroll = 0 //自定义音乐翻页变量

/*
// 天气（场景控制元件参数保留）
foforainy = global.rainy;
fofofallingstars = global.fallingstars;
fofosnowy = global.snowy;
fofothunder = global.thunder;
fofowindy = global.windy;
fofodarkness = global.darkness;
fofobrightness = global.brightness;
*/
globalvar foforainy;
globalvar fofofallingstars;
globalvar fofosnowy;
globalvar fofothunder;
globalvar fofowindy;
globalvar fofodarkness;
globalvar fofobrightness;

set_light_mode = false;
set_light_icon_alpha = 0.5;

// 视角缩放
zoom_ratio = 1;
ratio_level = 0;
last_ratio_level = ratio_level;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.muzyka=real(global.muzyka)
if keyboard_check_pressed(vk_f8) && global.musicon=1 {SXMS_C_Stop();global.musicon=2}
if keyboard_check_pressed(vk_f8) && global.musicon=0 {global.musicon=3}
if global.musicon=2 && !keyboard_check_pressed(vk_f8) {global.musicon=0}
if global.musicon=3 && !keyboard_check_pressed(vk_f8) {global.musicon=1}

global.autopair=real(global.autopair)
if keyboard_check_pressed(vk_f12) && global.autopair=1 {global.autopair=2}
if keyboard_check_pressed(vk_f12) && global.autopair=0 {global.autopair=3}
if global.autopair=2 && !keyboard_check_pressed(vk_f12) {global.autopair=0}
if global.autopair=3 && !keyboard_check_pressed(vk_f12) {global.autopair=1}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.paralax<>view_xview[0]+320 {global.paralax2=view_xview[0]+320-global.paralax ;global.paralax=view_xview[0]+320;
    if view_xview[0]+320>320 && view_xview[0]+320<room_width-320 {global.paralax3+=global.paralax2/10}}



if keyboard_check_pressed(vk_f6) && global.bgp=1 {global.bgp=2}
if global.bgp=2 && !keyboard_check_pressed(vk_f6) {global.bgp=0}
if keyboard_check_pressed(vk_f6) && global.bgp=0 {global.bgp=3}
if global.bgp=3 && !keyboard_check_pressed(vk_f6) {global.bgp=1}


if global.bgp=1 {
//显示4.4特有的10像素高度条
    background_visible[4]=1
    background_index[4]=background32
    background_htiled[4]=1
    background_vtiled[4]=0
    background_y[4]=room_height
//显示背景
    background_show()
}
else{
    background_index[0]=""
    background_index[1]=""
    background_index[2]=""
    background_index[3]=""
    background_index[4]=""
    background_visible[0]=0
    background_visible[1]=0
    background_visible[2]=0
    background_visible[3]=0
    background_visible[4]=0
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.smoothmode=1 && sizechange=0{
  instance_deactivate_all(true)
  instance_activate_region(view_xview[0]-999,view_yview[0]-999,640+999*2,480+999*2,true)
  instance_activate_object(o_edwallsdrawer)
  instance_activate_object(o_edpassage)
  instance_activate_object(o_acc)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if set_scenery{
    with(my_scenery){
    if coto=42{
        sprite_index = s_blocks
        image_index = block_index
        image_alpha = 1
    }
    else{
        if coto!=38{
            sprite_index = s_sceneriesbank
            image_index = coto-1
        }
        else{depth=5;sprite_index = s_edrotocenter;}
    }
    }
    set_scenery = 0;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.testout=1{    //自动回到测试前位置
    scroolx = global.xviewtemp
    scrooly = global.yviewtemp
    global.testout=0
}

// 视角缩放
target_zooms[0] = 1;
target_zooms[1] = 2;
target_zooms[2] = 3;
target_zooms[3] = 4;
target_zooms[4] = 5;
target_zooms[5] = 6;
target_zooms[6] = 7;
target_zooms[7] = 8;

if wlaczony != 1 && wlaczonaopcja == 0 {
    if (keyboard_check_pressed(189) || (keyboard_check(vk_control) && mouse_wheel_up())) && ratio_level < 7 {
        next_zoom_ratio = target_zooms[ratio_level + 1];
        next_view_wview = 640 * next_zoom_ratio;
        next_view_hview = 480 * next_zoom_ratio;
        if next_view_wview <= room_width && next_view_hview <= room_height {
            ratio_level += 1;
        }
    } else if (keyboard_check_pressed(187) || (keyboard_check(vk_control) && mouse_wheel_down())) && ratio_level > 0 {
        ratio_level -= 1;
    }
}

if last_ratio_level != ratio_level {
    var new_zoom, new_w, new_h;
    last_ratio_level = ratio_level;
    new_zoom = target_zooms[ratio_level];
    new_w = 640 * new_zoom;
    new_h = 480 * new_zoom;

    if scroolx < new_w / 2 {
        scroolx = round((new_w / 2) / 32) * 32;
    } else if scroolx > room_width - new_w / 2 {
        scroolx = ((room_width - new_w / 2) / 32) * 32;
    }

    if scrooly < new_h / 2 {
        scrooly = round((new_h / 2) / 32) * 32 - 16;
    } else if scrooly > room_height - new_h / 2 {
        scrooly = ((room_height - new_h / 2) / 32) * 32 - 16;
    }

    sound_play(snd_zoom);
    sound_volume(snd_zoom, global.glosnosc);
}

target_zoom = target_zooms[ratio_level];
zoom_ratio += (target_zoom - zoom_ratio) * 0.4;

view_wview[0] = 640 * zoom_ratio;
view_hview[0] = 480 * zoom_ratio;
view_xview[0] = round(min(room_width - 640 * zoom_ratio, max(0, scroolx - 320 * zoom_ratio)) / 32) * 32;
view_yview[0] = round(min(room_height - 480 * zoom_ratio, max(0, scrooly - 240 * zoom_ratio)) / 32) * 32;
if variable_global_exists('script_kile'){
if real(global.script_kile)= 1
{Load_Script_Masta();global.script_kile=-1}
}

if !first_set_scenery{
    with(o_edsceneriesblock){
    if coto=42{
        sprite_index = s_blocks
        image_index = block_index
        image_alpha = 0.4
    }
    else{
        if coto!=38{
            sprite_index = s_sceneriesbank
            image_index = coto-1
        }
        else{depth=5;sprite_index = s_edrotocenter;}
    }
    }
    first_set_scenery=1
}

if costawia3 = 42 && change_alpha = 0{
    with(o_edsceneriesblock){if(coto=42)image_alpha = 1}
    change_alpha = 1
}

if costawia3 <> 42 && change_alpha = 1{
    with(o_edsceneriesblock){if(coto=42)image_alpha = 0.3}
    change_alpha = 0
}
#define Keyboard_37
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if scroolx>view_wview[0]/2 && !keyboard_check(global.key_select){scroolx-=32}
#define Keyboard_38
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if scrooly>view_hview[0]/2 && !keyboard_check(vk_shift) && !keyboard_check(global.key_select) {scrooly-=32}
#define Keyboard_39
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if scroolx<room_width-view_wview[0]/2 && !keyboard_check(global.key_select) {scroolx+=32}
#define Keyboard_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if scrooly<room_height-view_hview[0]/2 && !keyboard_check(vk_shift) && !keyboard_check(global.key_select)  {scrooly+=32}
#define Keyboard_65
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if scroolx>view_wview[0]/2 && !keyboard_check(global.key_select){scroolx-=32}
#define Keyboard_68
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if scroolx<room_width-view_wview[0]/2 && !keyboard_check(global.key_select) {scroolx+=32}
#define Keyboard_83
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if scrooly<room_height-view_hview[0]/2 && !keyboard_check(vk_shift) && !keyboard_check(global.key_select)  {scrooly+=32}
#define Keyboard_87
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if scrooly>view_hview[0]/2 && !keyboard_check(vk_shift) && !keyboard_check(global.key_select) {scrooly-=32}
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_number(o_marker)>1 {instance_destroy()}




for (i = 0; i < ceil(view_wview[0] / 640); i += 1) {
    if (global.lava){draw_sprite_ext(s_biglava,0,view_xview[0]+i*640,global.poziomwody,1,1,0,c_white,0.4)}
    else{draw_sprite_ext(s_woda,0,view_xview[0]+i*640,global.poziomwody,1,1,0,c_white,0.4)}
}
if keyboard_check(vk_add){global.poziomwody-=4}
if keyboard_check(vk_subtract){global.poziomwody+=4}
if keyboard_check(vk_shift) && keyboard_check(vk_up) {global.poziomwody-=4}
if keyboard_check(vk_shift) && keyboard_check(vk_down) {global.poziomwody+=4}
/*
// initializacja

if initializuj=0 {initializuj=1;

for (i=0; i<room_width/32; i+=1)
    {
    for (a=0; a<room_height/32; a+=1)
        {
        arrayetapu[i,a]=0


        }

    }
arrayetapu[0,0]=1
arrayetapu[1,0]=1
arrayetapu[2,0]=1
arrayetapu[3,0]=1
arrayetapu[4,0]=1
arrayetapu[5,0]=1
arrayetapu[6,0]=1
arrayetapu[7,0]=1
arrayetapu[8,0]=1
arrayetapu[9,0]=1
arrayetapu[10,0]=1
arrayetapu[11,0]=1
arrayetapu[12,0]=1
arrayetapu[13,0]=1
arrayetapu[14,0]=1
arrayetapu[15,0]=1
arrayetapu[16,0]=1
arrayetapu[17,0]=1
arrayetapu[18,0]=1
arrayetapu[19,0]=1
arrayetapu[20,0]=1
arrayetapu[21,0]=1
arrayetapu[22,0]=1
arrayetapu[23,0]=1
arrayetapu[24,0]=1
arrayetapu[25,0]=1

}
// rysowanie
var i,a;
for (i=0; i<20; i+=1)
    {
    for (a=0; a<15; a+=1)
        {
        draw_sprite_ext(s_blocks,arrayetapu[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)],view_xview[0]+i*32,view_yview[0]+a*32,1,1,0,c_white,1)
        }
    }
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check_released(global.key_pick) {global.picking = false}

quitbgpselect=0
quitbgmselect=0
quitweatherselect=0

// PREFS
global.save=0  //非保存状态

if scrolla<=1 && scrollb<=1 {
if wlaczonaopcja=6 && czywybieranieback=0  //wlaczonaopcja表示工具栏中block，buddie，scenery，marks，bonus，prefs的某一项，6对应pref
//czywybieranieback是啥
    {
    draw_set_blend_mode(bm_subtract)
    draw_sprite_ext(s_edenemiesmask,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
    draw_set_blend_mode(bm_normal)
    draw_sprite_ext(s_edprefs,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
    }
    costawia6=0
       //costawia6记录pref栏鼠标选中的项目（如关卡名，作者名等，不同的项目用不同的数字代表；相应的，costawia5记录bonus栏鼠标选中的项目，以此类推）
       //下面这一大段，分别实现pref窗口下各个项目被鼠标选中时"高亮"的效果，并且记录"选中状态"，为判断鼠标单击时发生什么事件做准备。
  if wlaczonaopcja=6 && mouse_x>view_xview[0]+220 && mouse_x<view_xview[0]+350 &&
    mouse_y>view_yview[0]+117 && mouse_y<view_yview[0]+134 && czywybieranieback=0
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_prefsanim,0,view_xview[0]+220,view_yview[0]+117,1,1,0,c_white,0.2)
    draw_set_blend_mode(bm_normal)
    costawia6=1
    costawia=0
    costawia2=0
    //costawia3=0
    =0
    costawia5=0
    }//关卡名栏
  if wlaczonaopcja=6 && mouse_x>view_xview[0]+220 && mouse_x<view_xview[0]+350 &&
    mouse_y>view_yview[0]+140 && mouse_y<view_yview[0]+157 && czywybieranieback=0
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_prefsanim,0,view_xview[0]+220,view_yview[0]+140,1,1,0,c_white,0.2)
    draw_set_blend_mode(bm_normal)
    costawia6=2
    costawia=0
    costawia2=0
    //costawia3=0
    costawia4=0
    costawia5=0
    }//关卡作者栏
  if wlaczonaopcja=6 && mouse_x>view_xview[0]+220 && mouse_x<view_xview[0]+350 &&
    mouse_y>view_yview[0]+186 && mouse_y<view_yview[0]+203 && czywybieranieback=0
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_prefsanim,0,view_xview[0]+220,view_yview[0]+186,1,1,0,c_white,0.2)
    draw_set_blend_mode(bm_normal)
    costawia6=3
        costawia=0
    costawia2=0
    //costawia3=0
    costawia4=0
    costawia5=0
    }//
  if wlaczonaopcja=6 && mouse_x>view_xview[0]+220 && mouse_x<view_xview[0]+350 &&
    mouse_y>view_yview[0]+209 && mouse_y<view_yview[0]+226 && czywybieranieback=0
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_prefsanim,0,view_xview[0]+220,view_yview[0]+209,1,1,0,c_white,0.2)
    draw_set_blend_mode(bm_normal)
    costawia6=4
    costawia=0
    costawia2=0
    //costawia3=0
    costawia4=0
    costawia5=0
    }
  if wlaczonaopcja=6 && mouse_x>view_xview[0]+220 && mouse_x<view_xview[0]+350 &&
    mouse_y>view_yview[0]+232 && mouse_y<view_yview[0]+248 && czywybieranieback=0
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_prefsanim,0,view_xview[0]+220,view_yview[0]+232,1,1,0,c_white,0.2)
    draw_set_blend_mode(bm_normal)
    costawia6=5
        costawia=0
    costawia2=0
    //costawia3=0
    costawia4=0
    costawia5=0
    }
  if wlaczonaopcja=6 && mouse_x>view_xview[0]+220 && mouse_x<view_xview[0]+300-40 &&
    mouse_y>view_yview[0]+278 && mouse_y<view_yview[0]+295 && czywybieranieback=0
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_prefsanim,0,view_xview[0]+220-5,view_yview[0]+278,0.4,1,0,c_white,0.2)
    draw_set_blend_mode(bm_normal)
    costawia6=6
        costawia=0
    costawia2=0
    //costawia3=0
    costawia4=0
    costawia5=0
    }
  if wlaczonaopcja=6 && mouse_x>view_xview[0]+220 && mouse_x<view_xview[0]+300-40 &&
    mouse_y>view_yview[0]+300 && mouse_y<view_yview[0]+317 && czywybieranieback=0
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_prefsanim,0,view_xview[0]+220-12,view_yview[0]+300,0.5,1,0,c_white,0.2)
    draw_set_blend_mode(bm_normal)
    costawia6=7
        costawia=0
    costawia2=0
    //costawia3=0
    costawia4=0
    costawia5=0
    }
      if wlaczonaopcja=6 && mouse_x>view_xview[0]+220 && mouse_x<view_xview[0]+300-40 &&
    mouse_y>view_yview[0]+322 && mouse_y<view_yview[0]+339 && czywybieranieback=0
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_prefsanim,0,view_xview[0]+220-5,view_yview[0]+322,0.4,1,0,c_white,0.2)
    draw_set_blend_mode(bm_normal)
    costawia6=13
        costawia=0
    costawia2=0
    //costawia3=0
    costawia4=0
    costawia5=0
    }

  if wlaczonaopcja=6 && mouse_x>view_xview[0]+281 && mouse_x<view_xview[0]+402 &&
    mouse_y>view_yview[0]+278 && mouse_y<view_yview[0]+295 && czywybieranieback=0
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_prefsanim,0,view_xview[0]+275,view_yview[0]+278,1.2,1,0,c_white,0.2)
    draw_set_blend_mode(bm_normal)
    costawia6=9
        costawia=0
    costawia2=0
    //costawia3=0
    costawia4=0
    costawia5=0
    }
  if wlaczonaopcja=6 && mouse_x>view_xview[0]+281 && mouse_x<view_xview[0]+402 &&
    mouse_y>view_yview[0]+300 && mouse_y<view_yview[0]+317 && czywybieranieback=0
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_prefsanim,0,view_xview[0]+275,view_yview[0]+300,1,1,0,c_white,0.2)
    draw_set_blend_mode(bm_normal)
    costawia6=10
        costawia=0
    costawia2=0
    //costawia3=0
    costawia4=0
    costawia5=0
    }

  if wlaczonaopcja=6 && mouse_x>view_xview[0]+281 && mouse_x<view_xview[0]+432 &&
    mouse_y>view_yview[0]+322 && mouse_y<view_yview[0]+339 && czywybieranieback=0
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_prefsanim,0,view_xview[0]+275,view_yview[0]+322,1.3,1,0,c_white,0.2)
    draw_set_blend_mode(bm_normal)
    costawia6=11
        costawia=0
    costawia2=0
    //costawia3=0
    costawia4=0
    costawia5=0
    }

  if wlaczonaopcja=6 && mouse_x>view_xview[0]+220 && mouse_x<view_xview[0]+300-40 &&
    mouse_y>view_yview[0]+346 && mouse_y<view_yview[0]+364 && czywybieranieback=0
    {
    draw_set_blend_mode(bm_add)
    draw_sprite_ext(s_prefsanim,0,view_xview[0]+220-5,view_yview[0]+346,0.4,1,0,c_white,0.2)
    draw_set_blend_mode(bm_normal)
    costawia6=8
        costawia=0
    costawia2=0
    //costawia3=0
    costawia4=0
    costawia5=0
    }//这里目测是作者脑抽或者后来补上去的，前面跳过了costawia6=8这项

  if wlaczonaopcja=6 && czywybieranieback=0 //这段实现关卡名、重力参数等数据在pref界面上的显示
    {
    draw_set_font(cyferki)
    draw_set_color(c_white)
    if string_length(global.etapnazwa)>32 {draw_text(view_xview[0]+350,view_yview[0]+117,string_insert('(see more)',string_copy(global.etapnazwa,1,32),33))}
    else{draw_text(view_xview[0]+350,view_yview[0]+117,global.etapnazwa)}
    draw_text(view_xview[0]+350,view_yview[0]+140,global.etapautor)

    draw_text(view_xview[0]+350,view_yview[0]+186,global.etapczas)
    draw_text(view_xview[0]+350,view_yview[0]+209,global.etapgravity)
    draw_text(view_xview[0]+350,view_yview[0]+232,global.etapkuppa)
    }
    if costawia6=1 && mouse_check_button(mb_left) &&     kliknieto=0  //如果鼠标点击关卡名，则弹出窗口设置关卡名
    {
    kliknieto=1
    global.etapnazwa=get_string('Please type the name of your level.',global.etapnazwa)
    global.etapnazwa=string_copy(global.etapnazwa,0,2000)
    }
if costawia6=2 && mouse_check_button(mb_left) && kliknieto=0 && czywybieranieback=0  //如果鼠标点击关卡作者，则弹出窗口设置作者名，下面同理就不说了
    {
    kliknieto=1
    global.etapautor=get_string('Please type your name. Max 16 lenght.',global.etapautor)
    global.etapautor=string_copy(global.etapautor,0,16)
    }
if costawia6=3 && mouse_check_button(mb_left) && kliknieto=0 && czywybieranieback=0
    {
    kliknieto=1
    global.etapczas=get_integer('Please enter value of time. Max 10000.',global.etapczas)
    if global.etapczas>10000 global.etapczas=10000
    }
if costawia6=4 && mouse_check_button(mb_left) && kliknieto=0 && czywybieranieback=0
    {
    kliknieto=1
    global.etapgravity=get_integer('Please enter value.',global.etapgravity)
    }
if costawia6=5 && mouse_check_button(mb_left) && kliknieto=0 && czywybieranieback=0
    {
    kliknieto=1
    global.etapkuppa=get_integer('Please enter value',global.etapkuppa)
    }
message_button(s_guibutton)


// NAGRYWANIE
if costawia6=6 && mouse_check_button(mb_left) && kliknieto=0 && czywybieranieback=0
    {
    Save_Script_Main()
    if global.autosavename!=''{
    show_message("level saved")}
        costawia6=0
    }
if costawia6=7 && mouse_check_button(mb_left) && kliknieto=0 && czywybieranieback=0
    {
    global.autosavename=''
    Save_Script_Main()
    costawia6=0
    }
// WGRYWANIE
if costawia6=13 && mouse_check_button(mb_left) && kliknieto=0 && czywybieranieback=0
    {var warning; warning=show_question('Do you REALLY want to load a level WITHOUT the current level saved???')
    if warning=1 {
    global.autosavename='';Load_Script_Main()}
    if warning=0 {exit}
    }

    if costawia6=8 && mouse_check_button(mb_left) && kliknieto=0 && czywybieranieback=0
    {var warning2; warning2=show_question('Do you REALLY want to quit WITHOUT the current level saved???')
    if warning2=1 {
    with(o_edwallsdrawer){instance_destroy()}//抽风什么的都给劳资去死
    with(o_edbonusesblock){instance_destroy()}
    with(o_edbrowser){instance_destroy()}
    with(o_edenemyblock){instance_destroy()}
    with(o_edmarkerblock){instance_destroy()}
    with(o_edpassage){instance_destroy()}
    with(o_edsceneriesblock){instance_destroy()}
    room_goto(title);global.autosavename=''}
    if warning2=0 {exit}
    }
if costawia6=9 && mouse_check_button(mb_left) && kliknieto=0 && czywybieranieback=0
    {
    czywybieranieback=1;kliknieto=1
    }

if costawia6=10 && mouse_check_button(mb_left) && kliknieto=0 && czywybieranieback=0
    {
    czywybieranieback=100;kliknieto=1
    }

if costawia6=11 && mouse_check_button(mb_left) && kliknieto=0 && czywybieranieback=0
    {
    czywybieranieback=1000;kliknieto=1
    }


//o_edadmin.loadcheck1=0
//loadcheck2=0
//loadcheck3=0
//loadcheck4=0
delayus+=1 //此变量防止炮台/实心等摆放失控。什么嘛玩意！意思不能自己猜吗？——WSW留

// BONUS项
if wlaczonaopcja=5//下面四行红字用于显示bonus栏的界面
    {
    draw_set_blend_mode(bm_subtract)
    draw_sprite_ext(s_edenemiesmask,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
    draw_set_blend_mode(bm_normal)
    draw_sprite_ext(s_edbonuses,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
    }
// 第一行bonus
    if wlaczonaopcja=5 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110 && mouse_y<view_yview[0]+174 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110,1,1,0,c_white,1)}
    if wlaczonaopcja=5 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110 && mouse_y<view_yview[0]+174 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=floor(1+(mouse_x-(view_xview[0]+206))/64)//这里通过计算鼠标坐标判断点中了哪个bonus，并据此计算bonus的代号。（1～6）
    autopair=0 //怨念残留喝了
    costawia6=0
    }//这里解释一下上面提到的几个变量。kliknieto用来记录鼠标是否已经点选，=0表示没有，=1表示有，用来避免按住左键连点的情况（？）；samplewyboru1用来控制点击时产生的音效，ustawiony不是很明白是什么。）
//第二行bonus
    if wlaczonaopcja=5 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64 && mouse_y<view_yview[0]+174+64 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64,1,1,0,c_white,1)}
    if wlaczonaopcja=5 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64 && mouse_y<view_yview[0]+174+64 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=floor(1+(mouse_x-(view_xview[0]+206))/64)+6//（同理计算代号，这次是第二行，7～12）
    autopair=0 //怨念残留喝了
    costawia6=0
    }
    if wlaczonaopcja=5 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64*2 && mouse_y<view_yview[0]+174+64*2 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*2,1,1,0,c_white,1)}
    if wlaczonaopcja=5 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64*2 && mouse_y<view_yview[0]+174+64*2 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6+6
    autopair=0 //怨念残留喝了
    costawia6=0
    }

    if wlaczonaopcja=5 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64*3 && mouse_y<view_yview[0]+174+64*3 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*3,1,1,0,c_white,1)}
    if wlaczonaopcja=5 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64*3 && mouse_y<view_yview[0]+174+64*3 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6
    autopair=0 //怨念残留喝了
    costawia6=0
    }

//下面是关键，执行物品放置。
    if costawia5<>0 && delayus>15 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_edbonusbank,costawia5-1,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if costawia5<>0 && delayus>15 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && setting_mode == 0 //costawia5<>0表示选中了某个bonus，比如非隐藏绿果（编号是3）
        {
        if self_coto_check(5,costawia5){
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edbonusesblock)
        fofo.coto=costawia5
        }
        }//fofo是作者用来指? 在编辑界面上创建了的bonus（比如非隐藏绿果，给这个fofo定义一个叫做coto的变量来记录他的代号，令coto=costawia5，在本例中绿果的代号是3，所以coto=3）
    //delete bonus only when bonus is selected
    if costawia5<>0 && kliknieto=0 && mouse_check_button(mb_right) /*&& mouse_x>0 &&  mouse_y>0*/ && instance_position(mouse_x,mouse_y,o_edbonusesblock) && costawia4b=0 && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
        {
        fofo=instance_position(mouse_x,mouse_y,o_edbonusesblock)
        with(fofo){instance_destroy()}
        }//右键删除



// SCENERIA 自己类比bonus类，有重要的内容再说，其余的我懒得写了（
if wlaczonaopcja=3
    {
    draw_set_blend_mode(bm_subtract)
    draw_sprite_ext(s_edenemiesmask,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
    draw_set_blend_mode(bm_normal)
    draw_set_blend_mode(bm_normal)
    if costawia3b=0{draw_sprite_ext(s_edscenery,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)}
    if costawia3b=1{draw_sprite_ext(s_edscenery,1,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)}
    if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 {draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+384,1,1,0,c_yellow,1)}else{draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+384,1,1,0,c_white,1)}
    if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+384,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+384,1,1,0,c_white,1)}
    if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 && mouse_check_button(mb_left) {
        if o_edmain.costawia3b=1{o_edmain.costawia3b=0}
    }
    if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 && mouse_check_button(mb_left) {
        if o_edmain.costawia3b=0{o_edmain.costawia3b=1}
    }
    //模仿者预览
    if costawia3b=1{draw_sprite(s_blocks,global.imitater,view_xview[0]+224+64*5-2,view_yview[0]+128+128-2)}
    if mouse_wheel_up() && global.imitater>1 && costawia3b=1 && mouse_y>view_yview[0]+128+64*2-16 && mouse_y<view_yview[0]+128+64*2+48{//鼠标滚轮向上
        if(global.imitater=274){global.imitater-=22}
        else{global.imitater-=1}
    }
    if mouse_wheel_down() && global.imitater<sprite_get_number(s_blocks) && costawia3b=1 && mouse_y>view_yview[0]+128+64*2-16 && mouse_y<view_yview[0]+128+64*2+48{//鼠标滚轮向下
        if(global.imitater=252){global.imitater+=22}
        else{global.imitater+=1}
    }

    }

if wlaczonaopcja=3 && costawia3b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110 && mouse_y<view_yview[0]+174 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110,1,1,0,c_white,1)}
if wlaczonaopcja=3 && costawia3b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110 && mouse_y<view_yview[0]+174 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=floor(1+(mouse_x-(view_xview[0]+206))/64)
    autopair=0 //怨念残留喝了
    costawia5=0
    costawia6=0
    costawia4=0
    }
if wlaczonaopcja=3 && costawia3b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64 && mouse_y<view_yview[0]+174+64 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64,1,1,0,c_white,1)}
if wlaczonaopcja=3 && costawia3b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64 && mouse_y<view_yview[0]+174+64 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=floor(1+(mouse_x-(view_xview[0]+206))/64)+6
    autopair=0 //怨念残留喝了
    costawia4=0
    costawia5=0
    costawia6=0
    }
if wlaczonaopcja=3 && costawia3b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64+64 && mouse_y<view_yview[0]+174+64+64 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64+64,1,1,0,c_white,1)}
if wlaczonaopcja=3 && costawia3b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64+64 && mouse_y<view_yview[0]+174+64+64 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=real(string_copy('13 22 23 24 14 15',floor((mouse_x-(view_xview[0]+206))/64)*3+1,2))
    autopair=0 //怨念残留喝了
    costawia4=0
    costawia5=0
    costawia6=0
    }
 if wlaczonaopcja=3 && costawia3b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64+64+64 && mouse_y<view_yview[0]+174+64+64+64 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64+64+64,1,1,0,c_white,1)}
if wlaczonaopcja=3 && costawia3b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64+64+64 && mouse_y<view_yview[0]+174+64+64+64 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=real(string_copy('19 20 21 16 17 18',floor((mouse_x-(view_xview[0]+206))/64)*3+1,2))
    autopair=0 //怨念残留喝了
    costawia4=0
    costawia5=0
    costawia6=0
    }


    if wlaczonaopcja=3 && costawia3b=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110 && mouse_y<view_yview[0]+174 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110,1,1,0,c_white,1)}
if wlaczonaopcja=3 && costawia3b=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110 && mouse_y<view_yview[0]+174 && mouse_check_button(mb_left) && kliknieto=0
      {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=floor(1+(mouse_x-(view_xview[0]+206))/64)+24
    autopair=0 //怨念残留喝了
    costawia4=0
    costawia5=0
    costawia6=0
    }

    if wlaczonaopcja=3 && costawia3b=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64 && mouse_y<view_yview[0]+174+64 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64,1,1,0,c_white,1)}
if wlaczonaopcja=3 && costawia3b=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64 && mouse_y<view_yview[0]+174+64 && mouse_check_button(mb_left) && kliknieto=0
      {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=floor(1+(mouse_x-(view_xview[0]+206))/64)+24+6
    autopair=0 //怨念残留喝了
    costawia4=0
    costawia5=0
    costawia6=0
    }
    if wlaczonaopcja=3 && costawia3b=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64+64 && mouse_y<view_yview[0]+174+64+64 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64+64,1,1,0,c_white,1)}
if wlaczonaopcja=3 && costawia3b=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64+64 && mouse_y<view_yview[0]+174+64+64 && mouse_check_button(mb_left) && kliknieto=0
      {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=floor(1+(mouse_x-(view_xview[0]+206))/64)+24+6+6
    autopair=0 //怨念残留喝了
    costawia4=0
    costawia5=0
    costawia6=0
    }




/*
if costawia3<>0 && costawia3<>20 && costawia3!=35 && costawia3<42 && kliknieto=0 && mouse_x>0 &&  mouse_y>0 &&  wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_sceneriesbank,costawia3-1,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

if costawia3<>0 && costawia3<>20 && costawia3!=35 && costawia3<42 && kliknieto=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0 && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {
    if self_coto_check(3,costawia3){
        kliknieto=1
        my_scenery=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edsceneriesblock)
        my_scenery.coto=costawia3
        set_scenery=1
    }
    }
*/
//景物可以连放
if costawia3<>0 && costawia3<42 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edsceneriesblock) &&  wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {draw_sprite_ext(s_sceneriesbank,costawia3-1,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

if costawia3<>0 && costawia3<42 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {
    if self_coto_check(3,costawia3){
        kliknieto=1
        my_scenery=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edsceneriesblock)
        my_scenery.coto=costawia3
        set_scenery=1
    }
    }

if costawia3=42 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {
        draw_sprite_ext(s_blocks,global.imitater,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)
        if mouse_wheel_up() && global.imitater>1{//鼠标滚轮向上
            if(global.imitater=274){global.imitater-=22}
            else{global.imitater-=1}
        }
        if mouse_wheel_down() && global.imitater<sprite_get_number(s_blocks){//鼠标滚轮向下
            if(global.imitater=252){global.imitater+=22}
            else{global.imitater+=1}
        }
        if  keyboard_check_pressed(global.key_pick) && autopair3=0 {
            if arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]>0{
                if global.sample=1 {lololo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}
                global.imitater = arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]
                autopair = 0
            }
            else if(instance_position(mouse_x,mouse_y,o_edsceneriesblock)){
                fofo = instance_position(mouse_x,mouse_y,o_edsceneriesblock)
                if fofo.coto=42{
                    if global.sample=1 {lololo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}
                    global.imitater = fofo.block_index
                    autopair = 0
                }
            }
        }
    }


if costawia3<>0 && costawia3=42 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {
    if (self_coto_check(3,42)){
        kliknieto=1
        my_scenery=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edsceneriesblock)
        my_scenery.coto=42
        my_scenery.block_index = global.imitater
        set_scenery=1
    }
    }//imitater

if costawia3<>0 && kliknieto=0 && mouse_check_button(mb_right) /*&& mouse_x>0 &&  mouse_y>0*/ && instance_position(mouse_x,mouse_y,o_edsceneriesblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {
       tester = instance_position(mouse_x,mouse_y,o_edsceneriesblock);
       if(delete_coto_check(3,costawia3,tester.coto)){
           with(tester){instance_destroy();}
       }
       else{
           with(o_edsceneriesblock){
           if(delete_coto_check(3,other.costawia3,coto) && instance_position(mouse_x,mouse_y,id))instance_destroy();
           }
       }
    }





//         MARKERY 重头戏，marks
// wyswietlanie tablicy z markerami
if wlaczonaopcja=4
{
    draw_set_blend_mode(bm_subtract)
    draw_sprite_ext(s_edenemiesmask,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
    draw_set_blend_mode(bm_normal)
    if costawia4b=0{draw_sprite_ext(s_edmarkers,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)}
    //if costawia4b=1{draw_sprite_ext(s_edmarkers,1,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)}
    //桥预览
    draw_sprite(s_platformmasks,global.platformanime,view_xview[0]+400+61,view_yview[0]+240+239)
    draw_sprite(s_platformmasks,global.platformanime,view_xview[0]+400+126,view_yview[0]+240+236)
    draw_sprite(s_platformmasks,global.platformanime,view_xview[0]+400+190,view_yview[0]+240+236)
    draw_sprite(s_platformmasks,global.platformanime,view_xview[0]+400+253,view_yview[0]+240+236)
    draw_sprite(s_platformmasks,global.platformanime,view_xview[0]+400+316,view_yview[0]+240+233)
    draw_sprite(s_platformmasks,global.platformanime,view_xview[0]+400+381,view_yview[0]+240+231)
    //解密砖预览
    draw_sprite(s_switchmasks,global.yinyangcolor+8*global.assist,view_xview[0]+224+64*3,view_yview[0]+128+64)
    draw_sprite(s_yinmasks,global.yinyangcolor+8*global.assist,view_xview[0]+224+64*4,view_yview[0]+128+64)
    draw_sprite(s_yangmasks,global.yinyangcolor+8*global.assist,view_xview[0]+224+64*5,view_yview[0]+128+64)
    //半实心预览
    draw_sprite(s_ledgemasks,global.ledge_type,view_xview[0]+224+64,view_yview[0]+128+128)
    //水位砖预览
    if(global.water_change_type<2){draw_sprite(s_waterchangemasks,global.water_change_type+2*global.lava,view_xview[0]+224+128,view_yview[0]+128+128)}
    else{draw_sprite(s_waterchangemasks,4,view_xview[0]+224+128,view_yview[0]+128+128)}
    //遮罩绘制
    draw_sprite_ext(s_edmarkersmask,0,view_xview[0]+400+31,view_yview[0]+240+207,1,1,0,c_white,1)
    //滚轮切换样式设计
    if mouse_wheel_up() && global.platformanime>0 && mouse_y>view_yview[0]+128+64*3-16 && mouse_y<view_yview[0]+128+64*3+48{//鼠标滚轮向上
        global.platformanime-=1
    }
    if mouse_wheel_down() && global.platformanime<sprite_get_number(s_platforms)-1 && mouse_y>view_yview[0]+128+64*3-16 && mouse_y<view_yview[0]+128+64*3+48{//鼠标滚轮向下
        global.platformanime+=1
    }

    if mouse_wheel_up() && global.yinyangcolor>0 && mouse_y>view_yview[0]+128+64-16 && mouse_y<view_yview[0]+128+64+48{//鼠标滚轮向上
        global.yinyangcolor-=1
    }
    if mouse_wheel_down() && global.yinyangcolor<7 && mouse_y>view_yview[0]+128+64-16 && mouse_y<view_yview[0]+128+64+48{//鼠标滚轮向下
        global.yinyangcolor+=1
    }

    if mouse_wheel_up() && global.ledge_type>0 && mouse_y>view_yview[0]+128+128-16 && mouse_y<view_yview[0]+128+128+48{//鼠标滚轮向上
        if(mouse_x<view_xview[0]+334)global.ledge_type-=1
    }
    if mouse_wheel_down() && global.ledge_type<sprite_get_number(s_ledgemasks)-1 && mouse_y>view_yview[0]+128+128-16 && mouse_y<view_yview[0]+128+128+48{//鼠标滚轮向下
        if(mouse_x<view_xview[0]+334)global.ledge_type+=1
    }
    if mouse_wheel_up() && global.water_change_type>0 && mouse_y>view_yview[0]+128+128-16 && mouse_y<view_yview[0]+128+128+48{//鼠标滚轮向上
        if(mouse_x>view_xview[0]+334)global.water_change_type-=1
    }
    if mouse_wheel_down() && global.water_change_type<2 && mouse_y>view_yview[0]+128+128-16 && mouse_y<view_yview[0]+128+128+48{//鼠标滚轮向下
        if(mouse_x>view_xview[0]+334)global.water_change_type+=1
    }
    /*if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 {draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+384,1,1,0,c_yellow,1)}else{draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+384,1,1,0,c_white,1)}
    if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+384,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+384,1,1,0,c_white,1)}
    */
    /*if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 && mouse_check_button(mb_left) {
   if o_edmain.costawia4b=1{o_edmain.costawia4b=0}
   }
   if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 && mouse_check_button(mb_left) {
   if o_edmain.costawia4b=0{o_edmain.costawia4b=1}
   }*/
// wybor markera
}

//注意下面costawia记录的是该物品从左往右数的序号而不是物品号码，我刚才弄错了……比如终点是在2号位，不是17号）这段是第一行

if wlaczonaopcja=4 && o_edmain.costawia4b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110 && mouse_y<view_yview[0]+174 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110,1,1,0,c_white,1)}
if wlaczonaopcja=4 && o_edmain.costawia4b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110 && mouse_y<view_yview[0]+174 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=0
    costawia4=floor(1+(mouse_x-(view_xview[0]+206))/64)
    autopair=0 //怨念残留喝了
    costawia5=0
        costawia6=0
    }
    //第二行
if wlaczonaopcja=4 && o_edmain.costawia4b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64 && mouse_y<view_yview[0]+174+64 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64,1,1,0,c_white,1)}
if wlaczonaopcja=4 && o_edmain.costawia4b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64 && mouse_y<view_yview[0]+174+64 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=0
    costawia4=floor(1+(mouse_x-(view_xview[0]+206))/64)+6
    autopair=0 //怨念残留喝了
    costawia5=0
            costawia6=0

    }

    //第三行
if wlaczonaopcja=4 && o_edmain.costawia4b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590-64 &&
    mouse_y>view_yview[0]+110+64*2 && mouse_y<view_yview[0]+174+64*2 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*2,1,1,0,c_white,1)}
if wlaczonaopcja=4 && o_edmain.costawia4b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590-64 &&
    mouse_y>view_yview[0]+110+64*2 && mouse_y<view_yview[0]+174+64*2 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=0
    costawia4=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6
    autopair=0 //怨念残留喝了
    costawia5=0
    costawia6=0
    }

    //第四行
if wlaczonaopcja=4 && o_edmain.costawia4b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64*3 && mouse_y<view_yview[0]+174+64*3 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*3,1,1,0,c_white,1)}
if wlaczonaopcja=4 && o_edmain.costawia4b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64*3 && mouse_y<view_yview[0]+174+64*3 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=0
    costawia3=0
    costawia4=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6+6
    autopair=0 //怨念残留喝了
    costawia5=0
            costawia6=0
    }

    // stawianie kolejnych markerow 然后把costawia记录的号码和物品代号对应起来
    if costawia4=3 || costawia4=6 || costawia4=14 {show_solid = 1}

    if costawia4=2 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edmarkerblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_markersbank2,16,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    if costawia4=2 && costawia4b=0 && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edmarkerblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
        {
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=17//喝了终点
        }
    if costawia4=3 && costawia4b=0 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edmarkerblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {draw_sprite_ext(s_markersbank3,17,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.2)}
    if costawia4=3 && costawia4b=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15//删去"kliknieto=0"允许我们在按住鼠标的时候拖出一大片实心，delayus修正手感
        {
        if (self_coto_check(4,18)){
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=18//喝了实心
        autopair=0 //怨念残留喝了
        }
        }
    if costawia4=4 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_markersbank4,18,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    if costawia4=4 && costawia4b=0 && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&   wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
        {
        if(self_coto_check(4,19)){
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=19//喝了起点
        autopair=0 //怨念残留喝了
        }
        }
    if costawia4=5 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_checkpoint,19,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if costawia4=5 && costawia4b=0 && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
        {
        if(self_coto_check(4,20)){
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=20//喝了cp
        autopair=0 //怨念残留喝了
        }
        }
    if costawia4=6 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && mouse_y<32  && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_sealroof,21,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.2)}
    if costawia4=6 &&costawia4b=0 && kliknieto=0 && mouse_check_button(mb_left) && mouse_x>0 && mouse_y<32 && mouse_y>0 && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
        {
        if(self_coto_check(4,22)){
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=22//喝了封顶实心
        autopair=0 //怨念残留喝了
        }
        }
    if costawia4=7 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_scrollcenter,0,floor((mouse_x-16)/32)*32+16,floor((mouse_y)/32)*32,1,1,0,c_white,0.2);
    draw_set_color(c_green);
    draw_rectangle(floor((mouse_x-16)/32+1)*32-320,floor((mouse_y)/32)*32+16-240,floor((mouse_x-16)/32+1)*32+320,floor((mouse_y)/32)*32+16+240,true)
    draw_rectangle(floor((mouse_x-16)/32+1)*32-319,floor((mouse_y)/32)*32+16-239,floor((mouse_x-16)/32+1)*32+319,floor((mouse_y)/32)*32+16+239,true)
    draw_rectangle(floor((mouse_x-16)/32+1)*32-321,floor((mouse_y)/32)*32+16-241,floor((mouse_x-16)/32+1)*32+321,floor((mouse_y)/32)*32+16+241,true)
    draw_set_color(c_white);}
    if costawia4=7 &&costawia4b=0 && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && global.picking = false
    {
        kliknieto=1
        fofo=instance_create(floor((mouse_x-16)/32)*32+16,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=23//喝了强滚中心
        autopair=0 //怨念残留喝了
        ds_list_add(global.autoscrolls,fofo)
        if ds_list_size(global.autoscrolls)=1{
            // 首次放置时修改滚屏速度
                var sspeed;
                sspeed=get_integer('Set the scroll speed (unit: 0.01 pixel). Max=6000',100)
                sspeed=max(0,sspeed)
                sspeed=min(sspeed,6000)
                fofo.scrollspeed=sspeed/100
        }else{fofo.scrollspeed=ds_list_find_value(global.autoscrolls,ds_list_size(global.autoscrolls)-2).scrollspeed}
    }
    if costawia4=8 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_onlyyou,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if costawia4=8 && costawia4b=0 && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {
        if(self_coto_check(4,24)){
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=24//喝了脚滑人杀手
        autopair=0 //怨念残留喝了
        }
    }

    if costawia4>18 && costawia4<=24 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_platforms,global.platformanime,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)
    draw_sprite_ext(s_platformlabels,costawia4-19,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)
    //滚轮切换样式设计
    if mouse_wheel_up() && global.platformanime>0{//鼠标滚轮向上
        global.platformanime-=1
    }
    if mouse_wheel_down() && global.platformanime<sprite_get_number(s_platforms)-1{//鼠标滚轮向下
        global.platformanime+=1
    }
    }

    if costawia4>18 && costawia4<=24 && costawia4b=0 && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
        {
        if(self_coto_check(4,25)){
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        autopair=0 //怨念残留喝了
        fofo.coto=25//新桥
        fofo.type=costawia4-19
        fofo.anime=global.platformanime
        }
        }
    /*这里是旧版运输桥，现在已经木有了
    if costawia4=24 && costawia4b=0 && kliknieto=0 && mouse_x>0 &&  mouse_y>0 && !instance_position(mouse_x,mouse_y,o_edmarkerblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_markersbank,17,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
   if costawia4=24 && costawia4b=0 && kliknieto=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0 && !instance_position(mouse_x,mouse_y,o_edmarkerblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
        {
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=21
        autopair=0 //怨念残留喝了
        }
    */
    if costawia4=9 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_pointblock5,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if costawia4=9 && costawia4b=0 && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
        {
        if(self_coto_check(4,26)){
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=26//喝了叹号
        autopair=0 //怨念残留喝了
        var tempMessage;
        tempMessage = get_string('Please type the message you want to hide in this block. (In Chinese or English)#Use \# to start a new line, and use \\# for a real "\#" in your text.',defMessage)
        defMessage = tempMessage
        fofo.textMessage = tempMessage
        }
        }

    if costawia4>9 && costawia4<=12 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {
    //解密砖切换样式设计
    if mouse_wheel_up() && global.yinyangcolor>0{//鼠标滚轮向上
        global.yinyangcolor-=1
    }
    if mouse_wheel_down() && global.yinyangcolor<7{//鼠标滚轮向下
        global.yinyangcolor+=1
    }
    }

    if costawia4=10 && costawia4b=0 /*&& mouse_x>0 &&  mouse_y>0*/ && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {draw_sprite_ext(s_pointblock6,global.yinyangcolor+8*global.assist,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if costawia4=10 && costawia4b=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
        {
        if(self_coto_check(4,27)){
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=27//喝了switch
        fofo.color=global.yinyangcolor
        autopair=0 //怨念残留喝了
        }
        }


    if costawia4=11 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_yinyang,2*global.yinyangcolor+1+16*global.assist,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if costawia4=11 && costawia4b=0 && /*kliknieto=0 &&*/ mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
        {
        if(self_coto_check(4,28)){
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=28//喝了yin
        fofo.color=global.yinyangcolor
        autopair=0 //
        }
        }

    if costawia4=12 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_yinyang,2*global.yinyangcolor+16*global.assist,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if costawia4=12 && costawia4b=0 && /*kliknieto=0 &&*/ mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
        {
        if(self_coto_check(4,29)){
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=29//喝了yang
        fofo.color=global.yinyangcolor
        autopair=0 //
        }
        }

    if costawia4=13 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_ice,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if costawia4=13 && costawia4b=0 && /*kliknieto=0 &&*/ mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
        {
        if(self_coto_check(4,30)){
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=30//喝了碎冰冰
        autopair=0 //
        }
        }



    if costawia4=14 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {
    //半实心切换样式设计
    if mouse_wheel_up() && global.ledge_type>0{//鼠标滚轮向上
        global.ledge_type-=1
    }
    if mouse_wheel_down() && global.ledge_type<sprite_get_number(s_ledge)-1{//鼠标滚轮向下
        global.ledge_type+=1
    }
    draw_sprite_ext(s_ledge,global.ledge_type,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)
    }

    if costawia4=14 && costawia4b=0 && /*kliknieto=0 &&*/ mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
        {
        if(self_coto_check(4,31)){
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=31//喝了半实心
        fofo.ledge_type=global.ledge_type
        autopair=0 //
        }
        }

    if costawia4=15 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {
        if mouse_wheel_up() && global.water_change_type>0{//鼠标滚轮向上
            global.water_change_type-=1
        }
        if mouse_wheel_down() && global.water_change_type<2{//鼠标滚轮向下
            global.water_change_type+=1
        }
        if(global.water_change_type=0){draw_sprite_ext(s_waterchanger,2*global.lava,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
        if(global.water_change_type=1){draw_sprite_ext(s_waterchanger,1+2*global.lava,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
        if(global.water_change_type=2){draw_sprite_ext(s_waterbegin,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    }

    if costawia4=15 && costawia4b=0 && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {
        if(self_coto_check(4,32)){
            kliknieto=1
            fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
            fofo.coto=32
            fofo.type=global.water_change_type
            autopair=0 //怨念残留喝了
            fofo.target = min(999999,max(-64,get_integer('Please type the target height.(unit: px, >=-64px)',0)))
            fofo.velocity = min(max(0,get_integer('Please type the speed of the fluid(0,1,...,9).',1)),9)
            if(fofo.type=2){wiatrak=9}
        }
    }


    if costawia4=16 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_bgmchange,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if costawia4=16 && costawia4b=0 && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&   wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && setting_mode=0
        {
        if(self_coto_check(4,33)){
        kliknieto=1
        myfofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        myfofo.coto=33//喝了bgmbgp切换
        if(myfofo.haveset=0){setting_mode = 1; myfofo.haveset=1;}
        autopair=0 //
        }
        }

    if(setting_mode=1){
        myfofo.bgm_change = show_question('Do you want to change BGM when Mario hit me?');
        if (myfofo.bgm_change){czywybieranieback=100;setting_mode=2;}
        else {setting_mode=3-3*resetting;resetting=0;myfofo.setonce2=0}
    }
    if(setting_mode=3){
        myfofo.bgp_change = show_question('Do you want to change BGP when Mario hit me?');
        if (myfofo.bgp_change){czywybieranieback=1;setting_mode=4;o_edmain.backgroundpage=0;}
        else{setting_mode=5-5*resetting;resetting=0;myfofo.setonce2=0}
    }
    if(setting_mode=5){
        myfofo.weather_change = show_question('Do you want to change Weather when Mario hit me?');
        if (myfofo.weather_change){czywybieranieback=1;o_edmain.backgroundpage=100;setting_mode=6;}
        else{setting_mode=7-7*resetting;resetting=0;myfofo.setonce2=0}
    }
    if(setting_mode=7){
        myfofo.height = min(999999,get_integer('Do you want to change water height INSTANTLY when Mario hit me? If yes, enter the height. If no, leave the number to be NO MORE THAN -64.',myfofo.height))
        if (myfofo.bgm_change=0 && myfofo.bgp_change=0 && myfofo.weather_change=0 && myfofo.height<=-64)
        {with(myfofo){instance_destroy();}}
        setting_mode=0;resetting=0;wiatrak=0;
    }

    if costawia4=17 && costawia4b=0 && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && /*!instance_position(mouse_x,mouse_y,o_edmarkerblock) &&*/ wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_camerabegin,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

    if costawia4=17 && costawia4b=0 && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
        {
        if(self_coto_check(4,34)){
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=34//喝了camera
        autopair=0 //
        wiatrak=8
        }
        }


    if costawia4<>0 && kliknieto=0 && mouse_check_button(mb_right) /*&& mouse_x>0 &&  mouse_y>0*/ && instance_position(mouse_x,mouse_y,o_edmarkerblock) && costawia4b=0 && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && global.picking = false
    {
       tester = instance_position(mouse_x,mouse_y,o_edmarkerblock);
       if(delete_coto_check(4,costawia4,tester.coto)){
           with(tester){
               if coto=23{ds_list_delete(global.autoscrolls,ds_list_find_index(global.autoscrolls,id))}//删去这个恶劣强滚
               instance_destroy();
           }
       }
       else{
           with(o_edmarkerblock){
               if(delete_coto_check(4,other.costawia4,coto)&& instance_position(mouse_x,mouse_y,id)){
                   if coto=23{ds_list_delete(global.autoscrolls,ds_list_find_index(global.autoscrolls,id))}//删去这个恶劣强滚
                   instance_destroy();
               }
           }
       }
    }
        //delete passage only when passage is selected
    if costawia4=1 && kliknieto=0 && mouse_check_button(mb_right) /*&& mouse_x>0 &&  mouse_y>0*/ && instance_position(mouse_x,mouse_y,o_edpassage) && costawia4b=0 && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
        {
        fofo=instance_position(mouse_x,mouse_y,o_edpassage)
        autopair=0 //怨念残留喝了
        with(fofo){instance_destroy()}
        }


    //下面是水管出入口放置，喝了
    if costawia4=1 && costawia4b=0  //costawia4b=0目测是选中了mark中的水管出入口，这时候下面会出现放置水管的提示文字，就是s_help1和s_help2这两个精灵
        {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_help1,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_help2,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)

        costawia4c+=0.01
        if !keyboard_check(global.key_select){draw_sprite_ext(s_enemiesblock2,0,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,sin(costawia4c)+1)}
        }

    // stawianie pierwszego markera - passage
    if costawia4b=0 && costawia4=1 && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edpassage) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
        {
        kliknieto=1
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edpassage)
        fofo.warpnum=global.warpnum
        global.warpnum+=1
        costawia4b=1
        autopair=0 //怨念残留喝了
        }

    // wybor kierunku dla entrance
    if costawia4=1 && costawia4b=1
        {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_help4,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_help3,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)

        costawia4c+=0.01
        draw_sprite_ext(s_entrancedir,0,fofo.x+32,fofo.y+32,1,1,floor((point_direction(fofo.x+32,fofo.y+32,mouse_x,mouse_y)+45)/90)*90,c_white,1)
        }

    if costawia4b=1 && costawia4=1 && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && wiatrak=0
        {
        kliknieto=1
        costawia4b=2
        fofo.wejscie=floor((point_direction(fofo.x+32,fofo.y+32,mouse_x,mouse_y)+45)/90)*90
        fofo.tak=1
        }
    // stawianie         exita
    if costawia4=1 && costawia4b=2
        {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_help6,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_help5,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)

        costawia4c+=0.05
        if !keyboard_check(ord('Z')) {draw_sprite_ext(s_enemiesblock3,0,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,sin(costawia4c)+0.5)}//用余弦变化实现放置exit前exit块渐隐渐显的效果
        }
    //stawianie exita
    if costawia4b=2 && costawia4=1 && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && wiatrak=0
        {
        kliknieto=1
        costawia4b=3
        fofo.exitx=(floor(mouse_x/32))*32
        fofo.exity=(floor(mouse_y/32))*32
        fofo.tak2=1
        }
        //iiii.. kierunek
    if costawia4=1 && costawia4b=3
        {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_help8,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_help7,0,view_xview[0]+400,view_yview[0]+460,1,1,0,c_white,1)

        costawia4c+=0.01
        draw_sprite_ext(s_entrancedir,0,fofo.exitx+32,fofo.exity+32,1,1,floor((point_direction(fofo.exitx,fofo.exity,mouse_x,mouse_y)+45)/90)*90,c_white,1)
        }
    if costawia4b=3 && costawia4=1 && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ &&  wiatrak=0
        {
        kliknieto=1
        costawia4b=0
        fofo.wyjscie=floor((point_direction(fofo.exitx,fofo.exity,mouse_x,mouse_y)+45)/90)*90
        if fofo.wyjscie>=360{fofo.wyjscie=fofo.wyjscie mod 360}
        fofo.tak3=1
        with(o_edpassage){shuiguanhele=0;shuiguanhele2=0}
        }


//阴阳相互切换
if costawia4=11 && mouse_check_button_pressed(mb_middle){
    costawia = 0
    costawia2 = 0
    costawia3 = 0
    costawia4 = 12
    costawia5 = 0
    costawia6 = 0
    autopair = 0
} else if costawia4=12 && mouse_check_button_pressed(mb_middle){
    costawia = 0
    costawia2 = 0
    costawia3 = 0
    costawia4 = 11
    costawia5 = 0
    costawia6 = 0
    autopair = 0
}

    //水管自动配对
     autopaircheck=0
     if global.autopair=1 && wlaczony=1
  {
    //if ((costawia>=5&&costawia<=8)||(costawia>=17&&costawia<=20)||(costawia>=29&&costawia<=32)||(costawia>=41&&costawia<=44)||(costawia>=133&&costawia<=168)
    //||(costawia>=87&&costawia<=92)||(costawia>=99&&costawia<=106)||(costawia>=109&&costawia<=116)||(costawia>=121&&costawia<=128)){autopaircheck=1}else{autopaircheck=0}
    if (costawia=5||costawia=6||costawia=17||costawia=18){autopaircheck=1};
    if (costawia=7||costawia=8||costawia=19||costawia=20){autopaircheck=1};
    if (costawia=29||costawia=30||costawia=41||costawia=42){autopaircheck=3};
    if (costawia=31||costawia=32||costawia=43||costawia=44){autopaircheck=3};
    if ((costawia>=87&&costawia<=89)||(costawia>=99&&costawia<=101)){autopaircheck=5};
    if ((costawia>=90&&costawia<=92)||(costawia>=102&&costawia<=104)){autopaircheck=6};
    if ((costawia>=109&&costawia<=111)||(costawia>=121&&costawia<=123)){autopaircheck=7};
    if ((costawia>=112&&costawia<=114)||(costawia>=124&&costawia<=126)){autopaircheck=8};
    if (costawia=105||costawia=106||costawia=115||costawia=116||costawia=127||costawia=128){autopaircheck=9};
    if ((costawia>=133&&costawia<=135)||(costawia>=145&&costawia<=147)){autopaircheck=10};
    if ((costawia>=157&&costawia<=159)||costawia=225||costawia=226){autopaircheck=11};
    if (costawia=136||costawia=137||costawia=148||costawia=149||costawia=160||costawia=161){autopaircheck=12};
    if (costawia=138||costawia=139||costawia=150||costawia=151||costawia=162||costawia=163){autopaircheck=13};
    if (costawia=140||costawia=141||costawia=152||costawia=153||costawia=164||costawia=165){autopaircheck=14};
    if (costawia=142||costawia=143||costawia=154||costawia=155||costawia=166||costawia=167){autopaircheck=15};
    if (costawia=144||costawia=156||costawia=168||costawia=223||costawia=224){autopaircheck=16};
    if (costawia=58||costawia=59){autopaircheck=17};
    if (costawia=300 || costawia=301){autopaircheck=18};
    if wlaczony=1 {
    if autopaircheck>0{draw_sprite_ext(s_autopair2,0,view_xview[0]+224,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=0};
    draw_sprite_ext(s_autopair2,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if autopair=0{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224,view_yview[0]+416,1,1,0,c_white,1);}
}
    if (autopaircheck=1){
    draw_sprite_ext(s_autopair2,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=2};
    draw_sprite_ext(s_autopair2,3,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=3};
    draw_sprite_ext(s_autopair2,4,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=4;kliknieto=1};
    if autopair=2{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=3{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=4{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);}
    }
    /*if (autopaircheck=2){
    draw_sprite_ext(s_autopair2,4,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=4};
    draw_sprite_ext(s_autopair2,3,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=3};
    if autopair=4{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=3{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    }*/
    if (autopaircheck=3){
    draw_sprite_ext(s_autopair2,5,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=5};
    draw_sprite_ext(s_autopair2,6,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=6};
    draw_sprite_ext(s_autopair2,7,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=7;kliknieto=1};
    if autopair=5{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=6{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=7{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);}
    }
    /*if (autopaircheck=4){
    draw_sprite_ext(s_autopair2,7,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=7};
    draw_sprite_ext(s_autopair2,6,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=6};
    if autopair=7{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=6{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    }  */
    if (autopaircheck=9){
    draw_sprite_ext(s_autopair2,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=12};
    draw_sprite_ext(s_autopair2,3,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=13};
    draw_sprite_ext(s_autopair2,4,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=14};
    if autopair=12{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=13{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=14{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);}
    }
    if (autopaircheck=7){
    draw_sprite_ext(s_autopair2,5,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=15};
    draw_sprite_ext(s_autopair2,6,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=16};
    draw_sprite_ext(s_autopair2,7,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=17};
    if autopair=15{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=16{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=17{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);}
    }
    if (autopaircheck=12){
    draw_sprite_ext(s_autopair2,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=22};
    draw_sprite_ext(s_autopair2,3,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=23};
    draw_sprite_ext(s_autopair2,4,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=24};
    if autopair=22{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=23{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=24{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);}
    }
    if (autopaircheck=5){
    draw_sprite_ext(s_autopair2,5,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=25};
    draw_sprite_ext(s_autopair2,6,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=26};
    draw_sprite_ext(s_autopair2,7,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=27};
    if autopair=25{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=26{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=27{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);}
    }
    if (autopaircheck=13){
    draw_sprite_ext(s_autopair2,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=32};
    draw_sprite_ext(s_autopair2,3,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=33};
    draw_sprite_ext(s_autopair2,4,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=34};
    if autopair=32{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=33{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=34{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);}
    }
    if (autopaircheck=6){
    draw_sprite_ext(s_autopair2,5,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=35};
    draw_sprite_ext(s_autopair2,6,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=36};
    draw_sprite_ext(s_autopair2,7,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=37};
    if autopair=35{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=36{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=37{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);}
    }
    if (autopaircheck=14){
    draw_sprite_ext(s_autopair2,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=42};
    draw_sprite_ext(s_autopair2,3,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=43};
    draw_sprite_ext(s_autopair2,4,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=44};
    if autopair=42{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=43{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=44{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);}
    }
    if (autopaircheck=8){
    draw_sprite_ext(s_autopair2,5,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=45};
    draw_sprite_ext(s_autopair2,6,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=46};
    draw_sprite_ext(s_autopair2,7,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=47};
    if autopair=45{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=46{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=47{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);}
    }
    if (autopaircheck=15){
    draw_sprite_ext(s_autopair2,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=52};
    draw_sprite_ext(s_autopair2,3,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=53};
    draw_sprite_ext(s_autopair2,4,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=54};
    if autopair=52{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=53{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=54{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);}
    }
    if (autopaircheck=10){
    draw_sprite_ext(s_autopair2,5,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=55};
    draw_sprite_ext(s_autopair2,6,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=56};
    draw_sprite_ext(s_autopair2,7,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=57};
    if autopair=55{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=56{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=57{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);}
    }
    if (autopaircheck=16){
    draw_sprite_ext(s_autopair2,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=62};
    draw_sprite_ext(s_autopair2,3,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=63};
    draw_sprite_ext(s_autopair2,4,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=64};
    if autopair=62{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=63{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=64{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);}
    }
    if (autopaircheck=11){
    draw_sprite_ext(s_autopair2,5,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=65};
    draw_sprite_ext(s_autopair2,6,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=66};
    draw_sprite_ext(s_autopair2,7,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=67};
    if autopair=65{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=66{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=67{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*3,view_yview[0]+416,1,1,0,c_white,1);}
    }
    if (autopaircheck=17){
    draw_sprite_ext(s_autopair2,8,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=8};
    if autopair=8{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    }
    if (autopaircheck=18){
    draw_sprite_ext(s_autopair2,8,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=68};
    if autopair=68{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    }
    }}

// block类

if wlaczonaopcja=1
    {
    draw_set_color(c_white)
    draw_set_font(cyferkimario)
    if keyboard_check_pressed(vk_escape) {wlaczonaopcja=0}
    //换页
    draw_set_blend_mode(bm_subtract)
    draw_sprite_ext(s_edblocksmask,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
    draw_set_blend_mode(bm_normal)
    if blockpage=-1{draw_sprite_ext(s_edblocks,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1);}
    if blockpage=0{draw_sprite_ext(s_edblocks,1,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1);}
    if blockpage=1{draw_sprite_ext(s_edblocks,2,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1);}
    if blockpage=2{draw_sprite_ext(s_edblocks,3,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1);}
    if blockpage=-1{draw_set_color(make_color_rgb(255,255,127))}else{if(abs(view_xview[0]+256+51-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10){draw_set_color(c_yellow)}}draw_text(view_xview[0]+256+51,view_yview[0]+368,'1');draw_set_color(c_white)
    if blockpage<>-1 && abs(view_xview[0]+256+51-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10 && kliknieto=0 && mouse_check_button(mb_left){blockpage=-1}
    if blockpage=0{draw_set_color(make_color_rgb(255,255,127))}else{if(abs(view_xview[0]+256+51*2-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10){draw_set_color(c_yellow)}}draw_text(view_xview[0]+256+51*2,view_yview[0]+368,'2');draw_set_color(c_white)
    if blockpage<>0 && abs(view_xview[0]+256+51*2-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10 && kliknieto=0 && mouse_check_button(mb_left){blockpage=0}
    if blockpage=1{draw_set_color(make_color_rgb(255,255,127))}else{if(abs(view_xview[0]+256+51*3-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10){draw_set_color(c_yellow)}}draw_text(view_xview[0]+256+51*3,view_yview[0]+368,'3');draw_set_color(c_white)
    if blockpage<>1 && abs(view_xview[0]+256+51*3-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10 && kliknieto=0 && mouse_check_button(mb_left){blockpage=1}
    if blockpage=2{draw_set_color(make_color_rgb(255,255,127))}else{if(abs(view_xview[0]+256+51*4-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10){draw_set_color(c_yellow)}}draw_text(view_xview[0]+256+51*4,view_yview[0]+368,'4');draw_set_color(c_white)
    if blockpage<>2 && abs(view_xview[0]+256+51*4-mouse_x)<10 && abs(view_yview[0]+368-mouse_y)<10 && kliknieto=0 && mouse_check_button(mb_left){blockpage=2}
    if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+368-mouse_y)<16 {draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+364,1,1,0,c_yellow,1)}else{draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+364,1,1,0,c_white,1)}
    if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+368-mouse_y)<16 {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+364,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+364,1,1,0,c_white,1)}
    if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+368-mouse_y)<16 && kliknieto=0 && mouse_check_button(mb_left) {
    if o_edmain.blockpage=0{o_edmain.blockpage=-1}
    if o_edmain.blockpage=1{o_edmain.blockpage=0}
    if o_edmain.blockpage=2{o_edmain.blockpage=1}
    kliknieto=1
    }
    if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+368-mouse_y)<16 && kliknieto=0 && mouse_check_button(mb_left) {
    if o_edmain.blockpage=1{o_edmain.blockpage=2}
    if o_edmain.blockpage=0{o_edmain.blockpage=1}
    if o_edmain.blockpage=-1{o_edmain.blockpage=0}
    kliknieto=1
    }}

    //第一页
    /*if blockpage=-1{
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128 && mouse_y<view_yview[0]+160 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128 && mouse_y<view_yview[0]+160 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=1+floor((mouse_x-(view_xview[0]+206))/32);autopair=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32 && mouse_y<view_yview[0]+160+32 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32,1,1,0,c_white,1)}

if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32 && mouse_y<view_yview[0]+160+32 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=1+floor((mouse_x-(view_xview[0]+206))/32)+12;autopair=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
    costawia6=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*2 && mouse_y<view_yview[0]+160+32*2 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*2,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*2 && mouse_y<view_yview[0]+160+32*2 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=1+floor((mouse_x-(view_xview[0]+206))/32)+12*2;autopair=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*3 && mouse_y<view_yview[0]+160+32*3 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*3,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*3 && mouse_y<view_yview[0]+160+32*3 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=1+floor((mouse_x-(view_xview[0]+206))/32)+12*3;autopair=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }
    if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
mouse_y>view_yview[0]+128+32*4 && mouse_y<view_yview[0]+160+32*4 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*4,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*4 && mouse_y<view_yview[0]+160+32*4 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=1+floor((mouse_x-(view_xview[0]+206))/32)+12*4;autopair=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*5 && mouse_y<view_yview[0]+160+32*5 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*5,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*5 && mouse_y<view_yview[0]+160+32*5 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=1+floor((mouse_x-(view_xview[0]+206))/32)+12*5;autopair=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*6 && mouse_y<view_yview[0]+160+32*6 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*6,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*6 && mouse_y<view_yview[0]+160+32*6 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=1+floor((mouse_x-(view_xview[0]+206))/32)+12*6;autopair=0
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }}*/
    //第二页
    if blockpage=-1{
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128 && mouse_y<view_yview[0]+160 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128 && mouse_y<view_yview[0]+160 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('001 002 003 005 006 029 030 032 045 085 105 106',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32 && mouse_y<view_yview[0]+160+32 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32,1,1,0,c_white,1)}

if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32 && mouse_y<view_yview[0]+160+32 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('013 014 015 017 018 041 042 044 033 028 115 116',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
    costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*2 && mouse_y<view_yview[0]+160+32*2 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*2,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*2 && mouse_y<view_yview[0]+160+32*2 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('025 026 027 019 020 198 211 209 204 040 127 128',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*3 && mouse_y<view_yview[0]+160+32*3 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*3,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*3 && mouse_y<view_yview[0]+160+32*3 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('037 038 039 004 130 212 084 129 009 109 110 111',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
    if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
mouse_y>view_yview[0]+128+32*4 && mouse_y<view_yview[0]+160+32*4 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*4,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*4 && mouse_y<view_yview[0]+160+32*4 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('049 050 051 067 068 069 016 086 119 121 122 123',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*5 && mouse_y<view_yview[0]+160+32*5 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*5,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*5 && mouse_y<view_yview[0]+160+32*5 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('061 062 063 079 080 081 070 083 071 010 011 012',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*6 && mouse_y<view_yview[0]+160+32*6 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*6,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*6 && mouse_y<view_yview[0]+160+32*6 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('073 074 075 093 094 095 098 097 096 022 023 024',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }}
//第三页
    if blockpage=0{
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128 && mouse_y<view_yview[0]+160 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128 && mouse_y<view_yview[0]+160 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('213 214 215 220 136 137 140 141 107 117 138 139',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32 && mouse_y<view_yview[0]+160+32 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32,1,1,0,c_white,1)}

if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32 && mouse_y<view_yview[0]+160+32 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('216 217 218 208 148 149 152 153 222 198 150 151',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
    costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*2 && mouse_y<view_yview[0]+160+32*2 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*2,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*2 && mouse_y<view_yview[0]+160+32*2 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('084 211 219 118 160 161 164 165 221 129 162 163',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*3 && mouse_y<view_yview[0]+160+32*3 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*3,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*3 && mouse_y<view_yview[0]+160+32*3 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('009 130 004 087 088 089 112 113 114 090 091 092',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
    if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
mouse_y>view_yview[0]+128+32*4 && mouse_y<view_yview[0]+160+32*4 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*4,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*4 && mouse_y<view_yview[0]+160+32*4 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('193 194 195 099 100 101 124 125 126 102 103 104',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*5 && mouse_y<view_yview[0]+160+32*5 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*5,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*5 && mouse_y<view_yview[0]+160+32*5 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('199 200 201 169 170 171 181 182 183 034 035 036',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0;autopair=0
            costawia6=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*6 && mouse_y<view_yview[0]+160+32*6 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*6,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*6 && mouse_y<view_yview[0]+160+32*6 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('205 206 207 175 176 177 187 188 189 046 047 048',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }}

//第四页
    if blockpage=1{
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128 && mouse_y<view_yview[0]+160 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128 && mouse_y<view_yview[0]+160 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('285 286 287 052 053 054 244 245 246 055 056 057',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32 && mouse_y<view_yview[0]+160+32 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32,1,1,0,c_white,1)}

if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32 && mouse_y<view_yview[0]+160+32 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('288 289 290 064 065 066 247 248 249 142 143 144',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
    costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*2 && mouse_y<view_yview[0]+160+32*2 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*2,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*2 && mouse_y<view_yview[0]+160+32*2 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('291 292 293 076 077 078 250 251 252 154 155 156',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*3 && mouse_y<view_yview[0]+160+32*3 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*3,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*3 && mouse_y<view_yview[0]+160+32*3 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('295 297 196 197 184 185 186 131 072 166 167 223',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
    if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
        mouse_y>view_yview[0]+128+32*4 && mouse_y<view_yview[0]+160+32*4 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*4,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*4 && mouse_y<view_yview[0]+160+32*4 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('294 296 202 203 190 191 192 132 133 134 135 224',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*5 && mouse_y<view_yview[0]+160+32*5 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*5,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*5 && mouse_y<view_yview[0]+160+32*5 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('300 301 058 059 172 173 174 021 145 146 147 168',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0;autopair=0
            costawia6=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*6 && mouse_y<view_yview[0]+160+32*6 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*6,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128+32*6 && mouse_y<view_yview[0]+160+32*6 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('298 299 108 120 178 179 180 157 158 225 226 159',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }}

//第五页
    if blockpage=2{

    //限制鼠标位置，不能点击空白区
    if (mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 && mouse_y>view_yview[0]+128 && mouse_y<view_yview[0]+128+192)
    || (mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+206+128 && mouse_y>view_yview[0]+128+192 && mouse_y<view_yview[0]+128+192+32) {

if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+128 && mouse_y<view_yview[0]+160 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590  &&
    mouse_y>view_yview[0]+128 && mouse_y<view_yview[0]+160 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('227 228 229 230 302 303 304 305 329 327 344 345',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590  &&
    mouse_y>view_yview[0]+128+32 && mouse_y<view_yview[0]+160+32 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32,1,1,0,c_white,1)}

if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590  &&
    mouse_y>view_yview[0]+128+32 && mouse_y<view_yview[0]+160+32 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('233 234 235 231 306 307 308 309 326 330 346 328',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
    costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590  &&
    mouse_y>view_yview[0]+128+32*2 && mouse_y<view_yview[0]+160+32*2 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*2,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590  &&
    mouse_y>view_yview[0]+128+32*2 && mouse_y<view_yview[0]+160+32*2 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('236 237 238 232 310 311 312 313 338 333 334 347',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590  &&
    mouse_y>view_yview[0]+128+32*3 && mouse_y<view_yview[0]+160+32*3 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*3,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590  &&
    mouse_y>view_yview[0]+128+32*3 && mouse_y<view_yview[0]+160+32*3 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('239 240 241 280 314 315 316 317 341 336 337 348',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
    if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590  &&
        mouse_y>view_yview[0]+128+32*4 && mouse_y<view_yview[0]+160+32*4 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*4,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590  &&
    mouse_y>view_yview[0]+128+32*4 && mouse_y<view_yview[0]+160+32*4 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('274 275 276 242 318 319 320 321 332 339 340 349',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590  &&
    mouse_y>view_yview[0]+128+32*5 && mouse_y<view_yview[0]+160+32*5 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*5,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590  &&
    mouse_y>view_yview[0]+128+32*5 && mouse_y<view_yview[0]+160+32*5 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('277 278 279 243 322 323 324 325 335 342 343 331',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0;autopair=0
            costawia6=0
    }
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590  &&
    mouse_y>view_yview[0]+128+32*6 && mouse_y<view_yview[0]+160+32*6 && kliknieto=0
    {draw_sprite_ext(s_choosingblocks,0,view_xview[0]+206+32*floor((mouse_x-(view_xview[0]+206))/32),view_yview[0]+128+32*6,1,1,0,c_white,1)}
if wlaczonaopcja=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590  &&
    mouse_y>view_yview[0]+128+32*6 && mouse_y<view_yview[0]+160+32*6 && mouse_check_button(mb_left) && kliknieto=0
    {
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=real(string_copy('281 282 283 284',floor((mouse_x-(view_xview[0]+206))/32)*4+1,3))
    costawia2=0
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0;autopair=0
    }}
    }

    autopair3=0
    if autopaircheck>0 && wlaczony=1 {if abs(view_xview[0]+224-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 {autopair3=1};if abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 {autopair3=1};if( abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && autopaircheck<17){autopair3=1};if( abs(view_xview[0]+224+66*3-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && autopaircheck<17 ){autopair3=1}}
// stawianie BLOCZKOW i kasowanie
if autopair=0{
if costawia<>0 && kliknieto=0 && autopair3=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,costawia,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)
    if !keyboard_check(global.key_submenu) {
        key_submenu_pressed_down = false;
    }
    if keyboard_check(global.key_submenu) && !key_submenu_pressed_down {
        global.autosolid = 1 - global.autosolid;
        key_submenu_pressed_down = true;
        switch (global.autosolid) {
            case 0: sound_play(snd_lakitu2); break;
            case 1: sound_play(snd_lakitu1); break;
        }
    }
    }

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_x>0 &&  mouse_y>0 && mouse_check_button(mb_left)
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=costawia;
    if (self_coto_check(4,18) && global.autosolid = 1){
        fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edmarkerblock)
        fofo.coto=18//喝了实心
        autopair=0 //怨念残留喝了
        }
    }}
    if (mouse_x>0 && mouse_y>0){
if autopair=2{
if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,5,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,6,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,17,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,18,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=5
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=6
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=17
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=18
    }}
if autopair=3{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,17,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,18,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=17
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=18
    }}
if autopair=4{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,7,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,8,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,19,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,20,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=7
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=8
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=19
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=20
    }}
if autopair=5{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,29,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,30,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,41,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,42,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=29
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=30
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=41
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=42
    }}
if autopair=6{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,30,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,42,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=30
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=42
    }}
if autopair=7{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,31,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,32,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,43,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,44,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=31
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=32
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=43
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=44
    }}
if autopair=12{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,105,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,106,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,115,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,116,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=105
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=106
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=115
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=116
    }}
if autopair=13{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,115,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,116,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=115
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=116
    }}
if autopair=14{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,115,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,116,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,127,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,128,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=115
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=116
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=127
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=128
    }}
if autopair=15{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,109,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,110,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,121,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,122,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=109
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=110
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=121
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=122
    }}
if autopair=16{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,110,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,122,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=110
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=122
    }}
if autopair=17{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,110,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,111,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,122,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,123,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=110
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=111
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=122
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=123
    }}
if autopair=22{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,136,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,137,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,148,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,149,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=136
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=137
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=148
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=149
    }}
if autopair=23{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,148,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,149,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=148
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=149
    }}
if autopair=24{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,148,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,149,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,160,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,161,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=148
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=149
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=160
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=161
    }}
if autopair=25{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,87,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,88,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,99,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,100,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=87
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=88
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=99
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=100
    }}
if autopair=26{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,88,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,100,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=88
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=100
    }}
if autopair=27{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,88,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,89,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,100,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,101,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=88
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=89
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=100
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=101
    }}
if autopair=32{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,138,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,139,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,150,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,151,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=138
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=139
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=150
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=151
    }}
if autopair=33{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,150,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,151,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=150
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=151
    }}
if autopair=34{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,150,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,151,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,162,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,163,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=150
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=151
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=162
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=163
    }}
if autopair=35{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,90,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,91,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,102,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,103,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=90
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=91
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=102
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=103
    }}
if autopair=36{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,91,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,103,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=91
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=103
    }}
if autopair=37{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,91,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,92,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,103,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,104,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=91
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=92
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=103
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=104
    }}
if autopair=42{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,140,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,141,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,152,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,153,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=140
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=141
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=152
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=153
    }}
if autopair=43{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,152,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,153,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=152
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=153
    }}
if autopair=44{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,152,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,153,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,164,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,165,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=152
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=153
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=164
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=165
    }}
if autopair=45{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,112,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,113,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,124,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,125,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=112
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=113
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=124
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=125
    }}
if autopair=46{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,113,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,125,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=113
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=125
    }}
if autopair=47{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,113,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,114,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,125,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,126,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=113
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=114
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=125
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=126
    }}
if autopair=52{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,142,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,143,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,154,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,155,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=142
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=143
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=154
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=155
    }}
if autopair=53{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,154,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,155,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=154
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=155
    }}
if autopair=54{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,154,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,155,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,166,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,167,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=154
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=155
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=166
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=167
    }}
if autopair=55{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,133,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,134,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,145,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,146,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=133
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=134
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=145
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=146
    }}
if autopair=56{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,134,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,146,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=134
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=146
    }}
if autopair=57{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,134,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,135,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,146,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,147,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=134
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=135
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=146
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=147
    }}
if autopair=62{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,144,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,143,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,156,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,155,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=144
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=143
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=156
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=155
    }}
if autopair=63{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,223,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,155,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=223
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=155
    }}
if autopair=64{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,224,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,155,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,168,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,167,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=224
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=155
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=168
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=167
    }}
if autopair=65{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,157,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,158,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,145,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,146,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=157
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=158
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=145
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=146
    }}
if autopair=66{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,225,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,146,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=225
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=146
    }}
if autopair=67{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,226,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,159,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,146,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,147,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=226
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=159
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)+1]=146
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)+1]=147
    }}
if autopair=8{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,58,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,59,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
if mouse_x>0 && mouse_y>0&& mouse_x<room_width-32 && mouse_y<room_height{
if costawia<>0 && kliknieto=0 && autopair3=0 && arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]<>58 && arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]<>59&& arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]<>58 && arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]<>59 && mouse_check_button(mb_left)
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=58
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=59
    }}}
if autopair=68{
if costawia<>0 && kliknieto=0 && autopair3=0&& mouse_x>0 &&  mouse_y>0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_blocks,300,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
    {draw_sprite_ext(s_blocks,301,floor((mouse_x)/32)*32+32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5)}
if mouse_x>0 && mouse_y>0&& mouse_x<room_width-32 && mouse_y<room_height{
if costawia<>0 && kliknieto=0 && autopair3=0 && arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]<>300 && arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]<>301&& arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]<>300&& arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]<>301&& mouse_check_button(mb_left)
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=300
    arrayetapu[floor((mouse_x)/32)+1,floor((mouse_y)/32)]=301
    }}}

}
if costawia<>0 && kliknieto=0 && autopair3=0 && mouse_check_button(mb_right) && mouse_x>0 &&  mouse_y>0 && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=0
    fofo = instance_position(mouse_x,mouse_y,o_edmarkerblock)
    if (fofo.coto=18 || fofo.coto=22) {with(fofo){instance_destroy()}}
    }
if  costawia2 = 0 && costawia3 = 0 && costawia4 = 0 && costawia5 = 0 && costawia6 = 0
    && kliknieto=0 && autopair3=0 &&( /*mouse_check_button(mb_middle) ||*/ keyboard_check_pressed(global.key_pick))
    && mouse_x>0 &&  mouse_y>0 && wiatrak=0 && menujesie=0 && wlaczonaopcja=0
    {
    if arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]>0{
      if global.sample=1 {lololo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}
      costawia = arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]
      costawia2 = 0
      costawia3 = 0
      costawia4 = 0
      costawia5 = 0
      costawia6 = 0
      autopair = 0
    }
    }

//block 与 模仿者 相互切换
if costawia<>0 && mouse_check_button_pressed(mb_middle){
    global.imitater = costawia
    costawia = 0
    costawia2 = 0
    costawia3 = 42
    costawia3b = 1
    costawia4 = 0
    costawia5 = 0
    costawia6 = 0
    autopair = 0
    kliknieto = 1
    drinkability=3
}

if costawia3=42 && mouse_check_button_pressed(mb_middle) && kliknieto=0{
    costawia = global.imitater
    costawia2 = 0
    costawia3 = 0
    costawia3b = 0
    costawia4 = 0
    costawia5 = 0
    costawia6 = 0
    autopair = 0
    drinkability=1
}

// 敌人


if wlaczonaopcja=2
    {
    draw_set_blend_mode(bm_subtract)
    draw_sprite_ext(s_edenemiesmask,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)
    draw_set_blend_mode(bm_normal)
    if costawia2b=0{draw_sprite_ext(s_edenemies,0,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)}
    if costawia2b=1{draw_sprite_ext(s_edenemies,1,view_xview[0]+400,view_yview[0]+240,1,1,0,c_white,1)}
    if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 {draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+384,1,1,0,c_yellow,1)}else{draw_sprite_ext(s_left,0,view_xview[0]+256,view_yview[0]+384,1,1,0,c_white,1)}
    if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+384,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_right,0,view_xview[0]+512,view_yview[0]+384,1,1,0,c_white,1)}
    if abs(view_xview[0]+256-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 && mouse_check_button(mb_left) {
        if o_edmain.costawia2b=1{o_edmain.costawia2b=0}
    }
    if abs(view_xview[0]+512-mouse_x)<16 && abs(view_yview[0]+384-mouse_y)<16 && mouse_check_button(mb_left) {
        if o_edmain.costawia2b=0{o_edmain.costawia2b=1}
    }

    if costawia2b=0{
        //鼠标在探照灯格子上时滚轮切换圆形/花瓣，不在格子上时切换 spike_type
        if mouse_x>=view_xview[0]+206+64 && mouse_x<view_xview[0]+206+128 && mouse_y>=view_yview[0]+110+64*3 && mouse_y<view_yview[0]+174+64*3{
            if mouse_wheel_up(){global.petal_spotlight=0}
            if mouse_wheel_down(){global.petal_spotlight=1}
        } else {
            if mouse_wheel_up() && global.spike_type>0{global.spike_type-=1}
            if mouse_wheel_down() && global.spike_type<3{global.spike_type+=1}
        }
        draw_sprite(s_piraniolebmask,global.spike_type,view_xview[0]+206+270,view_yview[0]+174+80)
        draw_sprite(s_kolecmask,global.spike_type,view_xview[0]+214+198,view_yview[0]+174+144)
        //用贴图显示探照灯图标：第一帧默认圆形，第二帧花瓣
        draw_sprite(s_rotomask,global.petal_spotlight,view_xview[0]+270,view_yview[0]+302)
    }

    if costawia2b=1{
        if mouse_wheel_up() && global.shell_type>0{//鼠标滚轮向上
            global.shell_type-=1
        }
        if mouse_wheel_down() && global.shell_type<sprite_get_number(s_shellmask)-1{//鼠标滚轮向下
            global.shell_type+=1
        }
        draw_sprite(s_mfcmask,global.spike_type,view_xview[0]+206+13,view_yview[0]+172+82)
        draw_sprite(s_shellmask,global.shell_type,view_xview[0]+206+13,view_yview[0]+174+144)
    }
    }

if wlaczonaopcja=2 && costawia2b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110 && mouse_y<view_yview[0]+174 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110,1,1,0,c_white,1)}
if wlaczonaopcja=2 &&costawia2b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110 && mouse_y<view_yview[0]+174 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=floor(1+(mouse_x-(view_xview[0]+206))/64)
    autopair=0 //怨念残留喝了
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }
if wlaczonaopcja=2 && costawia2b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64 && mouse_y<view_yview[0]+174+64 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64,1,1,0,c_white,1)}
if wlaczonaopcja=2 && costawia2b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64 && mouse_y<view_yview[0]+174+64 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=floor(1+(mouse_x-(view_xview[0]+206))/64)+6
    autopair=0 //怨念残留喝了
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }
if wlaczonaopcja=2 && costawia2b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64*2 && mouse_y<view_yview[0]+174+64*2 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*2,1,1,0,c_white,1)}
if wlaczonaopcja=2 && costawia2b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64*2 && mouse_y<view_yview[0]+174+64*2 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6
    autopair=0 //怨念残留喝了
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }
if wlaczonaopcja=2 && costawia2b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64*3 && mouse_y<view_yview[0]+174+64*3 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*3,1,1,0,c_white,1)}
if wlaczonaopcja=2 && costawia2b=0 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64*3 && mouse_y<view_yview[0]+174+64*3 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6+6
    autopair=0 //怨念残留喝了
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }
if wlaczonaopcja=2 && costawia2b=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110 && mouse_y<view_yview[0]+174 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110,1,1,0,c_white,1)}
if wlaczonaopcja=2 &&costawia2b=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110 && mouse_y<view_yview[0]+174 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6+6+6
    autopair=0 //怨念残留喝了
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }

if wlaczonaopcja=2 && costawia2b=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64 && mouse_y<view_yview[0]+174+64 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64,1,1,0,c_white,1)}
if wlaczonaopcja=2 &&costawia2b=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64 && mouse_y<view_yview[0]+174+64 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6+6+6+6
    autopair=0 //怨念残留喝了
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }

if wlaczonaopcja=2 && costawia2b=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64*2 && mouse_y<view_yview[0]+174+64*2 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*2,1,1,0,c_white,1)}
if wlaczonaopcja=2 &&costawia2b=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64*2 && mouse_y<view_yview[0]+174+64*2 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6+6+6+6+6
    autopair=0 //怨念残留喝了
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }

if wlaczonaopcja=2 && costawia2b=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64*3 && mouse_y<view_yview[0]+174+64*3 && kliknieto=0
    {draw_sprite_ext(s_choosingobj,0,view_xview[0]+206+64*floor((mouse_x-(view_xview[0]+206))/64),view_yview[0]+110+64*3,1,1,0,c_white,1)}
if wlaczonaopcja=2 &&costawia2b=1 && mouse_x>view_xview[0]+206 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+110+64*3 && mouse_y<view_yview[0]+174+64*3 && mouse_check_button(mb_left) && kliknieto=0
    {
    delayus=0
    kliknieto=1
    sampelwyboru1=1//smp
    wlaczonaopcja=0;
    ustawiony=0
    costawia=0
    costawia2=floor(1+(mouse_x-(view_xview[0]+206))/64)+6+6+6+6+6+6+6
    autopair=0 //怨念残留喝了
    costawia3=0
    costawia4=0
    costawia5=0
            costawia6=0
    }

//探照灯、金飞龟、跳乌龟
if costawia2<>0 && (costawia2=20||costawia2=35||costawia2=39) && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    && !(costawia2=35 && mouse_y <= 32)
    {draw_sprite_ext(s_enemiesbank,costawia2-1,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia2<>0 && (costawia2=20||costawia2=35||costawia2=39) && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/  && !instance_position(mouse_x,mouse_y,o_edenemyblock)&& wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && setting_mode == 0
    && !(costawia2=35 && mouse_y <= 32)
    {
    kliknieto=1
    fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edenemyblock)
    autopair=0 //怨念残留喝了
    global.fotel=fofo.x
    global.fotel2=fofo.y
    fofo.coto=costawia2
    if costawia2=20 {wiatrak=1;fofo.is_petal=global.petal_spotlight;if global.petal_spotlight{fofo.rotomr[1]=global.petal_max_promien;fofo.rotors[1]=global.petal_promien_szybkosc}} //探照灯
    if costawia2=39 {wiatrak=3;global.goldcount=1}// 金飞龟——继承电光绕的优良传统
    if costawia2=35 {wiatrak=5} //可调跳乌龟
    }

//除去鱼和食人花石盾(所见即所得模式)外的摆放
if costawia2<>0 && (costawia2<>20 && costawia2<>35 && costawia2<>39 && costawia2<>40 && costawia2<>41 && costawia2<>43 && costawia2<>17 && costawia2<>22 && costawia2<>37) && !((costawia2>=6 && costawia2<=9 || costawia2=23 || costawia2>=44 && costawia2<=47) && global.objectoffset=0)  /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {draw_sprite_ext(s_enemiesbank,costawia2-1,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if costawia2<>0 && (costawia2<>20 && costawia2<>35 && costawia2<>39 && costawia2<>40 && costawia2<>41 && costawia2<>43 && costawia2<>17 && costawia2<>22 && costawia2<>37) && !((costawia2>=6 && costawia2<=9 || costawia2=23 || costawia2>=44 && costawia2<=47) && global.objectoffset=0) && mouse_check_button(mb_left)  /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15 && setting_mode == 0
    {
    if self_coto_check(2,costawia2){
    kliknieto=1
    fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edenemyblock)
    autopair=0 //怨念残留喝了
    global.fotel=fofo.x
    global.fotel2=fofo.y
    fofo.coto=costawia2
    }
    }


/*if costawia2=20 && kliknieto=0 && mouse_check_button(mb_left) && mouse_x>0 &&  mouse_y>0 && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {
    kliknieto=1
    fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edenemyblock)
    autopair=0 //怨念残留喝了
    global.fotel=fofo.x
    global.fotel2=fofo.y
    fofo.coto=costawia2
    wiatrak=1
    }*/

//鱼的摆放
if (costawia2=40||costawia2=41) && kliknieto=0 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0
    {draw_sprite_ext(s_enemiesbank,costawia2-1,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if (costawia2=40||costawia2=41) && kliknieto=0 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && setting_mode == 0
    {
    kliknieto=1
    fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edenemyblock)
    autopair=0 //怨念残留喝了
    global.fotel=fofo.x
    global.fotel2=fofo.y
    fofo.coto=costawia2
    wiatrak=6 //你们要的游鱼
    }

//正向食人花处理、石盾处理(所见即所得限定)
if global.objectoffset=0 && costawia2<>0 && (costawia2=6||costawia2=8||costawia2=23||costawia2=44||costawia2=46) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {draw_sprite_ext(s_enemiesbank,costawia2-1,floor((mouse_x-16)/32)*32+32,floor((mouse_y)/32)*32+32,1,1,0,c_white,0.5)}

if global.objectoffset=0 && costawia2<>0 && (costawia2=6||costawia2=8||costawia2=23||costawia2=44||costawia2=46) && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {
    kliknieto=1
    fofo=instance_create(floor((mouse_x-16)/32)*32+16,floor((mouse_y)/32)*32,o_edenemyblock)
    autopair=0 //怨念残留喝了
    global.fotel=fofo.x
    global.fotel2=fofo.y
    fofo.coto=costawia2
    }
//绿色倒食人花处理(所见即所得限定)
if global.objectoffset=0 && costawia2<>0 && costawia2=7 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {draw_sprite_ext(s_enemiesbank,costawia2-1,floor((mouse_x-16)/32)*32+32,floor((mouse_y)/32)*32+32+18,1,1,0,c_white,0.5)}

if global.objectoffset=0 && costawia2<>0 && costawia2=7 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {
    kliknieto=1
    fofo=instance_create(floor((mouse_x-16)/32)*32+16,floor((mouse_y)/32)*32,o_edenemyblock)
    autopair=0 //怨念残留喝了
    global.fotel=fofo.x
    global.fotel2=fofo.y
    fofo.coto=costawia2
    }
//红色倒食人花处理(所见即所得限定)
if global.objectoffset=0 && costawia2<>0 && costawia2=9 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {draw_sprite_ext(s_enemiesbank,costawia2-1,floor((mouse_x-16)/32)*32+32,floor((mouse_y)/32)*32+32+19,1,1,0,c_white,0.5)}

if global.objectoffset=0 && costawia2<>0 && costawia2=9 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {
    kliknieto=1
    fofo=instance_create(floor((mouse_x-16)/32)*32+16,floor((mouse_y)/32)*32,o_edenemyblock)
    autopair=0 //怨念残留喝了
    global.fotel=fofo.x
    global.fotel2=fofo.y
    fofo.coto=costawia2
    }
//蓝色倒食人花处理(所见即所得限定)
if global.objectoffset=0 && costawia2<>0 && costawia2=45 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {draw_sprite_ext(s_enemiesbank,costawia2-1,floor((mouse_x-16)/32)*32+32,floor((mouse_y)/32)*32+32+19,1,1,0,c_white,0.5)}

if global.objectoffset=0 && costawia2<>0 && costawia2=45 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {
    kliknieto=1
    fofo=instance_create(floor((mouse_x-16)/32)*32+16,floor((mouse_y)/32)*32,o_edenemyblock)
    autopair=0 //怨念残留喝了
    global.fotel=fofo.x
    global.fotel2=fofo.y
    fofo.coto=costawia2
    }
//灰色倒食人花处理(所见即所得限定)
if global.objectoffset=0 && costawia2<>0 && costawia2=47 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edbonusesblock) &&     wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {draw_sprite_ext(s_enemiesbank,costawia2-1,floor((mouse_x-16)/32)*32+32,floor((mouse_y)/32)*32+32+19,1,1,0,c_white,0.5)}

if global.objectoffset=0 && costawia2<>0 && costawia2=47 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15
    {
    kliknieto=1
    fofo=instance_create(floor((mouse_x-16)/32)*32+16,floor((mouse_y)/32)*32,o_edenemyblock)
    autopair=0 //怨念残留喝了
    global.fotel=fofo.x
    global.fotel2=fofo.y
    fofo.coto=costawia2
    }
//龟壳摆放
if costawia2=43 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
&& menujesie=0 && wlaczonaopcja=0 && delayus>15{
    if mouse_wheel_up() && global.shell_type>0{//鼠标滚轮向上
        global.shell_type-=1
    }
    if mouse_wheel_down() && global.shell_type<sprite_get_number(s_shellmask)-1{//鼠标滚轮向下
        global.shell_type+=1
    }
    draw_shell(global.shell_type,1);
}

if costawia2=43 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15 && setting_mode == 0
    {
    kliknieto=1
    fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edenemyblock)
    autopair=0 //怨念残留喝了
    global.fotel=fofo.x
    global.fotel2=fofo.y
    fofo.coto = costawia2;
    fofo.shell_type = global.shell_type
    }
//扎地摆放
if costawia2=17 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
&& menujesie=0 && wlaczonaopcja=0 && delayus>15{
    if mouse_wheel_up() && global.spike_type>0{//鼠标滚轮向上
        global.spike_type-=1
    }
    if mouse_wheel_down() && global.spike_type<3{//鼠标滚轮向下
        global.spike_type+=1
    }
    draw_spike(costawia2,global.spike_type,1);
}

if costawia2=17 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15 && setting_mode == 0
    {
    kliknieto=1
    fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edenemyblock)
    autopair=0 //怨念残留喝了
    global.fotel=fofo.x
    global.fotel2=fofo.y
    fofo.coto = costawia2;
    fofo.spike_type = global.spike_type
    draw_spike(costawia2,global.spike_type,1);
    }
//MW刺摆放
if costawia2=22 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
&& menujesie=0 && wlaczonaopcja=0 && delayus>15{
    if mouse_wheel_up() && global.spike_type>0{//鼠标滚轮向上
        global.spike_type-=1
    }
    if mouse_wheel_down() && global.spike_type<3{//鼠标滚轮向下
        global.spike_type+=1
    }
    draw_spike(costawia2,global.spike_type,1);
}

if costawia2=22 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15 && setting_mode == 0
    {
    kliknieto=1
    fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edenemyblock)
    autopair=0 //怨念残留喝了
    global.fotel=fofo.x
    global.fotel2=fofo.y
    fofo.coto = costawia2;
    fofo.spike_type = global.spike_type
    }
//MF刺摆放
if costawia2=37 /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
&& menujesie=0 && wlaczonaopcja=0 && delayus>15{
    if mouse_wheel_up() && global.spike_type>0{//鼠标滚轮向上
        global.spike_type-=1
    }
    if mouse_wheel_down() && global.spike_type<3{//鼠标滚轮向下
        global.spike_type+=1
    }
    draw_spike(costawia2,global.spike_type,1);
}

if costawia2=37 && mouse_check_button(mb_left) /*&& mouse_x>0 &&  mouse_y>0*/ && !instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0
    && menujesie=0 && wlaczonaopcja=0 && delayus>15 && setting_mode == 0
    {
    kliknieto=1
    fofo=instance_create(floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,o_edenemyblock)
    autopair=0 //怨念残留喝了
    global.fotel=fofo.x
    global.fotel2=fofo.y
    fofo.coto = costawia2;
    fofo.spike_type = global.spike_type
    }

if wiatrak>0
    {

    //电光绕摆放
    if wiatrak=1 {draw_sprite(s_wiatrak,0,(floor(mouse_x/32))*32+16,(floor(mouse_y/32))*32+16)}
    if wiatrak=1 && mouse_check_button(mb_left) && kliknieto=0 && (global.fotel<>(floor(mouse_x/32))*32 || global.fotel2<>(floor(mouse_y/32))*32)
        {
        wiatrak=2;
        fofo.rotor[1]=point_distance(fofo.x+16,fofo.y+16,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16)
        fofo.rotoa[1]=point_direction(fofo.x+16,fofo.y+16,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16)
        kliknieto=1
        fofo.test2=1
        }
    if wiatrak=2{
        if mouse_wheel_up() {
        if(!keyboard_check(global.key_select))global.agspeed+=1;else{global.agspeed+=0.01}
        if global.agspeed<=0{global.agspeed=global.agspeed+360}
        if global.agspeed>360{global.agspeed=global.agspeed-360}
        fofo.additional3=global.agspeed
        }
        if mouse_wheel_down() {
        if(!keyboard_check(global.key_select))global.agspeed-=1;else{global.agspeed-=0.01}
        if global.agspeed<=0{global.agspeed=global.agspeed+360}
        if global.agspeed>360{global.agspeed=global.agspeed-360}
        fofo.additional3=global.agspeed
        }
          if global.agspeed<0 {global.EDtest+=360+global.agspeed}
          else{global.EDtest+=global.agspeed}
          }
    //花瓣探照灯：左键确认速度，进入最大半径设置
    if wiatrak=2 && fofo.is_petal && mouse_check_button(mb_left) && kliknieto=0
        {
        wiatrak=10
        global.petal_max_promien=fofo.rotomr[1]
        global.petal_promien_szybkosc=fofo.rotors[1]
        kliknieto=1
        }
    //花瓣探照灯：鼠标点击设置最大半径（网格吸附）
    if wiatrak=10{
        draw_sprite(s_wiatrak,0,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16)
        draw_set_color(c_red)
        draw_line(fofo.x+16,fofo.y+16,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16)
        draw_set_alpha(0.3)
        draw_circle(fofo.x+16,fofo.y+16,point_distance(fofo.x+16,fofo.y+16,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16),0)
        draw_set_alpha(1)
        draw_set_font(cyferkimario)
        draw_set_color(c_white)
        draw_text(fofo.x,fofo.y-20,"max半径:"+string(point_distance(fofo.x+16,fofo.y+16,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16)))
           if mouse_check_button(mb_left) && kliknieto=0
               {
               fofo.rotomr[1]=point_distance(fofo.x+16,fofo.y+16,floor(mouse_x/32)*32+16,floor(mouse_y/32)*32+16)
               global.petal_max_promien=fofo.rotomr[1]
               fofo.petal_preview=fofo.rotor[1];if fofo.rotors[1]<0{fofo.petal_preview_dir=-1}else{fofo.petal_preview_dir=1};fofo.petal_dir_got_preview=0
               fofo.trail_count=0
               global.EDtest=0
               wiatrak=11
               kliknieto=1
               }
        if mouse_check_button(mb_right) {wiatrak=0;with(fofo)instance_destroy();}
        }
    //花瓣探照灯：鼠标滚轮设置半径变化速度
     if wiatrak=11{
         draw_set_font(cyferkimario)
         draw_set_color(c_white)
         draw_text(fofo.x,fofo.y-20,"半径变化速度:"+string(fofo.rotors[1]))
         if global.agspeed<0 {global.EDtest+=360+global.agspeed}
         else{global.EDtest+=global.agspeed}
          if mouse_wheel_up() {
             fofo.rotors[1]+=1
              if fofo.rotors[1]>99{fofo.rotors[1]=99}
             global.petal_promien_szybkosc=fofo.rotors[1]
fofo.petal_preview=fofo.rotor[1];if fofo.rotors[1]<0{fofo.petal_preview_dir=-1}else{fofo.petal_preview_dir=1};fofo.petal_dir_got_preview=0
              fofo.trail_count=0
              global.EDtest=0
              }
          if mouse_wheel_down() {
              fofo.rotors[1]-=1
               if fofo.rotors[1]<-99{fofo.rotors[1]=-99}
              global.petal_promien_szybkosc=fofo.rotors[1]
              fofo.petal_preview=fofo.rotor[1];if fofo.rotors[1]<0{fofo.petal_preview_dir=-1}else{fofo.petal_preview_dir=1};fofo.petal_dir_got_preview=0
             fofo.trail_count=0
             global.EDtest=0
             }
        if mouse_check_button(mb_left) && kliknieto=0
            {
            fofo.test2=2
            wiatrak=0
            kliknieto=1
            }
        if mouse_check_button(mb_right) {wiatrak=0;with(fofo)instance_destroy();}
        }
//金飞龟分割线
    if wiatrak=3 {draw_sprite(s_troopagoldfly,0,(floor(mouse_x/32))*32+16,(floor(mouse_y/32))*32+16);}//draw_text(fofo.x+4,fofo.y+4,global.agspeed)
    if wiatrak=3 && mouse_check_button(mb_left) && kliknieto=0 && (global.fotel<>(floor(mouse_x/32))*32 || global.fotel2<>(floor(mouse_y/32))*32)
        {
        wiatrak=4;
        fofo.rotor[1]=point_distance(fofo.x+16,fofo.y+16,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16)
        fofo.rotoa[1]=point_direction(fofo.x+16,fofo.y+16,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16)
        kliknieto=1
        fofo.test2=1
        global.EDtest = 0
        }
    if wiatrak=4{
        if mouse_wheel_up(){global.goldcount+=1;
        if global.goldcount<=0{global.goldcount=1}
        if global.goldcount>360{global.goldcount=360}
        fofo.additional3=global.goldcount
        }
        if mouse_wheel_down() {global.goldcount-=1;
        if global.goldcount<=0{global.goldcount=1}
        if global.goldcount>360{global.goldcount=360}
        fofo.additional3=global.goldcount
        }
         }
    //你们的血书跳乌龟
    if wiatrak=5 { fofo.test2=1 }
    //啊啊啊啊啊恶劣鱼
    //预览区域显示
    if wiatrak=6 && fofo.x<=(floor(mouse_x/32))*32 && fofo.y<=(floor(mouse_y/32))*32{
        draw_sprite(s_swimfishbegin,0,fofo.x,fofo.y);
        draw_sprite_ext(s_swimfishend,0,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,0.5);
        draw_set_color(make_color_rgb(173,16,0))
        draw_rectangle(fofo.x,fofo.y,(floor(mouse_x/32))*32+31,(floor(mouse_y/32))*32+31,1)
    }
    if wiatrak=6 && fofo.x>(floor(mouse_x/32))*32 && fofo.y<=(floor(mouse_y/32))*32{
        draw_sprite_ext(s_swimfishbegin,0,fofo.x+32,fofo.y,-1,1,0,c_white,1);
        draw_sprite_ext(s_swimfishend,0,(floor(mouse_x/32))*32+32,(floor(mouse_y/32))*32,-1,1,0,c_white,0.5);
        draw_set_color(make_color_rgb(173,16,0))
        draw_rectangle((floor(mouse_x/32))*32,fofo.y,fofo.x+31,(floor(mouse_y/32))*32+31,1)
    }
    //无效区域
    if wiatrak=6 && fofo.x<=(floor(mouse_x/32))*32 && fofo.y>(floor(mouse_y/32))*32{
        draw_sprite(s_fishdisabled,0,fofo.x,fofo.y);
        draw_sprite_ext(s_fishdisabled,1,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,0.5);
    }
    if wiatrak=6 && fofo.x>(floor(mouse_x/32))*32 && fofo.y>(floor(mouse_y/32))*32{
        draw_sprite_ext(s_fishdisabled,0,fofo.x+32,fofo.y,-1,1,0,c_white,1);
        draw_sprite_ext(s_fishdisabled,1,(floor(mouse_x/32))*32+32,(floor(mouse_y/32))*32,-1,1,0,c_white,0.5);
    }
    //取消
    if wiatrak=6 && mouse_check_button(mb_right) {wiatrak=0}
    //放置
    if wiatrak=6 && mouse_check_button(mb_left) && kliknieto=0 && fofo.y<=(floor(mouse_y/32))*32
        {
        fofo.fishendX=floor((mouse_x)/32)*32
        fofo.fishendY=floor((mouse_y)/32)*32
        fofo.test2=2
        kliknieto=1
        wiatrak=0
        }

    //view region
    if wiatrak=8 && fofo.x<=(floor(mouse_x/32))*32 && fofo.y<=(floor(mouse_y/32))*32{
        draw_sprite(s_camerabegin,0,fofo.x,fofo.y);
        draw_sprite_ext(s_cameraend,0,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,0.5);
        draw_set_color(make_color_rgb(173,16,0))
        draw_rectangle(fofo.x,fofo.y,(floor(mouse_x/32))*32+31,(floor(mouse_y/32))*32+31,1)
    }
    if wiatrak=8 && mouse_check_button(mb_right) {wiatrak=0;with(fofo)instance_destroy();}
    if wiatrak=8 && mouse_check_button(mb_left) && kliknieto=0 && fofo.x<=(floor(mouse_x/32))*32 && fofo.y<=(floor(mouse_y/32))*32 && floor((mouse_x-fofo.x)/32)>=19 && floor((mouse_y-fofo.y)/32)>=14
        {
        fofo.camera_endX=floor((mouse_x)/32)*32+32
        fofo.camera_endY=floor((mouse_y)/32)*32+32
        kliknieto=1
        wiatrak=0
        }

    if wiatrak=9 && fofo.x<=(floor(mouse_x/32))*32 && fofo.y<=(floor(mouse_y/32))*32{
        draw_sprite(s_waterbegin,0,fofo.x,fofo.y);
        draw_sprite_ext(s_waterend,0,(floor(mouse_x/32))*32,(floor(mouse_y/32))*32,1,1,0,c_white,0.5);
        draw_set_color(c_blue);draw_set_alpha(0.2)
        draw_rectangle(fofo.x,fofo.y,(floor(mouse_x/32))*32+31,(floor(mouse_y/32))*32+31,0)
        draw_set_color(c_white);draw_set_alpha(1)
    }
    if wiatrak=9 && mouse_check_button(mb_right) {wiatrak=0;with(fofo)instance_destroy();}
    if wiatrak=9 && mouse_check_button(mb_left) && kliknieto=0 && fofo.x<=(floor(mouse_x/32))*32 && fofo.y<=(floor(mouse_y/32))*32
        {
        fofo.water_endX=floor((mouse_x)/32)*32+32
        fofo.water_endY=floor((mouse_y)/32)*32+32
        kliknieto=1
        wiatrak=0
        }
    }

    //if wiatrak=2 && mouse_x<fofo.x+16
     //   {
     //   global.EDtest+=max(0.1,(point_distance(fofo.x+16,fofo.y+16,mouse_x,mouse_y)/100))*-1
     //   }
    if wiatrak=2 && mouse_check_button(mb_left) && kliknieto=0
        {
        wiatrak=0
        fofo.test2=2
        kliknieto=1
        }

    if wiatrak=4 && mouse_check_button(mb_left) && kliknieto=0
        {
        wiatrak=0
        fofo.test2=2
        kliknieto=1
        }

    if wiatrak=5 && mouse_check_button(mb_left) && mouse_y < fofo.y && kliknieto=0
        {
        wiatrak=0
        fofo.test2=2
        kliknieto=1
        }
    if wiatrak=6 && mouse_check_button(mb_left) && mouse_y >= fofo.y && kliknieto=0
        {
        wiatrak=0
        fofo.test2=2
        kliknieto=1
        }
    }
//敌人削除

if costawia2<>0 && kliknieto=0 && mouse_check_button(mb_right) /*&& mouse_x>0 &&  mouse_y>0*/ && instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0 && global.picking = false
    && menujesie=0 && wlaczonaopcja=0
    {
    fofo=instance_position(mouse_x,mouse_y,o_edenemyblock)
    if(fofo.coto<>40 && fofo.coto<>41 /*&& fofo.coto<>20*/){
        with(fofo){instance_destroy()}
    }
    else{
        if(fofo.coto = costawia2 /*&& fofo.coto<>20*/){
           with(fofo){instance_destroy()}
        }
    }
    }

/*if costawia2 = 20 && kliknieto=0 && mouse_check_button_pressed(mb_right) &&  instance_position(mouse_x,mouse_y,o_edenemyblock) && wiatrak=0 && global.picking = false
    && menujesie=0 && wlaczonaopcja=0
    {
    fofo=instance_position(mouse_x,mouse_y,o_edenemyblock)
    if fofo.coto=20
        {
        with(fofo){instance_destroy()}
        }
    }*/










// 右下角图标显示
if wlaczony=1
    {
    draw_set_blend_mode(bm_subtract)
    draw_sprite_ext(s_edhudmask,0,view_xview[0],view_yview[0],1,1,0,c_white,1)
    draw_set_blend_mode(bm_normal)
    draw_sprite_ext(s_edhud,0,view_xview[0]+5,view_yview[0]+5,1,1,0,c_white,1)
    }

if costawia<>0
        {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_helpusmask,0,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_helpus,0,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        }
if costawia2<>0
        {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_helpusmask,1,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_helpus,1,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        }
if costawia3<>0
        {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_helpusmask,2,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_helpus,2,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        }
if costawia4<>0
        {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_helpusmask,3,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_helpus,3,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        }
if costawia5<>0
        {
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_helpusmask,4,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_helpus,4,view_xview[0]+600,view_yview[0]+454,1,1,0,c_white,1)
        }
// 选中菜单栏某项后出现的箭头（这玩意有存在感吗？）
menujesie=0
if wlaczony=1 && costawia4b=0 && wiatrak=0
    {
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+160 &&
    mouse_y>view_yview[0]+97 && mouse_y<view_yview[0]+140
        {
        efekt+=10
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_edcursormask,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_edcursor,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120,1,1,0,c_white,1)
        opcja=1
        menujesie=1
        }

    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+160 &&
    mouse_y>view_yview[0]+97+60 && mouse_y<view_yview[0]+140+60
        {
        efekt+=10
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_edcursormask,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_edcursor,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60,1,1,0,c_white,1)
        opcja=2
        menujesie=1
        }
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+160 &&
    mouse_y>view_yview[0]+97+60+60 && mouse_y<view_yview[0]+140+60+60
        {
        efekt+=10
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_edcursormask,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_edcursor,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60,1,1,0,c_white,1)
        opcja=3
        menujesie=1
        }
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+160 &&
    mouse_y>view_yview[0]+97+60+60+60 && mouse_y<view_yview[0]+140+60+60+60
        {
        efekt+=10
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_edcursormask,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60+60,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_edcursor,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60+60,1,1,0,c_white,1)
        opcja=4
        menujesie=1
        }
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+160 &&
    mouse_y>view_yview[0]+97+60+60+60+60 && mouse_y<view_yview[0]+140+60+60+60+60
        {
        efekt+=10
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_edcursormask,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60+60+60,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_edcursor,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60+60+60,1,1,0,c_white,1)
        opcja=5
        menujesie=1
        }
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+160 &&
    mouse_y>view_yview[0]+97+60+60+60+60+60 && mouse_y<view_yview[0]+140+60+60+60+60+60
        {
        efekt+=10
        draw_set_blend_mode(bm_subtract)
        draw_sprite_ext(s_edcursormask,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60+60+60+60,1,1,0,c_white,1)
        draw_set_blend_mode(bm_normal)
        draw_sprite_ext(s_edcursor,0,view_xview[0]+155+10*sin(degtorad(efekt)),view_yview[0]+120+60+60+60+60+60,1,1,0,c_white,1)
        opcja=6
        menujesie=1
        }
    }
if opcja<>0 && mouse_check_button(mb_left) && kliknieto=0 && czywybieranieback=0
    {
    kliknieto=1
    wlaczonaopcja=opcja
    drinkability=opcja
    autopair=0 //怨念残留喝了
    }
// sampel wyboru 这段代码说明，sampelwyboru1=1的时候发出音效
if sampelwyboru1=1 {sampelwyboru1=0; if global.sample=1 {fofo=sound_play(snd_fire);sound_volume(snd_fire,global.glosnosc)}}
// 防止连点
if !mouse_check_button(mb_left) && !mouse_check_button(mb_right) {kliknieto=0}


// 进入背景选择界面
if czywybieranieback=1 && czywybieranieback<100
    {

    if o_edmain.backgroundpage=0{draw_sprite(s_edscenario,0,view_xview[0],view_yview[0])}
    if o_edmain.backgroundpage=1{draw_sprite(s_edscenario,1,view_xview[0],view_yview[0])}
    if o_edmain.backgroundpage=2{draw_sprite(s_edscenario,2,view_xview[0],view_yview[0])}
    //天气
    if o_edmain.backgroundpage=100{draw_sprite(s_edscenario,3,view_xview[0],view_yview[0])}

    if o_edmain.backgroundpage<>100 {
    //背景第一页、第二页、第三页按钮
    if abs(view_xview[0]+83-mouse_x)<16 && abs(view_yview[0]+438-mouse_y)<16 {draw_sprite_ext(s_left,0,view_xview[0]+83,view_yview[0]+438,1,1,0,c_yellow,1)}else{draw_sprite_ext(s_left,0,view_xview[0]+83,view_yview[0]+438,1,1,0,c_white,1)}
    if abs(view_xview[0]+147-mouse_x)<16 && abs(view_yview[0]+438-mouse_y)<16 {draw_sprite_ext(s_right,0,view_xview[0]+147,view_yview[0]+438,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_right,0,view_xview[0]+147,view_yview[0]+438,1,1,0,c_white,1)}

    if abs(view_xview[0]+83-mouse_x)<16 && abs(view_yview[0]+438-mouse_y)<16 && mouse_check_button(mb_left) && wahaha=0 {
    if o_edmain.backgroundpage=1{o_edmain.backgroundpage=0;wahaha = 1}
    }
    if abs(view_xview[0]+83-mouse_x)<16 && abs(view_yview[0]+438-mouse_y)<16 && mouse_check_button(mb_left) && wahaha=0 {
    if o_edmain.backgroundpage=2{o_edmain.backgroundpage=1;wahaha = 1}
    }
    if abs(view_xview[0]+147-mouse_x)<16 && abs(view_yview[0]+438-mouse_y)<16 && mouse_check_button(mb_left) && wahaha=0 {
    if o_edmain.backgroundpage=0{o_edmain.backgroundpage=1;wahaha = 1}
    }
    if abs(view_xview[0]+147-mouse_x)<16 && abs(view_yview[0]+438-mouse_y)<16 && mouse_check_button(mb_left) && wahaha=0 {
    if o_edmain.backgroundpage=1{o_edmain.backgroundpage=2;wahaha = 1}
    }
    }
    //天气按钮
    if mouse_x>view_xview[0]+462 && mouse_x<view_xview[0]+522 &&
    mouse_y>view_yview[0]+420 && mouse_y<view_yview[0]+450
    && o_edmain.backgroundpage<>100 && setting_mode <> 4
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+462,view_yview[0]+420,0.6,1.3,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) && wahaha=0 {o_edmain.backgroundpage=100; wahaha = 1}
    }


    //变量wahaha用于检测鼠标是否已经点击，松开后恢复
    if wahaha = 1 && !mouse_check_button(mb_left) {wahaha=0}

    //背景选择
    if o_edmain.backgroundpage=0{
    if mouse_x>view_xview[0]+27 && mouse_x<view_xview[0]+166 &&
    mouse_y>view_yview[0]+32 && mouse_y<view_yview[0]+135
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27,view_yview[0]+32+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=1  //plainsky
        }

        if mouse_x>view_xview[0]+27+139+3 && mouse_x<view_xview[0]+166+139+3 &&
        mouse_y>view_yview[0]+32 && mouse_y<view_yview[0]+135
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3 ,view_yview[0]+32+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=11  //bluesky
        }

        if mouse_x>view_xview[0]+27+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3 &&
        mouse_y>view_yview[0]+32 && mouse_y<view_yview[0]+135
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3,view_yview[0]+32+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=3  //grassland
        }

    if mouse_x>view_xview[0]+27+139+3+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3+139+3 &&
        mouse_y>view_yview[0]+32 && mouse_y<view_yview[0]+135
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3+139+3,view_yview[0]+32+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=4  //grassland paralax
        }

    //
    if mouse_x>view_xview[0]+27 && mouse_x<view_xview[0]+166 &&
    mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=5  //cave
        }

    if mouse_x>view_xview[0]+27+139+3 && mouse_x<view_xview[0]+166+139+3 &&
        mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3 ,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=2  //plainsky+cave
        }

    if mouse_x>view_xview[0]+27+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3 &&
        mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=7  //underwater
        }

    if mouse_x>view_xview[0]+27+139+3+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3+139+3 &&
        mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3+139+3,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=8  //underwater paralax
        }

    //
    if mouse_x>view_xview[0]+27 && mouse_x<view_xview[0]+166 &&
    mouse_y>view_yview[0]+32+102+16+102+16 && mouse_y<view_yview[0]+135+102+16+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27,view_yview[0]+32+102+16+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=12  //night
        }

    if mouse_x>view_xview[0]+27+139+3 && mouse_x<view_xview[0]+166+139+3 &&
        mouse_y>view_yview[0]+32+102+16+102+16 && mouse_y<view_yview[0]+135+102+16+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3 ,view_yview[0]+32+102+16+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=13  //night+cave
        }

    if mouse_x>view_xview[0]+27+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3 &&
        mouse_y>view_yview[0]+32+102+16+102+16 && mouse_y<view_yview[0]+135+102+16+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3,view_yview[0]+32+102+16+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=22  //castle
        }

    if mouse_x>view_xview[0]+27+139+3+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3+139+3 &&
        mouse_y>view_yview[0]+32+102+16+102+16 && mouse_y<view_yview[0]+135+102+16+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3+139+3,view_yview[0]+32+102+16+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=9  //castle paralax
        }
    }


    if o_edmain.backgroundpage=1{
    if mouse_x>view_xview[0]+27 && mouse_x<view_xview[0]+166 &&
    mouse_y>view_yview[0]+32 && mouse_y<view_yview[0]+135
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27,view_yview[0]+32+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=6  //cliff
        }

        if mouse_x>view_xview[0]+27+139+3 && mouse_x<view_xview[0]+166+139+3 &&
        mouse_y>view_yview[0]+32 && mouse_y<view_yview[0]+135
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3 ,view_yview[0]+32+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=23  //big clouds
        }

        if mouse_x>view_xview[0]+27+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3 &&
        mouse_y>view_yview[0]+32 && mouse_y<view_yview[0]+135
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3,view_yview[0]+32+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=19  //forest
        }

    if mouse_x>view_xview[0]+27+139+3+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3+139+3 &&
        mouse_y>view_yview[0]+32 && mouse_y<view_yview[0]+135
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3+139+3,view_yview[0]+32+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=26  //Goomba Party
        }

     //

       if mouse_x>view_xview[0]+27 && mouse_x<view_xview[0]+166 &&
       mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
       {
       draw_set_blend_mode(bm_add)
       draw_sprite_ext(s_prefsanim,0,view_xview[0]+27,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
       draw_set_blend_mode(bm_normal)
       backselect=16  //desert
        }

        if mouse_x>view_xview[0]+27+139+3 && mouse_x<view_xview[0]+166+139+3 &&
        mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3 ,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
       backselect=21  //desert ruin
        }

    if mouse_x>view_xview[0]+27+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3 &&
        mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=24 //snow new
        }

    if mouse_x>view_xview[0]+27+139+3+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3+139+3 &&
        mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3+139+3,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=20  //snow old
        }

    //

    if mouse_x>view_xview[0]+27 && mouse_x<view_xview[0]+166 &&
    mouse_y>view_yview[0]+32+102+16+102+16 && mouse_y<view_yview[0]+135+102+16+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27,view_yview[0]+32+102+16+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=15   //dusk
        }

    if mouse_x>view_xview[0]+27+139+3 && mouse_x<view_xview[0]+166+139+3 &&
        mouse_y>view_yview[0]+32+102+16+102+16 && mouse_y<view_yview[0]+135+102+16+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3 ,view_yview[0]+32+102+16+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=17   //dark
        }

    if mouse_x>view_xview[0]+27+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3 &&
        mouse_y>view_yview[0]+32+102+16+102+16 && mouse_y<view_yview[0]+135+102+16+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3,view_yview[0]+32+102+16+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=18   //volcano
        }

    if mouse_x>view_xview[0]+27+139+3+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3+139+3 &&
        mouse_y>view_yview[0]+32+102+16+102+16 && mouse_y<view_yview[0]+135+102+16+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3+139+3,view_yview[0]+32+102+16+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=25   //lava castle
        }

     }
     if o_edmain.backgroundpage=2{
    if mouse_x>view_xview[0]+27 && mouse_x<view_xview[0]+166 &&
    mouse_y>view_yview[0]+32 && mouse_y<view_yview[0]+135
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27,view_yview[0]+32+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=10
        }

        if mouse_x>view_xview[0]+27+139+3 && mouse_x<view_xview[0]+166+139+3 &&
        mouse_y>view_yview[0]+32 && mouse_y<view_yview[0]+135
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3 ,view_yview[0]+32+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=14
        }

        if mouse_x>view_xview[0]+27+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3 &&
        mouse_y>view_yview[0]+32 && mouse_y<view_yview[0]+135
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3,view_yview[0]+32+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=27
        }

    if mouse_x>view_xview[0]+27+139+3+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3+139+3 &&
        mouse_y>view_yview[0]+32 && mouse_y<view_yview[0]+135
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3+139+3,view_yview[0]+32+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=28
        }

     //

       if mouse_x>view_xview[0]+27 && mouse_x<view_xview[0]+166 &&
       mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
       {
       draw_set_blend_mode(bm_add)
       draw_sprite_ext(s_prefsanim,0,view_xview[0]+27,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
       draw_set_blend_mode(bm_normal)
       backselect=29
        }

       if mouse_x>view_xview[0]+27+139+3 && mouse_x<view_xview[0]+166+139+3 &&
       mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
       {
       draw_set_blend_mode(bm_add)
       draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
       draw_set_blend_mode(bm_normal)
       backselect=30
        }

       if mouse_x>view_xview[0]+27+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3 &&
       mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
       {
       draw_set_blend_mode(bm_add)
       draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
       draw_set_blend_mode(bm_normal)
       backselect=31
        }

       if mouse_x>view_xview[0]+27+139+3+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3+139+3 &&
       mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
       {
       draw_set_blend_mode(bm_add)
       draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3+139+3,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
       draw_set_blend_mode(bm_normal)
       backselect=32
        }

        /*
        if mouse_x>view_xview[0]+27+139+3 && mouse_x<view_xview[0]+166+139+3 &&
        mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3 ,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
       backselect=1
        }

    if mouse_x>view_xview[0]+27+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3 &&
        mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=1
        }

    if mouse_x>view_xview[0]+27+139+3+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3+139+3 &&
        mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3+139+3,view_yview[0]+32+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=1
        }

    //

    if mouse_x>view_xview[0]+27 && mouse_x<view_xview[0]+166 &&
    mouse_y>view_yview[0]+32+102+16+102+16 && mouse_y<view_yview[0]+135+102+16+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27,view_yview[0]+32+102+16+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=1
        }

    if mouse_x>view_xview[0]+27+139+3 && mouse_x<view_xview[0]+166+139+3 &&
        mouse_y>view_yview[0]+32+102+16+102+16 && mouse_y<view_yview[0]+135+102+16+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3 ,view_yview[0]+32+102+16+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=1
        }

    if mouse_x>view_xview[0]+27+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3 &&
        mouse_y>view_yview[0]+32+102+16+102+16 && mouse_y<view_yview[0]+135+102+16+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3,view_yview[0]+32+102+16+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=1
        }

    if mouse_x>view_xview[0]+27+139+3+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3+139+3 &&
        mouse_y>view_yview[0]+32+102+16+102+16 && mouse_y<view_yview[0]+135+102+16+102+16
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+27+139+3+139+3+139+3,view_yview[0]+32+102+16+102+16+32,1.2,4,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        backselect=1
        }
    */
    }

    //天气设置界面
    if o_edmain.backgroundpage=100 {
    draw_set_color(c_white)
    draw_set_font(cyferkimario)

    //Rainy
    draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('Rainy Level'))
    draw_set_halign(fa_right)
    if(setting_mode=6) {
        draw_text(view_xview[0]+405,view_yview[0]+100,string(foforainy))
    } else {
        draw_text(view_xview[0]+405,view_yview[0]+100,string(global.rainy))
    }
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+90 && mouse_y<view_yview[0]+110&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+90,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            if(setting_mode=6) { foforainy = max(0,min(5,get_integer("Set Rainy Level. Minimum is 0. Maximum is 5.", global.rainy)))
            } else {
            global.rainy = max(0,min(5,get_integer("Set Rainy Level. Minimum is 0. Maximum is 5.", global.rainy)))
            }
        }
    }

    //Falling Stars
    draw_text(view_xview[0]+40,view_yview[0]+130,string_upper('Falling Stars Level'))
    draw_set_halign(fa_right)
    if(setting_mode=6) {
        draw_text(view_xview[0]+405,view_yview[0]+130,string(fofofallingstars))
    } else {
        draw_text(view_xview[0]+405,view_yview[0]+130,string(global.fallingstars))
    }
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+120 && mouse_y<view_yview[0]+140&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+120,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            if(setting_mode=6) { fofofallingstars = max(0,min(3,get_integer("Set Falling Stars Level. Minimum is 0. Maximum is 3.", global.fallingstars)))
            } else {
            global.fallingstars = max(0,min(5,get_integer("Set Falling Stars Level. Minimum is 0. Maximum is 3.", global.fallingstars)))
            }
        }
    }

    //Snowy
    draw_text(view_xview[0]+40,view_yview[0]+160,string_upper('Snowy Level'))
    draw_set_halign(fa_right)
    if(setting_mode=6) {
        draw_text(view_xview[0]+405,view_yview[0]+160,string(fofosnowy))
    } else {
        draw_text(view_xview[0]+405,view_yview[0]+160,string(global.snowy))
    }
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+150 && mouse_y<view_yview[0]+170&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+150,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            if(setting_mode=6) { fofosnowy = max(0,min(5,get_integer("Set Snowy Level. Minimum is 0. Maximum is 5.", global.snowy)))
            } else {
            global.snowy = max(0,min(5,get_integer("Set Snowy Level. Minimum is 0. Maximum is 5.", global.snowy)))
            }
        }
    }

    //Thunder
    draw_text(view_xview[0]+40,view_yview[0]+190,string_upper('Thunder Level'))
    draw_set_halign(fa_right)
    if(setting_mode=6) {
        draw_text(view_xview[0]+405,view_yview[0]+190,string(fofothunder))
    } else {
        draw_text(view_xview[0]+405,view_yview[0]+190,string(global.thunder))
    }
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+180 && mouse_y<view_yview[0]+200&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+180,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            if(setting_mode=6) { fofothunder = max(0,min(1,get_integer("Set Thunder Level. Minimum is 0. Maximum is 1.", global.thunder)))
            } else {
            global.thunder = max(0,min(1,get_integer("Set Thunder Level. Minimum is 0. Maximum is 1.", global.thunder)))
            }
        }
    }

    //Windy
    draw_text(view_xview[0]+40,view_yview[0]+220,string_upper('Windy Level'))
    draw_set_halign(fa_right)
    if(setting_mode=6) {
        draw_text(view_xview[0]+405,view_yview[0]+220,string(fofowindy))
    } else {
        draw_text(view_xview[0]+405,view_yview[0]+220,string(global.windy))
    }
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+210 && mouse_y<view_yview[0]+230&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+210,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            if(setting_mode=6) { fofowindy = max(0,min(3,get_integer("Set Windy Level. Minimum is 0. Maximum is 3.", global.windy)))
            } else {
            global.windy = max(0,min(3,get_integer("Set Windy Level. Minimum is 0. Maximum is 3.", global.windy)))
            }
        }
    }

    //Darkness
    draw_text(view_xview[0]+40,view_yview[0]+430,string_upper('Dark Level'))
    draw_set_halign(fa_right)
    if(setting_mode=6) {
        draw_text(view_xview[0]+405,view_yview[0]+430,string(fofodarkness))
    } else {
        draw_text(view_xview[0]+405,view_yview[0]+430,string(global.darkness))
    }
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+420 && mouse_y<view_yview[0]+440&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+420,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            if(setting_mode=6) { fofodarkness = max(0,min(9,get_integer("Set Dark Level. Minimum is 0. Maximum is 9.", global.darkness)))
            } else {
            global.darkness = max(0,min(9,get_integer("Set Dark Level. Minimum is 0. Maximum is 9.", global.darkness)))
            }
        }
    }

    //Brightness
    draw_text(view_xview[0]+40,view_yview[0]+460,string_upper('Bright Level'))
    draw_set_halign(fa_right)
    if(setting_mode=6) {
        draw_text(view_xview[0]+405,view_yview[0]+460,string(fofobrightness))
    } else {
        draw_text(view_xview[0]+405,view_yview[0]+460,string(global.brightness))
    }
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+450 && mouse_y<view_yview[0]+470&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+450,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            if(setting_mode=6) { fofobrightness = max(0,min(5,get_integer("Set Bright Level. Minimum is 0. Maximum is 5.", global.brightness)))
            } else {
            global.brightness = max(0,min(5,get_integer("Set Bright Level. Minimum is 0. Maximum is 5.", global.brightness)))
            }
        }
    }

    //天气设置界面结束
    }
    //从天气页按BACK按钮退回到背景选择主页面
    if mouse_x>view_xview[0]+561 && mouse_x<view_xview[0]+621 &&
        mouse_y>view_yview[0]+427 && mouse_y<view_yview[0]+457
    && o_edmain.backgroundpage=100
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+561,view_yview[0]+427,0.5,1.3,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) && wahaha=0 {
            if(setting_mode=6) {
                myfofo.rainy=foforainy;
                myfofo.fallingstars=fofofallingstars;
                myfofo.snowy=fofosnowy;
                myfofo.thunder=fofothunder;
                myfofo.windy=fofowindy;
                myfofo.darkness=fofodarkness;
                myfofo.brightness=fofobrightness;
                //setting_mode=7-7*resetting;
                //resetting=0;
                setting_mode=7; wahaha = 1;
                myfofo.setonce2=0;
                o_edmain.backgroundpage=0;
                czywybieranieback=0;quitweatherselect=0;kliknieto=0;wiatrak=0;
            }
            else {o_edmain.backgroundpage=0; wahaha = 1;}
            // if quitweatherselect=1 {quitweatherselect=0;czywybieranieback=0;kliknieto=1}
        }
    }

    //按选择背景主页面BACK按钮退出
    if mouse_x>view_xview[0]+530 && mouse_x<view_xview[0]+590 && o_edmain.backgroundpage<>100 && wahaha = 0 &&
        mouse_y>view_yview[0]+420 && mouse_y<view_yview[0]+450
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+530,view_yview[0]+420,0.5,1.3,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        quitbgpselect=1
    } else { quitbgpselect=0 }

    if mouse_check_button(mb_left) && o_edmain.backgroundpage<>100 && wahaha = 0 &&
    mouse_x>view_xview[0]+530 && mouse_x<view_xview[0]+590 &&
    mouse_y>view_yview[0]+420 && mouse_y<view_yview[0]+450 &&
    quitbgpselect=1
        {if(setting_mode>0){setting_mode-=1}
        czywybieranieback=0;backselect=0;quitbgpselect=0}

    //选择好背景退出
    if mouse_check_button(mb_left) && o_edmain.backgroundpage<>100 &&
    ((mouse_x>view_xview[0]+27 && mouse_x<view_xview[0]+166)||(mouse_x>view_xview[0]+27+139+3 && mouse_x<view_xview[0]+166+139+3)||(mouse_x>view_xview[0]+27+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3)||(mouse_x>view_xview[0]+27+139+3+139+3+139+3 && mouse_x<view_xview[0]+166+139+3+139+3+139+3))
    &&((mouse_y>view_yview[0]+32 && mouse_y<view_yview[0]+135)||(mouse_y>view_yview[0]+32+102+16 && mouse_y<view_yview[0]+135+102+16)||(mouse_y>view_yview[0]+32+102+16+102+16 && mouse_y<view_yview[0]+135+102+16+102+16))
    && quitbgpselect=0 && kliknieto=0 && backselect>0
        {
        if(setting_mode=4){myfofo.bgp=backselect;setting_mode=5-5*resetting;resetting=0;myfofo.setonce2=0;costaiwa4=16}
        else{global.background=backselect;if(global.preview=-1)global.local_background=backselect;}
        czywybieranieback=0;kliknieto=1
        }

    }



// 进入音乐选择界面
if czywybieranieback=100
    {
    global.musicon=0

    draw_sprite(s_edscenario2,bgmpage,view_xview[0],view_yview[0])

    for(ii=0;ii<8;ii+=1){
        if mouse_x>view_xview[0]+460 && mouse_x<view_xview[0]+610 &&
        mouse_y>view_yview[0]+114+35*ii && mouse_y<view_yview[0]+114+35*ii+16
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+460,view_yview[0]+114+35*ii,1.3,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){bgmpage=ii;}
        }
    }
    /*for(ii=4;ii<8;ii+=1){
        if mouse_x>view_xview[0]+460 && mouse_x<view_xview[0]+610 &&
        mouse_y>view_yview[0]+116+35*ii+ && mouse_y<view_yview[0]+116+35*ii+12
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+460,view_yview[0]+116+34*ii,1.3,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button(mb_left){bgmpage=ii;}
        }
    }*/


    muzior=0
    muzioj=0
    if bgmpage=0{
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77 && mouse_y<view_yview[0]+89
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=1
        }

    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8 && mouse_y<view_yview[0]+89+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=2
        }
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7 && mouse_y<view_yview[0]+89+12+8+12+7
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=3
        }
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7 && mouse_y<view_yview[0]+89+12+8+12+7+12+7
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=4
        }
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=5
        }
        //
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=27
        }
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=13
        }
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=6
        }
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=7
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=8
        }
        //
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=9
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=10
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=11
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=12
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=23
        }
        //
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=14
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=15
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=16
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=17
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6+12+6 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6+12+6
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=18
        }
        //
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6+12+6+12+6 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6+12+6+12+6
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=19
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6+12+6+12+6+12+6 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6+12+6+12+6+12+6
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=24
        }
        //
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77 && mouse_y<view_yview[0]+89
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=22
        }

    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8 && mouse_y<view_yview[0]+89+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=20
        }
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7 && mouse_y<view_yview[0]+89+12+8+12+7
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=26
        }
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7 && mouse_y<view_yview[0]+89+12+8+12+7+12+7
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=25
        }
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7+12+5,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=28
        }
        //
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=21
        }
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+3 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+3
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+5,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=29
        }
     }
    if bgmpage=1{
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77 && mouse_y<view_yview[0]+89
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=41
        }

    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8 && mouse_y<view_yview[0]+89+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=42
        }
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7 && mouse_y<view_yview[0]+89+12+8+12+7
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=43
        }
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7 && mouse_y<view_yview[0]+89+12+8+12+7+12+7
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=44
        }
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=45
        }
        //
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=46
        }
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=47
        }
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=48
        }
    if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=49
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=50
        }
        //
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=51
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=52
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=53
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=58
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=54
        }
        //
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=55
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=56
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=57
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=76
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6+12+6 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6+12+6
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=59
        }
        //
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6+12+6+12+6 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6+12+6+12+6
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=60
        }
   if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6+12+6+12+6+12+6 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5+12+5+12+5+12+5+4+12+6+12+6+12+6+12+6
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=61
        }
        //
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77 && mouse_y<view_yview[0]+89
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=62
        }

    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8 && mouse_y<view_yview[0]+89+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=63
        }
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7 && mouse_y<view_yview[0]+89+12+8+12+7
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=64
        }
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7 && mouse_y<view_yview[0]+89+12+8+12+7+12+7
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=65
        }
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7+12+5,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=66
        }
        //
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=67
        }
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+3 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+3
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+5,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=68
        }
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+3+12+3 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+3+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+5+12+8,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=69
        }
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+3+12+3+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+3+12+5+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+5+12+8+12+5,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=70
        }
    if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+3+12+3+12+5+12+8 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+3+12+5+12+8+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+5+12+8+12+5+12+8,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=71
        }
   if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=73
        }
   if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=74
        }
   if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=75
        }
   if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+5,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=72
        }
   if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
        mouse_y>view_yview[0]+77+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5 && mouse_y<view_yview[0]+89+12+8+12+7+12+7+12+3+12+3+12+5+12+8+12+8+12+8+12+8+12+2+12+5+12+5+12+5
        {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+12+4+12+7+12+7+12+5+12+5+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6+12+6,1.3,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj=78
        }
        }
   if bgmpage=2{
        for(iii=0;iii<22;iii+=1){
            if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
            mouse_y>view_yview[0]+77+18*iii && mouse_y<view_yview[0]+89+18*iii
            {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+18*iii,1.3,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            muzioj=iii+101+(bgmpage-2)*44
            }
            if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
            mouse_y>view_yview[0]+77+18*iii && mouse_y<view_yview[0]+89+18*iii
            {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+18*iii,1.3,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            muzioj=iii+123+(bgmpage-2)*44
            }
        }
    }
   /*sms2*/
   if bgmpage=3{
        for(iii=0;iii<20;iii+=1){
            if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
            mouse_y>view_yview[0]+77+18*iii && mouse_y<view_yview[0]+89+18*iii
            {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+18*iii,1.3,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            muzioj=iii+101+(bgmpage-2)*44
            }
            /*if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
            mouse_y>view_yview[0]+77+18*iii && mouse_y<view_yview[0]+89+18*iii
            {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+18*iii,1.3,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            muzioj=iii+123+(bgmpage-2)*44
            }*/
        }
    }
   /*softendo*/
      if bgmpage=4{
        for(iii=0;iii<22;iii+=1){
            if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
            mouse_y>view_yview[0]+77+18*iii && mouse_y<view_yview[0]+89+18*iii
            {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+18*iii,1.3,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            muzioj=iii+173
            }
            if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
            mouse_y>view_yview[0]+77+18*iii && mouse_y<view_yview[0]+89+18*iii
            {
                if(iii<2){
                draw_set_blend_mode(bm_add)
                draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+18*iii,1.3,0.8,0,c_white,0.2)
                draw_set_blend_mode(bm_normal)
                muzioj=iii+195
                }
            }
        }
    }

    /*smwp orignal*/
    if bgmpage=5{
        for(iii=0;iii<13;iii+=1){
            if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
            mouse_y>view_yview[0]+77+18*iii && mouse_y<view_yview[0]+89+18*iii
            {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+18*iii,1.3,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            muzioj=iii+301
            }
        }
    }

   /*boss*/
      if bgmpage=6{
        for(iii=0;iii<21;iii+=1){
            if mouse_x>view_xview[0]+35 && mouse_x<view_xview[0]+185 &&
            mouse_y>view_yview[0]+77+18*iii && mouse_y<view_yview[0]+89+18*iii
            {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+35,view_yview[0]+77+18*iii,1.3,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            muzioj=iii+201
            }
            /*if mouse_x>view_xview[0]+240 && mouse_x<view_xview[0]+390 &&
            mouse_y>view_yview[0]+77+18*iii && mouse_y<view_yview[0]+89+18*iii
            {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+240,view_yview[0]+77+18*iii,1.3,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            muzioj=iii+123+(bgmpage-2)*44
            }*/
        }
    }

    /*custom*/
    if bgmpage=7{
        draw_set_color(c_white)
        draw_set_font(cyferkimario)

        /*draw_text(160,400,'COMING SOON')*/



        draw_text(view_xview[0] + 80, view_yview[0] + 400, 'PREV')
        draw_text(view_xview[0] + 160, view_yview[0] + 400, 'NEXT')
        draw_text(view_xview[0] + 240, view_yview[0] + 400, 'REFRESH')
        if mouse_x>view_xview[0]+70 && mouse_x<view_xview[0]+70+60&&
           mouse_y>view_yview[0]+390&& mouse_y<view_yview[0]+420
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+70,view_yview[0]+390,0.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button_pressed(mb_left) && listscroll>0 {listscroll-=10;}
        }
        if mouse_x>view_xview[0]+150 && mouse_x<view_xview[0]+150+50 &&
           mouse_y>view_yview[0]+390&& mouse_y<view_yview[0]+420
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+150,view_yview[0]+390,0.4,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            if mouse_check_button_pressed(mb_left) && listscroll < global.customMusicTotal - 10 {listscroll+=10;}
        }
        if mouse_x>view_xview[0]+230 && mouse_x<view_xview[0]+230+70 &&
           mouse_y>view_yview[0]+390 && mouse_y<view_yview[0]+420
        {
            draw_set_blend_mode(bm_add)
            draw_sprite_ext(s_prefsanim,0,view_xview[0]+230,view_yview[0]+390,0.6,0.8,0,c_white,0.2)
            draw_set_blend_mode(bm_normal)
            // 点击后刷新音乐列表
            if mouse_check_button_pressed(mb_left){music_list_update();show_message('Custom music list refreshed.');listscroll=0}
            /*if mouse_check_button_pressed(mb_left){
                global.customMusicName = get_open_filename('custom music|*.ogg;*.mp3','')
                if filename_path(global.customMusicName) != global.currentPath{
                    dir_problem = show_question('The music file is not in the same directory of your level.')
                listscroll=0
            }*/
        }

        // ========== 音乐列表显示 ==========
        // 显示当前页面的10首音乐
        for(i=1;i<=10;i+=1){
        if i+listscroll<=global.customMusicTotal{
            draw_text(view_xview[0] + 20, view_yview[0] + 60+ 30 * i, string(i+listscroll))
            draw_text(view_xview[0] + 50, view_yview[0] + 60+ 30 * i, string_upper(global.customMusicFile[i+listscroll]))
            if mouse_x>view_xview[0]+20 && mouse_x<view_xview[0]+360 &&
            mouse_y>view_yview[0]+50+30*i && mouse_y<view_yview[0]+70+30*i
            {
                draw_set_blend_mode(bm_add)
                draw_sprite_ext(s_prefsanim,0,view_xview[0]+20,view_yview[0]+50+30*i,2,0.8,0,c_white,0.2)
                draw_set_blend_mode(bm_normal)
                muzioj = 626+i+listscroll
            }
        }
        }
    }

    //no music
    if mouse_x>view_xview[0]+462 && mouse_x<view_xview[0]+522 &&
        mouse_y>view_yview[0]+420 && mouse_y<view_yview[0]+450
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+462,view_yview[0]+420,0.6,1.3,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        muzioj = 600  //600对应无音乐
    }

      //quitselect
    if mouse_x>view_xview[0]+550 && mouse_x<view_xview[0]+610 &&
        mouse_y>view_yview[0]+420 && mouse_y<view_yview[0]+450
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+550,view_yview[0]+420,0.5,1.3,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        quitbgmselect=1}else
    {quitbgmselect=0}



        muzior=muzioj
        if muzioj=0 {muzior=0}

        if muzior2<>muzior && muzior>0
            {
            muzior2=muzior//爽
            if muzior2=1 {mm_play_ext('.\Data\MW\ktkm1.dll',0); }
            if muzior2=2 {mm_play_ext('.\Data\MW\ktkm5.dll',0); }
            if muzior2=3 {mm_play_ext('.\Data\MW\ktkm6.dll',0); }
            if muzior2=4 {mm_play_ext('.\Data\MW\ktkm7.dll',0); }
            if muzior2=5 {mm_play_ext('.\Data\MW\ktkm9.dll',0); }
            if muzior2=6 {mm_play_ext('.\Data\MW\ktkm10.dll',0); }
            if muzior2=7 {mm_play_ext('.\Data\MW\ktkm12.dll',0); }
            if muzior2=8 {mm_play_ext('.\Data\MW\ktkm13.dll',0); }
            if muzior2=9 {mm_play_ext('.\Data\MW\ktkm14.dll',0); }
            if muzior2=10 {mm_play_ext('.\Data\MW\ktkm15.mp3',0); }
            if muzior2=11 {mm_play_ext('.\Data\MW\ktkm16.dll',0); }
            if muzior2=12 {mm_play_ext('.\Data\MW\ktkm17.dll',0); }
            if muzior2=13 {mm_play_ext('.\Data\MW\ktkm18.mp3',0); }
            if muzior2=14 {mm_play_ext('.\Data\MW\ktkm21.dll',0); }
            if muzior2=15 {mm_play_ext('.\Data\MW\ktkm22.dll',0); }
            if muzior2=16 {mm_play_ext('.\Data\MW\ktkm23.dll',0); }
            if muzior2=17 {mm_play_ext('.\Data\MW\ktkm24.dll',0); }
            if muzior2=18 {mm_play_ext('.\Data\MW\ktkm25.dll',0); }
            if muzior2=19 {mm_play_ext('.\Data\MW\ktkm26.dll',0); }
            if muzior2=20 {mm_play_ext('.\Data\MW\ktkm28.dll',0); }
            if muzior2=21 {mm_play_ext('.\Data\MW\ktkm36.dll',0); }
            if muzior2=22 {mm_play_ext('.\Data\MW\ktkm38.dll',0); }
            if muzior2=23 {mm_play_ext('.\Data\MW\ktkm20.dll',0); }
            if muzior2=24 {mm_play_ext('.\Data\MW\ktkm27.dll',0); }
            if muzior2=25 {mm_play_ext('.\Data\MW\ktkm37.dll',0); }
            if muzior2=26 {mm_play_ext('.\Data\MW\ktkm29.dll',0); }
            if muzior2=27 {mm_play_ext('.\Data\MW\ktkm35.dll',0); }
            if muzior2=28 {mm_play_ext('.\Data\MW\ktkm120.dll',0); }
            if muzior2=29 {mm_play_ext('.\Data\MW\ktkm19.dll',0); }
            if muzior2=41 {mm_play_ext('.\Data\MFR\ktkm0.dll',0); }
            if muzior2=42 {mm_play_ext('.\Data\MFR\ktkm50.mp3',0); }
            if muzior2=43 {mm_play_ext('.\Data\MFR\ktkm51.mp3',0); }
            if muzior2=44 {mm_play_ext('.\Data\MFR\ktkm52.mp3',0); }
            if muzior2=45 {mm_play_ext('.\Data\MFR\ktkm53.mp3',0); }
            if muzior2=46 {mm_play_ext('.\Data\MFR\ktkm55.mp3',0); }
            if muzior2=47 {mm_play_ext('.\Data\MFR\ktkm56.mp3',0); }
            if muzior2=48 {mm_play_ext('.\Data\MFR\ktkm41.dll',0); }
            if muzior2=49 {mm_play_ext('.\Data\MFR\ktkm93.mp3',0); }
            if muzior2=50 {mm_play_ext('.\Data\MFR\ktkm94.mp3',0); }
            if muzior2=51 {mm_play_ext('.\Data\MFR\ktkm100.mp3',0); }
            if muzior2=52 {mm_play_ext('.\Data\MFR\ktkm101.mp3',0); }
            if muzior2=53 {mm_play_ext('.\Data\MFR\ktkm103.mp3',0); }
            if muzior2=54 {mm_play_ext('.\Data\MFR\ktkm121.mp3',0); }
            if muzior2=55 {mm_play_ext('.\Data\MFR\ktkm122.mp3',0); }
            if muzior2=56 {mm_play_ext('.\Data\MFR\ktkm123.mp3',0); }
            if muzior2=57 {mm_play_ext('.\Data\MFR\ktkm124.mp3',0); }
            if muzior2=58 {mm_play_ext('.\Data\MFR\ktkm129.mp3',0); }
            if muzior2=59 {mm_play_ext('.\Data\MFR\ktkm130.mp3',0); }
            if muzior2=60 {mm_play_ext('.\Data\MFR\ktkm131.mp3',0); }
            if muzior2=61 {mm_play_ext('.\Data\MFR\ktkm132.mp3',0); }
            if muzior2=62 {mm_play_ext('.\Data\MFR\ktkm133.mp3',0); }
            if muzior2=63 {mm_play_ext('.\Data\MFR\ktkm134.mp3',0); }
            if muzior2=64 {mm_play_ext('.\Data\MFR\ktkm135.mp3',0); }
            if muzior2=65 {mm_play_ext('.\Data\MFR\ktkm210.mp3',0); }
            if muzior2=66 {mm_play_ext('.\Data\MFR\ktkm211.mp3',0); }
            if muzior2=67 {mm_play_ext('.\Data\MFR\ktkm212.mp3',0); }
            if muzior2=68 {mm_play_ext('.\Data\MFR\ktkm213.mp3',0); }
            if muzior2=69 {mm_play_ext('.\Data\MFR\ktkm214.mp3',0); }
            if muzior2=70 {mm_play_ext('.\Data\MFR\ktkm215.mp3',0); }
            if muzior2=71 {mm_play_ext('.\Data\MFR\ktkm2121.mp3',0); }
            if muzior2=72 {mm_play_ext('.\Data\MFR\ktkm88.dll',0); }
            if muzior2=73 {mm_play_ext('.\Data\MFR\ktkm39.dll',0); }
            if muzior2=74 {mm_play_ext('.\Data\MFR\ktkm40.dll',0); }
            if muzior2=75 {mm_play_ext('.\Data\MFR\ktkm42.mp3',0); }
            if muzior2=76 {mm_play_ext('.\Data\MFR\ktkm125.mp3',0); }
            if muzior2=77 {mm_play_ext('.\Data\MFR\ktkm90.mp3',0); }
            if muzior2=78 {mm_play_ext('.\Data\MFR\ktkm666.mp3',0); }

            if muzior2>=101&&muzior2<=144 {mm_play_ext('.\Data\SMS\sms'+string(muzior2-100)+'.ogg',0); }
            /*new music*/
            if muzior2>=145&&muzior2<=172 {mm_play_ext('.\Data\SMS2\sms'+string(muzior2-100)+'.ogg',0); }
            if muzior2>=173&&muzior2<=200 {mm_play_ext('.\Data\Softendo\std'+string(muzior2-172)+'.ogg',0); }
            if muzior2>=201&&muzior2<=204 {mm_play_ext('.\Data\Boss\boss'+string(muzior2-200)+'.dll',0); }
            if muzior2>=205&&muzior2<=230 {mm_play_ext('.\Data\Boss\boss'+string(muzior2-200)+'.ogg',0); }
            if muzior2>=301&&muzior2<=400 {mm_play_ext('.\Data\OM\om'+string(muzior2-300)+'.ogg',0);}
            if muzior2>626 {
                usePackage = global.customMusic;
                useName = global.customMusicFile[muzior2-626]
                mm_play_ext(global.customMusicDirectory+usePackage+'\'+useName,0)}
            }
            if mouse_check_button(mb_left) && quitbgmselect=1
            {if(setting_mode>0){setting_mode-=1}
            czywybieranieback=0;mm_stop_all_ext()}

            if mouse_check_button(mb_left) && quitbgmselect=0 && kliknieto=0 && muzioj>0
            {
            if (setting_mode=2){myfofo.bgm=string(muzior2);setting_mode=3-3*resetting;resetting=0;myfofo.setonce2=0;costaiwa4=16}
            else{global.muzyka=muzior2;if(global.preview=-1)global.local_muzyka=muzior2;}
            czywybieranieback=0;kliknieto=1;mm_stop_all_ext();
            }

            /*
            ktkm1.dll - Mario World 1
ktkm3.dll - Star
ktkm4.dll - End level
ktkm5.dll - Cave
ktkm6.dll - Rockland
ktkm7.dll - Castle
ktkm8.dll - Kuppa
ktkm9.dll - Map 1
ktkm10.dll - Ghost house
ktkm11.dll - End level
ktkm12.dll - map 2
ktkm13.dll - Starland
ktkm14.dll - Starland Rockland
ktkm15.dll - Underground
ktkm16.dll - Map 3
ktkm17.dll - Yoshi Island level 1
ktkm18.dll - Waterlevel
ktkm21.dll - MF5-1
ktkm22.dll - Sirens
ktkm23.dll - In the kitchen
ktkm24.dll - YKY
ktkm25.dll - Yet Bonus
ktkm26.dll - Youshi 2
ktkm28.dll - Apoplexy
ktkm36.dll - Savegame - select level
ktkm38.ogg - Castle
ktkm20.dll - Trancoi(Map 4)
ktkm27.dll - TheGoldenAges
ktkm37.dll - Federation(Map 8)
ktkm29.dll - BigBowser
ktkm35.dll - Overworld - SuperMarioBros2U
ktkm120.dll - GameSelect
ktkm19.dll - Rockland Yoshi*/
        if muzioj=0 {mm_stop_all_ext(); muzior=0; muzior2=0}



    }
// 进入可选项界面
if czywybieranieback=1000
    {

    draw_sprite(s_edadditional,0,view_xview[0],view_yview[0])
    draw_set_color(c_white)
    draw_set_font(cyferkimario)

    if (o_edmain.additionalpage<100) {
    if abs(view_xview[0]+83+443-mouse_x)<16 && abs(view_yview[0]+438-49-mouse_y)<16 {draw_sprite_ext(s_left,0,view_xview[0]+83+443,view_yview[0]+438-49,1,1,0,c_yellow,1)}else{draw_sprite_ext(s_left,0,view_xview[0]+83+443,view_yview[0]+438-49,1,1,0,c_white,1)}
    if abs(view_xview[0]+147+443-mouse_x)<16 && abs(view_yview[0]+438-49-mouse_y)<16 {draw_sprite_ext(s_right,0,view_xview[0]+147+443,view_yview[0]+438-49,1,1,0,c_yellow,1)} else {draw_sprite_ext(s_right,0,view_xview[0]+147+443,view_yview[0]+438-49,1,1,0,c_white,1)}

    if abs(view_xview[0]+83+443-mouse_x)<16 && abs(view_yview[0]+438-49-mouse_y)<16 && mouse_check_button(mb_left) && wahaha=0 {
    if o_edmain.additionalpage=1{o_edmain.additionalpage=0;wahaha = 1}
    }
    if abs(view_xview[0]+147+443-mouse_x)<16 && abs(view_yview[0]+438-49-mouse_y)<16 && mouse_check_button(mb_left) && wahaha=0 {
    if o_edmain.additionalpage=0{o_edmain.additionalpage=1;wahaha = 1}
    }
    }

    //防止鼠标连点
    if wahaha = 1 && !mouse_check_button(mb_left) {wahaha=0}

    if o_edmain.additionalpage=0 {

    //防穿墙模式
    draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('Modified Movement'))
    draw_set_halign(fa_right)
    if global.modifiedmov=1{draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+100,string_upper('yes'))}
    if global.modifiedmov=0{draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+100,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+90 && mouse_y<view_yview[0]+110&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+90,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.modifiedmov=1-global.modifiedmov;kliknieto=1}
    }
    //图层设置
    draw_text(view_xview[0]+40,view_yview[0]+130,string_upper('Layer Order'))
    draw_set_halign(fa_right)
    if global.layerord=2{draw_text(view_xview[0]+405,view_yview[0]+130,string_upper('Modified'))}
    if global.layerord=1{draw_text(view_xview[0]+405,view_yview[0]+130,string_upper('Water Above (1.5)'))}
    if global.layerord=0{draw_text(view_xview[0]+405,view_yview[0]+130,string_upper('Classic'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+120 && mouse_y<view_yview[0]+140&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+120,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.layerord=(global.layerord+1) mod 3;kliknieto=1}
    }
    //探照灯图层
    draw_text(view_xview[0]+40,view_yview[0]+160,string_upper('Roto-disc Layer'))
    draw_set_halign(fa_right)
    if global.rotodisclay=1{draw_text(view_xview[0]+405,view_yview[0]+160,string_upper('Above the Blocks'))}
    if global.rotodisclay=0{draw_text(view_xview[0]+405,view_yview[0]+160,string_upper('Below the Blocks'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+150 && mouse_y<view_yview[0]+170&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+150,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.rotodisclay=1-global.rotodisclay;kliknieto=1}
    }
    //水面高度
    draw_text(view_xview[0]+40,view_yview[0]+190,string_upper('Water Level'))
    draw_set_halign(fa_right)
    draw_text(view_xview[0]+405,view_yview[0]+190,string(global.poziomwody)+string_upper(' px'))
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+180 && mouse_y<view_yview[0]+200&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+180,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.poziomwody=min(999999,get_integer("Set the height of the water level.",global.poziomwody))}
    }
    //全局岩浆
    draw_text(view_xview[0]+40,view_yview[0]+220,string_upper('Fluid Type'))
    draw_set_halign(fa_right)
    if global.lava=1{draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+220,string_upper('lava'))}
    if global.lava=0{draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+220,string_upper('water'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+210 && mouse_y<view_yview[0]+230&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+210,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.lava=1-global.lava;kliknieto=1}
    }
    //自动水面
    draw_text(view_xview[0]+40,view_yview[0]+250,string_upper('Auto Fluid'))
    draw_set_halign(fa_right)
    if global.auto=1{draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+250,string_upper('yes'))}
    if global.auto=0{draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+250,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+240 && mouse_y<view_yview[0]+260&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+240,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.auto=1-global.auto;kliknieto=1}
    }
    //自动系参数
    if(global.auto){

    draw_text(view_xview[0]+40,view_yview[0]+280,string_upper('T1'))
    draw_set_halign(fa_right)
    draw_text(view_xview[0]+180,view_yview[0]+280,string(global.firstbound)+string_upper(' px'))
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+180 &&
       mouse_y>view_yview[0]+270 && mouse_y<view_yview[0]+290&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+270,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.firstbound=min(999999,max(-64,get_integer("Set the height of target 1. The fluid will automatically and repeatedly move between T1 and T2.",global.firstbound)))}
    }

    draw_text(view_xview[0]+264,view_yview[0]+280,string_upper('T2'))
    draw_set_halign(fa_right)
    draw_text(view_xview[0]+404,view_yview[0]+280,string(global.secondbound)+string_upper(' px'))
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+264 && mouse_x<view_xview[0]+404 &&
       mouse_y>view_yview[0]+270 && mouse_y<view_yview[0]+290&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+264,view_yview[0]+270,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.secondbound=min(999999,max(-64,get_integer("Set the height of target 2. Enter -64 to disable it, which means the fluid will stop moving after reaching T1",global.secondbound)))}
    }

    draw_text(view_xview[0]+40,view_yview[0]+310,string_upper('speed'))
    draw_set_halign(fa_right)
    draw_text(view_xview[0]+180,view_yview[0]+310,string(global.water_velocity)+string_upper(' unit'))
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+180 &&
       mouse_y>view_yview[0]+300 && mouse_y<view_yview[0]+320&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+300,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.water_velocity=min(9,max(0,get_integer("Set the speed of the fluid.(0,1,...,9)",global.water_velocity)))}
    }

    draw_text(view_xview[0]+264,view_yview[0]+310,string_upper('delay'))
    draw_set_halign(fa_right)
    draw_text(view_xview[0]+404,view_yview[0]+310,string(global.water_delay)+string_upper(' unit'))
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+264 && mouse_x<view_xview[0]+404 &&
       mouse_y>view_yview[0]+300 && mouse_y<view_yview[0]+320 && kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+264,view_yview[0]+300,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.water_delay=max(0,get_integer("Set the delay time before the fluid starts to move.",global.water_delay))}
    }

    }

    //解密砖第二功能开关
    draw_text(view_xview[0]+40,view_yview[0]+340,string_upper('Advanced Switch'))
    draw_set_halign(fa_right)
    if global.advswitch=1{draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+340,string_upper('yes'))}
    if global.advswitch=0{draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+340,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+330 && mouse_y<view_yview[0]+350&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+330,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.advswitch=1-global.advswitch;kliknieto=1}
    }

    //死亡不切bgm+快速复活
    draw_text(view_xview[0]+40,view_yview[0]+370,string_upper('fast retry'))
    draw_set_halign(fa_right)
    if global.fast_retry=1{draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+370,string_upper('yes'))}
    if global.fast_retry=0{draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+370,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+360 && mouse_y<view_yview[0]+380&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+360,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.fast_retry=1-global.fast_retry;kliknieto=1}
    }

    //MF甜菜
    draw_text(view_xview[0]+40,view_yview[0]+400,string_upper('MF style beet'))
    draw_set_halign(fa_right)
    if global.MFbeet=1{draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+400,string_upper('yes'))}
    if global.MFbeet=0{draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+400,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+390 && mouse_y<view_yview[0]+410&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+390,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.MFbeet=1-global.MFbeet;kliknieto=1}
    }

    //蔚蓝模式
    draw_text(view_xview[0]+40,view_yview[0]+430,string_upper('Celeste Style Switch'))
    draw_set_halign(fa_right)
    if global.celeste=1{draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+430,string_upper('yes'))}
    if global.celeste=0{draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+430,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+420 && mouse_y<view_yview[0]+440&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+420,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.celeste=1-global.celeste;kliknieto=1}
    }

    //水管无敌
        draw_text(view_xview[0]+40,view_yview[0]+460,string_upper('MF style pipe exit'))
    draw_set_halign(fa_right)
    if global.pipeout=1{draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+460,string_upper('yes'))}
    if global.pipeout=0{draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+460,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+450 && mouse_y<view_yview[0]+470&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+450,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.pipeout=1-global.pipeout;kliknieto=1}
    }
    //第一页结束
    }

    // =====第二页=====
    if o_edmain.additionalpage=1 {

    //快速通关
    draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('Faster Level Pass'))
    draw_set_halign(fa_right)
    if global.fastpass=1{draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+100,string_upper('yes'))}
    if global.fastpass=0{draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+100,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+90 && mouse_y<view_yview[0]+110&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+90,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.fastpass=1-global.fastpass;kliknieto=1}
    }

    //状态栏显示（HUD）
    draw_text(view_xview[0]+40,view_yview[0]+130,string_upper('HUD Display'))
    draw_set_halign(fa_right)
    if global.huddisplay=0{draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+130,string_upper('yes'))}
    if global.huddisplay=1{draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+130,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+120 && mouse_y<view_yview[0]+140&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+120,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.huddisplay=1-global.huddisplay;kliknieto=1}
    }


    //照明额外设置
    draw_text(view_xview[0]+40,view_yview[0]+160,string_upper('Settings for special luminous objects'))
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+150 && mouse_y<view_yview[0]+170&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+150,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){o_edmain.additionalpage=100;wahaha = 1;kliknieto=1}
    }

    //石盾砸砖
    draw_text(view_xview[0]+40,view_yview[0]+190,string_upper('Thwomp Activate Blocks'))
    draw_set_halign(fa_right)
    if global.stunblock=1{draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+190,string_upper('yes'))}
    if global.stunblock=0{draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+190,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+180 && mouse_y<view_yview[0]+200&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+180,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left){global.stunblock=1-global.stunblock;kliknieto=1}
    }


    //第二页结束
    }




    // =====额外照明设置=====
    if o_edmain.additionalpage=100 {
    draw_sprite(s_edadditional,2,view_xview[0],view_yview[0])

    //玩家火力花子弹o_fireball
    draw_text(view_xview[0]+40,view_yview[0]+100,string_upper('Player Fireball'))
    draw_set_halign(fa_right)
    if string_copy(global.lightobject,59,1) = '1' {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+100,string_upper('yes'))}
    if string_copy(global.lightobject,59,1) = '0' {draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+100,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+90 && mouse_y<view_yview[0]+110&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+90,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            kliknieto=1;
            if string_copy(global.lightobject,59,1) = '0' {
                global.lightobject = string_replace_char(global.lightobject, 59, '1');
            } else {
                global.lightobject = string_replace_char(global.lightobject, 59, '0');
            }
        }
    }

    //玩家甜菜子弹o_burax
    draw_text(view_xview[0]+40,view_yview[0]+130,string_upper('Player Beetroot'))
    draw_set_halign(fa_right)
    if string_copy(global.lightobject,60,1) = '1' {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+130,string_upper('yes'))}
    if string_copy(global.lightobject,60,1) = '0' {draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+130,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+120 && mouse_y<view_yview[0]+140&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+120,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            kliknieto=1;
            if string_copy(global.lightobject,60,1) = '0' {
                global.lightobject = string_replace_char(global.lightobject, 60, '1');
            } else {
                global.lightobject = string_replace_char(global.lightobject, 60, '0');
            }
        }
    }

    //无敌星马里奥o_marker (gwiazdka>0)
    draw_text(view_xview[0]+40,view_yview[0]+160,string_upper('Player Invincible Star'))
    draw_set_halign(fa_right)
    if string_copy(global.lightobject,61,1) = '1' {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+160,string_upper('yes'))}
    if string_copy(global.lightobject,61,1) = '0' {draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+160,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+150 && mouse_y<view_yview[0]+160&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+150,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            kliknieto=1;
            if string_copy(global.lightobject,61,1) = '0' {
                global.lightobject = string_replace_char(global.lightobject, 61, '1');
            } else {
                global.lightobject = string_replace_char(global.lightobject, 61, '0');
            }
        }
    }

    //红食人花子弹o_enemyfire
    draw_text(view_xview[0]+40,view_yview[0]+190,string_upper('Piranha Plant Fireball'))
    draw_set_halign(fa_right)
    if string_copy(global.lightobject,62,1) = '1' {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+190,string_upper('yes'))}
    if string_copy(global.lightobject,62,1) = '0' {draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+190,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+180 && mouse_y<view_yview[0]+200&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+180,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            kliknieto=1;
            if string_copy(global.lightobject,62,1) = '0' {
                global.lightobject = string_replace_char(global.lightobject, 62, '1');
            } else {
                global.lightobject = string_replace_char(global.lightobject, 62, '0');
            }
        }
    }

    //炮弹（普通）o_cannoni
    draw_text(view_xview[0]+40,view_yview[0]+220,string_upper('Bullet Bill'))
    draw_set_halign(fa_right)
    if string_copy(global.lightobject,63,1) = '1' {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+220,string_upper('yes'))}
    if string_copy(global.lightobject,63,1) = '0' {draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+220,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+210 && mouse_y<view_yview[0]+230&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+210,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            kliknieto=1;
            if string_copy(global.lightobject,63,1) = '0' {
                global.lightobject = string_replace_char(global.lightobject, 63, '1');
            } else {
                global.lightobject = string_replace_char(global.lightobject, 63, '0');
            }
        }
    }

    //锤子o_mlotekmalpki
    draw_text(view_xview[0]+40,view_yview[0]+250,string_upper('Hammer Bro. Hammer'))
    draw_set_halign(fa_right)
    if string_copy(global.lightobject,64,1) = '1' {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+250,string_upper('yes'))}
    if string_copy(global.lightobject,64,1) = '0' {draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+250,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+240 && mouse_y<view_yview[0]+260&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+240,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            kliknieto=1;
            if string_copy(global.lightobject,64,1) = '0' {
                global.lightobject = string_replace_char(global.lightobject, 64, '1');
            } else {
                global.lightobject = string_replace_char(global.lightobject, 64, '0');
            }
        }
    }

    //库巴火焰o_kuppafire
    draw_text(view_xview[0]+40,view_yview[0]+280,string_upper('Bowser Flame'))
    draw_set_halign(fa_right)
    if string_copy(global.lightobject,65,1) = '1' {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+280,string_upper('yes'))}
    if string_copy(global.lightobject,65,1) = '0' {draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+280,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+270 && mouse_y<view_yview[0]+290&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+270,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            kliknieto=1;
            if string_copy(global.lightobject,65,1) = '0' {
                global.lightobject = string_replace_char(global.lightobject, 65, '1');
            } else {
                global.lightobject = string_replace_char(global.lightobject, 65, '0');
            }
        }
    }

    //跟踪炮弹o_cannonig
    draw_text(view_xview[0]+40,view_yview[0]+310,string_upper('Bullet Bill Guided'))
    draw_set_halign(fa_right)
    if string_copy(global.lightobject,66,1) = '1' {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+310,string_upper('yes'))}
    if string_copy(global.lightobject,66,1) = '0' {draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+310,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+300 && mouse_y<view_yview[0]+320&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+300,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            kliknieto=1;
            if string_copy(global.lightobject,66,1) = '0' {
                global.lightobject = string_replace_char(global.lightobject, 66, '1');
            } else {
                global.lightobject = string_replace_char(global.lightobject, 66, '0');
            }
        }
    }

    //火球龟子弹o_fff
    draw_text(view_xview[0]+40,view_yview[0]+340,string_upper('Fire Bro. Fireball'))
    draw_set_halign(fa_right)
    if string_copy(global.lightobject,67,1) = '1' {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+340,string_upper('yes'))}
    if string_copy(global.lightobject,67,1) = '0' {draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+340,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+330 && mouse_y<view_yview[0]+350&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+330,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            kliknieto=1;
            if string_copy(global.lightobject,67,1) = '0' {
                global.lightobject = string_replace_char(global.lightobject, 67, '1');
            } else {
                global.lightobject = string_replace_char(global.lightobject, 67, '0');
            }
        }
    }

    //全局流体（岩浆）o_lightlava
    draw_text(view_xview[0]+40,view_yview[0]+370,string_upper('Fluid Lava Global'))
    draw_set_halign(fa_right)
    if string_copy(global.lightobject,68,1) = '1' {draw_set_color(make_color_rgb(168,160,248));draw_text(view_xview[0]+405,view_yview[0]+370,string_upper('yes'))}
    if string_copy(global.lightobject,68,1) = '0' {draw_set_color(make_color_rgb(248,136,112));draw_text(view_xview[0]+405,view_yview[0]+370,string_upper('no'))}
    draw_set_halign(fa_left)
    draw_set_color(c_white)
    if mouse_x>view_xview[0]+40 && mouse_x<view_xview[0]+230 &&
       mouse_y>view_yview[0]+360 && mouse_y<view_yview[0]+380&& kliknieto=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+40,view_yview[0]+360,1.4,0.8,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {
            kliknieto=1;
            if string_copy(global.lightobject,68,1) = '0' {
                global.lightobject = string_replace_char(global.lightobject, 68, '1');
            } else {
                global.lightobject = string_replace_char(global.lightobject, 68, '0');
            }
        }
    }

    //照明额外设置页面结束
    }

    //退出（照明额外设置）
    if mouse_x>view_xview[0]+561 && mouse_x<view_xview[0]+621 &&
        mouse_y>view_yview[0]+427 && mouse_y<view_yview[0]+457 && o_edmain.additionalpage>=100
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+561,view_yview[0]+427,0.5,1.3,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        if mouse_check_button(mb_left) {o_edmain.additionalpage=1;wahaha = 1;kliknieto=1;}
    }

    //退出（主页面）
    if mouse_x>view_xview[0]+561 && mouse_x<view_xview[0]+621 &&
        mouse_y>view_yview[0]+427 && mouse_y<view_yview[0]+457 && o_edmain.additionalpage<100 && wahaha=0
    {
        draw_set_blend_mode(bm_add)
        draw_sprite_ext(s_prefsanim,0,view_xview[0]+561,view_yview[0]+427,0.5,1.3,0,c_white,0.2)
        draw_set_blend_mode(bm_normal)
        quitadditional=1}else
    {quitadditional=0}
    if mouse_check_button(mb_left) && quitadditional=1
    {czywybieranieback=0;}

    }

 //if muzior2=0  {muzior2=1; global.muzyka=1}



// Ctrl+S 保存
if keyboard_check(vk_control) && keyboard_check(ord('S')) &&
setting_mode = 0 && wiatrak = 0
{
    Save_Script_Main()
    if global.autosavename!='' { show_message("level saved"); }
}

// Ctrl+L 读取
if keyboard_check(vk_control) && keyboard_check(ord('L')) &&
setting_mode = 0 && wiatrak = 0
{
    var warning; warning=show_question('Do you REALLY want to load a level WITHOUT the current level saved???')
    if warning=1 {
    global.autosavename='';Load_Script_Main()}
    if warning=0 {exit}
}

// 光照系统设置

/*无需中键，直接进入光照设置，所以注释掉
if wlaczonaopcja = 2 || wlaczonaopcja = 3 || wlaczonaopcja = 4 {
    if mouse_check_button_pressed(mb_middle) {
        set_light_mode = true;
    }
}*/

set_light_mode = true;

if set_light_mode {

    // ===绘制灯泡图标===
    if (scrolla < 2) {
    // Marks 类
    if wlaczonaopcja = 4 {

        // o_marker
        if (string_copy(global.lightobject, 1, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 3, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);

        // o_ice
        if (string_copy(global.lightobject, 2, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 0, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // o_windas
        if (string_copy(global.lightobject, 3, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 0, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 1, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 2, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 3, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 4, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

        // 部分可顶砖块
        // o_ice
        if (string_copy(global.lightobject, 10, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 2, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 3, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);
        //draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 4, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);
        //draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 2, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // o_yinyang
        if (string_copy(global.lightobject, 69, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 4, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);
    }

    // 景物类第一页
    if wlaczonaopcja = 3 && costawia3b = 0 {

        // Night Tree
        if (string_copy(global.lightobject, 4, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);

        // Big Night Tree
        if (string_copy(global.lightobject, 5, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);

        // Bright Light
        if (string_copy(global.lightobject, 6, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 4, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // Potrait
        if (string_copy(global.lightobject, 7, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

    }

    // 景物类第二页
    if wlaczonaopcja = 3 && costawia3b = 1 {

        // Lava Fall
        if (string_copy(global.lightobject, 8, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 4, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);

        // Roto-disc Center
        if (string_copy(global.lightobject, 9, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 1, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

    }

    // Bonus
    if wlaczonaopcja = 5 {

        // 问号砖
        if (string_copy(global.lightobject, 10, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 0, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 1, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 2, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 3, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 4, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 0, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

        // 红蘑菇
        if (string_copy(global.lightobject, 11, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 0, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 火力花
        if (string_copy(global.lightobject, 12, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 1, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 甜菜
        if (string_copy(global.lightobject, 13, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 2, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 绿果
        if (string_copy(global.lightobject, 14, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 3, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 无敌星
        if (string_copy(global.lightobject, 15, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 4, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 绿蘑菇
        if (string_copy(global.lightobject, 16, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 普通可碎砖、金砖
        if (string_copy(global.lightobject, 17, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 2, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 3, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

        // 金币
        if (string_copy(global.lightobject, 18, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

    }

    // 敌人类第一页
    if wlaczonaopcja = 2 && o_edmain.costawia2b = 0 {

        // 板栗仔
        if (string_copy(global.lightobject, 19, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 0, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);

        // 绿乌龟
        if (string_copy(global.lightobject, 20, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 1, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);

        // 红乌龟
        if (string_copy(global.lightobject, 21, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 2, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);

        // 绿飞龟
        if (string_copy(global.lightobject, 22, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 3, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);

        // 红刺猬
        if (string_copy(global.lightobject, 23, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 4, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);

        // 水管绿色食人花
        if (string_copy(global.lightobject, 24, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 0, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);

        // 水管红色食人花
        if (string_copy(global.lightobject, 25, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 1, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 2, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);

        // 红刺猬云
        if (string_copy(global.lightobject, 26, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 3, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);

        // 炮台
        if (string_copy(global.lightobject, 27, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 4, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);

        // 红鱼
        if (string_copy(global.lightobject, 28, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);

        // 绿鱼
        if (string_copy(global.lightobject, 29, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 0, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 蓝鱼
        if (string_copy(global.lightobject, 30, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 1, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 黄刺鱼
        if (string_copy(global.lightobject, 31, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 2, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 毒蘑菇
        if (string_copy(global.lightobject, 32, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 3, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 扎地食人花
        if (string_copy(global.lightobject, 33, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 4, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 岩浆
        if (string_copy(global.lightobject, 34, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 锤子龟
        if (string_copy(global.lightobject, 35, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 0, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

        // 探照灯
        if (string_copy(global.lightobject, 36, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 1, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

        // 火球
        if (string_copy(global.lightobject, 37, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 2, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

        // 地刺（MW样式）
        if (string_copy(global.lightobject, 38, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 3, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

        // 石盾
        if (string_copy(global.lightobject, 39, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 4, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

        // 库巴
        if (string_copy(global.lightobject, 40, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

    }

    // 敌人类第二页
    if wlaczonaopcja = 2 && o_edmain.costawia2b = 1 {

        // 灰刺猬
        if (string_copy(global.lightobject, 41, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 0, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);

        // 炮台（追踪）
        if (string_copy(global.lightobject, 42, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 1, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);

        // 火球龟
        if (string_copy(global.lightobject, 43, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 2, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);

        // 岩浆底部
        if (string_copy(global.lightobject, 44, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 3, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);

        // 炮台（倒）
        if (string_copy(global.lightobject, 27, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 4, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);

         // 炮台（追踪，倒）
        if (string_copy(global.lightobject, 42, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 0, 1, 1, 0, c_white, set_light_icon_alpha);

        // 布布鬼
        if (string_copy(global.lightobject, 45, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 0, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);

        // 硬壳龟
        if (string_copy(global.lightobject, 46, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 1, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);

        // 红飞龟
        if (string_copy(global.lightobject, 47, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 2, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);

        // 蓝乌龟
        if (string_copy(global.lightobject, 48, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 3, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);

        // 蓝飞龟
        if (string_copy(global.lightobject, 49, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 4, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);

        // 电珊瑚
        if (string_copy(global.lightobject, 50, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 1, 1, 1, 0, c_white, set_light_icon_alpha);

        // 地刺（MF样式）
        if (string_copy(global.lightobject, 51, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 0, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 金乌龟
        if (string_copy(global.lightobject, 52, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 1, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 金飞龟
        if (string_copy(global.lightobject, 53, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 2, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 静止探照灯
        if (string_copy(global.lightobject, 54, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 2, 1, 1, 0, c_white, set_light_icon_alpha);

        // 龟壳
        if (string_copy(global.lightobject, 55, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 0, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

        // 水管蓝色食人花
        if (string_copy(global.lightobject, 56, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 1, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 2, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

        // 水管灰色食人花
        if (string_copy(global.lightobject, 57, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 3, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 4, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

        // 灰刺猬云
        if (string_copy(global.lightobject, 58, 1) = '1') { set_light_icon_alpha = 1; } else { set_light_icon_alpha = 0.3; }
        draw_sprite_ext(s_setlight, 0, view_xview[0]+206+ 64 * 5, view_yview[0]+110+ 64 * 3, 1, 1, 0, c_white, set_light_icon_alpha);

    }

    } // 滚动条预览时候不显示





    // ===设置点击判定===

    if mouse_check_button_released(mb_right) {

        // Marks 类
        if wlaczonaopcja = 4 {

            // o_marker
            if mouse_x>view_xview[0]+206+ 64 * 3 && mouse_x<view_xview[0]+206+ 64 * (3 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1) {
                if string_copy(global.lightobject, 1, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 1, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 1, '0'); } }

            // o_ice
            if mouse_x>view_xview[0]+206+ 64 * 0 && mouse_x<view_xview[0]+206+ 64 * (0 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 2, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 2, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 2, '0'); } }

            // o_windas
            if mouse_x>view_xview[0]+206+ 64 * 0 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1) {
                if string_copy(global.lightobject, 3, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 3, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 3, '0'); } }

            // 部分可顶砖块（这里是信息砖、开关砖、水位砖，Bonus 处还有问号砖）
            if(mouse_x>view_xview[0]+206+ 64 * 2 && mouse_x<view_xview[0]+206+ 64 * (3 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1 + 1)) ||
              (mouse_x>view_xview[0]+206+ 64 * 2 && mouse_x<view_xview[0]+206+ 64 * (2 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1)) {
                if string_copy(global.lightobject, 10, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 10, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 10, '0'); } }

            // 开关砖阴阳部分另占一位
            if(mouse_x>view_xview[0]+206+ 64 * 4 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1 + 1)) {
                if string_copy(global.lightobject, 69, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 69, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 69, '0'); } }
        }

        // 景物第一页
        if wlaczonaopcja = 3 && costawia3b = 0 {

            // Night Tree
            if mouse_x>view_xview[0]+206+ 64 * 5 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1) {
                if string_copy(global.lightobject, 4, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 4, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 4, '0'); } }

            // Big Night Tree
            if mouse_x>view_xview[0]+206+ 64 * 5 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1 + 1) {
                if string_copy(global.lightobject, 5, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 5, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 5, '0'); } }

            // Bright Light
            if mouse_x>view_xview[0]+206+ 64 * 4 && mouse_x<view_xview[0]+206+ 64 * (4 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 6, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 6, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 6, '0'); } }

            // Potrait
            if mouse_x>view_xview[0]+206+ 64 * 5 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1) {
                if string_copy(global.lightobject, 7, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 7, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 7, '0'); } }

        }

        // 景物第二页
        if wlaczonaopcja = 3 && costawia3b = 1 {

            // Lava Fall
            if mouse_x>view_xview[0]+206+ 64 * 4 && mouse_x<view_xview[0]+206+ 64 * (4 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1 + 1) {
                if string_copy(global.lightobject, 8, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 8, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 8, '0'); } }

            // Roto-disc Center
            if mouse_x>view_xview[0]+206+ 64 * 1 && mouse_x<view_xview[0]+206+ 64 * (1 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 9, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 9, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 9, '0'); } }

        }

        // Bonus
        if wlaczonaopcja = 5 {

            // 问号砖
            if(mouse_x>view_xview[0]+206+ 64 * 0 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1)) ||
              (mouse_x>view_xview[0]+206+ 64 * 0 && mouse_x<view_xview[0]+206+ 64 * (0 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1)) {
                if string_copy(global.lightobject, 10, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 10, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 10, '0'); } }

            // 红蘑菇
            if mouse_x>view_xview[0]+206+ 64 * 0 && mouse_x<view_xview[0]+206+ 64 * (0 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 11, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 11, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 11, '0'); } }

            // 火力花
            if mouse_x>view_xview[0]+206+ 64 * 1 && mouse_x<view_xview[0]+206+ 64 * (1 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 12, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 12, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 12, '0'); } }

            // 甜菜
            if mouse_x>view_xview[0]+206+ 64 * 2 && mouse_x<view_xview[0]+206+ 64 * (2 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 13, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 13, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 13, '0'); } }

            // 绿果
            if mouse_x>view_xview[0]+206+ 64 * 3 && mouse_x<view_xview[0]+206+ 64 * (3 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 14, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 14, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 14, '0'); } }

            // 无敌星
            if mouse_x>view_xview[0]+206+ 64 * 4 && mouse_x<view_xview[0]+206+ 64 * (4 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 15, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 15, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 15, '0'); } }

            // 绿蘑菇
            if mouse_x>view_xview[0]+206+ 64 * 5 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 16, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 16, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 16, '0'); } }

            // 普通可碎砖、金砖
            if mouse_x>view_xview[0]+206+ 64 * 2 && mouse_x<view_xview[0]+206+ 64 * (3 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1) {
                if string_copy(global.lightobject, 17, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 17, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 17, '0'); } }

            // 金币
            if mouse_x>view_xview[0]+206+ 64 * 5 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1) {
                if string_copy(global.lightobject, 18, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 18, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 18, '0'); } }

        }

        // 敌人类第一页
        if wlaczonaopcja = 2 && o_edmain.costawia2b = 0 {

            // 板栗仔
            if mouse_x>view_xview[0]+206+ 64 * 0 && mouse_x<view_xview[0]+206+ 64 * (0 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1) {
                if string_copy(global.lightobject, 19, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 19, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 19, '0'); } }

            // 绿乌龟
            if mouse_x>view_xview[0]+206+ 64 * 1 && mouse_x<view_xview[0]+206+ 64 * (1 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1) {
                if string_copy(global.lightobject, 20, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 20, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 20, '0'); } }

            // 红乌龟
            if mouse_x>view_xview[0]+206+ 64 * 2 && mouse_x<view_xview[0]+206+ 64 * (2+ 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1) {
                if string_copy(global.lightobject, 21, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 21, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 21, '0'); } }

            // 绿飞龟
            if mouse_x>view_xview[0]+206+ 64 * 3 && mouse_x<view_xview[0]+206+ 64 * (3 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1) {
                if string_copy(global.lightobject, 22, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 22, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 22, '0'); } }

            // 红刺猬
            if mouse_x>view_xview[0]+206+ 64 * 4 && mouse_x<view_xview[0]+206+ 64 * (4 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1) {
                if string_copy(global.lightobject, 23, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 23, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 23, '0'); } }

            // 水管绿色食人花
            if(mouse_x>view_xview[0]+206+ 64 * 5 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1)) ||
              (mouse_x>view_xview[0]+206+ 64 * 0 && mouse_x<view_xview[0]+206+ 64 * (0 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1 + 1)) {
                if string_copy(global.lightobject, 24, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 24, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 24, '0'); } }

            // 水管红色食人花
            if mouse_x>view_xview[0]+206+ 64 * 1 && mouse_x<view_xview[0]+206+ 64 * (2 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1 + 1) {
                if string_copy(global.lightobject, 25, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 25, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 25, '0'); } }

            // 红刺猬云
            if mouse_x>view_xview[0]+206+ 64 * 3 && mouse_x<view_xview[0]+206+ 64 * (3 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1 + 1) {
                if string_copy(global.lightobject, 26, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 26, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 26, '0'); } }

            // 炮台
            if mouse_x>view_xview[0]+206+ 64 * 4 && mouse_x<view_xview[0]+206+ 64 * (4 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1+ 1) {
                if string_copy(global.lightobject, 27, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 27, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 27, '0'); } }

            // 红鱼
            if mouse_x>view_xview[0]+206+ 64 * 5 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1 + 1) {
                if string_copy(global.lightobject, 28, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 28, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 28, '0'); } }

            // 绿鱼
            if mouse_x>view_xview[0]+206+ 64 * 0 && mouse_x<view_xview[0]+206+ 64 * (0 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 29, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 29, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 29, '0'); } }

            // 蓝鱼
            if mouse_x>view_xview[0]+206+ 64 * 1 && mouse_x<view_xview[0]+206+ 64 * (1+ 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 30, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 30, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 30, '0'); } }

            // 黄刺鱼
            if mouse_x>view_xview[0]+206+ 64 * 2 && mouse_x<view_xview[0]+206+ 64 * (2 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 31, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 31, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 31, '0'); } }

            // 毒蘑菇
            if mouse_x>view_xview[0]+206+ 64 * 3 && mouse_x<view_xview[0]+206+ 64 * (3 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 32, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 32, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 32, '0'); } }

            // 扎地食人花
            if mouse_x>view_xview[0]+206+ 64 * 4 && mouse_x<view_xview[0]+206+ 64 * (4 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 33, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 33, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 33, '0'); } }

            // 岩浆
            if mouse_x>view_xview[0]+206+ 64 * 5 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 34, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 34, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 34, '0'); } }

            // 锤子龟
            if mouse_x>view_xview[0]+206+ 64 * 0 && mouse_x<view_xview[0]+206+ 64 * (0 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1) {
                if string_copy(global.lightobject, 35, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 35, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 35, '0'); } }

            // 探照灯
            if mouse_x>view_xview[0]+206+ 64 * 1 && mouse_x<view_xview[0]+206+ 64 * (1 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1) {
                if string_copy(global.lightobject, 36, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 36, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 36, '0'); } }

            // 火球
            if mouse_x>view_xview[0]+206+ 64 * 2 && mouse_x<view_xview[0]+206+ 64 * (2 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1) {
                if string_copy(global.lightobject, 37, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 37, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 37, '0'); } }

            // 地刺（MW样式）
            if mouse_x>view_xview[0]+206+ 64 * 3 && mouse_x<view_xview[0]+206+ 64 * (3 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1) {
                if string_copy(global.lightobject, 38, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 38, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 38, '0'); } }

            // 石盾
            if mouse_x>view_xview[0]+206+ 64 * 4 && mouse_x<view_xview[0]+206+ 64 * (4 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1) {
                if string_copy(global.lightobject, 39, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 39, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 39, '0'); } }

            // 库巴
            if mouse_x>view_xview[0]+206+ 64 * 5 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1) {
                if string_copy(global.lightobject, 40, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 40, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 40, '0'); } }

        }

        // 敌人类第二页
        if wlaczonaopcja = 2 && o_edmain.costawia2b = 1 {

            // 灰刺猬
            if mouse_x>view_xview[0]+206+ 64 * 0 && mouse_x<view_xview[0]+206+ 64 * (0 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1) {
                if string_copy(global.lightobject, 41, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 41, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 41, '0'); } }

            // 炮台（追踪）
            if(mouse_x>view_xview[0]+206+ 64 * 1 && mouse_x<view_xview[0]+206+ 64 * (1 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1)) ||
              (mouse_x>view_xview[0]+206+ 64 * 5 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1)) {
                if string_copy(global.lightobject, 42, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 42, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 42, '0'); } }

            // 火球龟
            if mouse_x>view_xview[0]+206+ 64 * 2 && mouse_x<view_xview[0]+206+ 64 * (2 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1) {
                if string_copy(global.lightobject, 43, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 43, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 43, '0'); } }

            // 岩浆底部
            if mouse_x>view_xview[0]+206+ 64 * 3 && mouse_x<view_xview[0]+206+ 64 * (3 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1) {
                if string_copy(global.lightobject, 44, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 44, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 44, '0'); } }

            // 炮台（倒）
            if mouse_x>view_xview[0]+206+ 64 * 4 && mouse_x<view_xview[0]+206+ 64 * (4 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 0 && mouse_y<view_yview[0]+110+ 64 * (0 + 1) {
                if string_copy(global.lightobject, 27, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 27, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 27, '0'); } }

            // 布布鬼
            if mouse_x>view_xview[0]+206+ 64 * 0 && mouse_x<view_xview[0]+206+ 64 * (0 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1 + 1) {
                if string_copy(global.lightobject, 45, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 45, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 45, '0'); } }

            // 硬壳龟
            if mouse_x>view_xview[0]+206+ 64 * 1 && mouse_x<view_xview[0]+206+ 64 * (1 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1 + 1) {
                if string_copy(global.lightobject, 46, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 46, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 46, '0'); } }

            // 红飞龟
            if mouse_x>view_xview[0]+206+ 64 * 2 && mouse_x<view_xview[0]+206+ 64 * (2 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1 + 1) {
                if string_copy(global.lightobject, 47, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 47, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 47, '0'); } }

            // 蓝乌龟
            if mouse_x>view_xview[0]+206+ 64 * 3 && mouse_x<view_xview[0]+206+ 64 * (3 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1 + 1) {
                if string_copy(global.lightobject, 48, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 48, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 48, '0'); } }

            // 蓝飞龟
            if mouse_x>view_xview[0]+206+ 64 * 4 && mouse_x<view_xview[0]+206+ 64 * (4 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1 + 1) {
                if string_copy(global.lightobject, 49, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 49, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 49, '0'); } }

            // 电珊瑚
            if mouse_x>view_xview[0]+206+ 64 * 5 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 1 && mouse_y<view_yview[0]+110+ 64 * (1 + 1) {
                if string_copy(global.lightobject, 50, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 50, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 50, '0'); } }

            // 地刺（MF样式）
            if mouse_x>view_xview[0]+206+ 64 * 0 && mouse_x<view_xview[0]+206+ 64 * (0 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 51, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 51, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 51, '0'); } }

            // 金乌龟
            if mouse_x>view_xview[0]+206+ 64 * 1 && mouse_x<view_xview[0]+206+ 64 * (1 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 52, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 52, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 52, '0'); } }

            // 金飞龟
            if mouse_x>view_xview[0]+206+ 64 * 2 && mouse_x<view_xview[0]+206+ 64 * (2 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 53, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 53, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 53, '0'); } }

            // 静止探照灯
            if mouse_x>view_xview[0]+206+ 64 * 5 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 2 && mouse_y<view_yview[0]+110+ 64 * (2 + 1) {
                if string_copy(global.lightobject, 54, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 54, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 54, '0'); } }

            // 龟壳
            if mouse_x>view_xview[0]+206+ 64 * 0 && mouse_x<view_xview[0]+206+ 64 * (0 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1) {
                if string_copy(global.lightobject, 55, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 55, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 55, '0'); } }

            // 水管蓝色食人花
            if mouse_x>view_xview[0]+206+ 64 * 1 && mouse_x<view_xview[0]+206+ 64 * (2 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1) {
                if string_copy(global.lightobject, 56, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 56, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 56, '0'); } }

            // 水管灰色食人花
            if mouse_x>view_xview[0]+206+ 64 * 3 && mouse_x<view_xview[0]+206+ 64 * (4 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1) {
                if string_copy(global.lightobject, 57, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 57, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 57, '0'); } }

            // 灰刺猬云
            if mouse_x>view_xview[0]+206+ 64 * 5 && mouse_x<view_xview[0]+206+ 64 * (5 + 1) &&
               mouse_y>view_yview[0]+110+ 64 * 3 && mouse_y<view_yview[0]+110+ 64 * (3 + 1) {
                if string_copy(global.lightobject, 58, 1) = '0'
                { global.lightobject = string_replace_char(global.lightobject, 58, '1'); } else
                { global.lightobject = string_replace_char(global.lightobject, 58, '0'); } }

        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
draw_set_blend_mode(bm_normal)
draw_set_font(font0)
draw_set_alpha(1)
draw_set_color(c_white)
draw_text(view_xview[0]+300,view_yview[0]+300,string(instance_number(o_edenemyblock)))
draw_text(view_xview[0]+400,view_yview[0]+350,string(view_xview[0]))
draw_text(view_xview[0]+400,view_yview[0]+400,string(view_yview[0]))

score=fps


draw_text(view_xview[0]+300,view_yview[0]+400,'mouseX+'+string(mouse_x))
draw_text(view_xview[0]+300,view_yview[0]+420,'mouseY+'+string(mouse_y))*/
opcja=0

//上面的是啥（
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=drawowanie blokow z ARRAYA
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if czywybieranieback=0{
if scrolla <= 1 {
  if mouse_x >= view_xview[0] && mouse_x <= view_xview[0]+640 && mouse_y >= view_yview[0]+480-16 && mouse_y <= view_yview[0]+480 && !mouse_check_button(vk_anykey) { scrolla=1 ; drinka = 1 } else { scrolla=0 ; drinka = 0 ; drinkaa = 0 }
}
if scrolla=1 && drinka=1 && drinkaa<30 { drinkaa+=1 }
if scrolla=1 && drinka=1 && drinkaa>=30 { drinkaa=0 ; scrolla=2 }

if scrolla = 2 {
  scrollx = view_xview[0]*((608-608*(640/room_width))/max((room_width-640),1))

  if !(mouse_y >= view_yview[0]+480-16 && mouse_y <= view_yview[0]+480 && mouse_x >= view_xview[0] && mouse_x <= view_xview[0]+640) { scrolla=0 ; drinka = 0 }

  if mouse_x >= view_xview[0]+scrollx+16 && mouse_x <= view_xview[0]+scrollx+16+608*(640/room_width) && mouse_y >= view_yview[0]+480-16 && mouse_y <= view_yview[0]+480 && mouse_check_button(mb_left) {
    scrolla = 3
scrollam1 = mouse_x - view_xview[0]
scrollam2 = scrollx
  }
}

if scrolla = 3 {
  if !mouse_check_button(mb_left) {
    if !(mouse_y >= view_yview[0]+480-16 && mouse_y <= view_yview[0]+480 && mouse_x >= view_xview[0] && mouse_x <= view_xview[0]+640) { scrolla=0 ; drinka = 0 } else { scrolla = 2 }
  } else {
scrollx = min(max(scrollam2 + mouse_x - view_xview[0] - scrollam1,0),608-608*(640/room_width))
    scroolx = min((max(((((room_width-640)*(scrollx/max((608-608*(640/room_width)),1))+320) div 32) * 32),320)),room_width-320)
  }

}

if scrolla >= 2 && scrolla <= 3 {
  draw_sprite_ext(s_drink1,0,view_xview[0],view_yview[0]+480-16,1,1,0,c_white,1)
  draw_sprite_ext(s_drink,0,view_xview[0]+scrollx+16,view_yview[0]+480-16,608*(640/room_width),1,0,c_white,1)
}


if scrollb <= 1 {
  if mouse_x >= view_xview[0]+640-16 && mouse_x <= view_xview[0]+640 && mouse_y >= view_yview[0] && mouse_y <= view_yview[0]+480 && !mouse_check_button(vk_anykey) { scrollb=1 ; drinkb = 1 } else { scrollb=0 ; drinkb = 0 ; drinkbb = 0 }
}
if scrollb=1 && drinkb=1 && drinkbb<30 { drinkbb+=1 }
if scrollb=1 && drinkb=1 && drinkbb>=30 { drinkbb=0 ; scrollb=2 }

if scrollb = 2 {
  scrolly = view_yview[0]*((448-448*(480/room_height))/max((room_height-480),1))

  if !(mouse_x >= view_xview[0]+640-16 && mouse_x <= view_xview[0]+640 && mouse_y >= view_yview[0] && mouse_y <= view_yview[0]+480) { scrollb=0 ; drinkb = 0 }

  if mouse_y >= view_yview[0]+scrolly+16 && mouse_y <= view_yview[0]+scrolly+16+448*(480/room_height) && mouse_x >= view_xview[0]+640-16 && mouse_x <= view_xview[0]+640 && mouse_check_button(mb_left) {
    scrollb = 3
scrollbm1 = mouse_y - view_yview[0]
scrollbm2 = scrolly
  }
}

if scrollb = 3 {
  if !mouse_check_button(mb_left) {
    if !(mouse_x >= view_xview[0]+640-16 && mouse_x <= view_xview[0]+640 && mouse_y >= view_yview[0] && mouse_y <= view_yview[0]+480) { scrollb=0 ; drinkb = 0 } else { scrollb = 2 }
  } else {
scrolly = min(max(scrollbm2 + mouse_y - view_yview[0] - scrollbm1,0),448-448*(480/room_height))
    scrooly = min((max(((((room_height-480)*(scrolly/max((448-448*(480/room_height)),1))+240) div 16) * 16),240)),room_height-240)
if (scrooly-240) mod 32 != 0 { scrooly += 16 }
if scrooly > room_height-240 { scrooly = room_height-240 }
  }

}

if scrollb >= 2 && scrollb <= 3 {
  draw_sprite_ext(s_drink2,0,view_xview[0]+640-16,view_yview[0],1,1,0,c_white,1)
  draw_sprite_ext(s_drinkk,0,view_xview[0]+640-16,view_yview[0]+scrolly+16,1,448*(480/room_height),0,c_white,1)
}
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.deletemode=1{
if mouse_check_button(mb_right)&& mouse_x>0 && mouse_y>0 && costawia4b=0 && kliknieto=0 && wiatrak=0 && menujesie=0 && wlaczonaopcja=0 && global.picking=false {
    arrayetapu[floor((mouse_x)/32),floor((mouse_y)/32)]=0
    fofo = instance_position(mouse_x,mouse_y,o_edenemyblock); with(fofo){instance_destroy()}
    fofo = instance_position(mouse_x,mouse_y,o_edsceneriesblock); with(fofo){instance_destroy()}
    fofo = instance_position(mouse_x,mouse_y,o_edmarkerblock); with(fofo){instance_destroy()}
    fofo = instance_position(mouse_x,mouse_y,o_edpassage); with(fofo){instance_destroy()}
    fofo = instance_position(mouse_x,mouse_y,o_edbonusesblock); with(fofo){instance_destroy()}
}
room_caption='DELETE MODE: ON'
}
else{room_caption='Super Mario Worker Project '+global.versiontext}

if !show_solid{
draw_set_font(cyferkimario)
draw_set_color(c_white)
draw_text(view_xview[0]+245,view_yview[0]+16,'INVISIBLE SOLID')
}
#define KeyPress_27
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if wlaczonaopcja=0{
    var warning2; warning2=show_question('Do you REALLY want to quit WITHOUT the current level saved???')
    if warning2=1 {room_goto(title)
    with(o_edwallsdrawer){instance_destroy()}//抽风什么的都给劳资去死
    with(o_edbonusesblock){instance_destroy()}
    with(o_edbrowser){instance_destroy()}
    with(o_edenemyblock){instance_destroy()}
    with(o_edmarkerblock){instance_destroy()}
    with(o_edpassage){instance_destroy()}
    with(o_edsceneriesblock){instance_destroy()}
    SXMS_C_Stop();global.autosavename=''}
    if warning2=0 {exit}}
if wlaczonaopcja>1 && czywybieranieback!=1 && czywybieranieback!=100{
    wlaczonaopcja=0}
if czywybieranieback=1{
    czywybieranieback=0}
if czywybieranieback=100{
    czywybieranieback=0
    SXMS_C_Stop()}
#define KeyPress_32
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ratio_level == 0 { wlaczony = wlaczony * -1; }
#define KeyPress_46
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.deletemode=1{
  question=show_question('Would you like to turn OFF delete mode? ')
}
else{
  question=show_question('Would you like to turn ON delete mode? ')
}
if question=0 {exit}
if question=1 {
  global.deletemode = global.deletemode*(-1)
}
#define KeyPress_68
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=WCZYTYWANIE SCENARIUSZA -> Skopiuj ca硑 kod je渓i chcesz go w innym miejscu!!!!!
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//global.scenariofile=''
//while global.scenariofile=''{
//global.scenariofile=get_open_filename('Mario Forever Scenario (.mfs)|*.mfs','Please Select Scenario To Load.mfs')}
//room_goto(Another_Level)
#define KeyPress_73
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*
with(o_edwallsdrawer){x+=32;y+=32}
with(o_edbonusesblock){x+=32;y+=32}
with(o_edbrowser){x+=32;y+=32}
with(o_edenemyblock){x+=32;y+=32}
with(o_edmarkerblock){x+=32;y+=32}
with(o_edpassage){x+=32;y+=32;exitx+=32;exity+=32}
with(o_edsceneriesblock){x+=32;y+=32}
*/
#define KeyPress_114
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var ques;
//ques=show_question('Do you REALLY want to test a level WITHOUT the current level saved???')
//if ques=1 {
global.autosavename1=global.autosavename
//global.autosavename_record = global.autosavename
global.autosavename=working_directory+"\temp.smwl"
create=file_text_open_write(global.autosavename)//create a file if file does not exist
file_text_write_string(create," ")
file_text_close(create)
Save_Script_Main();
global.testmode=1;

//记录测试前位置
global.xviewtemp = scroolx;
global.yviewtemp = scrooly;

with(o_edwallsdrawer){instance_destroy()}//抽风什么的都给劳资去死
with(o_edbonusesblock){instance_destroy()}
with(o_edbrowser){instance_destroy()}
with(o_edenemyblock){instance_destroy()}
with(o_edmarkerblock){instance_destroy()}
with(o_edpassage){instance_destroy()}
with(o_edsceneriesblock){instance_destroy()}
room_goto(Loader)
//}
//if ques=0 {exit}
#define KeyPress_115
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var ques;
//ques=show_question('Do you REALLY want to test a level in GodMode WITHOUT the current level saved???')
//if ques=1 {
global.autosavename1=global.autosavename
//global.autosavename_record = global.autosavename
global.testmode=1;
global.autosavename=working_directory+"\temp.smwl";
create=file_text_open_write(global.autosavename)//create a file if file does not exist
file_text_write_string(create," ")
file_text_close(create)
Save_Script_Main();
global.godmode=1

//记录测试前位置
global.xviewtemp = scroolx;
global.yviewtemp = scrooly;

//}
if global.godmode=1{
with(o_edwallsdrawer){instance_destroy()}//抽风什么的都给劳资去死
with(o_edbonusesblock){instance_destroy()}
with(o_edbrowser){instance_destroy()}
with(o_edenemyblock){instance_destroy()}
with(o_edmarkerblock){instance_destroy()}
with(o_edpassage){instance_destroy()}
with(o_edsceneriesblock){instance_destroy()}
room_goto(Loader)}
//if ques=0 {exit}
#define KeyPress_118
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


view_xview[0]=0
view_yview[0]=0
var dupiks, dupigrek, question;
question=show_question('Do you REALLY want to RESIZE of your level???')
if question=0 {exit}
if question=1 {
dupiks=get_integer('Set the size of level. X in tiles - min 20, max 1920',floor(room_width/32));
dupigrek=get_integer('Y in tiles - min 15, max 1920',floor(room_height/32))
}
x_trans = get_integer('Move x (in tiles) of (0,0) to:',0)
y_trans = get_integer('Move y (in tiles) of (0,0) to:',0)
x_new = min(max(dupiks,20),1920)
y_new = min(max(dupigrek,15),1920)
if room_width+x_trans*32>x_new*32 || room_height+y_trans*32>y_new*32 || x_trans*32<0 || y_trans*32<0 {
question=show_question('Some blocks may be out of the new border, which will be DELETED. Do you want to continue?')}
if question=0 {exit}
if question=1 {
sizechange=1
with(o_edwallsdrawer){x+=o_edmain.x_trans*32;y+=o_edmain.y_trans*32}
with(o_edbonusesblock){x+=o_edmain.x_trans*32;y+=o_edmain.y_trans*32}
with(o_edbrowser){x+=o_edmain.x_trans*32;y+=o_edmain.y_trans*32}
with(o_edenemyblock){
x+=o_edmain.x_trans*32;y+=o_edmain.y_trans*32
if(coto=40||coto=41){fishendX+=o_edmain.x_trans*32;fishendY+=o_edmain.y_trans*32}
}
with(o_edmarkerblock){
x+=o_edmain.x_trans*32;y+=o_edmain.y_trans*32
if(coto=32){target = max(target+o_edmain.y_trans*32,-64);if(type=2){water_endX+=o_edmain.x_trans*32;water_endY+=o_edmain.y_trans*32}}
if(coto=33){if(height>-64)height = max(height+o_edmain.y_trans*32,-63)}
if(coto=34){camera_endX+=o_edmain.x_trans*32;camera_endY+=o_edmain.y_trans*32}
}
with(o_edpassage){x+=o_edmain.x_trans*32;y+=o_edmain.y_trans*32;exitx+=o_edmain.x_trans*32;exity+=o_edmain.y_trans*32}
with(o_edsceneriesblock){x+=o_edmain.x_trans*32;y+=o_edmain.y_trans*32}

for( i=0;i<x_new;i+=1 ){
    for( j=0;j<y_new;j+=1 ){
        global.arrayetapu2[i,j]=0
    }
}

for ( i=max(0,x_trans) ; i<min(x_new,floor(room_width/32)+x_trans) ; i+=1 ) {
    for( j=max(0,y_trans) ; j<min(y_new,floor(room_height/32)+y_trans) ; j+=1 ){
    global.arrayetapu2[i,j]=arrayetapu[i-x_trans,j-y_trans]
    }
}

global.poziomwody+=y_trans*32
if global.auto{
    global.firstbound = max(global.firstbound+y_trans*32,-64);
    if(global.secondbound>-64)global.secondbound = max(global.secondbound+y_trans*32,-63);
}

room_set_width(room,x_new*32)
room_set_height(room,y_new*32)

global.autosavename1=global.autosavename
global.autosavename=working_directory+".\temp\TempChangeSize.smwl"
create=file_text_open_write(global.autosavename)//create a file if file does not exist
file_text_write_string(create," ")
file_text_close(create)

global.lvlwidth=x_new*32
global.lvlheight=y_new*32
global.donottemp=1
Save_Script_Main();

with(o_edwallsdrawer){instance_destroy()}//抽风什么的都给劳资去死
with(o_edbonusesblock){instance_destroy()}
with(o_edbrowser){instance_destroy()}
with(o_edenemyblock){instance_destroy()}
with(o_edmarkerblock){instance_destroy()}
with(o_edpassage){instance_destroy()}
with(o_edsceneriesblock){instance_destroy()}

room_restart()
Load_Script_Main()
file_delete(global.autosavename)
global.autosavename = global.autosavename1
}
#define KeyPress_121
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var a;
a=get_integer('Set the height of the water',floor((global.poziomwody+16)/32));
global.poziomwody=floor(a*32-16);
#define KeyPress_122
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.smoothmode=1{
  question=show_question('Would you like to turn OFF smooth mode? ')
}
else{
  question=show_question('Would you like to turn ON smooth mode? ')
}
if question=0 {exit}
if question=1 {
  if(global.smoothmode){instance_activate_all()}
  global.smoothmode = global.smoothmode*(-1)
}
#define KeyRelease_116
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
show_solid = 1-show_solid
#define KeyRelease_119
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.musicon=1{
            if global.local_muzyka=1 {mm_play_ext('.\Data\MW\ktkm1.dll',0); }
            if global.local_muzyka=2 {mm_play_ext('.\Data\MW\ktkm5.dll',0); }
            if global.local_muzyka=3 {mm_play_ext('.\Data\MW\ktkm6.dll',0); }
            if global.local_muzyka=4 {mm_play_ext('.\Data\MW\ktkm7.dll',0); }
            if global.local_muzyka=5 {mm_play_ext('.\Data\MW\ktkm9.dll',0); }
            if global.local_muzyka=6 {mm_play_ext('.\Data\MW\ktkm10.dll',0); }
            if global.local_muzyka=7 {mm_play_ext('.\Data\MW\ktkm12.dll',0); }
            if global.local_muzyka=8 {mm_play_ext('.\Data\MW\ktkm13.dll',0); }
            if global.local_muzyka=9 {mm_play_ext('.\Data\MW\ktkm14.dll',0); }
            if global.local_muzyka=10 {mm_play_ext('.\Data\MW\ktkm15.mp3',0); }
            if global.local_muzyka=11 {mm_play_ext('.\Data\MW\ktkm16.dll',0); }
            if global.local_muzyka=12 {mm_play_ext('.\Data\MW\ktkm17.dll',0); }
            if global.local_muzyka=13 {mm_play_ext('.\Data\MW\ktkm18.mp3',0); }
            if global.local_muzyka=14 {mm_play_ext('.\Data\MW\ktkm21.dll',0); }
            if global.local_muzyka=15 {mm_play_ext('.\Data\MW\ktkm22.dll',0); }
            if global.local_muzyka=16 {mm_play_ext('.\Data\MW\ktkm23.dll',0); }
            if global.local_muzyka=17 {mm_play_ext('.\Data\MW\ktkm24.dll',0); }
            if global.local_muzyka=18 {mm_play_ext('.\Data\MW\ktkm25.dll',0); }
            if global.local_muzyka=19 {mm_play_ext('.\Data\MW\ktkm26.dll',0); }
            if global.local_muzyka=20 {mm_play_ext('.\Data\MW\ktkm28.dll',0); }
            if global.local_muzyka=21 {mm_play_ext('.\Data\MW\ktkm36.dll',0); }
            if global.local_muzyka=22 {mm_play_ext('.\Data\MW\ktkm38.dll',0); }
            if global.local_muzyka=23 {mm_play_ext('.\Data\MW\ktkm20.dll',0); }
            if global.local_muzyka=24 {mm_play_ext('.\Data\MW\ktkm27.dll',0); }
            if global.local_muzyka=25 {mm_play_ext('.\Data\MW\ktkm37.dll',0); }
            if global.local_muzyka=26 {mm_play_ext('.\Data\MW\ktkm29.dll',0); }
            if global.local_muzyka=27 {mm_play_ext('.\Data\MW\ktkm35.dll',0); }
            if global.local_muzyka=28 {mm_play_ext('.\Data\MW\ktkm120.dll',0); }
            if global.local_muzyka=29 {mm_play_ext('.\Data\MW\ktkm19.dll',0); }
            if global.local_muzyka=41 {mm_play_ext('.\Data\MFR\ktkm0.dll',0); }
            if global.local_muzyka=42 {mm_play_ext('.\Data\MFR\ktkm50.mp3',0); }
            if global.local_muzyka=43 {mm_play_ext('.\Data\MFR\ktkm51.mp3',0); }
            if global.local_muzyka=44 {mm_play_ext('.\Data\MFR\ktkm52.mp3',0); }
            if global.local_muzyka=45 {mm_play_ext('.\Data\MFR\ktkm53.mp3',0); }
            if global.local_muzyka=46 {mm_play_ext('.\Data\MFR\ktkm55.mp3',0); }
            if global.local_muzyka=47 {mm_play_ext('.\Data\MFR\ktkm56.mp3',0); }
            if global.local_muzyka=48 {mm_play_ext('.\Data\MFR\ktkm41.dll',0); }
            if global.local_muzyka=49 {mm_play_ext('.\Data\MFR\ktkm93.mp3',0); }
            if global.local_muzyka=50 {mm_play_ext('.\Data\MFR\ktkm94.mp3',0); }
            if global.local_muzyka=51 {mm_play_ext('.\Data\MFR\ktkm100.mp3',0); }
            if global.local_muzyka=52 {mm_play_ext('.\Data\MFR\ktkm101.mp3',0); }
            if global.local_muzyka=53 {mm_play_ext('.\Data\MFR\ktkm103.mp3',0); }
            if global.local_muzyka=54 {mm_play_ext('.\Data\MFR\ktkm121.mp3',0); }
            if global.local_muzyka=55 {mm_play_ext('.\Data\MFR\ktkm122.mp3',0); }
            if global.local_muzyka=56 {mm_play_ext('.\Data\MFR\ktkm123.mp3',0); }
            if global.local_muzyka=57 {mm_play_ext('.\Data\MFR\ktkm124.mp3',0); }
            if global.local_muzyka=58 {mm_play_ext('.\Data\MFR\ktkm129.mp3',0); }
            if global.local_muzyka=59 {mm_play_ext('.\Data\MFR\ktkm130.mp3',0); }
            if global.local_muzyka=60 {mm_play_ext('.\Data\MFR\ktkm131.mp3',0); }
            if global.local_muzyka=61 {mm_play_ext('.\Data\MFR\ktkm132.mp3',0); }
            if global.local_muzyka=62 {mm_play_ext('.\Data\MFR\ktkm133.mp3',0); }
            if global.local_muzyka=63 {mm_play_ext('.\Data\MFR\ktkm134.mp3',0); }
            if global.local_muzyka=64 {mm_play_ext('.\Data\MFR\ktkm135.mp3',0); }
            if global.local_muzyka=65 {mm_play_ext('.\Data\MFR\ktkm210.mp3',0); }
            if global.local_muzyka=66 {mm_play_ext('.\Data\MFR\ktkm211.mp3',0); }
            if global.local_muzyka=67 {mm_play_ext('.\Data\MFR\ktkm212.mp3',0); }
            if global.local_muzyka=68 {mm_play_ext('.\Data\MFR\ktkm213.mp3',0); }
            if global.local_muzyka=69 {mm_play_ext('.\Data\MFR\ktkm214.mp3',0); }
            if global.local_muzyka=70 {mm_play_ext('.\Data\MFR\ktkm215.mp3',0); }
            if global.local_muzyka=71 {mm_play_ext('.\Data\MFR\ktkm2121.mp3',0); }
            if global.local_muzyka=72 {mm_play_ext('.\Data\MFR\ktkm88.dll',0); }
            if global.local_muzyka=73 {mm_play_ext('.\Data\MFR\ktkm39.dll',0); }
            if global.local_muzyka=74 {mm_play_ext('.\Data\MFR\ktkm40.dll',0); }
            if global.local_muzyka=75 {mm_play_ext('.\Data\MFR\ktkm42.mp3',0); }
            if global.local_muzyka=76 {mm_play_ext('.\Data\MFR\ktkm125.mp3',0); }
            if global.local_muzyka=77 {mm_play_ext('.\Data\MFR\ktkm90.mp3',0); }
            if global.local_muzyka=78 {mm_play_ext('.\Data\MFR\ktkm666.mp3',0); }
            if global.local_muzyka>=101&&global.local_muzyka<=144 {mm_play_ext('.\Data\SMS\sms'+string(global.local_muzyka-100)+'.ogg',0); }
            if global.local_muzyka>=145&&global.local_muzyka<=172 {mm_play_ext('.\Data\SMS2\sms'+string(global.local_muzyka-100)+'.ogg',0); }
            if global.local_muzyka>=173&&global.local_muzyka<=200 {mm_play_ext('.\Data\Softendo\std'+string(global.local_muzyka-172)+'.ogg',0); }
            if global.local_muzyka>=201&&global.local_muzyka<=204 {mm_play_ext('.\Data\Boss\boss'+string(global.local_muzyka-200)+'.dll',0); }
            if global.local_muzyka>=205&&global.local_muzyka<=230 {mm_play_ext('.\Data\Boss\boss'+string(global.local_muzyka-200)+'.ogg',0); }
            if global.local_muzyka>=301&&global.local_muzyka<=400 {mm_play_ext('.\Data\OM\om'+string(global.local_muzyka-300)+'.ogg',0);}
            if global.local_muzyka>=627{mm_play_ext(global.customMusicDirectory+global.customMusic+'\'+global.customMusicFile[global.local_muzyka-626],0)}

           } else { mm_stop_all_ext() }
