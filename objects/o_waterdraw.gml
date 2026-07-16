#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fofo=0
kolorek=make_color_rgb(90,140,231)
lavarek=make_color_rgb(123,0,0)

zhadi=0
fish=0
dianshanhu=0
yanjiang=0
huoqiu=0
wenhao=0
yuncao=0
deng=0

setonce=0
//global.lava = 0  //0代表水，1代表岩浆

timecount=0
mini=0
use_timecount=1

bound = 1

if global.layerord=0{depth=-19}
if global.layerord=1{depth=-21}
if global.layerord=2{depth=-23}
//temp=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !setonce && global.auto{
    target = global.poziomwody
    velocity = global.water_velocity
    firstbound = global.firstbound
    secondbound = global.secondbound
    delay = global.water_delay
    setonce=1
}

if global.pauza=0{

if (use_timecount=1 && delay>0){
    mini+=1;
    if mini>15{mini=0;timecount+=1;}
}
if global.auto=1 && timecount>=delay{
    if(bound=1){target=firstbound}
    else if(secondbound>-64){target=secondbound}
}

if (global.poziomwody<1000000){
if velocity<>0 && global.poziomwody<>target{
    timecount=0;use_timecount=0
    if abs(global.poziomwody-target)>(velocity*0.4){
        global.poziomwody+=sign(target-global.poziomwody)*(velocity*0.4);
    }
    else{
        global.poziomwody=target;
    }
}
if global.auto=1 && global.poziomwody = target {bound*=-1;use_timecount=1}
}

else{
if velocity<>0 && global.water_height_record2<>target{
    timecount=0;use_timecount=0
    if abs(global.water_height_record2-target)>velocity*0.4{
        global.water_height_record2+=sign(target-global.water_height_record2)*velocity*0.4;
    }
    else{
        global.water_height_record2=target;
    }
}
if global.auto=1 && global.water_height_record2=target {bound*=-1;use_timecount=1}
}

}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(1)
draw_set_color(c_white)

fofo+=0.2
if(global.lava){
    draw_sprite_ext(s_biglava,fofo,view_xview[0],global.poziomwody,1,1,0,c_white,1)

    if view_yview[0]+480>global.poziomwody+16
    {
        draw_rectangle_color(view_xview[0],global.poziomwody+32,view_xview[0]+640,view_yview[0]+480,lavarek,lavarek,lavarek,lavarek,0)
    }
}
else{
    draw_sprite_ext(s_woda,fofo,view_xview[0],round(global.poziomwody),1,1,0,c_white,0.5)

    if view_yview[0]+480>global.poziomwody+16
    {
        draw_set_alpha(0.5)
        draw_rectangle_color(view_xview[0],round(global.poziomwody)+16,view_xview[0]+640,view_yview[0]+480,kolorek,kolorek,kolorek,kolorek,0)
        draw_set_alpha(1)
    }
}
