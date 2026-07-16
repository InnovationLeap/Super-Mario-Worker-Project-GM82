#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fofo=0
kolorek=make_color_rgb(90,140,231)
instance_create(x,y,o_waterdraw)

zhadi=0
fish=0
dianshanhu=0
yanjiang=0
huoqiu=0
wenhao=0
yuncao=0
deng=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.levelsmooth =1 {
instance_deactivate_region(o_marker.x-640,o_marker.y-480,640*3,480*3,false,true)

instance_activate_region(o_marker.x-640,o_marker.y-480,640*3,480*3,true)
instance_activate_region(view_xview[0]-640,view_yview[0]-480,640*3,480*3,true)
instance_activate_object(o_marker)
instance_activate_object(o_markerwind)
instance_activate_object(o_mario)
instance_activate_object(o_mario2)
instance_activate_object(o_marioeffektor)
instance_activate_object(o_skuszak)
instance_activate_object(o_checkpoint)
instance_activate_object(o_exitar)
instance_activate_object(o_exitar2)
//instance_activate_object(obj_wall)
//instance_activate_object(o_pointblock)

instance_activate_object(o_cannoni)
instance_activate_object(o_cannonig)
instance_activate_object(o_wiatrak)
instance_activate_object(o_wiatrakanim)
instance_activate_object(o_kuppafire)
instance_activate_object(o_rynekd)
instance_activate_object(o_lavaball)
instance_activate_object(o_lakitu)


with(o_exiter) {
  instance_activate_region(exitx,exity,64,64,true)
}

instance_activate_object(o_zgniatacz)
with(o_zgniatacz) {
  if lilofon=1 && !(x>view_xview[0]-640 && x<view_xview[0]+640*2 && y>view_yview[0]-480 && y<view_yview[0]+480*2) {
    instance_activate_region(x-32,y-32,32*2+sprite_width,32+sprite_height+iyor,true)
  }
}

instance_activate_object(o_bonuspanding)
with(o_bonuspanding) {
  if !(x>view_xview[0]-640 && x<view_xview[0]+640*2 && y>view_yview[0]-480 && y<view_yview[0]+480*2) {
    instance_activate_region(x-32,y-32,32*2+sprite_width,32*2+sprite_height,true)
  }
}

instance_activate_object(o_windas)
with(o_windas) {
  if (type=1 || type=7 || type=13 || type=2 || type=8 || type=14 || type=3 || type=9 || type=15) && !(x>view_xview[0]-640 && x<view_xview[0]+640*2 && y>view_yview[0]-480 && y<view_yview[0]+480*2) {
    instance_activate_region(x-32,y,32*2+sprite_width,sprite_height,true)
  }
}

instance_activate_object(o_rybekc)
with(o_rybekc) {
  if aktywowany=1 && !(x>view_xview[0]-640 && x<view_xview[0]+640*2 && y>view_yview[0]-480 && y<view_yview[0]+480*2) {
    instance_activate_region(x-32,y-32,32*2+sprite_width,32*2+sprite_height,true)
  }
}

instance_activate_object(o_troopafly)
with(o_troopafly) {
  if aktywowany=1 && !(x>view_xview[0]-640 && x<view_xview[0]+640*2 && y>view_yview[0]-480 && y<view_yview[0]+480*2) {
    instance_activate_region(x-32,y-32,32*2+sprite_width,32*2+sprite_height,true)
  }
}

instance_activate_object(o_troopashell)
with(o_troopashell) {
  if !(x>view_xview[0]-640 && x<view_xview[0]+640*2 && y>view_yview[0]-480 && y<view_yview[0]+480*2) {
    instance_activate_region(x-32,y-32,32*2+sprite_width,32*2+sprite_height,true)
  }
}

instance_activate_object(o_kuppa)
with(o_kuppa) {
  if aktywowany=1 && !(x>view_xview[0]-640 && x<view_xview[0]+640*2 && y>view_yview[0]-480 && y<view_yview[0]+480*2){
    instance_activate_region(x-32,y-32,32*2+sprite_width,32*2+sprite_height,true)
  }

}

instance_activate_object(o_lakitubomb)
with(o_lakitubomb) {
  if !(x>view_xview[0]-640 && x<view_xview[0]+640*2 && y>view_yview[0]-480 && y<view_yview[0]+480*2) {
    instance_activate_region(x-32,y-32,32*2+sprite_width,32*2+sprite_height,true)
  }
}

instance_activate_object(o_hammerbros)
with(o_hammerbros) {
  if !(x>view_xview[0]-640 && x<view_xview[0]+640*2 && y>view_yview[0]-480 && y<view_yview[0]+480*2) {
    instance_activate_region(x-32,y-32,32*2+sprite_width,32*2+sprite_height,true)
  }
}

instance_activate_object(o_firesister)
with(o_firesister) {
  if !(x>view_xview[0]-640 && x<view_xview[0]+640*2 && y>view_yview[0]-480 && y<view_yview[0]+480*2) {
    instance_activate_region(x-32,y-32,32*2+sprite_width,32*2+sprite_height,true)
  }
}

}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
zhadi+=0.1
if zhadi >= 6 { zhadi = 0 }

fish+=0.1
if fish >= 2 { fish = 0 }

dianshanhu+=0.5
if dianshanhu >= 24 { dianshanhu = 0 }

yanjiang+=0.2
if yanjiang >= 7 { yanjiang = 0 }

huoqiu+=0.2
if huoqiu >= 3 { huoqiu = 0 }

yuncao+=0.1
if yuncao >= 3 { yuncao = 0 }

deng+=0.2
if deng >= 6 { deng = 0 }

wenhao+=0.1

jinbi+=0.2

lava +=1
if lava >= 16 { lava=0 }
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_alpha(1)
draw_set_color(c_white)
var i,a;
for (i=0; i<21; i+=1){
    for (a=0; a<16; a+=1){
        draw_x = i+floor(view_xview[0]/32)
        draw_y = a+floor(view_yview[0]/32)
        if global.zxy[draw_x,draw_y]>0{
            draw_sprite_ext(s_blocks,global.zxy[draw_x,draw_y],draw_x*32,draw_y*32,1,1,0,c_white,1)
        }
    }
}

if global.layerord=0{depth=-21}
if global.layerord=1 || global.layerord=2{depth=-19}
