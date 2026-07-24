var aa,ab;
    aa=string(argument0)//aa为物件编号(scenery是1,marks是2等,Enemy的保存单独在另一个函数里)
    ab=string(coto)//ab为物品编号（就是那个,101中的1,218中的18）
    repeat(2-string_length(ab)){ab=string_insert('0',ab,-1)}//为物品编号补0
    aa=string_insert(ab,aa,string_length(aa)+1)//将物品完整编号写入aa
    if global.objectoffset=0{//位置补正相关I
        if argument0='1' && coto=19{x-=1}//炮台底座位置补正1
        if argument0='1' && coto=20{x-=1}//炮台底座位置补正2
        if argument0='1' && coto=21{x-=1}//炮台底座位置补正3
        if argument0='2' && coto=17{x-=32}//终点杆位置补正
        if argument0='2' && coto=19{x+=16;y+=32}//起点位置补正
    }
    if x>=0{
    ab=transB(min(x,61999))//将ab设为x坐标
    repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}//补0
        aa=string_insert(ab,aa,string_length(aa)+1)}//将x坐标写入aa
    else{
    ab=string(min(-x,999))//同理，不说了(x)
    repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
    ab=string_insert('-',ab,0)
    aa=string_insert(ab,aa,string_length(aa)+1)
    }
    if y>=0{
    ab=transB(min(y,61999))
    repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)}
    else{
    ab=string(min(-y,999))
    repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
    ab=string_insert('-',ab,0)
    aa=string_insert(ab,aa,string_length(aa)+1)
    }
    if global.objectoffset=0{//位置补正相关II
        if argument0='1' && coto=19{x+=1}//炮台底座位置补回来1
        if argument0='1' && coto=20{x+=1}//炮台底座位置补回来2
        if argument0='1' && coto=21{x+=1}//炮台底座位置补回来3
        if argument0='2' && coto=17{x+=32}//终点杆位置补回来
        if argument0='2' && coto=19{x-=16;y-=32}//起点位置补回来
    }

    if argument0='1' && coto=42{//imitater
    ab=string(block_index)
    repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
    aa=string_insert(ab,aa,string_length(aa)+1)
    }

    if argument0='2' && coto=23{//强滚存储速度
    aa=string_insert(real_string_length(scrollspeed*100,3),aa,string_length(aa)+1)
    aa=string_insert(string(is_orange),aa,string_length(aa)+1)
    }
    if argument0='2' && coto=25{//新桥存储性状和样式
    aa=string_insert(real_string_length(type,3),aa,string_length(aa)+1)
    aa=string_insert(real_string_length(anime,3),aa,string_length(aa)+1)
    }
    if argument0='2' && coto=26{//叹号存储文本
    aa=string_insert(textMessage,aa,string_length(aa)+1)
    }
    if argument0='2' && coto>=27 && coto<=29{//解密砖储存颜色
    aa=string_insert(string(color),aa,string_length(aa)+1)
    }
    if argument0='2' && coto=31{
    aa=string_insert(string(ledge_type),aa,string_length(aa)+1)
    }
    if argument0='2' && coto=32{
    aa=string_insert(transC(target),aa,string_length(aa)+1)
    aa=string_insert(string(velocity),aa,string_length(aa)+1)
    aa=string_insert(string(type),aa,string_length(aa)+1)
    aa=string_insert(transC(water_endX),aa,string_length(aa)+1)
    aa=string_insert(transC(water_endY),aa,string_length(aa)+1)
    }
    if argument0='2' && coto=33{ //储存音乐切换标记
    //bgm
    aa=string_insert(string(bgm_change),aa,string_length(aa)+1)
    ab=bgm
    repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
    aa=string_insert(ab,aa,string_length(aa)+1)
    //bgp
    aa=string_insert(string(bgp_change),aa,string_length(aa)+1)
    ab=string(bgp)
    repeat(2-string_length(ab)){ab=string_insert('0',ab,0)}
    aa=string_insert(ab,aa,string_length(aa)+1)
    //linked
    aa=string_insert(string(linked),aa,string_length(aa)+1)
    //height
    if height>0{
        ab=transB(min(height,61999))
        repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
    }
    else{
        ab=string(min(-height,999))
        repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
        ab=string_insert('-',ab,0)
    }
    aa=string_insert(ab,aa,string_length(aa)+1)
    //===Weather===
    //Rainy, Falling Stars, Snowy, Thunder, Windy, Darkness, Brightness
    aa=string_insert(string(weather_change),aa,string_length(aa)+1)
    aa=string_insert(string(rainy),aa,string_length(aa)+1)
    aa=string_insert(string(fallingstars),aa,string_length(aa)+1)
    aa=string_insert(string(snowy),aa,string_length(aa)+1)
    aa=string_insert(string(thunder),aa,string_length(aa)+1)
    aa=string_insert(string(windy),aa,string_length(aa)+1)
    aa=string_insert(string(darkness),aa,string_length(aa)+1)
    aa=string_insert(string(brightness),aa,string_length(aa)+1)
    }

    if argument0='2' && coto=34{ //储存滚屏区域
    ab=transB(min(camera_endX,61999))
    repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
    aa=string_insert(ab,aa,string_length(aa)+1)
    ab=transB(min(camera_endY,61999))
    repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
    aa=string_insert(ab,aa,string_length(aa)+1)
    }

/*
ab=string(additional1)
    repeat(string_length(ab)-3){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa))
ab=string(additional2)
    repeat(string_length(ab)-3){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa))
ab=string(additional3)
    repeat(string_length(ab)-3){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa))
ab=string(additional4)
    repeat(string_length(ab)-3){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa))
*/

file_text_write_string(global.script_file,aa)//将aa写入文件
file_text_writeln(global.script_file)
