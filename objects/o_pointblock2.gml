#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
podbity=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//当马里奥本身已经与隐藏砖重叠的时候没法激活上面的隐藏砖
//目前看来唯一的解决办法是找个替身（
if global.modifiedmov=1
{
  if instance_place(x,y,o_marker) && podbity=0
    {
  lolo=instance_create(x,y,o_pointblock3)
  lolo.bonus=bonus
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
if podbity=1 && bonus=7
    {
    lolo=instance_create(x,y,o_pointblockpodbijacz);
    lolo.dobity=1
    instance_destroy()
    }



if podbity=1 && bonus<>7
    {
    lolo=instance_create(x,y,o_pointblock);
    lolo.podbity=1
    lolo.bonus=bonus
    instance_destroy()
    }
