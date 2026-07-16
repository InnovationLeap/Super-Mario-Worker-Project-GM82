#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bgm_change = 0
bgp_change = 0
weather_change = 0
water_change = 0
bgm = '1'
bgp = 1
height = 800
linked=0
//Weather
rainy = 0
fallingstars = 0
snowy = 0
thunder = 0
windy = 0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if linked = 0 && place_meeting(x, y, o_marker) {
    if (bgm_change = 1 && global.muzyka <> bgm) {
        global.muzyka = bgm;
        if (!(o_marker.gwiazdka=1 && instance_number(object112)<>0)) {
            mm_stop_all_ext();
            Music_Play();
        }
    }

    if (bgp_change = 1 && global.background <> bgp) {
        global.background = bgp;
    }

    if (height > -64) {
        global.auto = 0;
        global.poziomwody = height;
        o_waterdraw.velocity = 0;
        o_waterdraw.target = fofo.height
    }

    //Weather
    if (weather_change = 1) {
        global.rainy = rainy;
        global.fallingstars = fallingstars;
        global.snowy = snowy;
        global.thunder = thunder;
        global.windy = windy;
        global.darkness = darkness;
        global.brightness = brightness;
    }
}
