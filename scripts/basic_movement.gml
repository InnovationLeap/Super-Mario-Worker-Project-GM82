//argument0: 水平速度
//argument1：动画速度
//argument2：是否自动看路
//argument3：转向时是否翻转图片

if sekwencja=0{
    if !place_meeting(x,y+1,o_pointblock){
    if !place_meeting(x,y+1,obj_halfground){
    if !place_meeting(x,y+1,obj_wall){
    sekwencja=1;
    }
    }
    }
}

if sekwencja=1 {
    grawitacja+=0.5; y+=grawitacja
    if !place_meeting(x,y,o_uppercut){
    if (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,o_pointblock)){
        grawitacja=0; sekwencja=2;
    }
    }
}

while sekwencja=2{
    if (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)){
        y-=1;
    }
    else{sekwencja=0;}
}

// chodzenie
if kierunek=1{
    if (place_meeting(x+argument0,y,obj_wall)|| place_meeting(x+argument0,y,o_pointblock)) {kierunek=-1;x-=argument0;if(argument3)image_xscale=-1}
    else{
        if argument2 && grawitacja=0{
            if !place_meeting(x+30,y+20,obj_halfground) && !place_meeting(x+30,y+20,obj_wall){
                kierunek=-1;if(argument3)image_xscale=-1;
            }
        }
        x+=argument0;
    }
}
else{
    if (place_meeting(x-argument0,y,obj_wall)|| place_meeting(x-argument0,y,o_pointblock)) {kierunek=1;x+=argument0;if(argument3)image_xscale=1}
    else{
        if argument2 && grawitacja=0{
            if !place_meeting(x-30,y+20,obj_halfground) && !place_meeting(x-30,y+20,obj_wall){
                kierunek=1;if(argument3)image_xscale=1;
            }
        }
        x-=argument0;
    }
}

image_index+=argument1
