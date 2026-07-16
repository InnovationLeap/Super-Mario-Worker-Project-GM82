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
if o_edmain.costawia3 <> 42{
for (i=0; i<20; i+=1)
    {
    for (a=0; a<15; a+=1)
        {
        draw_sprite_ext(s_blocks,o_edmain.arrayetapu[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)],view_xview[0]+i*32,view_yview[0]+a*32,1,1,0,c_white,1)
        if o_edmain.arrayetapu[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)]=85{
            draw_set_font(cyferkimario);
            //draw_text_transformed(view_xview[0]+i*32,view_yview[0]+a*32,'85',0.75,0.75,0)
            draw_sprite(s_block85,0,view_xview[0]+i*32,view_yview[0]+a*32)
            }
        }
    }
}
else
for (i=0; i<20; i+=1)
    {
    for (a=0; a<15; a+=1)
        {
        draw_sprite_ext(s_blocks,o_edmain.arrayetapu[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)],view_xview[0]+i*32,view_yview[0]+a*32,1,1,0,c_white,0.4)
        if o_edmain.arrayetapu[i+floor(view_xview[0]/32),a+floor(view_yview[0]/32)]=85{
            draw_set_font(cyferkimario);
            //draw_text_transformed(view_xview[0]+i*32,view_yview[0]+a*32,'85',0.75,0.75,0)
            draw_sprite(s_block85,0,view_xview[0]+i*32,view_yview[0]+a*32)
            }
        }
    }
