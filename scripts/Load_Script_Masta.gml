script_file=global.script_kile
global.etapnazwa=file_text_read_string(script_file)
file_text_readln(script_file)
global.etapautor=file_text_read_string(script_file)
file_text_readln(script_file)
global.etapczas=real(file_text_read_string(script_file))
file_text_readln(script_file)
global.etapgravity=real(file_text_read_string(script_file))
file_text_readln(script_file)
global.etapkuppa=real(file_text_read_string(script_file))
file_text_readln(script_file)
global.poziomwody=real(file_text_read_string(script_file))
file_text_readln(script_file)
global.background=real(file_text_read_string(script_file))
global.local_background=global.background
file_text_readln(script_file)
global.muzyka=real(file_text_read_string(script_file))
global.local_muzyka=global.muzyka
file_text_readln(script_file)
global.checkpassage=0
haveversion=0
//var aa,ab,ac,ad,af,ag,ah,ai,aj;
if file_text_read_string(script_file)='BlocksDataStart'{
 file_text_readln(script_file)
 aa=file_text_read_string(script_file)
 ad=0
 while aa!='BlocksEnd'{
  ab=string_length(aa)/2
  for (ac=0;ac<ab;ac+=1){
   //o_edmain.arrayetapu[ac,ad]=real(string_copy(aa,ac*2+1,2))
   o_edmain.arrayetapu[ac,ad]=real(string_pos(string_copy(aa,ac*2+1,1),"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")-1)*10+real(string_copy(aa,ac*2+2,1))
  }
  ad+=1
  file_text_readln(script_file)
  aa=file_text_read_string(script_file)

 }
}
global.warpnum=0 //水管配对的编号
ds_list_destroy(global.autoscrolls)
global.autoscrolls=ds_list_create()//强滚列表
global.platformanime=0//悬浮桥默认样式
rotonum=0
rotonum2=0
rotox=ds_list_create()
rotoy=ds_list_create()
ds_list_add(rotox,-9999)
ds_list_add(rotoy,-9999)
rotox2=ds_list_create()
rotoy2=ds_list_create()
ds_list_add(rotox2,-9999)
ds_list_add(rotoy2,-9999)
global.modifiedmov=0
global.rotodisclay=0
global.layerord=-1
while !file_text_eof(script_file){
 file_text_readln(script_file)
 aa=file_text_read_string(script_file)
 if string_char_at(aa,0)='0'{
  if real(string_copy(aa,2,2))!=20 && real(string_copy(aa,2,2))!=39 && real(string_copy(aa,2,2))!=35 && real(string_copy(aa,2,2))!=40 && real(string_copy(aa,2,2))!=41 && real(string_copy(aa,2,2))!=43 && real(string_copy(aa,2,2))!=17 && real(string_copy(aa,2,2))!=22 && real(string_copy(aa,2,2))!=37 {
   ae=instance_create(transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_edenemyblock)
   ae.coto=real(string_copy(aa,2,2))
  }
  if real(string_copy(aa,2,2))=20{
   //(debug)show_message(string(transA(string_copy(aa,4,4)))+","+string(ds_list_find_index(rotox,transA(string_copy(aa,4,4))))+";"+string(transA(string_copy(aa,8,4)))+","+string(ds_list_find_index(rotoy,transA(string_copy(aa,8,4)))))
   if ds_list_find_index(rotox,transA(string_copy(aa,4,4))*10000+transA(string_copy(aa,8,4)))!=-1{// = ds_list_find_index(rotoy,transA(string_copy(aa,8,4))) && ds_list_find_index(rotox,transA(string_copy(aa,4,4)))!=-1{
    rototar=roto[ds_list_find_index(rotox,transA(string_copy(aa,4,4))*10000+transA(string_copy(aa,8,4)))]
    //rototar.coto=20
    rototar.rotoord+=1
    rototar.rotor[rototar.rotoord]=transA(string_copy(aa,12,3))
    rototar.rotoa[rototar.rotoord]=real(string_copy(aa,15,3))
    rototar.rotos[rototar.rotoord]=real(string_copy(aa,18,3))
    rototar.test2=2
   }
   else{
    rotonum+=1
    ae=instance_create(transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_edenemyblock)
    ae.coto=real(string_copy(aa,2,2))
    ds_list_add(rotox,transA(string_copy(aa,4,4))*10000+transA(string_copy(aa,8,4)))
    //ds_list_add(rotoy,transA(string_copy(aa,8,4)))
    roto[rotonum]=ae
    ae.rotoord=1
    ae.rotor[ae.rotoord]=transA(string_copy(aa,12,3))
    ae.rotoa[ae.rotoord]=real(string_copy(aa,15,3))
    ae.rotos[ae.rotoord]=real(string_copy(aa,18,3))
    ae.test2=2
   }
  }
  if real(string_copy(aa,2,2))=39{
   //(debug)show_message(string(transA(string_copy(aa,4,4)))+","+string(ds_list_find_index(rotox,transA(string_copy(aa,4,4))))+";"+string(transA(string_copy(aa,8,4)))+","+string(ds_list_find_index(rotoy,transA(string_copy(aa,8,4)))))
   if ds_list_find_index(rotox2,transA(string_copy(aa,4,4))*10000+transA(string_copy(aa,8,4)))!=-1{// = ds_list_find_index(rotoy,transA(string_copy(aa,8,4))) && ds_list_find_index(rotox,transA(string_copy(aa,4,4)))!=-1{
    rototar=roto[ds_list_find_index(rotox2,transA(string_copy(aa,4,4))*10000+transA(string_copy(aa,8,4)))]
   // rototar.coto=39
    rototar.rotoord+=1
    rototar.rotor[rototar.rotoord]=transA(string_copy(aa,12,3))
    rototar.rotoa[rototar.rotoord]=real(string_copy(aa,15,3))
    rototar.rotoc[rototar.rotoord]=real(string_copy(aa,18,3))
    rototar.rotod[rototar.rotoord]=real(string_copy(aa,21,1))
    rototar.test2=2
   }
   else{
    rotonum2+=1
    ae=instance_create(transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_edenemyblock)
    ae.coto=real(string_copy(aa,2,2))
    ds_list_add(rotox2,transA(string_copy(aa,4,4))*10000+transA(string_copy(aa,8,4)))
    //ds_list_add(rotoy,transA(string_copy(aa,8,4)))
    roto[rotonum2]=ae
    ae.rotoord=1
    ae.rotor[ae.rotoord]=transA(string_copy(aa,12,3))
    ae.rotoa[ae.rotoord]=real(string_copy(aa,15,3))
    ae.rotoc[ae.rotoord]=real(string_copy(aa,18,3))
    ae.rotod[ae.rotoord]=real(string_copy(aa,21,1))
    ae.test2=2
   }
  }
  if real(string_copy(aa,2,2))=35
    {
  ae=instance_create(transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_edenemyblock)
      ae.coto=real(string_copy(aa,2,2))
  if string_length(aa) > 11 && real(string_copy(aa,12,3))>0 { ae.jumph=real(string_copy(aa,12,3)); ae.test2=2 }
}
if real(string_copy(aa,2,2))=40
{
  ae=instance_create(transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_edenemyblock)
  ae.coto=real(string_copy(aa,2,2))
  ae.fishendX=transA(string_copy(aa,12,4));ae.fishendY=transA(string_copy(aa,16,4))
  ae.type=real(string_copy(aa,20,1))
  ae.test2=2
}
if real(string_copy(aa,2,2))=41
{
  ae=instance_create(transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_edenemyblock)
  ae.coto=real(string_copy(aa,2,2))
  ae.fishendX=transA(string_copy(aa,12,4));ae.fishendY=transA(string_copy(aa,16,4))
  ae.type=real(string_copy(aa,20,1))
  ae.test2=2
}
if real(string_copy(aa,2,2))=43
{
  ae=instance_create(transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_edenemyblock)
  ae.coto=real(string_copy(aa,2,2))
  ae.shell_type=real(string_copy(aa,12,1))
}
if real(string_copy(aa,2,2))=17
{
  ae=instance_create(transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_edenemyblock)
  ae.coto=real(string_copy(aa,2,2))
  ae.spike_type=real(string_copy(aa,12,1))
}
if real(string_copy(aa,2,2))=22
{
  ae=instance_create(transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_edenemyblock)
  ae.coto=real(string_copy(aa,2,2))
  ae.spike_type=real(string_copy(aa,12,1))
}
if real(string_copy(aa,2,2))=37
{
  ae=instance_create(transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_edenemyblock)
  ae.coto=real(string_copy(aa,2,2))
  ae.spike_type=real(string_copy(aa,12,1))
}
/*
    ae=instance_create(transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_edenemyblock)
  ae.coto=real(string_copy(aa,2,2))
  if ae.coto=20{
   ae.additional1=real(string_copy(aa,12,3))
   ae.additional2=real(string_copy(aa,15,3))
   ae.additional3=real(string_copy(aa,18,3))
   ae.test2=2
  }
*/
 if global.objectoffset=0{//敌人位置补正相关
    with(ae){
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

        if coto=6||coto=8||coto=9||coto=23||coto=44||coto=45||coto=46||coto=47 {x-=16}//正向食人花、红色食人花倒、石盾、蓝色食人花、灰色食人花
        if coto=7{x-=16;y+=1}//绿色食人花倒
    }
 }
 }
 if string_char_at(aa,0)='1'{
  ae=instance_create(transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_edsceneriesblock)
  ae.coto=real(string_copy(aa,2,2))
  if global.objectoffset=0{//scenary位置补正相关
    if real(string_copy(aa,2,2))=19{ae.x+=1}//炮台底座位置补正
    if real(string_copy(aa,2,2))=20{ae.x+=1}
    if real(string_copy(aa,2,2))=21{ae.x+=1}
  }
  //imitater
  if real(string_copy(aa,2,2))=42{
    ae.block_index=real(string_copy(aa,12,3))
  }
 }
 if string_char_at(aa,0)='2'{
  ae=instance_create(transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_edmarkerblock)
  ae.coto=real(string_copy(aa,2,2))
  if global.objectoffset=0{//marks位置补正相关
    if real(string_copy(aa,2,2))=17{ae.x+=32}//终点杆位置补正
    if real(string_copy(aa,2,2))=19{ae.x-=16;ae.y-=32}//起点位置补正
  }
  //恶劣强滚
  if real(string_copy(aa,2,2))=23{
    ds_list_add(global.autoscrolls,ae)
    ae.scrollspeed=real(transA(string_copy(aa,12,3)))/100
  }
   //新桥
  if real(string_copy(aa,2,2))=25{
    ae.type=real(string_copy(aa,12,3))
    ae.anime=real(string_copy(aa,15,3))
    global.platformanime=ae.anime
  }
  //叹号
  if real(string_copy(aa,2,2))=26{
    ae.textMessage=string_copy(aa,12,string_length(aa)-11)
  }
  //解密砖
  if real(string_copy(aa,2,2))>=27 && real(string_copy(aa,2,2))<=29{
    ae.color=real(string_copy(aa,12,1))
  }
  //半实心
  if real(string_copy(aa,2,2))=31{
    ae.ledge_type=real(string_copy(aa,12,1))
  }
  //水位砖
  if real(string_copy(aa,2,2))=32{
    ae.target=transA(string_copy(aa,12,4))
    ae.velocity=real(string_copy(aa,16,1))
    ae.type=real(string_copy(aa,17,1))
    ae.water_endX=transA(string_copy(aa,18,4))
    ae.water_endY=transA(string_copy(aa,22,4))
  }
  //音乐切换
  if real(string_copy(aa,2,2))=33{
    ae.bgm_change = real(string_copy(aa,12,1))
    ae.bgm = string(real(string_copy(aa,13,3)))
    ae.bgp_change = real(string_copy(aa,16,1))
    ae.bgp = real(string_copy(aa,17,2))
    ae.height = transA(string_copy(aa,20,4))
    ae.weather_change = real(string_copy(aa,24,1))
    ae.rainy = real(string_copy(aa,25,1))
    ae.fallingstars = real(string_copy(aa,26,1))
    ae.snowy = real(string_copy(aa,27,1))
    ae.thunder = real(string_copy(aa,28,1))
    ae.windy = real(string_copy(aa,29,1))
    ae.darkness = real(string_copy(aa,30,1))
    ae.brightness = real(string_copy(aa,31,1))
  }
  //镜头控制
  if real(string_copy(aa,2,2))=34{
    ae.camera_endX=transA(string_copy(aa,12,4));
    ae.camera_endY=transA(string_copy(aa,16,4));
  }
 }
 if string_char_at(aa,0)='3'{
  ae=instance_create(transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_edbonusesblock)
  ae.coto=real(string_copy(aa,2,2))
 }
 if string_char_at(aa,0)='4'{
 if real(string_copy(aa,18,1))!=1{
  ae=instance_create(transA(string_copy(aa,2,4)),transA(string_copy(aa,6,4)),o_edpassage)}
  else{ae=instance_create(transA(string_copy(aa,2,4)),transA(string_copy(aa,6,4))-32,o_edpassage)}
   ae.exitx=transA(string_copy(aa,10,4))
   ae.exity=transA(string_copy(aa,14,4))
   ae.wejscie=real(string_copy(aa,18,1))*90
   ae.wyjscie=real(string_copy(aa,19,1))*90
   ae.warpnum=global.warpnum
   global.warpnum+=1
   ae.tak=1
   ae.tak2=1
   ae.tak3=1
 }
haveversion=0
if string_copy(aa,0,7)='version'{
haveversion=1
gameversion=real(string_copy(aa,string_pos("=",aa)+1,4))
if gameversion > global.version {
show_message('This level is made with an newer version of Super Mario Worker Project.
Some of the features of the level may be lost.')}
if gameversion < 1500 && global.layerord=-1 {global.layerord=0}
if gameversion >= 1500 && gameversion < 1600 && global.layerord=-1 {global.layerord=1}
if gameversion >= 1600 && global.layerord=-1 {global.layerord=2}
if gameversion < 1700 {global.MFbeet=0;global.fast_retry=0;}
}
if string_copy(aa,0,13)='modifiedmov=1'{global.modifiedmov=1}
if string_copy(aa,0,13)='rotodisclay=1'{global.rotodisclay=1}
if string_copy(aa,0,10)='layerord=0'{global.layerord=0}
if string_copy(aa,0,10)='layerord=1'{global.layerord=1}
if string_copy(aa,0,10)='layerord=2'{global.layerord=2}
if string_copy(aa,0,6)='lava=1'{global.lava=1}
if string_copy(aa,0,6)='auto=1'{global.auto=1}
if string_copy(aa,0,2)='T1'{global.firstbound=real(string_copy(aa,4,string_length(aa)-3))}
if string_copy(aa,0,2)='T2'{global.secondbound=real(string_copy(aa,4,string_length(aa)-3))}
if string_copy(aa,0,8)='velocity'{global.water_velocity=real(string_copy(aa,10,string_length(aa)-9))}
if string_copy(aa,0,5)='delay'{global.water_delay=real(string_copy(aa,7,string_length(aa)-6))}
if string_copy(aa,0,11)='advswitch=1'{global.advswitch=1}
if string_copy(aa,0,11)='fastretry=1'{global.fast_retry=1}
if string_copy(aa,0,8)='MFbeet=0'{global.MFbeet=0}
if string_copy(aa,0,9)='celeste=0'{global.celeste=0}
if string_copy(aa,0,9)='pipeout=1'{global.pipeout=1}
if string_copy(aa,0,10)='fastpass=1'{global.fastpass=1}
if string_copy(aa,0,10)='fastpass=0'{global.fastpass=0}
if string_copy(aa,0,12)='huddisplay=1'{global.huddisplay=1}
if string_copy(aa,0,12)='huddisplay=0'{global.huddisplay=0}
//Weather
if string_copy(aa,0,5)='rainy'{global.rainy=real(string_copy(aa,7,1))}
if string_copy(aa,0,12)='fallingstars'{global.fallingstars=real(string_copy(aa,14,1))}
if string_copy(aa,0,5)='snowy'{global.snowy=real(string_copy(aa,7,1))}
if string_copy(aa,0,7)='thunder'{global.thunder=real(string_copy(aa,9,1))}
if string_copy(aa,0,5)='windy'{global.windy=real(string_copy(aa,7,1))}
if string_copy(aa,0,8)='darkness'{global.darkness=real(string_copy(aa,10,1))}
if string_copy(aa,0,10)='brightness'{global.brightness=real(string_copy(aa,12,1))}

/*
if string_copy(aa,0,11)='lightobject'{
  if (string_length(aa) < 80) {global.lightobject=string_copy(aa,13,67) + "0"}
  else {global.lightobject=string_copy(aa,13,68)}
}
*/
if string_copy(aa,0,11)='lightobject'{global.lightobject=string_copy(aa,13,69)};
while (string_length(global.lightobject)<69) {global.lightobject=global.lightobject+'0'}

if string_copy(aa,0,11)='stunblock=1'{global.stunblock=1}
if string_copy(aa,0,11)='stunblock=0'{global.stunblock=0}
}

if haveversion=0{
global.MFbeet=0;global.fast_retry=0;
if filename_ext(global.autosavename)='.mfl' {
show_message('This level is made with an older version of Super Mario Worker Project/Mario Worker.
Your level will be transformed and it should be saved as .smwl file.')
//global.checkpassage=1
}
if filename_ext(global.autosavename)='.smwl' {
verquestion=show_question('This level is made with an older version of Super Mario Worker Project.
If you made with the version of 1.0.1-1.1.0 ?')
if verquestion=1{global.checkpassage=1}
}
}

if global.layerord=-1 {global.layerord=0}
global.aaaaa=ds_list_write(rotox)
global.bbbbb=ds_list_write(rotoy)
global.aaaaaa=ds_list_write(rotox2)
global.bbbbbb=ds_list_write(rotoy2)
file_text_close(script_file)
file_delete(filename_change_ext(global.script_kiler,'.smwlx'))
ds_list_destroy(rotox)
ds_list_destroy(rotoy)
ds_list_destroy(rotox2)
ds_list_destroy(rotoy2)
