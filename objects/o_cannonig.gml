#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed=0
if x>o_marker.x {dir=-1}
if x<=o_marker.x {dir=1}
activated=1
kill_type=0
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok



//跟踪炮弹属性
fgspeed=0
gspeed=0
license=1

if global.layerord=0||global.layerord=1 {depth=1}
if global.layerord=2 {depth=-20}

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
if global.pauza=0 && global.level_complete=0 {

    if activated=1 {

        //跟踪炮弹


        x += gspeed;//gspeed是速度
        image_xscale=dir;
        image_index+=0.2;
        if fgspeed=0 {gspeed=3.5*dir;fgspeed=1};//初始化速度
        //以下为跟踪马里奥
        if dir=1 && x>o_marker.x && gspeed>0 {gspeed -= 0.1};
        if dir=1 && x>o_marker.x && gspeed=0 {dir = -1};
        if dir=1 && x<=o_marker.x && gspeed<3.5 {gspeed += 0.1};
        if dir=-1 && x<o_marker.x && gspeed<0 {gspeed += 0.1};
        if dir=-1 && x<o_marker.x && gspeed=0 {dir = 1};
        if dir=-1 && x>=o_marker.x && gspeed>-3.5 {gspeed -= 0.1};
    }

    // uppercut i zwykla smierc攻击判定
    if kill_type=1 {instance_destroy(); instance_create(x,y,o_cannonidead); instance_create(x,y,o_scorepop)}
    if kill_type=3 || kill_type=4 || kill_type=5 {instance_destroy(); instance_create(x,y,o_cannonidead); tmp=instance_create(x,y,o_scorepop); tmp.image_index=0;if global.sample=1 {tmp2=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)}}
    if kill_type=2 {instance_destroy(); instance_create(x,y,o_cannonidead);}


    if y>room_height[0]+64 {instance_destroy()}
    if x<view_xview[0]-1000 {instance_destroy()}
    if x>view_xview[0]+1640 {instance_destroy()}
}
