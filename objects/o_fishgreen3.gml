#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

image_speed=0
dir=-1
activated=0
kill_type=0
killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok
coikiedy=round(random(1))
coikiedy2=0
xspeed=4-irandom(4)+1.25
yspeed=-1.3*irandom(10)

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
if global.pauza=0 && global.level_complete=0 {





    if activated=0 {if x>view_xview[0]-100 && x<view_xview[0]+740 && y>view_yview[0]-100 && y<view_yview[0]+580 {
            if x<o_marker.x {activated=1; dir=1}
            if x>=o_marker.x {activated=1; dir=-1}
    }}
    if activated=1 {
        x+=dir*xspeed
        y+=yspeed
        yspeed+=0.2

        image_index=o_preview.fish

        if dir=-1 {image_xscale=-1}
        if dir=1 {image_xscale=1}

        // uppercut i zwykla smierc
        //if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
        //if place_meeting(x,y,o_troopashell) {energia-=3; rodzajzabicia=0}
        //if energia<0 && rodzajzabicia=1 {instance_destroy(); instance_create(x,y+16,o_rybekadie); instance_create(x,y,o_punkciornik)}
        if kill_type=3 || kill_type=4 || kill_type=5 {instance_destroy(); tmp6=instance_create(x,y+16,o_fishdead);tmp6.sprite_index=s_fish2;tmp=instance_create(x,y,o_scorepop); tmp.image_index=0;if global.sample=1 {tmp2=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)}}
        if kill_type=1 {instance_destroy(); tmp6=instance_create(x,y+16,o_fishdead);tmp6.sprite_index=s_fish2;instance_create(x,y,o_scorepop)}
        if kill_type=2 {instance_destroy(); tmp6=instance_create(x,y+16,o_fishdead);tmp6.sprite_index=s_fish2;}
        if x<=view_xview-96||x>=view_xview+640+96||y>=view_yview+480+96 {instance_destroy()}
    }
}
