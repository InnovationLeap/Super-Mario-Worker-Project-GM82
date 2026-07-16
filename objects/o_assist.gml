#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
create=1
setonce=0
ani_count=0

// 发光具体位置微调见 o_scenery 的 step 事件
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !setonce {

with(o_scenery){

switch(image_index){
//把下面5行复制一份改改就OK
case 0: //这个值应对应景物编号-1
   {
   sprite_index=s_chmursenery //景物动画
   image_speed=0.1
   break;
   }

case 1: //这个值应对应景物编号-1
   {
   sprite_index=s_grass //景物动画
   image_speed=0.1
   break;
   }

case 6: //这个值应对应景物编号-1
   {
   sprite_index=s_clouddark
   image_speed=0.1
   break;
   }

case 7: //这个值应对应景物编号-1
   {
   sprite_index=s_grassdark
   image_speed=0.1
   break;
   }

case 12: //这个值应对应景物编号-1
   {
   sprite_index=s_cloud2 //景物动画
   image_speed=0.1
   break;
   }

case 13: //这个值应对应景物编号-1
   {
   sprite_index=s_light //景物动画
   image_speed=0.2
   break;
   }

case 21: //这个值应对应景物编号-1
   {
   sprite_index=s_grassaunt //景物动画
   image_speed=0.1
   break;
   }

case 24: //这个值应对应景物编号-1
   {
   sprite_index=s_freefuck //景物动画
   image_speed=0.1
   break;
   }

case 30: //这个值应对应景物编号-1
   {
   sprite_index=s_grassdesert //景物动画
   image_speed=0.1
   break;
   }

case 33: //这个值应对应景物编号-1
   {
   sprite_index=s_clouddesert //景物动画
   image_speed=0.1
   break;
   }

case 34: //这个值应对应景物编号-1
   {
   sprite_index=s_lavafall //景物动画
   image_speed=1
   break;
   }

case 36: //这个值应对应景物编号-1
   {
   sprite_index=s_cloudgrey //景物动画
   image_speed=0.1
   break;
   }

case 37: //这个值应对应景物编号-1
   {
   sprite_index=s_rotocenter //景物动画
   if global.layerord=0{depth=-22}
   if global.layerord=1{depth=-20}
   if global.layerord=2{depth=-21}//景深（个鬼
   break;
   }

case 38: //这个值应对应景物编号-1
   {
   sprite_index=s_corala //景物动画
   break;
   }

case 39: //这个值应对应景物编号-1
   {
   sprite_index=s_coralb //景物动画
   break;
   }

case 40: //这个值应对应景物编号-1
   {
   sprite_index=s_coralc //景物动画
   break;
   }
}

}

setonce=1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with(o_bgmchange){

if linked=1{
    fofo = instance_place(x-32,y,o_region);
    fofo.linked=1
    fofo.bgm_change = bgm_change;
    fofo.bgm = bgm;
    fofo.bgp_change = bgp_change;
    fofo.bgp = bgp;
    fofo.height = height;
    fofo.weather_change = weather_change;
    fofo.rainy = rainy;
    fofo.fallingstars = fallingstars;
    fofo.snowy = snowy;
    fofo.thunder = thunder;
    fofo.windy = windy;
    fofo.darkness = darkness;
    fofo.brightness = brightness;
    instance_destroy();
}

if linked=2{
    fofo = instance_place(x-32,y,o_kuppa)
    fofo.bgm_change = bgm_change;
    fofo.bgm = bgm;
    fofo.bgp_change = bgp_change;
    fofo.bgp = bgp;
    fofo.height = height;
    fofo.weather_change = weather_change;
    fofo.rainy = rainy;
    fofo.fallingstars = fallingstars;
    fofo.snowy = snowy;
    fofo.thunder = thunder;
    fofo.windy = windy;
    fofo.darkness = darkness;
    fofo.brightness = brightness;
    instance_destroy();
};


}

with(o_checkpoint){

if a=0 {
    if global.checkpoint>0{
        for (k=1;k<=global.checkpoint;k+=1){
            if x=global.check[k,0]-16 && y=global.check[k,1]-32 {sprite_index=s_checkpoint2}
            if k=global.checkpoint {o_marker.x=global.check[k,0];o_marker.y=global.check[k,1];o_marker.checkpointdetect=1;}
        }
        a=1;
    }
    else{a=1}
}

}

ani_count+=1;
if ani_count>=30{ani_count=0;}
/*with(o_marker){

}*/
