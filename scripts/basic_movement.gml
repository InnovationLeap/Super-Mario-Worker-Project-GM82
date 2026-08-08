//argument0: 水平速度
//argument1：动画速度
//argument2：是否自动看路
//argument3：转向时是否翻转图片

if state=0 {
    if !place_meeting(x,y+1,o_pointblock) {
        if !place_meeting(x,y+1,obj_halfground) {
            if !place_meeting(x,y+1,obj_wall) {
                state=1;
            }
        }
    }
}

if state=1 {
    grav+=0.5; y+=grav
    if !place_meeting(x,y,o_uppercut) {
        if (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,o_pointblock)) {
            grav=0; state=2;
        }
    }
}

while state=2 {
    if (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {
        y-=1;
    } else {state=0;}
}

// chodzenie
if dir=1 {
    if (place_meeting(x+argument0,y,obj_wall)|| place_meeting(x+argument0,y,o_pointblock)) {dir=-1;x-=argument0;if(argument3)image_xscale=-1} else {
        if argument2 && grav=0 {
            if !place_meeting(x+30,y+20,obj_halfground) && !place_meeting(x+30,y+20,obj_wall) {
                dir=-1;if(argument3)image_xscale=-1;
            }
        }
        x+=argument0;
    }
} else {
    if (place_meeting(x-argument0,y,obj_wall)|| place_meeting(x-argument0,y,o_pointblock)) {dir=1;x+=argument0;if(argument3)image_xscale=1} else {
        if argument2 && grav=0 {
            if !place_meeting(x-30,y+20,obj_halfground) && !place_meeting(x-30,y+20,obj_wall) {
                dir=1;if(argument3)image_xscale=1;
            }
        }
        x-=argument0;
    }
}

image_index+=argument1
