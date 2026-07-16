#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
light_radius = 0;
light_radius_max = 35;
spd = 0.6;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if o_marker.gwiazdka > 0 {
    light_radius = min(light_radius_max, light_radius + spd);
} else {
    light_radius = max(0, light_radius - spd);
}
