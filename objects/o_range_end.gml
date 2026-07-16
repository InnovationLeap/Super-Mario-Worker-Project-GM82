#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
start = id;
costawia = 0;
label = "";
activated = 0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if keyboard_check(global.key_select){
switch(label){
    case "fish": if(activated){start.fishendX = x; start.fishendY = y;}
                 x = start.fishendX;
                 y = max(start.y,start.fishendY);
                 break;

    case "camera": if(activated){start.camera_endX = x+32; start.camera_endY = y+32;}
                   x = max(start.x+640-32,start.camera_endX-32);
                   y = max(start.y+480-32,start.camera_endY-32);
                   break;

    case "water": if(activated){start.water_endX = x+32; start.water_endY = y+32;}
                  x = max(start.x-32,start.water_endX-32);
                  y = max(start.y-32,start.water_endY-32);
                  break;
}
}
else{ activated=0 }
