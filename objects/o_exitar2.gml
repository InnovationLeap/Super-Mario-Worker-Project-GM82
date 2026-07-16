#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
startx=x
starty=y
sekwencja=0
iyor=0
zabity=0
ixor=0
iyor2=-4
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {

if zabity=0 {
    image_index = 0
    if sekwencja=0 && iyor<200 {y+=3; iyor+=3}
    if sekwencja=0 && iyor>=200 {sekwencja=1}
    if sekwencja=1 && iyor>0 {y-=3; iyor-=3}
    if sekwencja=1 && iyor<=0 {sekwencja=0}
}

if zabity=1
    {
    if x>o_marker {ixor=5}
    if x>o_marker {ixor=-5}
    global.przeszedllevel=100
    zabity=2
    mm_stop_all_ext();

    // Normal Level Pass
    if global.fastpass=0 || global.gameversion <= 1711 {
        mm_play_ext('.\Data\MW\ktkm4.dll',0);
    }
    // Faster Level Pass
    if global.fastpass=1 {
        visible = 0
        smoke = instance_create(x+8, y, o_smoke)
        sound_play(snd_fastpass);
    }

    }
if zabity=2
    {
    x+=ixor
    y+=iyor2
    iyor2+=0.2
    image_index = 1
    image_angle+=10
    }

}
