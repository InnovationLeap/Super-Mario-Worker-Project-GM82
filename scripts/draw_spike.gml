if !argument2{
    switch(argument0){
        case 17:
            switch(argument1){
                case 0: draw_sprite(s_piranioleb,2,x+16,y+16); break;
                case 1: draw_sprite(s_piranioleb2,2,x+16,y+16); break;
                case 2: draw_sprite(s_piranioleb3,2,x+16,y+16); break;
                case 3: draw_sprite(s_piranioleb4,2,x+16,y+16); break;
            }
            break;
        case 22:
            switch(argument1){
                case 0: draw_sprite(s_kolec,0,x,y); break;
                case 1: draw_sprite(s_kolec2,0,x,y); break;
                case 2: draw_sprite(s_kolec3,0,x,y); break;
                case 3: draw_sprite(s_kolec4,0,x,y); break;
            }
            break;
        case 37:
            switch(argument1){
                case 0: draw_sprite(s_mfc,0,x,y); break;
                case 1: draw_sprite(s_mfc2,0,x,y); break;
                case 2: draw_sprite(s_mfc3,0,x,y); break;
                case 3: draw_sprite(s_mfc4,0,x,y); break;
            }
            break;
    }
}
else{
    switch(argument0){
        case 17:
            switch(argument1){
                case 0: draw_sprite_ext(s_piranioleb,2,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5); break;
                case 1: draw_sprite_ext(s_piranioleb2,2,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5); break;
                case 2: draw_sprite_ext(s_piranioleb3,2,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5); break;
                case 3: draw_sprite_ext(s_piranioleb4,2,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5); break;
            }
            break;
        case 22:
            switch(argument1){
                case 0: draw_sprite_ext(s_kolec,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
                case 1: draw_sprite_ext(s_kolec2,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
                case 2: draw_sprite_ext(s_kolec3,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
                case 3: draw_sprite_ext(s_kolec4,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
            }
            break;
        case 37:
            switch(argument1){
                case 0: draw_sprite_ext(s_mfc,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
                case 1: draw_sprite_ext(s_mfc2,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
                case 2: draw_sprite_ext(s_mfc3,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
                case 3: draw_sprite_ext(s_mfc4,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
            }
            break;
    }
}
