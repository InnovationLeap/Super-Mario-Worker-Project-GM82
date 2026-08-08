#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
grav=0
state=0

image_speed=0
dir=-1
activated=1
kill_type=0

shoot_seq=0
jump_timer=0
in_block=0
walk_timer=0
chodzonko2=0
angrymode=0
angrymodetimer=0
shoot_seq2=random(0.2)

killer=0 // czy mozna rozdeptywac 0 - tak, 1 - nie, 2 - tak ale nie zabija,
knockback=0 // przy rozdeptywaniu ile ma zwiekszyc odskok

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
        // spadanie i skakanie
        if state=0 {jump_timer+=1}
        if jump_timer>100 {jump_timer=0; state=1; grav=-12; y-=10}
        if state=0 && !place_meeting(x,y+1,obj_halfground) && !place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,o_pointblock) {state=1}
        if state=1 {grav+=0.5; y+=grav}
        if state=1 && in_block=0 && grav<0 && (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {in_block=1}
        if state=1 && in_block=1 && grav>0 && !place_meeting(x,y,obj_halfground) && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {in_block=0}
        if state=1 && ( (place_meeting(x,y+1,obj_halfground) || place_meeting(x,y+1,obj_wall) || place_meeting(x,y+1,o_pointblock)) ) && ( (place_meeting(x+1,y,obj_halfground) || place_meeting(x+1,y,obj_wall) || place_meeting(x+1,y,o_pointblock)) )&& ( (place_meeting(x-1,y,obj_halfground) || place_meeting(x-1,y,obj_wall) || place_meeting(x-1,y,o_pointblock)) )&& in_block=0 {grav=0; state=2}
        while state=2 &&( (place_meeting(x,y,obj_halfground) || place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) ) {y-=1 }
        if state=2 && !(place_meeting(x,y,obj_halfground)) && !(place_meeting(x,y,obj_wall)) && !(place_meeting(x,y,o_pointblock)) {state=0 }
    }

    if !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {
        // strzelanie
        if x>o_marker.x {image_xscale=-1}
        if x<o_marker.x {image_xscale=1}
        if x<view_xview[0]+740 && x>view_xview[0]-100 shoot_seq+=1+shoot_seq2
        if shoot_seq<=150 {sprite_index=s_hammerbro}
        if shoot_seq>150 {sprite_index=s_hammerbroattack}
        if shoot_seq>250 {shoot_seq=0; tmp=instance_create(x,y,o_hammerbro); tmp.dir=image_xscale;sound_play(snd_hammer)}

        // chodzenie
        if angrymode=1 {
            if dir=-1 {if !place_meeting(x-2,y,obj_wall) && !place_meeting(x-2,y,o_pointblock) {x-=2;}}
            if dir=1 {if !place_meeting(x+2,y,obj_wall) && !place_meeting(x+2,y,o_pointblock) {x+=2;}}
            if x>o_marker.x {dir=-1}
            if x<o_marker.x {dir=1}
        }
        if walk_timer=0 && chodzonko2=0 {walk_timer=10+round(random(150)); chodzonko2=walk_timer}
        if walk_timer>0 {if !place_meeting(x+1,y,obj_wall) {x+=1;}; walk_timer-=1}
        if walk_timer=0 && chodzonko2>0 {if !place_meeting(x-1,y,obj_wall) {x-=1;}; chodzonko2-=1}

        if angrymode=0 {angrymodetimer+=1}
        if angrymodetimer>2500 {angrymode=1}

        if (place_meeting(x+1,y,obj_wall) || place_meeting(x-1,y,obj_wall) || place_meeting(x-1,y,o_pointblock) || place_meeting(x+1,y,o_pointblock)) && in_block=0 {dir=dir*-1}
        image_index+=0.1
    }


    // uppercut i zwykla smierc
    //if place_meeting(x,y,o_uppercut) {energia-=3; rodzajzabicia=0}
    if kill_type=1 {instance_destroy(); instance_create(x,y,o_hammerbrosdead); instance_create(x,y,o_scorepop)}
    if kill_type=3 || kill_type=4 || kill_type=5 {instance_destroy(); instance_create(x,y,o_hammerbrosdead); tmp=instance_create(x,y,o_scorepop); tmp.image_index=0;if global.sample=1 {tmp2=sound_play(snd_kick);sound_volume(snd_kick,global.game_volume)}}
    if kill_type=2 {instance_destroy(); instance_create(x,y,o_hammerbrosdead);}



    // niszcz po za ekranem
    if y>room_height[0]+64 {instance_destroy()}
}
