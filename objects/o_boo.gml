#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grav=0
state=0

image_speed=0
facing=-1
activated=1
kill_type=0
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok


dir=1 //??
fy=y
ysin=0

stomp_proof=1

if global.layerord=0||global.layerord=1 {depth=0}
if global.layerord=2 {depth=-22}

// 发光位置微调
light_x = 0;
light_y = 0;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*备忘
kierunek记录马里奥朝向，1为右，0为左
*/
if global.pauza=0 && global.level_complete=0 {

    if x>view_xview[0]-100 && x<view_xview[0]+740 && y>view_yview[0]-100 && y<view_yview[0]+580 {
        //状态检测
        if x > o.marker.x {
            dir = -1
            if o_marker.dir=1 { move=1 } else { move=0 }
        } else {
            dir = 1
            if o_marker.dir=0 { move=1 } else { move=0 }
        }
        //动画
        image_xscale = dir
        image_index = move
        //运动
        if move = 1 {//追踪
            if x > o_marker.x { x-=0.8 }
            if x < o_marker.x { x+=0.8 }
            if y > o_marker.y { y-=0.8 }
            if y < o_marker.y { y+=0.8 }

            //y运动
            y = fy-sin(ysin)*30
            ysin += 0.04
            y = fy+sin(ysin)*30
            if fy < o_marker.y { fy+=0.2 }
            if fy > o_marker.y { fy-=0.2 }
        }
    }
}
