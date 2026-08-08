#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bumped=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//当马里奥本身已经与隐藏砖重叠的时候没法激活上面的隐藏砖
//目前看来唯一的解决办法是找个替身（
if global.modifiedmov=1 {
    if instance_place(x,y,o_marker) && bumped=0 {
        tmp=instance_create(x,y,o_pointblock3)
        tmp.bonus=bonus
        instance_destroy()
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//if podbity=0 draw_sprite(s_pointblock,0,x,y)
if bumped=1 && bonus=7 {
    tmp=instance_create(x,y,o_blockbumper);
    tmp.dobity=1
    instance_destroy()
}



if bumped=1 && bonus<>7 {
    tmp=instance_create(x,y,o_pointblock);
    tmp.bumped=1
    tmp.bonus=bonus
    instance_destroy()
}
