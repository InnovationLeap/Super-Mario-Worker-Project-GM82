#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
a=0
kk=0
save_color = 0
save_water = 1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if sprite_index=s_checkpoint && place_meeting(x,y,o_marker) {
sound_play(snd_vine);
global.checkpoint+=1;
global.check[global.checkpoint,0]=x+16
global.check[global.checkpoint,1]=y+32
sprite_index=s_checkpoint2
global.lastrodzajmaria=global.rodzajmaria
global.lastzycia=global.zycia
global.lastcoins=global.coins
global.lastpunkty=global.punkty

if(save_water){
if(global.poziomwody<1000000)
{global.water_height_record = global.poziomwody}
else
{global.water_height_record = global.water_height_record2}
}

if(save_color){
for(i=0;i<8;i+=1){
    global.yinyang_record[i] = global.yinyang_status[i]
}
}

global.music_record = global.muzyka
global.background_record = global.background
// Weather records
global.rainy_record = global.rainy
global.fallingstars_record = global.fallingstars
global.snowy_record = global.snowy
global.thunder_record = global.thunder
global.windy_record = global.windy
global.darkness_record = global.darkness
global.brightness_record = global.brightness
}

if sprite_index=s_checkpoint2 {image_speed=0.1}
else{image_speed=0}//动画

//以下代码配合god模式食用

if kk=1 {
if checknumber=global.checkpointa{
with(o_marker){test_bound(other.x+16,other.y+32)}
o_marker.x=x+16
o_marker.y=y+32
sprite_index=s_checkpoint2
global.checkpoint=global.checkpointa
global.check[global.checkpoint,0]=x+16
global.check[global.checkpoint,1]=y+32
kk=0
}
if checknumber<global.checkpointa{
sprite_index=s_checkpoint2
kk=0
}
if checknumber>global.checkpointa{
sprite_index=s_checkpoint
kk=0
}
}
