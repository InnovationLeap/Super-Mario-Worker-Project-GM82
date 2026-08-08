i=0;region_count=0;
while(i<instance_number(o_region) && region_count=0) {
    tmp2=instance_find(o_region,i);
    if argument0>=tmp2.x && argument0<tmp2.endx && argument1>tmp2.y && argument1<=tmp2.endy {
        left_bound=tmp2.x;
        top_bound=tmp2.y
        right_bound=tmp2.endx-640;
        bottom_bound=tmp2.endy-480;
        if(tmp2.linked=1) {
            //global.fuck2+=114514
            if (tmp2.bgm_change=1 && global.bgm_id<>tmp2.bgm) {mm_stop_all_ext();global.bgm_id=tmp2.bgm;Music_Play();/*global.fuck*=3*/}
            if (tmp2.bgp_change=1 && global.background<>tmp2.bgp) {global.background=tmp2.bgp;}
            if (tmp2.height>-64) {global.auto=0;global.water_level = tmp2.height;o_waterdraw.velocity=0;o_waterdraw.target=tmp2.height}
            if (tmp2.weather_change == 1) {
                global.rainy = tmp2.rainy;
                global.fallingstars = tmp2.fallingstars;
                global.snowy = tmp2.snowy;
                global.thunder = tmp2.thunder;
                global.windy = tmp2.windy;
                global.darkness = tmp2.darkness;
                global.brightness = tmp2.brightness;
            }
        }
        region_count=1;
        view_set=0
        now_region = tmp2;
    }
    i+=1;
}
if(region_count=0) {
    left_bound=0;
    top_bound=0;
    right_bound=room_width-640;
    bottom_bound=room_height-480;
}
