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
killer=1 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok
randomus=0.8

if global.layerord=0||global.layerord=1 {depth=0}
if global.layerord=2 {depth=-22}

//dabusi=1

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
if y>global.water_level && setonce=0 {
    is_swimming = 1
    setonce=1
}

if is_swimming=1 && y<=global.water_level {
    tmp2=instance_create(x,y,o_fishyellow3);
    tmp2.xspeed=2-irandom(2)+1.25
    tmp2.yspeed=-3-1.3*irandom(4)
    instance_destroy();
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.level_complete=0 {


    if activated=0 {if x>view_xview[0]-100 && x<view_xview[0]+740 && y>view_yview[0]-100 && y<view_yview[0]+580 {
            if x<o_marker.x {activated=1;}
            if x>=o_marker.x {activated=1;}
    }}
    if activated=1 {
        // chodzenie

        if x>o_marker.x {x-=randomus; dir=-1}
        if x<o_marker.x {x+=randomus; dir=1}
        if y>o_marker.y && y>global.water_level+32 {y-=randomus;}
        if y<o_marker.y {y+=randomus; }
        if dir=-1 {image_xscale=-1}
        if dir=1 {image_xscale=1}

        image_index=o_preview.fish
        //if rodzajzabicia=5 {instance_destroy(); lolo=instance_create(x,y,o_rybekadie); lolo.sprite_index=s_fish4; lolo=instance_create(x,y,o_punkciornik); lolo.image_index=0;if global.sample=1 {fofo=sound_play(snd_kick);sound_volume(snd_kick,global.glosnosc)}}
        if kill_type=2 {instance_destroy(); tmp6=instance_create(x,y+16,o_fishdead);tmp6.sprite_index=s_fish4}



    }
}
