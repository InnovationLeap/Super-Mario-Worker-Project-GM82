#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
color=0
yin=0 //指定初始实虚：0为阴，1为阳

setup=0

pre_index= 0
overlapped = 0

setonce=0

// 发光位置微调
light_x = 16;
light_y = 16;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if setup = 0{
    if global.remember_color{
        if(global.yinyang_record[color]=1){yin=1-yin}
    }
    image_index = 2*color+yin+16*global.assist
    pre_index=image_index
    setup = 1;
}

if global.celeste{

    if !setonce{mask = instance_create(x,y,o_yinyangmask);setonce=1}
    if abs(x-o_marker.x+16) <= 32 && abs(y-o_marker.y+48) <=64{
        with(mask){
           if place_meeting(x,y,o_marker){other.overlapped=1}
        }
    }

    if overlapped=1{
        with(mask){
            if !place_meeting(x,y,o_marker){
                other.image_index=other.pre_index
                other.overlapped=0
            }
        }
    }
}

// 光照设置
//with (o_yinyang) {
//    light_radius = 1 - yin;
//}
//light_radius = 1 - yin;

light_radius = 1- image_index mod 2;
