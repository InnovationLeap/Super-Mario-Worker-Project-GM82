var aa,ab,i;  //定义两个变量，aa负责记录整串敌人代码，ab负责记录每节代码
aa='0'  //初始化aa为字符串0
ab='0'
i=0
global.ccccc=0
if global.objectoffset=0{//位置补正相关I
    if coto=1||coto=31||coto=32{x+=16;y+=16}//板栗仔、布布鬼、硬壳龟
    if coto=2||coto=3||coto=34||coto=38{x+=14;y+=14}//乌龟
    if coto=4||coto=33||coto=35{x+=15;y+=17}//红绿蓝飞龟
    if coto=5{x+=17;y+=15}//红刺猬
    if coto=25{x+=17;y+=18}//灰刺猬
    if coto=10{x+=15;y+=8}//刺猬云
    if coto=48{x+=15;y+=8}//悲伤云
    if coto=12||coto=13||coto=14||coto=15{x+=16;y+=17}//鱼
    if coto=19||coto=27{x+=17;y+=10}//锤龟族
    if coto=21{x+=14}//火球
    //if coto=11||coto=26{x+=1;y+=1}//正向炮台
    //if coto=29||coto=30{x+=1}//倒向炮台

    if coto=6||coto=8||coto=9||coto=23||coto=44||coto=45||coto=46||coto=47{x+=16}//正向食人花、红色食人花倒、石盾、蓝色食人花、灰色食人花
    if coto=7{x+=16;y-=1}//绿色食人花倒
}
if coto<=48 && coto!=43 && coto!=20 && coto!=39 && coto!=35 && coto!=40 && coto!=41 && coto!=17 && coto!=22 && coto!=37{//把那个coto<=x 的x改成目前最大敌人编号
    ab=string(coto)  //ab记录敌人代号
    repeat(2-string_length(ab)){ab=string_insert('0',ab,0)}  //写0
    aa=string_insert(ab,aa,string_length(aa)+1)  //ab写入aa
    if x>=0{
    ab=transB(min(x,61999))
    repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
    aa=string_insert(ab,aa,string_length(aa)+1)}
    else{
    ab=string(min(-x,999))
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
    file_text_write_string(global.script_file,aa)
    file_text_writeln(global.script_file)    //aa写入文件并换行
}
if coto=20{    //如果是探照灯
    repeat(rotoord){
        i+=1

        aa='0';ab='0'
        ab=string(coto)  //ab记录敌人代号
        repeat(2-string_length(ab)){ab=string_insert('0',ab,0)}  //写0
        aa=string_insert(ab,aa,string_length(aa)+1)  //ab写入aa
        if x>=0{//x坐标
            ab=transB(x)
            repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
            aa=string_insert(ab,aa,string_length(aa)+1)
        }else{
            ab=string(min(-x,999))
            repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
            ab=string_insert('-',ab,0)
            aa=string_insert(ab,aa,string_length(aa)+1)
        }
        if y>=0{//y坐标
            ab=transB(y)
            repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
            aa=string_insert(ab,aa,string_length(aa)+1)
        }else{
            ab=string(min(-y,999))
            repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
            ab=string_insert('-',ab,0)
            aa=string_insert(ab,aa,string_length(aa)+1)
        }
        //半径
        aa=string_insert(real_string_length(rotor[i],3),aa,string_length(aa)+1)
        //角度
        aa=string_insert(real_string_length(rotoa[i],3),aa,string_length(aa)+1)
        //速度
        aa=string_insert(real_string_length(rotos[i],3),aa,string_length(aa)+1)
        //花瓣探照灯: is_petal(1) + max_radius(3) + radius_speed(3)
        if is_petal {
            aa=string_insert('1',aa,string_length(aa)+1)
            aa=string_insert(real_string_length(rotomr[i],3),aa,string_length(aa)+1)
            aa=string_insert(real_string_length(rotors[i],3),aa,string_length(aa)+1)
        }
        global.ccccc+=1
        file_text_write_string(global.script_file,aa)
        file_text_writeln(global.script_file)    //aa写入文件并换行
    }
}
if coto=39{    //金飞龟大法好
    repeat(rotoord){
    i+=1

    aa='0';ab='0'
    ab=string(coto)  //ab记录敌人代号
    repeat(2-string_length(ab)){ab=string_insert('0',ab,0)}  //写0
    aa=string_insert(ab,aa,string_length(aa)+1)  //ab写入aa
    if x>=0{//x坐标
        ab=transB(x)
        repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)
    }else{
        ab=string(min(-x,999))
        repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
        ab=string_insert('-',ab,0)
        aa=string_insert(ab,aa,string_length(aa)+1)
    }
    if y>=0{//y坐标
        ab=transB(y)
        repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)
    }else{
        ab=string(min(-y,999))
        repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
        ab=string_insert('-',ab,0)
        aa=string_insert(ab,aa,string_length(aa)+1)
    }
    //半径
    aa=string_insert(real_string_length(rotor[i],3),aa,string_length(aa)+1)
    //角度
    aa=string_insert(real_string_length(rotoa[i],3),aa,string_length(aa)+1)
    if rotoc[i]>0{//个数
        ab=string(min(floor(rotoc[i]),360))
        repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)
    }else{
        ab='001'
    }
//方向
    ab=string(min(max(0,floor(rotod[i])),1))
    aa=string_insert(ab,aa,string_length(aa)+1)
    /*ab=string(rotor[i])  //ab记录半径
    repeat(3-string_length(ab)){ab=string_insert('0',ab,-1)}  //写0
    aa=string_insert(ab,aa,string_length(aa)+1)  //ab写入aa
    ab=string(rotoa[i]) //ab记录角度
    repeat(3-string_length(ab)){ab=string_insert('0',ab,-1)}  //写0
    aa=string_insert(ab,aa,string_length(aa)+1)  //ab写入aa
    ab=string(rotos[i])  //ab记录速度
    repeat(3-string_length(ab)){ab=string_insert('0',ab,-1)}  //写0
    aa=string_insert(ab,aa,string_length(aa)+1)  //ab写入aa*/
    global.ccccc+=1
    file_text_write_string(global.script_file,aa)
    file_text_writeln(global.script_file)    //aa写入文件并换行
}}

//这里是跳乌龟
if coto=35{
    ab=string(coto)  //ab记录敌人代号
    repeat(2-string_length(ab)){ab=string_insert('0',ab,0)}  //写0
    aa=string_insert(ab,aa,string_length(aa)+1)  //ab写入aa
    if x>=0{
        ab=transB(min(x,61999))
        repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)
    }else{
        ab=string(min(-x,999))
        repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
        ab=string_insert('-',ab,0)
        aa=string_insert(ab,aa,string_length(aa)+1)
    }
    if y>=0{
        ab=transB(min(y,61999))
        repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)
    }else{
        ab=string(min(-y,999))
        repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
        ab=string_insert('-',ab,0)
        aa=string_insert(ab,aa,string_length(aa)+1)
    }
    //写入跳跃高度 没高度则不写入
    if jumph>0 {
        aa=string_insert(real_string_length(jumph,3),aa,string_length(aa)+1)
    }
    file_text_write_string(global.script_file,aa)
    file_text_writeln(global.script_file)    //aa写入文件并换行
}
if (coto=40||coto=41)&&test2=2{    //随机鱼
    ab=string(coto)  //ab记录敌人代号
    repeat(2-string_length(ab)){ab=string_insert('0',ab,0)}  //写0
    aa=string_insert(ab,aa,string_length(aa)+1)  //ab写入aa
    if x>=0{//x坐标
        ab=transB(x)
        repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)
    }else{
        ab=string(min(-x,999))
        repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
        ab=string_insert('-',ab,0)
        aa=string_insert(ab,aa,string_length(aa)+1)
    }
    if y>=0{//y坐标
        ab=transB(y)
        repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)
    }else{
        ab=string(min(-y,999))
        repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
        ab=string_insert('-',ab,0)
        aa=string_insert(ab,aa,string_length(aa)+1)
    }
    if fishendX>=0{//终点x坐标
        ab=transB(fishendX)
        repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)
    }else{
        ab=string(min(-fishendX,999))
        repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
        ab=string_insert('-',ab,0)
        aa=string_insert(ab,aa,string_length(aa)+1)
    }
    if fishendY>=0{//终点y坐标
        ab=transB(fishendY)
        repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)
    }else{
        ab=string(min(-fishendY,999))
        repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
        ab=string_insert('-',ab,0)
        aa=string_insert(ab,aa,string_length(aa)+1)
    }
    //样式
    aa=string_insert(real_string_length(type,1),aa,string_length(aa)+1)
    file_text_write_string(global.script_file,aa)
    file_text_writeln(global.script_file)    //aa写入文件并换行
}

if coto=43{
    ab=string(coto)  //ab记录敌人代号
    repeat(2-string_length(ab)){ab=string_insert('0',ab,0)}  //写0
    aa=string_insert(ab,aa,string_length(aa)+1)
    aa=string_insert(transC(x),aa,string_length(aa)+1)
    aa=string_insert(transC(y),aa,string_length(aa)+1)
    aa=string_insert(string(shell_type),aa,string_length(aa)+1)
    file_text_write_string(global.script_file,aa)
    file_text_writeln(global.script_file)
}

if coto=17{
    ab=string(coto)  //ab记录敌人代号
    repeat(2-string_length(ab)){ab=string_insert('0',ab,0)}  //写0
    aa=string_insert(ab,aa,string_length(aa)+1)
    aa=string_insert(transC(x),aa,string_length(aa)+1)
    aa=string_insert(transC(y),aa,string_length(aa)+1)
    aa=string_insert(string(spike_type),aa,string_length(aa)+1)
    file_text_write_string(global.script_file,aa)
    file_text_writeln(global.script_file)
}

if coto=22{
    ab=string(coto)  //ab记录敌人代号
    repeat(2-string_length(ab)){ab=string_insert('0',ab,0)}  //写0
    aa=string_insert(ab,aa,string_length(aa)+1)
    aa=string_insert(transC(x),aa,string_length(aa)+1)
    aa=string_insert(transC(y),aa,string_length(aa)+1)
    aa=string_insert(string(spike_type),aa,string_length(aa)+1)
    file_text_write_string(global.script_file,aa)
    file_text_writeln(global.script_file)
}

if coto=37{
    ab=string(coto)  //ab记录敌人代号
    repeat(2-string_length(ab)){ab=string_insert('0',ab,0)}  //写0
    aa=string_insert(ab,aa,string_length(aa)+1)
    aa=string_insert(transC(x),aa,string_length(aa)+1)
    aa=string_insert(transC(y),aa,string_length(aa)+1)
    aa=string_insert(string(spike_type),aa,string_length(aa)+1)
    file_text_write_string(global.script_file,aa)
    file_text_writeln(global.script_file)
}

if global.objectoffset=0{//位置补正相关II
    if coto=1||coto=31||coto=32{x-=16;y-=16}//板栗仔、布布鬼、硬壳龟
    if coto=2||coto=3||coto=34||coto=38{x-=14;y-=14}//乌龟
    if coto=4||coto=33||coto=35{x-=15;y-=17}//红绿蓝飞龟
    if coto=5{x-=17;y-=15}//红刺猬
    if coto=25{x-=17;y-=18}//灰刺猬
    if coto=10{x-=15;y-=8}//刺猬云
    if coto=48{x-=15;y-=8}//悲伤云
    if coto=12||coto=13||coto=14||coto=15{x-=16;y-=17}//鱼
    if coto=19||coto=27{x-=17;y-=10}//锤龟族
    if coto=21{x-=14}//火球
    //if coto=11||coto=26{x-=1;y-=1}//正向炮台
    //if coto=29||coto=30{x-=1}//倒向炮台

    if coto=6||coto=8||coto=9||coto=23||coto=44||coto=45||coto=46||coto=47{x-=16}//正向食人花、红色食人花倒、石盾、蓝色食人花、灰色食人花
    if coto=7{x-=16;y+=1}//绿色食人花倒
}
/*
ab=string(additional4)
    repeat(string_length(ab)-3){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa))   这段被禁用了，意义不明，难道探照灯有第四个参数？
*/
