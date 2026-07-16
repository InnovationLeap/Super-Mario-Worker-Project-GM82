#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
target = 0
velocity = 0

endx=x
endy=y
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if x<o_marker.x && endx>=o_marker.x{
    if y<o_marker.y && endy>=o_marker.y{
        if(global.auto || o_waterdraw.target <> target || o_waterdraw.velocity <> velocity){
            o_waterdraw.target = target;
            o_waterdraw.velocity = velocity;
            if(global.lava){sound_play(snd_lava);}
            else{sound_play(snd_water);}
            global.auto=0;
            instance_destroy();
        }
    }
}
