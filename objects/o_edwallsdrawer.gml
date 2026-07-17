#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cyferkimario=font_add_sprite(txt_mariofonts,ord('!'),1,0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if o_edmain.ratio_level == 0 {
    up_left_x = view_xview[0];
    up_left_y = view_yview[0];
} else {
    up_left_x = round(view_xview[0] / 32) * 32;
    up_left_y = round(view_yview[0] / 32) * 32;
}

if o_edmain.costawia3 <> 42{
for (i=0; i<ceil(20 * o_edmain.zoom_ratio); i+=1)
    {
    for (a=0; a<ceil(15 * o_edmain.zoom_ratio); a+=1)
        {
        if o_edmain.ratio_level == 0 {
            draw_sprite_ext(s_blocks,o_edmain.arrayetapu[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)],up_left_x+i*32,up_left_y+a*32,1,1,0,c_white,1)
        } else {
            if o_edmain.arrayetapu[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)] > 0 {
                draw_sprite_ext(s_blocks,o_edmain.arrayetapu[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)],up_left_x+i*32,up_left_y+a*32,1,1,0,c_white,1)
            }
        }
        if o_edmain.arrayetapu[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)]=85{
            draw_set_font(cyferkimario);
            draw_sprite(s_block85,0,up_left_x+i*32,up_left_y+a*32)
            }
        }
    }
}
else
for (i=0; i<ceil(20 * o_edmain.zoom_ratio); i+=1)
    {
    for (a=0; a<ceil(15 * o_edmain.zoom_ratio); a+=1)
        {
        if o_edmain.ratio_level == 0 {
            draw_sprite_ext(s_blocks,o_edmain.arrayetapu[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)],up_left_x+i*32,up_left_y+a*32,1,1,0,c_white,0.4)
        } else {
            if o_edmain.arrayetapu[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)] > 0 {
                draw_sprite_ext(s_blocks,o_edmain.arrayetapu[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)],up_left_x+i*32,up_left_y+a*32,1,1,0,c_white,0.4)
            }
        }
        if o_edmain.arrayetapu[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)]=85{
            draw_set_font(cyferkimario);
            draw_sprite(s_block85,0,up_left_x+i*32,up_left_y+a*32)
            }
        }
    }
