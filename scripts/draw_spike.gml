if !argument2 {
    switch(argument0) {
    case 17:
        switch(argument1) {
        case 0: draw_sprite(s_groundpiranhaup,2,x+16,y+16); break;
        case 1: draw_sprite(s_groundpiranhadown,2,x+16,y+16); break;
        case 2: draw_sprite(s_groundpiranhaleft,2,x+16,y+16); break;
        case 3: draw_sprite(s_groundpiranharight,2,x+16,y+16); break;
        }
        break;
    case 22:
        switch(argument1) {
        case 0: draw_sprite(s_spike,0,x,y); break;
        case 1: draw_sprite(s_spike2,0,x,y); break;
        case 2: draw_sprite(s_spike3,0,x,y); break;
        case 3: draw_sprite(s_spike4,0,x,y); break;
        }
        break;
    case 37:
        switch(argument1) {
        case 0: draw_sprite(s_mfc,0,x,y); break;
        case 1: draw_sprite(s_mfc2,0,x,y); break;
        case 2: draw_sprite(s_mfc3,0,x,y); break;
        case 3: draw_sprite(s_mfc4,0,x,y); break;
        }
        break;
    }
} else {
    switch(argument0) {
    case 17:
        switch(argument1) {
        case 0: draw_sprite_ext(s_groundpiranhaup,2,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5); break;
        case 1: draw_sprite_ext(s_groundpiranhadown,2,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5); break;
        case 2: draw_sprite_ext(s_groundpiranhaleft,2,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5); break;
        case 3: draw_sprite_ext(s_groundpiranharight,2,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5); break;
        }
        break;
    case 22:
        switch(argument1) {
        case 0: draw_sprite_ext(s_spike,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
        case 1: draw_sprite_ext(s_spike2,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
        case 2: draw_sprite_ext(s_spike3,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
        case 3: draw_sprite_ext(s_spike4,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
        }
        break;
    case 37:
        switch(argument1) {
        case 0: draw_sprite_ext(s_mfc,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
        case 1: draw_sprite_ext(s_mfc2,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
        case 2: draw_sprite_ext(s_mfc3,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
        case 3: draw_sprite_ext(s_mfc4,0,floor((mouse_x)/32)*32,floor((mouse_y)/32)*32,1,1,0,c_white,0.5); break;
        }
        break;
    }
}
