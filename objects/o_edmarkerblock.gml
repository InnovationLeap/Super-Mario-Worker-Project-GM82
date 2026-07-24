#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !variable_local_exists('coto'){
coto=0
}
drink=0
cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0) // 定义字体
deltax=0
deltay=0
imweitiao=0
textMessage=""
picked=false
color=0
bgm_change = 0
bgp_change = 0
bgm = '1'
bgp = 1
height=-64
haveset=0
linked=0
ledge_type = 0
setonce=0
setonce2=0
preview=-1
target=0
velocity=1

camera_endX=0
camera_endY=0
water_endX=0
water_endY=0

end_mark = 0

is_orange=0

//img_determine=0

//失败的步事件
/*if !img_determine{
    if coto<17{sprite_index = s_markersbank;image_index = coto;}
    else{
    switch(coto){
    case 17: sprite_index = s_markersbank2;break;
    case 18: sprite_index = s_markersbank3;image_alpha=0.4;depth=-1000;visible=o_edmain.show_solid;break;
    case 19: sprite_index = s_markersbank4;break;
    case 20: sprite_index = s_checkpoint;break;
    case 21: sprite_index = s_markersbank;image_index=17;break;
    case 22: sprite_index = s_sealroof;image_alpha=0.4;depth=-1000;visible=o_edmain.show_solid;break;
    case 23: sprite_index = s_scrollcenter;image_alpha=0.4;break;
    case 24: sprite_index = s_onlyyou;break;
    case 25: sprite_index = s_platforms;image_index=anime;break;
    case 26: sprite_index = s_pointblock5;break;
    case 27: sprite_index = s_pointblock6;image_index=color;break;
    case 28: sprite_index = s_yinyang;image_index=2*color+1;break;
    case 29: sprite_index = s_yinyang;image_index=2*color;break;
    case 30: sprite_index = s_ice;image_alpha=0.8;break;
    case 31: sprite_index = s_ledge;image_index=ledge_type;image_alpha=0.4;depth=-1000;visible=o_edmain.show_solid;break;
    }
    }
img_determine=1
}*/
//if coto=18{instance_create(x,y,o_edsolid); instance_destroy();}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//coto是很重要的变量，记录了这是“什么物品”，然后这段代码里面利用coto来确定显示什么精灵，因为同类物品在编辑界面同为一个object
if coto<17
draw_sprite(s_markersbank,coto,x,y)
else
switch(coto){
case 17:
draw_sprite(s_markersbank2,coto,x,y+32);break;
case 18:
if o_edmain.show_solid{
    draw_sprite_ext(s_markersbank3,coto,x,y,1,1,0,c_white,0.4)
    depth=-1000
}break;
case 19:
draw_sprite(s_markersbank4,coto,x,y);break;
case 20:
draw_sprite(s_checkpoint,0,x,y);break;
case 21:
draw_sprite(s_markersbank,17,x,y);break;
case 22:
if o_edmain.show_solid{
    draw_sprite_ext(s_sealroof,0,x,y,1,1,0,c_white,0.4)
    if y<>0 {y=0}
    depth=-1000
}break;
case 24:
draw_sprite_ext(s_onlyyou,0,x,y,1,1,0,c_white,0.4);break;
//新桥开始
case 25:
{
    draw_sprite(s_platforms,anime,x,y)
    draw_sprite(s_platformlabels,type,x,y)

    /*
    if mouse_x>=x && mouse_x<x+32 && mouse_y>=y && mouse_y<y+32 && mouse_wheel_up() && anime>0 && o_edmain.costawia4>0 {//鼠标滚轮向上
        anime-=1;global.platformanime=anime
    }
    if mouse_x>=x && mouse_x<x+32 && mouse_y>=y && mouse_y<y+32 && mouse_wheel_down() && anime<sprite_get_number(s_platforms)-1 && o_edmain.costawia4>0 {//鼠标滚轮向下
        anime+=1;global.platformanime=anime
    }
    */

    if mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 &&keyboard_check(global.key_submenu) && global.picking = false{//按shift修改
        var menustr, platformmenu;
        menustr='red long platform|red short platform|cloud platform|yellow long platform|yellow short platform|'
        menustr=menustr+'blue long platform|blue short platform|green long platform|green short platform|'
        menustr=menustr+'white long platform|white short platform|grey long platform|grey short platform|'
        menustr=menustr+'purple long platform|purple short platform|castle long platform|castle short platform with dots|'
        menustr=menustr+'orange castle long platform|orange castle short platform with dots'
        platformmenu=show_menu(menustr,-1)
        if platformmenu>=0 {anime=platformmenu;global.platformanime=anime}
    }
}break;
//新桥结束
//恶劣强滚开始
case 23:
{
    draw_set_color(c_white)
    /*if scrollspeed>3{scrollspeed=3}
    if scrollspeed<1{scrollspeed=1}*/
    draw_sprite_ext(s_scrollcenter,is_orange,x,y,1,1,0,c_white,0.4)
    draw_set_font(cyferkimario)
    autoscrollnum=ds_list_find_index(global.autoscrolls,id)//编号
    lastscroll=ds_list_find_value(global.autoscrolls,autoscrollnum-1)//上一个恶劣强滚
    draw_text(x,y,autoscrollnum)
    draw_text(x+32,y+32,scrollspeed)
    if is_orange=1{draw_set_color(c_orange)}else{draw_set_color(c_green)}
    if (lastscroll != 0){draw_line(lastscroll.x+16,lastscroll.y+16,x+16,y+16)}
    if (mouse_x>=x && mouse_x<x+32 && mouse_y>=y && mouse_y<y+32)||scrolledge=1{
        if is_orange=1{draw_set_color(c_orange)}else{draw_set_color(c_green)}
        draw_rectangle(x+16-320,y+16-240,x+16+320,y+16+240,true)
        draw_rectangle(x+16-319,y+16-239,x+16+319,y+16+239,true)
        draw_rectangle(x+16-321,y+16-241,x+16+321,y+16+241,true)}
    draw_set_color(c_white)
    depth=-999

    // 鼠标滚轮切换橙/白类型：上滑白，下滑橙
    if mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 && global.picking=false{
        if mouse_wheel_up(){is_orange=0}
        if mouse_wheel_down(){is_orange=1}
    }

    if mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 && keyboard_check(global.key_submenu) && global.picking=false
    {
        var sspeed, menustr, scrollmenu;
        if is_orange=0{menustr='Set the scroll speed (unit: 0.01 pixel). Max=6000|Switch to orange scroll'}
        else{menustr='Set the scroll speed (unit: 0.01 pixel). Max=6000|Switch to white scroll'}
        scrollmenu=show_menu(menustr,-1)
        if scrollmenu=0{
            sspeed=get_integer('Set the scroll speed (unit: 0.01 pixel). Max=6000',scrollspeed*100)
            sspeed=max(0,sspeed)
            sspeed=min(sspeed,6000)
            scrollspeed=sspeed/100
        }
        if scrollmenu=1{is_orange=1-is_orange}
    }
    /*picking start*/
    if mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 && keyboard_check_pressed(global.key_pick) && o_edmain.costawia4 = 7 && global.picking = false
    {
        if global.sample=1 {lololo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}
        global.picking = true
        picked = true
    }
    if picked=true && o_edmain.costawia4 = 7{
        x = floor((mouse_x)/32)*32
        y = floor((mouse_y)/32)*32
        if keyboard_check_released(global.key_pick)
        {
            global.picking=false
            picked=false
            if global.sample=1 {lololo=sound_play(snd_fire);sound_volume(snd_fire,global.glosnosc)}
        }
    }
    if o_edmain.costawia4 <>7 {picked=false}
    /*picking end*/
}break;
//恶劣强滚结束

//Messageblock Start
case 26:
{
    draw_sprite(s_pointblock5,0,x,y)
    if mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 &&keyboard_check(global.key_submenu) && o_edmain.costawia4 = 9 && global.picking = false
    {
        var tempMessage;
        tempMessage=get_string('Edit the message (in Chinese or English)',textMessage)
        textMessage = tempMessage
    }
    /*picking start*/
    if mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 && keyboard_check_pressed(global.key_pick) && o_edmain.costawia4 = 9 && global.picking = false
    {
        if global.sample=1 {lololo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}
        global.picking= true
        picked = true
    }
    if picked=true && o_edmain.costawia4 = 9{
        x = floor((mouse_x)/32)*32
        y = floor((mouse_y)/32)*32
        if keyboard_check_released(global.key_pick)
        {
            global.picking=false
            picked=false
            if global.sample=1 {lololo=sound_play(snd_fire);sound_volume(snd_fire,global.glosnosc)}
        }
    }
    if o_edmain.costawia4 <>9 {picked=false}
    /*picking end*/
}break;
//Messageblock End
case 27:
draw_sprite(s_pointblock6,color+8*global.assist,x,y);break;

case 28:
draw_sprite(s_yinyang,2*color+1+16*global.assist,x,y);break;

case 29:
draw_sprite(s_yinyang,2*color+16*global.assist,x,y);break;

case 30:
draw_sprite_ext(s_ice,0,x,y,1,1,0,c_white,0.8);break;

case 31:
if o_edmain.show_solid{  //ledge
    draw_sprite_ext(s_ledge,ledge_type,x,y,1,1,0,c_white,0.4);
    depth=-1000
};break;

case 32:
{
    if(type=2){
        if water_endY<y{water_endY=y}
        if water_endX<x{water_endX=x}
        draw_sprite_ext(s_waterbegin,0,x,y,1,1,0,c_white,1)
        if(water_endX>x && water_endY>y)draw_sprite_ext(s_waterend,0,water_endX-32,water_endY-32,1,1,0,c_white,1)
        draw_set_color(c_blue);draw_set_alpha(0.2)
        draw_rectangle(x,y,water_endX-1,water_endY-1,0)
        draw_set_color(c_white);draw_set_alpha(1)
        if mouse_x>=water_endX&&mouse_x<water_endX+32&&mouse_y>=water_endY&&mouse_y<water_endY+32&&mouse_x>0&&mouse_y>0&&mouse_check_button(mb_right)
        && o_edmain.wiatrak=0 && o_edmain.menujesie=0 && o_edmain.wlaczonaopcja=0 && (o_edmain.costawia4=15 || global.deletemode=1){instance_destroy()}
        if !end_mark{//create end_mark
        fofo_end = instance_create(water_endX-32,water_endY-32,o_range_end)
        fofo_end.start = id
        fofo_end.costawia = 4
        fofo_end.label = "water"
        end_mark = 1
    }

    }
    else{draw_sprite(s_waterchanger,type+2*global.lava,x,y)}
        if mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 &&keyboard_check(global.key_submenu) && o_edmain.costawia4 = 15 && global.picking = false
    {
        target = max(-64,get_integer('Edit the target height',target))
        velocity = min(max(0,get_integer('Edit the speed of the fluid',velocity)),9)
    }
    /*picking start*/
    if(type<2){
    if mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 && keyboard_check_pressed(global.key_pick) && o_edmain.costawia4 = 15 && global.picking = false
    {
        if global.sample=1 {lololo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}
        global.picking= true
        picked = true
    }
    if picked=true && o_edmain.costawia4 = 15{
        x = floor((mouse_x)/32)*32
        y = floor((mouse_y)/32)*32
        if keyboard_check_released(global.key_pick)
        {
            global.picking=false
            picked=false
            if global.sample=1 {lololo=sound_play(snd_fire);sound_volume(snd_fire,global.glosnosc)}
        }
    }
    if o_edmain.costawia4 <>15 {picked=false}
    /*picking end*/
    }
}break;

case 33:
{  //scene control
    if(bgm_change=1 && bgp_change=0)draw_sprite(s_bgmchange,0,x,y);
    if(bgm_change=0 && bgp_change=1)draw_sprite(s_bgmchange,1,x,y);
    if(bgm_change=1 && bgp_change=1)draw_sprite(s_bgmchange,2,x,y);
    if(bgm_change=0 && bgp_change=0)draw_rectangle_color(x,y,x+32,y+32,c_navy,c_navy,c_navy,c_navy,1);
    if(weather_change=1)draw_sprite_ext(s_weathericon,0,x,y,1,1,0,c_white,0.9);
    if(height>-64)draw_sprite_ext(s_littlewoda,0,x,y,1,1,0,c_white,0.5);
    lalala = instance_place(x-32,y,o_edmarkerblock);
    if lalala.coto=34{
        linked=1;
        draw_line_width_color(x-16,y+16,x+16,y+16,2,c_red,c_red);
    }
    lalala = instance_place(x-32,y,o_edenemyblock);
    if lalala.coto=24{
        linked=2;
        draw_line_width_color(x-16,y+16,x+16,y+16,2,c_red,c_red);
    }

    /*picking start*/
    if mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 && keyboard_check_pressed(global.key_pick) && o_edmain.costawia4 = 16 && global.picking = false
    {
        if global.sample=1 {lololo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}
        global.picking = true
        picked = true
    }
    if picked=true && o_edmain.costawia4 = 16{
        x = floor((mouse_x)/32)*32
        y = floor((mouse_y)/32)*32
        if keyboard_check_released(global.key_pick)
        {
            global.picking=false
            picked=false
            if global.sample=1 {lololo=sound_play(snd_fire);sound_volume(snd_fire,global.glosnosc)}
        }
    }
    if o_edmain.costawia4 <>16 {picked=false}
    /*picking end*/

    if mouse_x>x && mouse_x<x+32 && mouse_y>y && mouse_y<y+32 && keyboard_check(global.key_submenu) && global.picking = false
    {
        var menustr, scenemenu;
        if(preview=1){menustr='Reset BGM|Reset BGP|Reset weather|Reset water height|Turn OFF preview mode'}
        else{menustr='Reset BGM|Reset BGP|Reset weather|Reset water height|Turn ON preview mode'}
        scenemenu=show_menu(menustr,-1)
        if scenemenu != -1 && scenemenu < 4{
            o_edmain.myfofo = id;
            o_edmain.resetting = 1;
            o_edmain.setting_mode = 1 + 2 * scenemenu;
            with(o_edmain){costawia=0;costaiwa2=0;costawia3=0;costawia4=0;costawia5=0;costawia6=0;}

            // 天气参数读取，便于设置参数类似的天气控件
            if scenemenu == 2 {
                foforainy = o_edmain.myfofo.rainy;
                fofofallingstars = o_edmain.myfofo.fallingstars;
                fofosnowy = o_edmain.myfofo.snowy;
                fofothunder = o_edmain.myfofo.thunder;
                fofowindy = o_edmain.myfofo.windy;
                fofodarkness = o_edmain.myfofo.darkness;
                fofobrightness = o_edmain.myfofo.brightness;
            }
        }
        if(scenemenu=4){
            if(preview=-1){
                with(o_edmarkerblock){preview=-1;setonce=1}
                preview=1;global.preview=1;setonce2=0;
            }
            else{preview=-1;global.preview=-1;setonce=0;}
        }
    }
    if(preview=1 && setonce2=0){
        if(bgm_change)global.local_muzyka = real(bgm);
        if(bgp_change)global.local_background = bgp;
        setonce2=1;
    }
    if(preview=-1 && setonce=0){
        global.local_muzyka = global.muzyka;
        global.local_background = global.background;
        setonce=1;
    }
}break;


case 34:
{
    if camera_endY<y{camera_endY=y}
    if camera_endX<x{camera_endX=x}
    draw_sprite_ext(s_camerabegin,0,x,y,1,1,0,c_white,1)
    if(camera_endX>x && camera_endY>y)draw_sprite_ext(s_cameraend,0,camera_endX-32,camera_endY-32,1,1,0,c_white,1)
    draw_set_color(make_color_rgb(173,16,0))
    draw_rectangle(x,y,camera_endX-1,camera_endY-1,1)
    draw_set_color(c_white)
    if mouse_x>=camera_endX&&mouse_x<camera_endX+32&&mouse_y>=camera_endY&&mouse_y<camera_endY+32&&mouse_x>0&&mouse_y>0&&mouse_check_button(mb_right)
    && o_edmain.wiatrak=0 && o_edmain.menujesie=0 && o_edmain.wlaczonaopcja=0 && (o_edmain.costawia4=17 || global.deletemode=1){instance_destroy()}
    if !end_mark{//create end_mark
        fofo_end = instance_create(camera_endX-32,camera_endY-32,o_range_end)
        fofo_end.start = id
        fofo_end.costawia = 4
        fofo_end.label = "camera"
        end_mark = 1
    }

}break;

}
