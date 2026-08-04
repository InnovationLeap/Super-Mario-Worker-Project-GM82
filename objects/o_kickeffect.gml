#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Raccoon tail hit impact effect (SMWP2 KickEffect)
// Animates over 5 frames: scale 0.25 -> 1.0 -> 0.25, alpha blink on peak frame
// Auto-destroys after lifetime
timer = 0
lifetime = 5
image_speed = 0
image_xscale = 0.25
image_yscale = 0.25
image_alpha = 1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza = 0 {
    timer += 1
    if timer = 1 { image_xscale = 0.25; image_yscale = 0.25; image_alpha = 1 }
    if timer = 2 { image_xscale = 0.62; image_yscale = 0.62; image_alpha = 1 }
    if timer = 3 { image_xscale = 1.0; image_yscale = 1.0; image_alpha = 0.5 }
    if timer = 4 { image_xscale = 0.62; image_yscale = 0.62; image_alpha = 1 }
    if timer = 5 { image_xscale = 0.25; image_yscale = 0.25; image_alpha = 1 }
    if timer > lifetime { instance_destroy() }
}
