#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


if mouse_x>258 && mouse_x<380 && mouse_y>181 && mouse_y<305
    {
    draw_set_blend_mode(bm_add)

    draw_sprite_ext(s_maskselector,0,255,178,1,1,0,c_white,0.3)

    draw_set_blend_mode(bm_normal)

    if mouse_check_button(mb_any)
        {
        room_goto_next()
        window_set_fullscreen(1)
        global.displaymode=1
        }
    }


if mouse_x>258-120-20 && mouse_x<380-120-16 && mouse_y>181 && mouse_y<305
    {
    draw_set_blend_mode(bm_add)

    draw_sprite_ext(s_maskselector,0,255-120-20,178,1,1,0,c_white,0.3)

    draw_set_blend_mode(bm_normal)

    if mouse_check_button(mb_any)
        {
        room_goto_next()
        global.displaymode=0
        }
    }



if mouse_x>258+120+20 && mouse_x<380+120+16 && mouse_y>181 && mouse_y<305
    {
    draw_set_blend_mode(bm_add)

    draw_sprite_ext(s_maskselector,0,255+120+20,178,1,1,0,c_white,0.3)

    draw_set_blend_mode(bm_normal)

        if mouse_check_button(mb_any)
        {
        display_reset()
        room_goto_next()
        window_set_fullscreen(1)
        display_set_all(640,480,-1,-1)
        display_reset()
        global.displaymode=1
        }


    }
