#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fadein = 0;
timer = 0;
image_alpha = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer += 1;

if fadein = 0 {
    image_alpha += 0.02;
}

if timer >= 110 {
    fadein = 1;
    image_alpha -= 0.02;
}

if fadein = 1 && image_alpha <= 0.00 {
    room_goto_next();
}

if ( x > -2344 ) {
    x = max(-2344, x - 20);
}
