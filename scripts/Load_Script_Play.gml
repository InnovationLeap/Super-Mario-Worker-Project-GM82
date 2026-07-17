if file_exists(filename_change_ext(global.toload,'.smwlx')){file_delete(filename_change_ext(global.toload,'.smwlx'))}
GZ_DeCompressFile(global.toload,filename_change_ext(global.toload,'.smwlx'))
global.toload=filename_change_ext(global.toload,'.smwlx')
global.toloader=global.toload

ec_convert_file(global.toloader)

global.toload=file_text_open_read(global.toloader)

global.checkpoint=0//CP重置
var v_ens, skript;
var checka;
checka=1
skript=''
if global.msgMap>0{ds_map_destroy(global.msgMap)}
global.msgMap=ds_map_create()
v_ens[01]=o_goomba;
v_ens[02]=o_troopa;
v_ens[03]=o_troopared;
v_ens[04]=o_troopafly;
v_ens[05]=o_kolcozwierz;
v_ens[06]=o_pirania;
v_ens[07]=o_piraniashot;
v_ens[08]=o_piraniainv;
v_ens[09]=o_piraniainvshot;
v_ens[10]=o_lakitu;
v_ens[11]=o_cannon;
v_ens[12]=o_rybeka;
v_ens[13]=o_rybekb;
v_ens[14]=o_rybekc;
v_ens[15]=o_rynekd;
v_ens[16]=o_bonusdead;
v_ens[17]=o_miejscowapirania;
v_ens[18]=o_lava;
v_ens[19]=o_hammerbros;
v_ens[20]=o_wiatrak;
v_ens[21]=o_lavaball;
v_ens[22]=o_kolec;
v_ens[23]=o_zgniatacz;
v_ens[24]=o_kuppa;
v_ens[25]=o_fahlee;
v_ens[26]=o_cannong;
v_ens[27]=o_firesister;
v_ens[28]=o_lavadier;
v_ens[29]=o_nonnac;
v_ens[30]=o_gnonnac;
v_ens[31]=o_boo;
v_ens[32]=o_buzzybeetle;
v_ens[33]=o_troopaflyred;
v_ens[34]=o_troopablue;
v_ens[35]=o_troopabluefly;
v_ens[36]=o_elecoral;
v_ens[37]=o_mfc;
v_ens[38]=o_troopagold;
v_ens[39]=o_goldcenter;
v_ens[40]=o_swimfisharea;
v_ens[41]=o_flyfisharea;
v_ens[42]=o_rotostill;
v_ens[43]=o_troopashell2;
v_ens[44]=o_piraniablue;
v_ens[45]=o_piraniablueshot;
v_ens[46]=o_piraniagrey;
v_ens[47]=o_piraniagreyshot;
v_ens[48]=o_fakitu;

lolof=0;

room_set_width(Play_Room,real(file_text_read_string(global.toload)))
file_text_readln(global.toload)
room_set_height(Play_Room,real(file_text_read_string(global.toload)))
file_text_readln(global.toload)
global.etapnazw=file_text_read_string(global.toload)
file_text_readln(global.toload)
global.etapautor=file_text_read_string(global.toload)
file_text_readln(global.toload)
global.etapczas=real(file_text_read_string(global.toload))
file_text_readln(global.toload)
global.etapgravity=real(file_text_read_string(global.toload))
file_text_readln(global.toload)
global.etapkuppa=real(file_text_read_string(global.toload))
global.etapkuppafixed=global.etapkuppa
file_text_readln(global.toload)
global.poziomwody=real(file_text_read_string(global.toload))
global.water_height_record=global.poziomwody
file_text_readln(global.toload)
global.background=real((file_text_read_string(global.toload)))
global.background_record = global.background
file_text_readln(global.toload)
global.muzyka=file_text_read_string(global.toload)
global.music_record = global.muzyka
file_text_readln(global.toload)
var aa,ab,ac,ad,af,ag,ah,ai,aj,zxy;
zxy=room_instance_add(Play_Room,0,0,pokazywator)
ah=0
draw_set_alpha(1)
draw_set_color(c_white)
draw_set_blend_mode(bm_normal)
if file_text_read_string(global.toload)='BlocksDataStart'{
 file_text_readln(global.toload)
 aa=file_text_read_string(global.toload)
 ad=0
 while aa!='BlocksEnd'{
  ab=string_length(aa)/2
  for (ac=0;ac<ab;ac+=1){
  aj=real(string_pos(string_copy(aa,ac*2+1,1),"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")-1)*10+real(string_copy(aa,ac*2+2,1))
  global.zxy[ac,ad]=aj
   //o_edmain.arrayetapu[ac,ad]=real(string_copy(aa,ac*2+1,2))
  }
  ad+=1
  file_text_readln(global.toload)
  aa=file_text_read_string(global.toload)

 }
}
global.modifiedmov=0
global.rotodisclay=0
global.gameversion=0
global.layerord=-1
ds_list_destroy(global.autoscrolls)
global.autoscrolls=ds_list_create()//强滚列表

s_depth = 999999; //景物深度管理

while !file_text_eof(global.toload){
 file_text_readln(global.toload)
 aa=file_text_read_string(global.toload)
 if string_char_at(aa,1)='0'{
  ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),v_ens[real(string_copy(aa,2,2))])
  if (real(string_copy(aa,2,2))=40||real(string_copy(aa,2,2))=41)&&transA(string_copy(aa,4,4))<transA(string_copy(aa,12,4)){
  skript=string_insert('('+string(ae)+').image_xscale=('+string(transA(string_copy(aa,12,4)))+'-'+string(transA(string_copy(aa,4,4)))+'+32)/32;('+string(ae)+').image_yscale=('+string(transA(string_copy(aa,16,4)))+'+32-'+string(transA(string_copy(aa,8,4)))+')/32;('+string(ae)+').type='+string(string_copy(aa,20,1))+';('+string(ae)+').fishdir=-1;',skript,string_length(skript)+1)
  }
  if (real(string_copy(aa,2,2))=40||real(string_copy(aa,2,2))=41)&&transA(string_copy(aa,4,4))>=transA(string_copy(aa,12,4)){
  skript=string_insert('('+string(ae)+').x='+string(string_copy(aa,12,4))+';('+string(ae)+').image_xscale=('+string(transA(string_copy(aa,4,4)))+'+32-'+string(transA(string_copy(aa,12,4)))+')/32;('+string(ae)+').image_yscale=('+string(transA(string_copy(aa,16,4)))+'+32-'+string(transA(string_copy(aa,8,4)))+')/32;('+string(ae)+').type='+string(string_copy(aa,20,1))+';('+string(ae)+').fishdir=1;',skript,string_length(skript)+1)
  }
  if real(string_copy(aa,2,2))=39{
  skript=string_insert('('+string(ae)+').rotor='+string(transA(string_copy(aa,12,3)))+';('+string(ae)+').rotoa='+string(string_copy(aa,15,3))+';('+string(ae)+').rotoc='+string(string_copy(aa,18,3))+';('+string(ae)+').rotod='+string(string_copy(aa,21,1))+';',skript,string_length(skript)+1)
  }
  if real(string_copy(aa,2,2))=20{
  skript=string_insert('('+string(ae)+').promien='+string(transA(string_copy(aa,12,3)))+';('+string(ae)+').kat='+string(string_copy(aa,15,3))+';('+string(ae)+').szybkosc='+string(string_copy(aa,18,3))+';('+string(ae)+').test2=2;',skript,string_length(skript)+1)
   if string_length(aa)>=27{
    skript=string_insert('('+string(ae)+').is_petal='+string(string_copy(aa,21,1))+';('+string(ae)+').max_promien='+string(transA(string_copy(aa,22,3)))+';('+string(ae)+').promien_szybkosc='+string(string_copy(aa,25,3))+';('+string(ae)+').petal_current='+string(transA(string_copy(aa,12,3)))+';',skript,string_length(skript)+1)
    }
    }
  if real(string_copy(aa,2,2))=35 && string_length(aa) > 11 {
  skript=string_insert('('+string(ae)+').height='+string_copy(aa,12,3)+';',skript,string_length(skript)+1)
  }
  if real(string_copy(aa,2,2))=43 && string_length(aa) > 11 {
      if(real(string_copy(aa,12,1))<8){skript=string_insert('('+string(ae)+').czerwona='+string(floor(real(string_copy(aa,12,1))/2))+';'+'('+string(ae)+').offset=1;',skript,string_length(skript)+1)}
      else{skript=string_insert('('+string(ae)+').hardshell=1;'+'('+string(ae)+').offset=1;',skript,string_length(skript)+1)}
      if(floor(real(string_copy(aa,12,1))/2)<>real(string_copy(aa,12,1))/2){
          skript=string_insert('('+string(ae)+').rodzajzabicia=1;'+'('+string(ae)+').single=1;',skript,string_length(skript)+1)
      }
  }
  if real(string_copy(aa,2,2))=17 && string_length(aa) > 11 {
      skript=string_insert('('+string(ae)+').spike_type='+ string_copy(aa,12,1) +';',
      skript,string_length(skript)+1)
  }
  if real(string_copy(aa,2,2))=22 && string_length(aa) > 11 {
      skript=string_insert('('+string(ae)+').spike_type='+ string_copy(aa,12,1) +';',
      skript,string_length(skript)+1)
  }
  if real(string_copy(aa,2,2))=37 && string_length(aa) > 11 {
      skript=string_insert('('+string(ae)+').spike_type='+ string_copy(aa,12,1) +';',
      skript,string_length(skript)+1)
  }
}

 if string_char_at(aa,1)='1'{
     s_coto = real(string_copy(aa,2,2));
     if s_coto<>42{
         ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_scenery)
         skript=string_insert('('+string(ae)+').image_single='+string(s_coto)+'-1;'+'('+string(ae)+').depth='+string(s_depth)+';',skript,string_length(skript)+1)
         //skript=string_insert('',skript,string_length(skript)+1)
     }
     else{
         skript = string_insert('tile_add(b_blocks,'+string(32*(real(string_copy(aa,12,3)) mod 20))+','+string(string(32*(real(string_copy(aa,12,3)) div 20)))+',32,32,'+string(transA(string_copy(aa,4,4)))+','+string(transA(string_copy(aa,8,4)))+','+string(s_depth)+');',skript,string_length(skript)+1);
         //skript=string_insert('('+string(ae)+').block_index='+string(string_copy(aa,12,3))+';('+string(ae)+').x-=16;('+string(ae)+').y-=32;',skript,string_length(skript)+1)
     }
     s_depth-=1; //根据景物摆放顺序手动管理图层关系
  }
if string_char_at(aa,1)='2'{
  ai=real(string_copy(aa,2,2))
  if ai=17{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4))+32,transA(string_copy(aa,8,4))+32,o_exitar)}
  if ai=18{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),obj_wall)}
  if ai=19 && ah=0{ah=1;ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_marker)}
  if ai=20 {ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_checkpoint);skript=string_insert('('+string(ae)+').checknumber='+string(checka)+';',skript,string_length(skript)+1);global.check[checka,0]=0;global.check[checka,1]=0;checka+=1}
  if ai<17{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_windas);skript=string_insert('('+string(ae)+').type='+string(ai)+';',skript,string_length(skript)+1)}
  if ai=21{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_windas);skript=string_insert('('+string(ae)+').type='+string(17)+';',skript,string_length(skript)+1)}
  if ai=22{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),obj_waall)}
  if ai=23{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_scroll);skript=string_insert('('+string(ae)+').scrollspeed='+string(transA(string_copy(aa,12,3)))+'/100;',skript,string_length(skript)+1);
  ds_list_add(global.autoscrolls,ae)}//恶劣强滚
  if ai=24{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_onlyU)}
  if ai=25{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_windas);skript=string_insert('('+string(ae)+').type='+string_copy(aa,12,3)+'+6*'+string_copy(aa,15,3)+';',skript,string_length(skript)+1)}
  if ai=26{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_messageblock);_msg=string_copy(aa,12,9999);_msg=string_replace_all(_msg,"\#",chr(2));_msg=string_replace_all(_msg,"#",chr(13));_msg=string_replace_all(_msg,chr(2),"#");ds_map_add(global.msgMap,ae,_msg);skript=string_insert('('+string(ae)+').textMessage=ds_map_find_value(global.msgMap,'+string(ae)+')',skript,string_length(skript)+1)}
  if ai=27{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_switch);skript=string_insert('('+string(ae)+').color='+string_copy(aa,12,1)+';',skript,string_length(skript)+1)}
  if ai=28{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_yinyang);skript=string_insert('('+string(ae)+').color='+string_copy(aa,12,1)+';'+'('+string(ae)+').yin=1;',skript,string_length(skript)+1)}
  if ai=29{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_yinyang);skript=string_insert('('+string(ae)+').color='+string_copy(aa,12,1)+';'+'('+string(ae)+').yin=0;',skript,string_length(skript)+1)}
  if ai=30{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_ice)}
  if ai=31{switch(string_copy(aa,12,1)){
  case '0': ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),obj_halfwall);break;
  case '1': ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),obj_halfground);break;
  case '2': ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),obj_static);break;
  }
  }
  if ai=32{switch(string_copy(aa,17,1)){
  case '0': ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_waterchanger);skript=string_insert('('+string(ae)+').target='+string(transA(string_copy(aa,12,4)))+';('+string(ae)+').velocity='+string_copy(aa,16,1)+';('+string(ae)+').reuse=1;',skript,string_length(skript)+1)break;
  case '1': ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_waterchanger);skript=string_insert('('+string(ae)+').target='+string(transA(string_copy(aa,12,4)))+';('+string(ae)+').velocity='+string_copy(aa,16,1)+';('+string(ae)+').reuse=0;',skript,string_length(skript)+1)break;
  case '2': ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_waterregion);skript=string_insert('('+string(ae)+').target='+string(transA(string_copy(aa,12,4)))+';('+string(ae)+').velocity='+string_copy(aa,16,1)+';('+string(ae)+').endx='+string(transA(string_copy(aa,18,4)))+';('+string(ae)+').endy='+string(transA(string_copy(aa,22,4)))+';',skript,string_length(skript)+1)break;
  }
  }
  // ↓原来的
  //if ai=33{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_bgmchange);skript=string_insert('('+string(ae)+').bgm_change='+string_copy(aa,12,1)+';'+'('+string(ae)+').bgm='+'string(real('+chr(34)+string_copy(aa,13,3)+chr(34)+'));'+'('+string(ae)+').bgp_change='+string_copy(aa,16,1)+';'+'('+string(ae)+').bgp='+'real('+chr(34)+string_copy(aa,17,2)+chr(34)+');('+string(ae)+').linked='+string_copy(aa,19,1)+';('+string(ae)+').height='+string(transA(string_copy(aa,20,4))),skript,string_length(skript)+1)}
  // ↓现在的
  if ai=33{
    ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_bgmchange);

    //以下为兼容性写法，空字符变为'0'，防止支持天气代码的SMWP版本加载旧场景控件时报错
    _weather_change = string_copy(aa,24,1); if _weather_change = '' { _weather_change = '0'; }
    _rainy = string_copy(aa,25,1); if _rainy = '' { _rainy = '0'; }
    _fallingstars = string_copy(aa,26,1); if _fallingstars = '' { _fallingstars = '0'; }
    _snowy = string_copy(aa,27,1); if _snowy = '' { _snowy = '0'; }
    _thunder = string_copy(aa,28,1); if _thunder = '' { _thunder = '0'; }
    _windy = string_copy(aa,29,1); if _windy = '' { _windy = '0'; }
    _darkness = string_copy(aa,30,1); if _darkness = '' { _darkness = '0'; }
    _brightness = string_copy(aa,31,1); if _brightness = '' { _brightness = '0'; }

    skript=string_insert(
        '('+string(ae)+').bgm_change='+string_copy(aa,12,1)+';'+
        '('+string(ae)+').bgm=string(real('+chr(34)+string_copy(aa,13,3)+chr(34)+'));'+
        '('+string(ae)+').bgp_change='+string_copy(aa,16,1)+';'+
        '('+string(ae)+').bgp=real('+chr(34)+string_copy(aa,17,2)+chr(34)+');'+
        '('+string(ae)+').linked='+string_copy(aa,19,1)+';'+
        '('+string(ae)+').height='+string(transA(string_copy(aa,20,4)))+';'+

        '('+string(ae)+').weather_change='+_weather_change+';'+
        '('+string(ae)+').rainy='+_rainy+';'+
        '('+string(ae)+').fallingstars='+_fallingstars+';'+
        '('+string(ae)+').snowy='+_snowy+';'+
        '('+string(ae)+').thunder='+_thunder+';'+
        '('+string(ae)+').windy='+_windy+';'+
        '('+string(ae)+').darkness='+_darkness+';'+
        '('+string(ae)+').brightness='+_brightness+';',

        skript,
        string_length(skript)+1
    );
}
  if ai=34{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_region);skript=string_insert('('+string(ae)+').endx='+string(transA(string_copy(aa,12,4)))+';'+'('+string(ae)+').endy='+string(transA(string_copy(aa,16,4)))+';',skript,string_length(skript)+1)}
}
 if string_char_at(aa,1)='3'{
  ai=real(string_copy(aa,2,2))
  if ai>0 && ai<7{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_pointblock);skript=string_insert('('+string(ae)+').bonus='+string(ai)+';',skript,string_length(skript)+1)}
  if ai>6 && ai<13{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_pointblock2);skript=string_insert('('+string(ae)+').bonus='+string(ai-6)+';',skript,string_length(skript)+1)}
    if ai>18 && ai<25{ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_pointblock);skript=string_insert('('+string(ae)+').bonus='+string(ai+82)+';',skript,string_length(skript)+1)}
  switch(ai){
   case(13):ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_pointblock);skript=string_insert('('+string(ae)+').bonus=0;',skript,string_length(skript)+1);break;
   case(14):ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_pointblock2);skript=string_insert('('+string(ae)+').bonus=0;',skript,string_length(skript)+1);break;
   case(15):ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_pointblockpodbijacz);skript=string_insert('('+string(ae)+').block=1;('+string(ae)+').podbicia=16;('+string(ae)+').podbity=1',skript,string_length(skript)+1);break;
   case(16):ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_pointblockpodbijacz);break;
   case(17):ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_pointblock2);skript=string_insert('('+string(ae)+').bonus=7;',skript,string_length(skript)+1);break;
   case(18):ae=room_instance_add(Play_Room,transA(string_copy(aa,4,4)),transA(string_copy(aa,8,4)),o_point);break;
  }
  skript=string_insert('('+string(ae)+').coto='+string(string_copy(aa,2,2))+';',skript,string_length(skript)+1)ae.coto=real(string_copy(aa,2,2))
 }
 if string_char_at(aa,1)='4'{
 if real(string_copy(aa,18,1))!=1{
  ae=room_instance_add(Play_Room,transA(string_copy(aa,2,4)),transA(string_copy(aa,6,4)),o_exiter)}else
  {ae=room_instance_add(Play_Room,transA(string_copy(aa,2,4)),transA(string_copy(aa,6,4))-32,o_exiter)}
  skript=string_insert('('+string(ae)+').exitx='+string(transA(string_copy(aa,10,4)))+';('+string(ae)+').exity='+string(transA(string_copy(aa,14,4)))+';('+string(ae)+').wejscie='+string(string_copy(aa,18,1))+';('+string(ae)+').wyjscie='+string(string_copy(aa,19,1))+';',skript,string_length(skript)+1)
  //ae.coto=real(string_copy(aa,2,2))
 }

//敌人优化默认关，版本检测到大于等于1710则开
global.newsmooth = 0
if string_copy(aa,0,7)='version'{
haveversion=1
global.gameversion=real(string_copy(aa,string_pos("=",aa)+1,4))
if global.gameversion > global.version {
show_message('This level is made with an newer version of Super Mario Worker Project.
Some of the features of the level may be lost.')}
if global.gameversion < 1500 && global.layerord=-1 {global.layerord=0}
if global.gameversion >= 1500 && global.gameversion < 1600 && global.layerord=-1 {global.layerord=1}
if global.gameversion >= 1600 && global.layerord=-1 {global.layerord=2}
if global.gameversion < 1700 {global.MFbeet=0;global.fast_retry=0;}
if global.gameversion >=1710 {global.newsmooth = 1}
}

if string_copy(aa,0,13)='modifiedmov=1'{global.modifiedmov=1}
if string_copy(aa,0,13)='rotodisclay=1'{global.rotodisclay=1}
if string_copy(aa,0,10)='layerord=0'{global.layerord=0}
if string_copy(aa,0,10)='layerord=1'{global.layerord=1}
if string_copy(aa,0,10)='layerord=2'{global.layerord=2}
if string_copy(aa,0,6)='lava=1'{global.lava=1;global.lava_record=1}
if string_copy(aa,0,6)='lava=0'{global.lava=0;global.lava_record=0}
if string_copy(aa,0,6)='auto=1'{global.auto=1;global.auto_record=1;}
if string_copy(aa,0,6)='auto=0'{global.auto=0;global.auto_record=0;}
if string_copy(aa,0,2)='T1'{global.firstbound=real(string_copy(aa,4,string_length(aa)-3))}
if string_copy(aa,0,2)='T2'{global.secondbound=real(string_copy(aa,4,string_length(aa)-3))}
if string_copy(aa,0,8)='velocity'{global.water_velocity=real(string_copy(aa,10,string_length(aa)-9))}
if string_copy(aa,0,5)='delay'{global.water_delay=real(string_copy(aa,7,string_length(aa)-6))}
if string_copy(aa,0,11)='advswitch=1'{global.advswitch=1}
if string_copy(aa,0,11)='advswitch=0'{global.advswitch=0}
if string_copy(aa,0,11)='fastretry=1'{global.fast_retry=1}
if string_copy(aa,0,11)='fastretry=0'{global.fast_retry=0}
if string_copy(aa,0,8)='MFbeet=1'{global.MFbeet=1}
if string_copy(aa,0,8)='MFbeet=0'{global.MFbeet=0}
if string_copy(aa,0,9)='celeste=1'{global.celeste=1}
if string_copy(aa,0,9)='celeste=0'{global.celeste=0}
if string_copy(aa,0,9)='pipeout=1'{global.pipeout=1}
if string_copy(aa,0,9)='pipeout=0'{global.pipeout=0}
if string_copy(aa,0,10)='fastpass=1'{global.fastpass=1}
if string_copy(aa,0,10)='fastpass=0'{global.fastpass=0}
if string_copy(aa,0,12)='huddisplay=1'{global.huddisplay=1}
if string_copy(aa,0,12)='huddisplay=0'{global.huddisplay=0}
//Weather
if string_copy(aa,0,5)='rainy'{global.rainy=real(string_copy(aa,7,1)); global.rainy_record=global.rainy}
if string_copy(aa,0,12)='fallingstars'{global.fallingstars=real(string_copy(aa,14,1)); global.fallingstars_record=global.fallingstars}
if string_copy(aa,0,5)='snowy'{global.snowy=real(string_copy(aa,7,1)); global.snowy_record=global.snowy}
if string_copy(aa,0,7)='thunder'{global.thunder=real(string_copy(aa,9,1)); global.thunder_record=global.thunder}
if string_copy(aa,0,5)='windy'{global.windy=real(string_copy(aa,7,1)); global.windy_record=global.windy}
if string_copy(aa,0,8)='darkness'{global.darkness=real(string_copy(aa,10,1)); global.darkness_record=global.darkness}
if string_copy(aa,0,10)='brightness'{global.brightness=real(string_copy(aa,12,1)); global.brightness_record=global.brightness}
if string_copy(aa,0,11)='lightobject'{global.lightobject=string_copy(aa,13,69)}

if string_copy(aa,0,11)='stunblock=1'{global.stunblock=1}
if string_copy(aa,0,11)='stunblock=0'{global.stunblock=0}
}

if global.layerord=-1 {global.layerord=0;global.MFbeet=0;global.fast_retry=0;}

if ah=0{show_message("Hey guy, please add a mario first :v");room_instance_add(Play_Room,real("0"),real("0"),o_marker)}

file_text_close(global.toload)
room_set_code(Play_Room,skript)
skript=''
file_delete(global.toloader)
//this is load2
