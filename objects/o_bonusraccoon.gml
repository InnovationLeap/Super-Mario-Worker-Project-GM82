#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
state=0
image_speed=0
image_xscale=1

// Rising phase
// Grid-aligned rise: total displacement = 96px (physics) + ~32px(block escape) ≈ 128px = 4*32
// Formula: D = g*k*(1-k)/2, with k = -v0/g
// v0=-8, g=8/25 → k=25, D=-96 (upward 96px)
leaf_faza=0
leaf_speedY=-8
leaf_gravity=8/25

// Falling flutter
leaf_originX=0
leaf_kat=0
leaf_floatY=6
leaf_floatDist=32
leaf_floatYRange=2.8

leaf_prev_x=0

// 发光位置微调
// 注意：s_bonusleaf 的精灵原点是 (16,16)（居中），而 s_bonusstar/flower/mush 等同类道具
// 原点都是 (0,0)（左上），所以它们用 light 16/16 正好落在方块中心，本对象照抄就偏到了
// 画布右下角（叶子右下方 16px）。这里改回 0/0 = 精灵原点，也就是叶子画面的中心。
// 实测参考：alpha 包围盒 x 0-30 / y 3-29（中心 15,16）、alpha 质心 (13,18)。
// 全对象只有这两个数是光圈的旋钮，要再微调直接改这里。
light_x = 0;
light_y = 0;
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {

    image_index=0

    if leaf_faza=0 {
        if state=0 && (place_meeting(x,y,obj_wall) || place_meeting(x,y,o_pointblock)) {y-=1}
        if state=0 && !place_meeting(x,y,obj_wall) && !place_meeting(x,y,o_pointblock) {state=1}
        if state=1 {
            leaf_speedY+=leaf_gravity
            y+=leaf_speedY
            if leaf_speedY>=0 {
                leaf_faza=1
                leaf_originX=x
                leaf_prev_x=x
                leaf_kat=0
            }
        }
    }

    if leaf_faza=1 {
        var _rad, dx;
        _rad=degtorad(leaf_kat)
        x=leaf_originX-(cos(_rad)-1)*leaf_floatDist
        leaf_speedY=(sin(degtorad((leaf_kat mod 180)*0.5+180))+1)*leaf_floatYRange
        y+=leaf_speedY
        leaf_kat+=leaf_floatY

        // Direction based on X velocity
        dx=x-leaf_prev_x
        if dx>0.3 {image_xscale=1}
        if dx<-0.3 {image_xscale=-1}
        leaf_prev_x=x
    }

    // v6.11：生成器生成的单位改由生成器按 256px 回收（ObjGenerator.md §5.6），这里只管非生成物
    if gen_tag = 0 {
        if x>view_xview[0]+650 || x<view_xview[0]-10 || y>view_yview[0]+490 {instance_destroy()}
    }

}
