#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
kokoz=0
global.dowownix=70
efektor=0
findel=1000
skipper=0

cyferkimario=font_add_sprite(txt_mariofonts55,ord('!'),0,-15) // nastaw fonty
cyferkimario2=font_add_sprite(txt_mariofonts555,ord('!'),0,-15) // nastaw fonty


//dll_declare();
//browser_create(0,0,room_width-220,room_height);
//go_to('https://smwp.marioforever.net/');


textrotfl=0
sekwencja=0
timerrotfl=0


efekcior=0

dziubak=0
dziubaky=3


delay=0


bigur=10

verpath = 'http://update.smwp.marioforever.net/version17.ini';
vertemp = working_directory+'\version.ini';
//localversioncode = global.version; //This holds the version from the current version of the game the user owns
webversioncode = 0;
webversionnumber = '';
downloadlink = '';
globalvar drawUpdate;
drawUpdate = false; //If the local version does not match the web version, draw update message
updatecheck = false;
mm_play_ext('.\Data\MW\ktkm17.dll',0)
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//Make sure to delete the web version.txt so the next time the game is ran
//you can check for updates again
file_delete('.\version.ini');
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
window_set_cursor(cr_default);
draw_set_alpha(0.2)
draw_rectangle(0,200+sin(efektor)*20,1024,400-sin(efektor)*20,0)
draw_set_alpha(1)
draw_set_alpha(0.2)
draw_rectangle(0,200+sin(efektor+1)*20,1024,400-sin(efektor+1)*20,0)
draw_set_alpha(1)
draw_set_alpha(0.2)
draw_rectangle(0,200+sin(efektor+2)*20,1024,400-sin(efektor+2)*20,0)
draw_set_alpha(1)

efektor+=0.1




draw_set_font(cyferkimario)
draw_set_color(c_white)

draw_set_blend_mode(bm_add)
draw_sprite_ext(s_bigmariorun,efekcior*5,910,500-dziubak,3,3,0,c_white,0.4)
draw_set_blend_mode(bm_normal)

draw_set_halign(fa_left)
delay+=1



if bigur>0 bigur=bigur/1.5
if delay>100 && sekwencja=0 {delay=0; sekwencja=1;bigur=10}
if sekwencja=1 {kokoz+=1}


if kokoz=400 {instance_create(910,30,object132)}

findel=findel/1.1
if sekwencja=0 && global.checkupdate != 0
{
if textrotfl=3
    {
    draw_set_font(cyferkimario2)
    draw_set_blend_mode(bm_subtract)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'CHECKING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'UPDATE...',0,0,1+bigur,1,0)
    draw_set_font(cyferkimario)
    draw_set_blend_mode(bm_add)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'CHECKING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'UPDATE...',0,0,1+bigur,1,0)
    draw_set_blend_mode(bm_normal)
    }
if textrotfl=2
    {
    draw_set_font(cyferkimario2)
    draw_set_blend_mode(bm_subtract)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'CHECKING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'UPDATE..',0,0,1+bigur,1,0)
    draw_set_font(cyferkimario)
    draw_set_blend_mode(bm_add)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'CHECKING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'UPDATE..',0,0,1+bigur,1,0)
    draw_set_blend_mode(bm_normal)
    }
if textrotfl=1
    {
    draw_set_font(cyferkimario2)
    draw_set_blend_mode(bm_subtract)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'CHECKING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'UPDATE.',0,0,1+bigur,1,0)
    draw_set_font(cyferkimario)
    draw_set_blend_mode(bm_add)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'CHECKING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'UPDATE.',0,0,1+bigur,1,0)
    draw_set_blend_mode(bm_normal)
    }
if textrotfl=0
    {
    draw_set_font(cyferkimario2)
    draw_set_blend_mode(bm_subtract)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'CHECKING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'UPDATE',0,0,1+bigur,1,0)
    draw_set_font(cyferkimario)
    draw_set_blend_mode(bm_add)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'CHECKING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'UPDATE',0,0,1+bigur,1,0)
    draw_set_blend_mode(bm_normal)
}}

if sekwencja=0 && global.checkupdate = 0
{
if textrotfl=3
    {
    draw_set_font(cyferkimario2)
    draw_set_blend_mode(bm_subtract)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'PREPARING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'FILES...',0,0,1+bigur,1,0)
    draw_set_font(cyferkimario)
    draw_set_blend_mode(bm_add)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'PREPARING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'FILES...',0,0,1+bigur,1,0)
    draw_set_blend_mode(bm_normal)
    }
if textrotfl=2
    {
    draw_set_font(cyferkimario2)
    draw_set_blend_mode(bm_subtract)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'PREPARING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'FILES..',0,0,1+bigur,1,0)
    draw_set_font(cyferkimario)
    draw_set_blend_mode(bm_add)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'PREPARING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'FILES..',0,0,1+bigur,1,0)
    draw_set_blend_mode(bm_normal)
    }
if textrotfl=1
    {
    draw_set_font(cyferkimario2)
    draw_set_blend_mode(bm_subtract)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'PREPARING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'FILES.',0,0,1+bigur,1,0)
    draw_set_font(cyferkimario)
    draw_set_blend_mode(bm_add)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'PREPARING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'FILES.',0,0,1+bigur,1,0)
    draw_set_blend_mode(bm_normal)
    }
if textrotfl=0
    {
    draw_set_font(cyferkimario2)
    draw_set_blend_mode(bm_subtract)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'PREPARING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'FILES',0,0,1+bigur,1,0)
    draw_set_font(cyferkimario)
    draw_set_blend_mode(bm_add)
    draw_text_ext_transformed(905-40-20,300-findel+global.dowownix,'PREPARING',0,0,1+bigur,1,0)
    draw_text_ext_transformed(930-40-20,320+findel+global.dowownix,'FILES',0,0,1+bigur,1,0)
    draw_set_blend_mode(bm_normal)
}}

if sekwencja=1
{draw_set_halign(fa_center)

if mouse_x>860 && mouse_x<1024 && mouse_y>280 && mouse_y<455
    {
    window_set_cursor(cr_handpoint)
    if mouse_button=mb_left{room_goto_next();browser_destroy();window_set_cursor(cr_default);draw_set_halign(fa_left)}
    }

    draw_set_font(cyferkimario2)
    draw_set_blend_mode(bm_subtract)
    draw_text_ext_transformed(950-sin(efekcior)*15-40,280+global.dowownix,'CLICK',0,0,1+bigur,1,0)
    draw_text_ext_transformed_color(950+sin(efekcior)*15-40,290+global.dowownix,'HERE',0,0,1+bigur,1,0,c_white,c_white,c_white,c_white,1)
    draw_text_ext_transformed_color(950-sin(efekcior)*5-40,315+global.dowownix,'TO_START',0,0,1+bigur,1,0,c_white,c_white,c_white,c_white,1)
    draw_set_font(cyferkimario)
    draw_set_blend_mode(bm_add)
    draw_text_ext_transformed(950-sin(efekcior)*15-40,280+global.dowownix,'CLICK',0,0,1+bigur,1,0)
    draw_text_ext_transformed_color(950+sin(efekcior)*15-40,290-3+global.dowownix,'HERE',0,0,1+bigur,1,0,c_red,c_red,c_red,c_red,1)
    draw_text_ext_transformed_color(950-sin(efekcior)*5-40,315-3+global.dowownix,'TO_START',0,0,1+bigur,1,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
    draw_set_blend_mode(bm_normal)
}

if sekwencja=1 && (global.checkupdate = 1 || (global.checkupdate > 1 && betanumber = 0)) && drawUpdate = true {
draw_set_halign(fa_center)

if mouse_x>860 && mouse_x<1024 && mouse_y>590 && mouse_y<660
    {
    window_set_cursor(cr_handpoint)
    if mouse_button=mb_left{execute_shell(downloadlink,0)}
    }
    draw_set_font(cyferkimario2)
    draw_set_blend_mode(bm_subtract)
    draw_text_ext_transformed_color(965-40-20,540+findel+global.dowownix,'UPDATE_'+webversionnumber,0,0,1+bigur,1,0,c_white,c_white,c_white,c_white,1)
    draw_text_ext_transformed_color(965-40-20,565+findel+global.dowownix,'IS_AVAILABLE',0,0,1+bigur,1,0,c_white,c_white,c_white,c_white,1)
    draw_set_font(cyferkimario)
    draw_set_blend_mode(bm_add)
    draw_text_ext_transformed_color(965-40-20,540-3+findel+global.dowownix,'UPDATE_'+webversionnumber,0,0,1+bigur,1,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
    draw_text_ext_transformed_color(965-40-20,565-3+findel+global.dowownix,'IS_AVAILABLE',0,0,1+bigur,1,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
    draw_set_blend_mode(bm_normal)
}

if sekwencja=1 && global.checkupdate > 1 && betanumber != 0 && drawUpdate = true {
draw_set_halign(fa_center)

if mouse_x>860 && mouse_x<1024 && mouse_y>590 && mouse_y<660
    {
    window_set_cursor(cr_handpoint)
    if mouse_button=mb_left{execute_shell(downloadlink,0)}
    }
    draw_set_font(cyferkimario2)
    draw_set_blend_mode(bm_subtract)
    draw_text_ext_transformed_color(965-40-20,540+findel+global.dowownix,webversionnumber+'_BETA'+betanum,0,0,1+bigur,1,0,c_white,c_white,c_white,c_white,1)
    draw_text_ext_transformed_color(965-40-20,565+findel+global.dowownix,'IS_AVAILABLE',0,0,1+bigur,1,0,c_white,c_white,c_white,c_white,1)
    draw_set_font(cyferkimario)
    draw_set_blend_mode(bm_add)
    draw_text_ext_transformed_color(965-40-20,540-3+findel+global.dowownix,webversionnumber+'_BETA'+betanum,0,0,1+bigur,1,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
    draw_text_ext_transformed_color(965-40-20,565-3+findel+global.dowownix,'IS_AVAILABLE',0,0,1+bigur,1,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
    draw_set_blend_mode(bm_normal)
}

efekcior+=0.05
background_vspeed[0]=1
background_hspeed[0]=0

background_vspeed[1]=-0.1
background_hspeed[1]=-0.1
background_alpha[1]=0

timerrotfl+=5
if timerrotfl>100 {timerrotfl=0; textrotfl+=1}
if textrotfl>3 {textrotfl=0}



//

draw_set_blend_mode(bm_add)
draw_sprite_ext(s_maskselector,0,780,-350+dziubak,2,2,0,c_white,1)
draw_set_blend_mode(bm_normal)

draw_set_blend_mode(bm_add)
draw_sprite_ext(s_maskselector,0,780,800-dziubak,2,4,0,c_white,1)
draw_set_blend_mode(bm_normal)


dziubak+=dziubaky
dziubaky=dziubaky/1.02
