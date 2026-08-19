/// ed_autopair_ui()
/// 水管自动配对界面：place_code→autopaircheck 映射 + 选项按钮渲染/点击。
/// 按钮行已封装为 ed_autopair_row / ed_autopair_single（数据化：帧基+值基）。
/// 需在 self=o_edmain 上下文调用。

    autopaircheck=0
    if global.autopair=1 && wlaczony=1 {
        //if ((costawia>=5&&costawia<=8)||(costawia>=17&&costawia<=20)||(costawia>=29&&costawia<=32)||(costawia>=41&&costawia<=44)||(costawia>=133&&costawia<=168)
        //||(costawia>=87&&costawia<=92)||(costawia>=99&&costawia<=106)||(costawia>=109&&costawia<=116)||(costawia>=121&&costawia<=128)){autopaircheck=1}else{autopaircheck=0}
        if (place_code=5||place_code=6||place_code=17||place_code=18) {autopaircheck=1};
        if (place_code=7||place_code=8||place_code=19||place_code=20) {autopaircheck=1};
        if (place_code=29||place_code=30||place_code=41||place_code=42) {autopaircheck=3};
        if (place_code=31||place_code=32||place_code=43||place_code=44) {autopaircheck=3};
        if ((place_code>=87&&place_code<=89)||(place_code>=99&&place_code<=101)) {autopaircheck=5};
        if ((place_code>=90&&place_code<=92)||(place_code>=102&&place_code<=104)) {autopaircheck=6};
        if ((place_code>=109&&place_code<=111)||(place_code>=121&&place_code<=123)) {autopaircheck=7};
        if ((place_code>=112&&place_code<=114)||(place_code>=124&&place_code<=126)) {autopaircheck=8};
        if (place_code=105||place_code=106||place_code=115||place_code=116||place_code=127||place_code=128) {autopaircheck=9};
        if ((place_code>=133&&place_code<=135)||(place_code>=145&&place_code<=147)) {autopaircheck=10};
        if ((place_code>=157&&place_code<=159)||place_code=225||place_code=226) {autopaircheck=11};
        if (place_code=136||place_code=137||place_code=148||place_code=149||place_code=160||place_code=161) {autopaircheck=12};
        if (place_code=138||place_code=139||place_code=150||place_code=151||place_code=162||place_code=163) {autopaircheck=13};
        if (place_code=140||place_code=141||place_code=152||place_code=153||place_code=164||place_code=165) {autopaircheck=14};
        if (place_code=142||place_code=143||place_code=154||place_code=155||place_code=166||place_code=167) {autopaircheck=15};
        if (place_code=144||place_code=156||place_code=168||place_code=223||place_code=224) {autopaircheck=16};
        if (place_code=58||place_code=59) {autopaircheck=17};
        if (place_code=300 || place_code=301) {autopaircheck=18};
        if wlaczony=1 {
            if autopaircheck>0 {draw_sprite_ext(s_autopair2,0,view_xview[0]+224,view_yview[0]+416,1,1,0,c_white,1);
                if(abs(view_xview[0]+224-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && clicked=0 && mouse_check_button(mb_left)) {autopair=0};
                draw_sprite_ext(s_autopair2,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
                if autopair=0 {draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224,view_yview[0]+416,1,1,0,c_white,1);}
            }
            if autopaircheck=1 {ed_autopair_row(2, 2, 1)}
    /*if (autopaircheck=2){
    draw_sprite_ext(s_autopair2,4,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=4};
    draw_sprite_ext(s_autopair2,3,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=3};
    if autopair=4{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=3{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    }*/
            if autopaircheck=3 {ed_autopair_row(5, 5, 1)}
    /*if (autopaircheck=4){
    draw_sprite_ext(s_autopair2,7,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*1-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=7};
    draw_sprite_ext(s_autopair2,6,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);
    if(abs(view_xview[0]+224+66*2-mouse_x)<32 && abs(view_yview[0]+416-mouse_y)<32 && kliknieto=0 && mouse_check_button(mb_left)){autopair=6};
    if autopair=7{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*1,view_yview[0]+416,1,1,0,c_white,1);}
    if autopair=6{draw_sprite_ext(s_autopairbutton,2,view_xview[0]+224+66*2,view_yview[0]+416,1,1,0,c_white,1);}
    }  */
            if autopaircheck=9 {ed_autopair_row(2, 12, 0)}
            if autopaircheck=7 {ed_autopair_row(5, 15, 0)}
            if autopaircheck=12 {ed_autopair_row(2, 22, 0)}
            if autopaircheck=5 {ed_autopair_row(5, 25, 0)}
            if autopaircheck=13 {ed_autopair_row(2, 32, 0)}
            if autopaircheck=6 {ed_autopair_row(5, 35, 0)}
            if autopaircheck=14 {ed_autopair_row(2, 42, 0)}
            if autopaircheck=8 {ed_autopair_row(5, 45, 0)}
            if autopaircheck=15 {ed_autopair_row(2, 52, 0)}
            if autopaircheck=10 {ed_autopair_row(5, 55, 0)}
            if autopaircheck=16 {ed_autopair_row(2, 62, 0)}
            if autopaircheck=11 {ed_autopair_row(5, 65, 0)}
            if autopaircheck=17 {ed_autopair_single(8, 8)}
            if autopaircheck=18 {ed_autopair_single(8, 68)}
        }
    }
