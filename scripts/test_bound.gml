i=0;region_count=0;
while(i<instance_number(o_region) && region_count=0){
    fofo=instance_find(o_region,i);
    if argument0>=fofo.x && argument0<fofo.endx && argument1>fofo.y && argument1<=fofo.endy{
        left_bound=fofo.x;
        top_bound=fofo.y
        right_bound=fofo.endx-640;
        bottom_bound=fofo.endy-480;
        if(fofo.linked=1){
            //global.fuck2+=114514
            if (fofo.bgm_change=1 && global.muzyka<>fofo.bgm){mm_stop_all_ext();global.muzyka=fofo.bgm;Music_Play();/*global.fuck*=3*/}
            if (fofo.bgp_change=1 && global.background<>fofo.bgp){global.background=fofo.bgp;}
            if (fofo.height>-64){global.auto=0;global.poziomwody = fofo.height;o_waterdraw.velocity=0;o_waterdraw.target=fofo.height}
            if (fofo.weather_change == 1)
            {
                global.rainy = fofo.rainy;
                global.fallingstars = fofo.fallingstars;
                global.snowy = fofo.snowy;
                global.thunder = fofo.thunder;
                global.windy = fofo.windy;
                global.darkness = fofo.darkness;
                global.brightness = fofo.brightness;
            }
        }
        region_count=1;
        view_set=0
        now_region = fofo;
    }
    i+=1;
}
if(region_count=0){
    left_bound=0;
    top_bound=0;
    right_bound=room_width-640;
    bottom_bound=room_height-480;
}
