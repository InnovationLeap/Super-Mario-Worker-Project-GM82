#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lifetime=0
image_speed=0
zaliczono=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {
lifetime+=1
y-=0.5
if lifetime>100 {image_alpha-=0.1}
if image_alpha<=0 {instance_destroy()}

if zaliczono=0
    {
    zaliczono=1
    if image_index=0 {global.punkty+=100}
    if image_index=1 {global.punkty+=200}
    if image_index=2 {global.punkty+=500}
    if image_index=3 {global.punkty+=1000}
    if image_index=4 {global.punkty+=2000}
    if image_index=5 {global.punkty+=5000}
    if image_index=6
        {
        global.zycia+=1;
        if global.sample=1 {fofo=sound_play(snd_1up);sound_volume(snd_1up,global.glosnosc)}
        }
    }
}
