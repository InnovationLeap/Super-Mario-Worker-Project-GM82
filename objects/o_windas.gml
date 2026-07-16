#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
type=17*6
ixor=0
iyor=0
step=0

image_speed=0
anim=0
spadacz=0
nabijacz=0
kierunek=1
img_determine=0
img_type=0

// 发光位置微调 - 见 Step 事件
light_radius = 1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 {

    if img_determine = 0 {
    img_type = floor(type/6)

    switch (img_type) {
        case 0: image_index = 0; light_x = 48; light_y = 8; break; // 红长
        case 1: image_index = 1; light_x = 16; light_y = 8; break; // 红短
        case 3: image_index = 6; light_x = 48; light_y = 8; break; // 黄长
        case 4: image_index = 7; light_x = 16; light_y = 8; break; // 黄短
        case 5: image_index = 8; light_x = 48; light_y = 8; break; // 蓝长
        case 6: image_index = 9; light_x = 16; light_y = 8; break; // 蓝短
        case 7: image_index = 10; light_x = 48; light_y = 8; break; // 绿长
        case 8: image_index = 11; light_x = 16; light_y = 8; break; // 绿短
        case 9: image_index = 12; light_x = 48; light_y = 8; break; // 白长
        case 10: image_index = 13; light_x = 16; light_y = 8; break; // 白短
        case 11: image_index = 14; light_x = 48; light_y = 8; break; // 灰长
        case 12: image_index = 15; light_x = 16; light_y = 8; break; // 灰短
        case 13: image_index = 16; light_x = 48; light_y = 8; break; // 藕荷长
        case 14: image_index = 17; light_x = 16; light_y = 8; break; // 藕荷短
        case 15: image_index = 18; light_x = 60; light_y = 16; break; // 城堡长
        case 16: image_index = 19; light_x = 38; light_y = 16; break; // 城堡带点短
        case 17: image_index = 20; light_x = 60; light_y = 16; break; // 棕色城堡长
        case 18: image_index = 21; light_x = 38; light_y = 16; break; // 棕色城堡带点短
    }

    img_determine =1
    }

    if img_type=2 {
        image_index=2+anim ;anim+=0.2; if anim>3.6 {anim=0};
        light_x = 64; light_y = 16;
    } // cloud animation
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/


if global.pauza=0 {
//确定桥的形态






if global.modifiedmov=0 {
if type mod 6=0 // 掉落浮桥
    {
    nabijacz+=1
    if spadacz=1 && nabijacz>10
        {iyor+=1; nabijacz=0}

    if y>room_height {instance_destroy()}//纵坐标过大，销毁
    if instance_place(x,y-2,o_marker) //马里奥站在浮桥上
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if lolo.winduje=id && global.rodzajmaria<>5 {
        with(lolo){if sekwencja=0 && !instance_place(x,y+1,obj_wall) && !instance_place(x,y+1,o_pointblock) && instance_place(x,y+1,o_windas) && huadun=0

            {
            findel=instance_place(x,y+1,o_windas)
            findel.spadacz=1
            if !instance_place(x,y+1+findel.iyor,obj_wall) && !instance_place(x,y+1+findel.iyor,o_pointblock) {y+=findel.iyor;wyspeed=iyor }
            if (instance_place(x,y+1+findel.iyor,obj_wall) || instance_place(x,y+1+findel.iyor,o_pointblock)) {wyjatek=1};
            while wyjatek=1 && !instance_place(x,y+1,obj_wall) && !instance_place(x,y+1,o_pointblock) {y+=1}
            if wyjatek=1 && (instance_place(x,y+1,obj_wall) || instance_place(x,y+1,o_pointblock)) {wyjatek=0}
            }
            }}

        }y+=iyor;
    }

if type mod 6 =1 // jadaca na boki
    {
    if instance_place(x+2,y,obj_wall) || instance_place(x+2,y,o_pointblock) && kierunek=1 {kierunek=-1}
    if instance_place(x-2,y,obj_wall) || instance_place(x-2,y,o_pointblock) && kierunek=-1 {kierunek=1}
    if instance_place(x+2,y,o_onlyU) && kierunek=1 {kierunek=-2;colspeed=1}//忽悠转向，colspeed为转向时速度
    if instance_place(x-2,y,o_onlyU) && kierunek=-1 {kierunek=2;colspeed=-1}
    if kierunek=2{
        if colspeed>=1{kierunek=1}
        colspeed+=0.1; x+=colspeed;
        if instance_place(x,y-2,o_marker)
        {
            lolo=instance_place(x,y-2,o_marker)
            lolo.windonip=id
            if global.rodzajmaria<>5{
            with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0  {x+=other.colspeed;wxspeed=other.colspeed}}
        }}
    }
    if kierunek=-2{
        if colspeed<=-1{kierunek=-1}
        colspeed-=0.1; x+=colspeed;
        if instance_place(x,y-2,o_marker)
        {
            lolo=instance_place(x,y-2,o_marker)
            lolo.windonip=id
            if global.rodzajmaria<>5{
            with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0  {x+=other.colspeed;wxspeed=other.colspeed}}
        }}
    }

    if kierunek=1
        {x+=1
        if y>room_height {y=-32}
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0  {x+=1;wxspeed=1}}
        }}
        }
    if kierunek=-1
        {x-=1
        if y>room_height {y=-32}
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x-2,y,obj_wall) && !instance_place(x-2,y,o_pointblock) && x>16 && huadun=0  {x-=1;;wxspeed=-1} }
        }}
        }

    }


if type mod 6=2 // jadaca na boki
    {


    if kierunek=1
        {x+=2
        if y>room_height {y=-32}
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0 {x+=2;wxspeed=2}}
        }}
        }
    if kierunek=-1
        {x-=2
        if y>room_height {y=-32}
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x-2,y,obj_wall) && !instance_place(x-2,y,o_pointblock) && x>16 && huadun=0 {x-=2;wxspeed=-2}}
        }}
        }
    if instance_place(x+2,y,obj_wall) || instance_place(x+2,y,o_pointblock) && kierunek=1 {kierunek=-1}
    if instance_place(x-2,y,obj_wall) || instance_place(x-2,y,o_pointblock) && kierunek=-1 {kierunek=1}
    if instance_place(x+2,y,o_onlyU) && kierunek=1 {kierunek=-2;colspeed=2}//忽悠转向，colspeed为转向时速度
    if instance_place(x-2,y,o_onlyU) && kierunek=-1 {kierunek=2;colspeed=-2}
    if kierunek=2{
        if colspeed>=2{kierunek=1}
        colspeed+=0.1; x+=colspeed;
        if instance_place(x,y-2,o_marker)
        {
            lolo=instance_place(x,y-2,o_marker)
            lolo.windonip=id
            if global.rodzajmaria<>5{
            with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0  {x+=other.colspeed;wxspeed=other.colspeed}}
        }}
    }
    if kierunek=-2{
        if colspeed<=-2{kierunek=-1}
        colspeed-=0.1; x+=colspeed;
        if instance_place(x,y-2,o_marker)
        {
            lolo=instance_place(x,y-2,o_marker)
            lolo.windonip=id
            if global.rodzajmaria<>5{
            with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0  {x+=other.colspeed;wxspeed=other.colspeed}}
        }}
    }
    }

if type mod 6=3 // jadaca na boki
    {
    if kierunek=1
        {x+=3
        if y>room_height {y=-32}
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0 {x+=3;wxspeed=3}}
        }}
        }
    if kierunek=-1
        {x-=3
        if y>room_height {y=-32}
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x-2,y,obj_wall) && !instance_place(x-2,y,o_pointblock) && x>16 && huadun=0 {x-=3};wxspeed=-3}
        }}
        }
    if instance_place(x+2,y,obj_wall) || instance_place(x+2,y,o_pointblock) && kierunek=1 {kierunek=-1}
    if instance_place(x-2,y,obj_wall) || instance_place(x-2,y,o_pointblock) && kierunek=-1 {kierunek=1}
    if instance_place(x+2,y,o_onlyU) && kierunek=1 {kierunek=-2;colspeed=3}//忽悠转向，colspeed为转向时速度
    if instance_place(x-2,y,o_onlyU) && kierunek=-1 {kierunek=2;colspeed=-3}
    if kierunek=2{
        if colspeed>=3{kierunek=1}
        colspeed+=0.1; x+=colspeed;
        if instance_place(x,y-2,o_marker)
        {
            lolo=instance_place(x,y-2,o_marker)
            lolo.windonip=id
            if global.rodzajmaria<>5{
            with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0  {x+=other.colspeed;wxspeed=other.colspeed}}
        }}
    }
    if kierunek=-2{
        if colspeed<=-3{kierunek=-1}
        colspeed-=0.1; x+=colspeed;
        if instance_place(x,y-2,o_marker)
        {
            lolo=instance_place(x,y-2,o_marker)
            lolo.windonip=id
            if global.rodzajmaria<>5{
            with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0  {x+=other.colspeed;wxspeed=other.colspeed}}
        }}
    }
    }

if type mod 6=4 // jadaca na dol
    {
    y+=1
    if y>room_height {y=-32}
    if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x,y+1,obj_wall) && !instance_place(x,y+1,o_pointblock) && huadun=0 {y+=1};wyspeed=1}
        }
        }
    }

if type mod 6=5 // jadaca do gory
    {
    y-=1
    if global.gameversion<1700{if y<-32 {y=room_height+32}}
    else{if y<-32 {y=room_height}}
    if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x,y-5,obj_wall) && !instance_place(x,y-5,o_pointblock) && huadun=0 {y-=1};wyspeed=-1}
        }
        }

     }
     }
 else {

if type mod 6=0 // 掉落浮桥
    {
    nabijacz+=1
    if spadacz=1 && nabijacz>10
        {iyor+=1; nabijacz=0}

    if y>room_height {instance_destroy()}//纵坐标过大，销毁
    if instance_place(x,y-2,o_marker) //马里奥站在浮桥上
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if lolo.winduje=id && global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x,y+1,obj_wall) && !instance_place(x,y+1,o_pointblock) && instance_place(x,y+1,o_windas) && huadun=0

            {
            findel=instance_place(x,y+1,o_windas)
            findel.spadacz=1
            if !instance_place(x,y+1+findel.iyor,obj_wall) && !instance_place(x,y+1+findel.iyor,o_pointblock) {y+=findel.iyor;wyspeed=iyor }
            if (instance_place(x,y+1+findel.iyor,obj_wall) || instance_place(x,y+1+findel.iyor,o_pointblock)) {wyjatek=1};
            while wyjatek=1 && !instance_place(x,y+1,obj_wall) && !instance_place(x,y+1,o_pointblock) {y+=1}
            if wyjatek=1 && (instance_place(x,y+1,obj_wall) || instance_place(x,y+1,o_pointblock)) {wyjatek=0}
            }
            }}

        }y+=iyor;
    }

if type mod 6=1 // jadaca na boki
    {
    if instance_place(x+1,y,obj_wall) || instance_place(x+1,y,o_pointblock) && kierunek=1 {kierunek=-1}
    if instance_place(x-1,y,obj_wall) || instance_place(x-1,y,o_pointblock) && kierunek=-1 {kierunek=1}
    if instance_place(x+2,y,o_onlyU) && kierunek=1 {kierunek=-2;colspeed=1}//忽悠转向，colspeed为转向时速度
    if instance_place(x-2,y,o_onlyU) && kierunek=-1 {kierunek=2;colspeed=-1}
    if kierunek=2{
        if colspeed>=1{kierunek=1}
        colspeed+=0.1; x+=colspeed;
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0 {x+=other.colspeed;wxspeed=other.colspeed}}
        }}
    }
    if kierunek=-2{
        if colspeed<=-1{kierunek=-1}
        colspeed-=0.1; x+=colspeed;
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0 {x+=other.colspeed;wxspeed=other.colspeed}}
        }}
    }

    if kierunek=1
        {x+=1
        if y>room_height {y=-32}
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0 {x+=1;wxspeed=1}}
        }}
        }
    if kierunek=-1
        {x-=1
        if y>room_height {y=-32}
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x-2,y,obj_wall) && !instance_place(x-2,y,o_pointblock) && x>16 && huadun=0{x-=1;;wxspeed=-1}}
        }}
        }

    }


if type mod 6=2 // jadaca na boki
    {


    if kierunek=1
        {x+=2
        if y>room_height {y=-32}
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x+3,y,obj_wall) && !instance_place(x+3,y,o_pointblock) && x<room_width+16 && huadun=0 {x+=2;wxspeed=2}}
        }}
        }
    if kierunek=-1
        {x-=2
        if y>room_height {y=-32}
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x-3,y,obj_wall) && !instance_place(x-3,y,o_pointblock) && x>16 && huadun=0 {x-=2;wxspeed=-2}}
        }}
        }
    if instance_place(x+2,y,obj_wall) || instance_place(x+2,y,o_pointblock) && kierunek=1 {kierunek=-1}
    if instance_place(x-2,y,obj_wall) || instance_place(x-2,y,o_pointblock) && kierunek=-1 {kierunek=1}
    if instance_place(x+2,y,o_onlyU) && kierunek=1 {kierunek=-2;colspeed=2}//忽悠转向，colspeed为转向时速度
    if instance_place(x-2,y,o_onlyU) && kierunek=-1 {kierunek=2;colspeed=-2}
    if kierunek=2{
        if colspeed>=2{kierunek=1}
        colspeed+=0.1; x+=colspeed;
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0 {x+=other.colspeed;wxspeed=other.colspeed}}
        }}
    }
    if kierunek=-2{
        if colspeed<=-2{kierunek=-1}
        colspeed-=0.1; x+=colspeed;
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0 {x+=other.colspeed;wxspeed=other.colspeed}}
        }}
    }
    }

if type mod 6=3 // jadaca na boki
    {
    if kierunek=1
        {x+=3
        if y>room_height {y=-32}
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x+4,y,obj_wall) && !instance_place(x+4,y,o_pointblock) && x<room_width+16 && huadun=0 {x+=3;wxspeed=3}}
        }}
        }
    if kierunek=-1
        {x-=3
        if y>room_height {y=-32}
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x-4,y,obj_wall) && !instance_place(x-4,y,o_pointblock) && x>16 && huadun=0 {x-=3};wxspeed=-3}
        }}
        }
    if instance_place(x+3,y,obj_wall) || instance_place(x+3,y,o_pointblock) && kierunek=1 {kierunek=-1}
    if instance_place(x-3,y,obj_wall) || instance_place(x-3,y,o_pointblock) && kierunek=-1 {kierunek=1}
    if instance_place(x+2,y,o_onlyU) && kierunek=1 {kierunek=-2;colspeed=3}//忽悠转向，colspeed为转向时速度
    if instance_place(x-2,y,o_onlyU) && kierunek=-1 {kierunek=2;colspeed=-3}
    if kierunek=2{
        if colspeed>=3{kierunek=1}
        colspeed+=0.1; x+=colspeed;
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0 {x+=other.colspeed;wxspeed=other.colspeed}}
        }}
    }
    if kierunek=-2{
        if colspeed<=-3{kierunek=-1}
        colspeed-=0.1; x+=colspeed;
        if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x+2,y,obj_wall) && !instance_place(x+2,y,o_pointblock) && x<room_width+16 && huadun=0 {x+=other.colspeed;wxspeed=other.colspeed}}
        }}
    }
    }

if type mod 6=4 // jadaca na dol
    {
    y+=1
    if global.gameversion<1700{if y>room_height {y=-32}}
    else{if y>room_height {y=-32}}
    if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x,y+1,obj_wall) && !instance_place(x,y+1,o_pointblock) && huadun=0 {y+=1};wyspeed=1}
        }
        }
    }

if type mod 6=5 // jadaca do gory
    {
    y-=1
    if global.gameversion<1700{if y<-32 {y=room_height+32}}
    else{if y<-32 {y=room_height}}
    if instance_place(x,y-2,o_marker)
        {
        lolo=instance_place(x,y-2,o_marker)
        lolo.windonip=id
        if global.rodzajmaria<>5{
        with(lolo){if sekwencja=0 && !instance_place(x,y-5,obj_wall) && !instance_place(x,y-5,o_pointblock) && huadun=0 {y-=1};wyspeed=-1}
        }
        }

     }
     }
}
