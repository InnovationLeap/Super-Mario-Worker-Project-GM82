if !argument1{
switch(argument0){
    case 0: draw_sprite(s_troopashell,0,x+16,y+16);break;
    case 1: draw_sprite(s_troopashell,1,x+16,y+16);break;
    case 2: draw_sprite(s_trooparedshell,0,x+16,y+16);break;
    case 3: draw_sprite(s_trooparedshell,1,x+16,y+16);break;
    case 4: draw_sprite(s_troopablueshell,0,x+16,y+16);break;
    case 5: draw_sprite(s_troopablueshell,3,x+16,y+16);break;
    case 6: draw_sprite(s_troopashellgold,0,x+16,y+16);break;
    case 7: draw_sprite(s_troopashellgold,1,x+16,y+16);break;
    case 8: draw_sprite(s_buzzyshell,0,x+16,y+16);break;
    case 9: draw_sprite(s_buzzyshell,1,x+16,y+16);break;
}
}
else{
switch(argument0){
    case 0: draw_sprite_ext(s_troopashell,0,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5);break;
    case 1: draw_sprite_ext(s_troopashell,1,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5);break;
    case 2: draw_sprite_ext(s_trooparedshell,0,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5);break;
    case 3: draw_sprite_ext(s_trooparedshell,1,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5);break;
    case 4: draw_sprite_ext(s_troopablueshell,0,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5);break;
    case 5: draw_sprite_ext(s_troopablueshell,3,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5);break;
    case 6: draw_sprite_ext(s_troopashellgold,0,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5);break;
    case 7: draw_sprite_ext(s_troopashellgold,1,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5);break;
    case 8: draw_sprite_ext(s_buzzyshell,0,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5);break;
    case 9: draw_sprite_ext(s_buzzyshell,1,floor((mouse_x)/32)*32+16,floor((mouse_y)/32)*32+16,1,1,0,c_white,0.5);break;
}

}
