#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grawitacja=0
sekwencja=0

image_speed=0
kierunek=-1
aktywowany=0
rodzajzabicia=0
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
odpych=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

czerwona=2
deltax=-1
height=0
start=0
loop=0

// 发光位置微调
light_x = 0;
light_y = -4;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.etappokonany=0 {


if aktywowany=0
    {
    if (!place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,o_pointblock)) {sekwencja=1}
        if x>view_xview[0]-100 && x<view_xview[0]+740 && y>view_yview[0]-100 && y<view_yview[0]+580
        {
        aktywowany=1
        if x<o_marker.x {kierunek=1}
        if x>=o_marker.x {kierunek=-1;image_xscale=-1}
        }
    }

if aktywowany=1 {
// spadanie
if height<=0 //如果没有高度直接调用旧版代码，针对旧版关卡，还有一些把参数给改成这种的人（
  {
   if sekwencja=0 { if global.gameversion<1500{grawitacja = -12 }else{grawitacja = -8}; sekwencja=1 }
//if sekwencja=0 && !place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,o_pointblock) {sekwencja=1}
   if sekwencja=1 {grawitacja+=0.5; y+=grawitacja}
   if sekwencja=1 && grawitacja<0 && (place_meeting(x,y-1,obj_wall) || place_meeting(x,y-1,o_pointblock)) {grawitacja=0; sekwencja=3;}
   while sekwencja=3 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y+=1}
   if sekwencja=3 && (!place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock)) {sekwencja=1}
   if sekwencja=1 && grawitacja>=0 && (place_meeting(x,y+1,obj_halfground) ||  place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,o_pointblock)) {grawitacja=0; sekwencja=2;}
   while sekwencja=2 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1}
   if sekwencja=2 && (!place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock)) {sekwencja=0}
  }
// chodzenie
if kierunek=1{
    if (place_meeting(x+1,y,obj_wall)|| place_meeting(x+1,y,o_pointblock)) {kierunek=-1;x-=1;image_xscale=-1}
    else{
        x+=1;
    }
}
else{
    if (place_meeting(x-1,y,obj_wall)|| place_meeting(x-1,y,o_pointblock)) {kierunek=1;x+=1;image_xscale=1}
    else{
        x-=1;
    }
}

image_index+=0.1

if height > 0
 //新版跳乌龟运动
  {
    if start=0 //初始化
  {
    //这行代码处理开始在空中的情况
    if !( instance_place(x,y+1,obj_halfground) || instance_place(x,y+1,obj_wall) || instance_place(x,y+1,o_pointblock) ) { deltax=0 ; fy=y+height }
    start=1
  }
   //建立一个过点(1,0) (-1,0) (0,height) 的抛物线
   // y=(-height)*x^2+height
   if deltax=-1 { fy=y }
   deltax += 5/height; //这里的5是控制不同高度的跳跃速度，定到多少最好暂时没有确定
   y =  fy-(height*power(deltax,2)*-1 + height)
   //实时计算y速度以进行顶头和落地的判定
   var y1,y2,yspeed;
   y1 = (height*power(deltax,2)*-1 + height)
   y2 = (height*power(deltax+5/height,2)*-1 + height) //这里还有个5 你们谁要改参数的话别忘改了
   yspeed = y1-y2
   //顶头
   if yspeed < 0
     {
   //分两种情况 以防y速度过大导致问题
   if abs(yspeed) <= sprite_height
     {
   var nexty;
   nexty=y+yspeed;
   if ( instance_place(x,nexty,obj_wall) || instance_place(x,nexty,o_pointblock) ) && loop=0 { loop=1 }
   while ( loop=1 )
     {
   if (instance_place(x,nexty,obj_wall) || instance_place(x,nexty,o_pointblock) ) { nexty+=1 }
               else
 {
   if abs(yspeed) > 6 {deltax=0; fy += nexty - (fy-height) ; y=nexty ; loop=0 } //这里直接平移了顶点，也就是回归自由落体运动
          else { deltax=deltax*-1 ; fy=nexty+(height*power(deltax,2)*-1 + height) ; y=nexty ; loop=0 } //这里直接把y速度*-1了
 }
 }
 } else
  {
    var time ;  //定义一个倍数以方便后面for循环
time=ceil( abs(yspeed)/sprite_height );
for (i=0;i<time;i+=1)
  {
         var nexty;
         nexty=y-(i+1)*sprite_height;
         if ( instance_place(x,nexty,obj_wall) || instance_place(x,nexty,o_pointblock) ) && loop=0 { loop=2 }
         while ( loop=2 )
           {
         if ( instance_place(x,nexty,obj_wall) || instance_place(x,nexty,o_pointblock) ) { nexty+=1 }
                     else
       {
         if abs(yspeed) > 6 {deltax=0; fy += nexty - (fy-height) ; y=nexty ; loop=0 } //这里直接平移了顶点，也就是回归自由落体运动
     else { deltax=deltax*-1 ; fy=nexty+(height*power(deltax,2)*-1 + height) ; y=nexty ; loop=0 } //这里直接把y速度*-1了
       }
       }
  }
  }
 }
 //落地
   if yspeed > 0
     {
   //分两种情况 以防y速度过大导致问题
   if abs(yspeed) <= sprite_height
     {
   var nexty;
   nexty=y+yspeed;
   if ( instance_place(x,nexty,obj_halfground) || instance_place(x,nexty,obj_wall) || instance_place(x,nexty,o_pointblock) ) && loop=0 { loop=3 }
   while ( loop=3 )
     {
   if ( instance_place(x,nexty,obj_halfground) || instance_place(x,nexty,obj_wall) || instance_place(x,nexty,o_pointblock) ) { nexty-=1 }
               else { deltax=-1; fy = nexty ; y=nexty ; loop=0 }
 }
 } else
  {
    var time ;  //定义一个倍数以方便后面for循环
time=ceil( abs(yspeed)/sprite_height );
for (i=0;i<time;i+=1)
  {
         var nexty;
         nexty=y+(i+1)*sprite_height;
         if ( instance_place(x,nexty,obj_halfground) || instance_place(x,nexty,obj_wall) || instance_place(x,nexty,o_pointblock) ) && loop=0 { loop=4 }
         while ( loop=4 )
           {
         if ( instance_place(x,nexty,obj_halfground) || instance_place(x,nexty,obj_wall) || instance_place(x,nexty,o_pointblock) ) { nexty-=1 }
                     else { deltax=-1; fy = nexty ; y=nexty ; loop=0 }
       }
  }
  }
 }
  }

}

// uppercut i zwykla smierc
//if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
if rodzajzabicia=1 {instance_destroy(); instance_create(x,y,o_troopablue);instance_create(x,y,o_punkciornik)}
if rodzajzabicia=3 || rodzajzabicia=4 || rodzajzabicia=5 {instance_destroy(); redduj=instance_create(x,y,o_troopadead); lolo=instance_create(x,y,o_punkciornik); lolo.image_index=0;redduj.sprite_index=s_troopablueshell; redduj.czerwona=czerwona;if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}
if rodzajzabicia=2 {instance_destroy(); redduj=instance_create(x,y,o_troopadead);redduj.sprite_index=s_troopablueshell; redduj.czerwona=czerwona}



// niszcz po za ekranem
if y>room_height[0]+64 {instance_destroy()}
}
