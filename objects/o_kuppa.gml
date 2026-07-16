#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grawitacja=0
sekwencja=0
energia=0
image_speed=0
kierunek=-1
aktywowany=0
rodzajzabicia=0

sekwencjashot=0
sekwencjaskok=0
wbloczku=0
chodzonko=0
chodzonko2=0
angrymode=0
angrymodetimer=0
sekwencjashot2=random(0.2)
iyus=y


ixornik=min(max(320,x),room_width-320)

killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok
oberw=0
oberwanim=0
oberwsek=0


zarabia=11 // zmienna informujaca muszle czy mozna zarabiac zycia
noshellkick=1
setonce=0
viewsetonce=0
actsetonce=0


//New parameters in SMWP1.7
koopa_strength = 0; //库巴对子弹甜菜的抗性，0和1的区别在于，0在库巴无敌时间也会继续受到攻击，1不会
koopa_reset = 0;  //是否重置HP
koopa_freeview = 0;  //是否自由滚屏
koopa_midboss_hp = -1; //库巴作为道中boss的血量（-1=关底boss，打败后过关，使用原版血量）
//注：道中boss不共享血量；关底boss共享血量。
koopa_speed = 1;//库巴移动速度

//以下为库巴模拟场景切换，在编辑界面中通过与音乐控制元件连接而发挥作用
bgm_change = 1
bgm = '202' //默认库巴bgm
bgp_change = 0
bgp = 0
height = -64

// 发光位置微调
light_x = 0;
light_y = -32;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.etappokonany=0 {

// 如果reset=1且不是midboss，血量重置
if koopa_reset = 1 && koopa_midboss_hp=-1 && setonce=0
{global.etapkuppa=global.etapkuppafixed; setonce=1;}

//进入范围，触发库巴
if aktywowany=0 && x>view_xview-300 && x<view_xview+960 {
  aktywowany=1;
  //每个freeview=0的被触发库巴将被登记数目
  //主要用来控制滚屏和音乐状态
  if (koopa_freeview = 0 && viewsetonce=0){
      viewsetonce=1;
      global.koopa_scroll_count+=1;
      if(bgm_change=1 && global.muzyka<>bgm){ //等效音乐标记
          mm_stop_all_ext();global.muzyka_save = global.muzyka;global.muzyka=bgm;Music_Play();
      }
      if (bgp_change=1 && global.background<>bgp){global.background=bgp;} //等效背景标记
      if (height>-64){global.auto=0;global.poziomwody = height;o_waterdraw.velocity=0;o_waterdraw.target=height} //等效水位标记
      if (weather_change == 1) //等效天气标记
      {
        global.rainy = rainy;
        global.fallingstars = fallingstars;
        global.snowy = snowy;
        global.thunder = thunder;
        global.windy = windy;
        global.darkness = darkness;
        global.brightness = brightness;
      }
  }
  // 如果存在最终boss被触发，则activated为2；否则设为1
  // 主要用来控制是否显示血条
  if(global.koopa_activated<2 && actsetonce=0){
     global.koopa_activated = 1-min(0,koopa_midboss_hp)
     actsetonce=1
  }
}
// 受伤后处理
//1）不是midboss,扣global值
if energia<=-max(koopa_strength,1) && koopa_midboss_hp=-1
{
if global.sample=1 && global.etapkuppa>1
{
fofo=sound_play(snd_kuppaoberw);
sound_volume(snd_kuppaoberw,global.glosnosc)
}
energia=0;global.etapkuppa-=1; oberw=200
}

//2）是midboss,扣自身值
if energia<=-max(koopa_strength,1) && koopa_midboss_hp>0
{
if global.sample=1 && koopa_midboss_hp>1
{
fofo=sound_play(snd_kuppaoberw);
sound_volume(snd_kuppaoberw,global.glosnosc)
}
energia=0;koopa_midboss_hp-=1; oberw=200
}

if oberw>0
    {
    oberw-=1
    if oberwanim<1 && oberwsek=0 {oberwanim+=0.04}
    if oberwanim>=1 && oberwsek=0 {oberwsek=1}
    if oberwanim>0 && oberwsek=1 {oberwanim-=0.03}
    if oberwanim<=0 && oberwsek=1 {oberwsek=0}
    image_alpha=oberwanim
    } else image_alpha=1

//打败后过关
if global.etapkuppa<=0
    {
    if global.sample=1{sound_play(snd_kuppalast);sound_volume(snd_kuppalast,global.glosnosc)}
    instance_destroy()
    lolo=instance_create(x,y,o_kuppadie)
    lolo.image_xscale=image_xscale
    loloo=instance_create(x,y,o_punkciornik)
    loloo.image_index=5
    global.punkty+=5000
    global.etappokonany=1
    }

//道中boss打败后不过关
if koopa_midboss_hp=0
    {
    global.pauza=3;
    if global.sample=1{sound_play(snd_kuppalast);sound_volume(snd_kuppalast,global.glosnosc)}
    if(koopa_freeview=0){global.koopa_scroll_count-=1;}
    instance_destroy()
    lolo=instance_create(x,y,o_kuppadie)
    lolo.mid=1
    lolo.image_xscale=image_xscale
    loloo=instance_create(x,y,o_punkciornik)
    loloo.image_index=5
    global.punkty+=5000
    }

//库巴跳跃
if aktywowany=1{
// spadanie i skakanie
if sekwencja=0 {sekwencjaskok+=1}
if sekwencjaskok>100 {sekwencjaskok=0; sekwencja=1; grawitacja=-12; y-=10}
if grawitacja<0 {odpych=abs(grawitacja)}
if grawitacja>=0 {odpych=0}

if sekwencja=0 && !place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y+1,obj_wall) {sekwencja=1}
if sekwencja=1 {grawitacja+=0.5; y+=grawitacja}
if sekwencja=1 && wbloczku=0 && grawitacja<0 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {wbloczku=1}
if sekwencja=1 && wbloczku=1 && grawitacja>0 && !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {wbloczku=0}
if sekwencja=1 && (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall)) && wbloczku=0 {grawitacja=0; sekwencja=2}
while sekwencja=2 && (place_meeting(x,y,obj_halfground) ||place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1 if !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {sekwencja=0}}


// 库巴运动与喷火
if x>o_marker.x {image_xscale=-1}
if x<o_marker.x {image_xscale=1}

sekwencjashot+=1+sekwencjashot2
if sekwencjashot<=150 {sprite_index=s_kuppa;image_index+=0.2}
if sekwencjashot>=150 && sekwencjashot<180 {sprite_index=s_kuppaziewacz;image_index=0}
if sekwencjashot>=180 && sekwencjashot<200 {sprite_index=s_kuppaziewacz;image_index=1}
if sekwencjashot>=200 {sekwencjashot=0; lolo=instance_create(x,y-32,o_kuppafire); lolo.kierunek=image_xscale;lolo.iyus=iyus
if global.sample=1 && x>view_xview-300 && x<view_xview+960 && y>view_yview-200 && y<view_yview+700
{fofo=sound_play(snd_kuppazianie);sound_volume(snd_kuppazianie,global.glosnosc)}}


if kierunek=-1 && chodzonko2>0 {x-=koopa_speed}
if kierunek=1 && chodzonko2>0 {x+=koopa_speed}
if chodzonko2>0 {chodzonko2-=1}

chodzonko+=1
if chodzonko>60 {chodzonko=0; chodzonko2=30+round(random(70))}


if (place_meeting(x+1,y,obj_wall) || place_meeting(x-1,y,obj_wall)) && wbloczku=0 {kierunek=kierunek*-1}
if (place_meeting(x+1,y,o_pointblock) || place_meeting(x-1,y,o_pointblock)) && wbloczku=0 {kierunek=kierunek*-1}


if kierunek=-1 && x<=ixornik-200 {kierunek=1}
if kierunek=1 && x>=ixornik+200 {kierunek=-1}
}


}
if y>room_height[0]+64 {instance_destroy()}
