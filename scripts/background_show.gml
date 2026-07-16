now_background = global.background
if(inedit){now_background = global.local_background}

switch (now_background) {

      case 1 :   //普通天空
       background_visible[0]=1
        background_visible[1]=0
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background5
        background_htiled[0]=1
        background_vtiled[0]=0
        background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
        background_y[0]=0
        background_x[0]=0
     background_alpha[0]=1

  break;

      case 2 :   //白天+地下
    background_visible[0]=1
background_visible[1]=1
    background_visible[2]=1
        background_visible[3]=0

    background_index[0]=background11
        background_htiled[0]=1
        background_vtiled[0]=1
    background_xscale[0]=1
        background_yscale[0]=1
        background_blend[0]=c_white
        background_y[0]=480
background_x[0]=0
     background_alpha[0]=1

background_index[1]=background12
        background_htiled[1]=1
        background_vtiled[1]=0
        background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=480
background_x[1]=0
background_alpha[1]=1

        background_index[2]=background5
        background_htiled[2]=1
        background_vtiled[2]=0
        background_xscale[2]=1
        background_yscale[2]=1
        background_blend[2]=c_white
        background_y[2]=0
background_x[2]=0
background_alpha[2]=1

  break;

      case 3 :   //白天+草地
        background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background5
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
background_alpha[0]=1

        background_index[1]=background13
        background_htiled[1]=1
        background_vtiled[1]=0
background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=room_height-140
background_x[1]=0
background_alpha[1]=1

  break;

  case 4 :    //白天+草地（满速滚屏）
    background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=1
        background_visible[3]=1

        background_index[0]=background5
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
background_alpha[0]=1

        background_index[1]=background13
        background_htiled[1]=1
        background_vtiled[1]=0
background_xscale[1]=1
        background_yscale[1]=1
background_blend[1]=c_white
        background_y[1]=room_height-140
        background_x[1]=view_xview[0]-global.paralax3
background_alpha[1]=1

        background_index[2]=background14
        background_htiled[2]=1
        background_vtiled[2]=0
background_xscale[2]=1
        background_yscale[2]=1
background_blend[2]=c_white
        background_y[2]=view_yview[0]+50
        background_x[2]=view_xview[0]-global.paralax3*2+chmurkir
        background_alpha[2]=woder

        background_index[3]=background14
        background_htiled[3]=1
        background_vtiled[3]=0
background_xscale[3]=1
        background_yscale[3]=1
background_blend[3]=c_white
        background_y[3]=view_yview[0]
        background_x[3]=view_xview[0]-global.paralax3*3+chmurkir*2
        background_alpha[3]=woder

        chmurkir+=0.2
        if view_yview[0]+100>global.poziomwody && woder>0 {woder-=0.05}
        if view_yview[0]+100<global.poziomwody && woder<1 {woder+=0.05}

  break;

  case 5 :    //地下

    background_visible[0]=1
        background_visible[1]=0
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background11
        background_htiled[0]=1
        background_vtiled[0]=1
background_xscale[0]=1
        background_yscale[0]=1
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
background_alpha[0]=1

  break;

  case 6 :    //岩石山

        background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background5
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1


        background_index[1]=background15
        background_htiled[1]=1
        background_vtiled[1]=0
background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=room_height-101
background_x[1]=0
     background_alpha[1]=1

  break;

  case 7 :    //水下
    background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background5
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

        background_index[1]=background16
        background_htiled[1]=1
        background_vtiled[1]=0
background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=room_height-163
background_x[1]=0
     background_alpha[1]=1

  break;

  case 8 :    //水下（缓慢滚屏）
    background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=1
        background_visible[3]=1

        background_index[0]=background5
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

        background_index[1]=background16
        background_htiled[1]=1
        background_vtiled[1]=0
background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=room_height-180
        background_alpha[1]=0.2
        background_x[1]=view_xview[0]-global.paralax3

        background_index[2]=background16
        background_htiled[2]=1
        background_vtiled[2]=0
background_xscale[2]=1
        background_yscale[2]=1
        background_blend[2]=c_white
        background_y[2]=room_height-160
        background_alpha[2]=0.8
        background_x[2]=view_xview[0]-global.paralax3*2

        background_index[3]=background16
        background_htiled[3]=1
        background_vtiled[3]=0
background_xscale[3]=1
        background_yscale[3]=1
        background_blend[3]=c_white
        background_y[3]=room_height-140
        background_x[3]=view_xview[0]-global.paralax3*3
        background_alpha[3]=1

  break;

  case 9 :    //城堡（缓慢滚屏）
    background_visible[0]=1
        background_visible[1]=0
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background17
        background_htiled[0]=1
        background_vtiled[0]=1
background_xscale[0]=1
        background_yscale[0]=1
        background_blend[0]=c_white
     background_y[0]=0
     background_alpha[0]=1
        background_x[0]=view_xview[0]-global.paralax3*2

  break;

  case 10 :    //第十背景 喝了
    background_visible[0]=1
        background_visible[1]=0
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background5
        background_htiled[0]=1
        background_vtiled[0]=1
background_xscale[0]=1
        background_yscale[0]=1
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

  break;

  case 11 :    //蓝天
    background_visible[0]=1
        background_visible[1]=0
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background6
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

  break;

  case 12 :    //夜晚
    background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background19
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

background_index[1]=background21
        background_htiled[1]=1
        background_vtiled[1]=0
background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=room_height-178
background_x[1]=0
     background_alpha[1]=1

  break;

  case 13 :   //夜晚+地下
    background_visible[0]=1
background_visible[1]=1
    background_visible[2]=1
        background_visible[3]=0

    background_index[0]=background11
        background_htiled[0]=1
        background_vtiled[0]=1
    background_xscale[0]=1
        background_yscale[0]=1
        background_blend[0]=c_white
        background_y[0]=480
background_x[0]=0
     background_alpha[0]=1

background_index[1]=background20
        background_htiled[1]=1
        background_vtiled[1]=0
        background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=480
background_x[1]=0
background_alpha[1]=1

        background_index[2]=background19
        background_htiled[2]=1
        background_vtiled[2]=0
        background_xscale[2]=1
        background_yscale[2]=1
        background_blend[2]=c_white
        background_y[2]=0
background_x[2]=0
background_alpha[2]=1

  break;

  case 14 :    //第十四背景 喝了
    background_visible[0]=1
        background_visible[1]=0
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background6
        background_htiled[0]=1
        background_vtiled[0]=1
background_xscale[0]=1
        background_yscale[0]=1
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

  break;

  case 15 :    //黄昏
    background_visible[0]=1
        background_visible[1]=0
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background45
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

  break;

  case 16 :    //沙漠
    background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background466
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

background_index[1]=background46
        background_htiled[1]=1
        background_vtiled[1]=0
background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=room_height-480
background_x[1]=0
     background_alpha[1]=1

  break;

  case 17 :    //黑暗天空
    background_visible[0]=1
        background_visible[1]=0
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background47
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

  break;

  case 18 :    //火山
        background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=1
        background_visible[3]=0

        background_index[0]=backgroundv2
        background_htiled[0]=1
        background_vtiled[0]=1
        background_xscale[0]=room_width
        background_yscale[0]=room_height
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

        background_index[1]=backgroundv1
        background_htiled[1]=1
        background_vtiled[1]=0
        background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=0
background_x[1]=0
     background_alpha[1]=1

        background_index[2]=backgroundv3
        background_htiled[2]=1
        background_vtiled[2]=0
        background_yscale[2]=1
        background_xscale[2]=1
        background_blend[2]=c_white
        background_y[2]=room_height-168
background_x[2]=0
     background_alpha[2]=1

  break;

  case 19 :    //绿色天空+青山树林
    background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background49shaben
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

        background_index[1]=background49
        background_htiled[1]=1
        background_vtiled[1]=0
background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=room_height-480
background_x[1]=0
     background_alpha[1]=1

  break;

  case 20 :    //雪地
    background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background_snowsky
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

        background_index[1]=background_snow
        background_htiled[1]=1
        background_vtiled[1]=0
background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=room_height-140
background_x[1]=0
     background_alpha[1]=1

  break;

  case 21 :    //金字塔

    background_visible[0]=1
        background_visible[1]=0
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background_underdesert
        background_htiled[0]=1
        background_vtiled[0]=1
background_xscale[0]=1
        background_yscale[0]=1
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
background_alpha[0]=1

  break;

  case 22 :    //城堡

    background_visible[0]=1
        background_visible[1]=0
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background17
        background_htiled[0]=1
        background_vtiled[0]=1
background_xscale[0]=1
        background_yscale[0]=1
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
background_alpha[0]=1

  break;

  case 23 :    //蓝天白云
    background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background6
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

        background_index[1]=longzongcloud
        background_htiled[1]=1
        background_vtiled[1]=0
background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=room_height-320
background_x[1]=0
     background_alpha[1]=1

  break;

  case 24 :    //船新雪地
    background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background_snowskynew
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

        background_index[1]=background_snownew
        background_htiled[1]=1
        background_vtiled[1]=0
background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=room_height-416
background_x[1]=0
     background_alpha[1]=1

  break;

  case 25 :    //又大又粗
    background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=1
        background_visible[3]=1

        background_index[0]=background_hele1
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

        background_index[1]=background_hele2
        background_htiled[1]=1
        background_vtiled[1]=0
background_xscale[1]=1
        background_yscale[1]=1*(room_height/480)
        background_blend[1]=c_white
     background_y[1]=240
background_x[1]=0
     background_alpha[1]=1

        background_index[2]=background_hele4
        background_htiled[2]=1
        background_vtiled[2]=0
background_xscale[2]=1
        background_yscale[2]=room_height
        background_blend[2]=c_white
        background_y[2]=0
background_x[2]=0
     background_alpha[2]=1

        background_index[3]=background_hele3
        background_htiled[3]=1
        background_vtiled[3]=0
background_xscale[3]=1
        background_yscale[3]=1
        background_blend[3]=c_white
        background_y[3]=room_height-130
background_x[3]=0
     background_alpha[3]=1

  break;

  case 26 :    //GP喝了
    background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=1
        background_visible[3]=0

        background_index[0]=background_gp
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

        background_index[1]=background13
        background_htiled[1]=1
        background_vtiled[1]=0
background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=room_height-140
background_x[1]=0
background_alpha[1]=1

background_index[2]=background_gp2
        background_htiled[2]=1
        background_vtiled[2]=0
background_xscale[2]=1
        background_yscale[2]=1
        background_blend[2]=c_white
        background_y[2]=0
background_x[2]=0
background_alpha[2]=1

  break;
  case 27 :    //海底遗迹
        background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background_underwater
        background_htiled[0]=1
        background_vtiled[0]=0
        background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
        background_y[0]=0
        background_x[0]=0
        background_alpha[0]=1

        background_index[1]=background_underwater2
        background_htiled[1]=1
        background_vtiled[1]=0
        background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=room_height-192
        background_x[1]=0
        background_alpha[1]=0.75
  break;

  case 28 :    //BGM是das的Rainbow Resort那关
        background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=1
        background_visible[3]=0

        background_index[0]=background_doesnotLM
        background_htiled[0]=1
        background_vtiled[0]=0
        background_xscale[0]=1
        background_yscale[0]=room_height
        background_blend[0]=c_white
        background_y[0]=0
        background_x[0]=0
        background_alpha[0]=1

        background_index[1]=background_LM
        background_htiled[1]=1
        background_vtiled[1]=0
        background_xscale[1]=1
        background_yscale[1]=1*(room_height+480)/960
        background_blend[1]=c_white
        background_y[1]=room_height-320*background_yscale[1]
        background_alpha[1]=1
        background_x[1]=0

        background_index[2]=background16
        background_htiled[2]=1
        background_vtiled[2]=0
        background_xscale[2]=1
        background_yscale[2]=1
        background_blend[2]=c_white
        background_y[2]=room_height-160
        background_alpha[2]=1
        background_x[2]=0

        background_index[3]=background16
        background_htiled[3]=1
        background_vtiled[3]=0
        background_xscale[3]=1
        background_yscale[3]=1
        background_blend[3]=c_white
        background_y[3]=room_height-160
        background_x[3]=0
        background_alpha[3]=1

  break;

  case 29 :    //One Fine Day
        background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=1
        background_visible[3]=1

        background_index[0]=background_HL
        background_htiled[0]=1
        background_vtiled[0]=0
        background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
        background_y[0]=0
        background_x[0]=0
        background_alpha[0]=1

        background_index[1]=background13
        background_htiled[1]=1
        background_vtiled[1]=0
        background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=room_height-140
        background_x[1]=0
        background_alpha[1]=1

        background_index[2]=background_HLCloud
        background_htiled[2]=1
        background_vtiled[2]=0
        background_xscale[2]=1
        background_yscale[2]=1
        background_blend[2]=c_white
        background_y[2]=18
        background_x[2]=-35
        background_alpha[2]=woder

        background_index[3]=background_HLCloud
        background_htiled[3]=1
        background_vtiled[3]=0
        background_xscale[3]=1
        background_yscale[3]=1
        background_blend[3]=c_white
        background_y[3]=0
        background_x[3]=0
        background_alpha[3]=woder

        chmurkir+=0.2
        if view_yview[0]+100>global.poziomwody && woder>0 {woder-=0.05}
        if view_yview[0]+100<global.poziomwody && woder<1 {woder+=0.05}

  break;

  case 30 :    //深秘之森

    background_visible[0]=1
        background_visible[1]=0
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background_deep_forest
        background_htiled[0]=1
        background_vtiled[0]=1
background_xscale[0]=1
        background_yscale[0]=1
        background_blend[0]=c_white
     background_y[0]= -96
background_x[0]=0
background_alpha[0]=1

  break;

  case 31 :    //休闲海滩
    background_visible[0]=1
        background_visible[1]=1
        background_visible[2]=1
        background_visible[3]=0

        background_index[0]=background5
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

        background_index[1]=background_seaside_cloud
        background_htiled[1]=1
        background_vtiled[1]=0
background_xscale[1]=1
        background_yscale[1]=1
        background_blend[1]=c_white
        background_y[1]=room_height-480+160
background_x[1]=0
     background_alpha[1]=1

        background_index[2]=background_seaside_sea
        background_htiled[2]=1
        background_vtiled[2]=0
background_xscale[2]=1
        background_yscale[2]=1
        background_blend[2]=c_white
        background_y[2]=room_height-480+256
background_x[2]=0
     background_alpha[2]=1

  break;

  case 32 :   //深蓝色-红色渐变色背景
       background_visible[0]=1
        background_visible[1]=0
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background_deepblue_red
        background_htiled[0]=1
        background_vtiled[0]=0
        background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
        background_y[0]=0
        background_x[0]=0
     background_alpha[0]=1

  break;


  default :
  background_visible[0]=1
        background_visible[1]=0
        background_visible[2]=0
        background_visible[3]=0

        background_index[0]=background5
        background_htiled[0]=1
        background_vtiled[0]=0
background_xscale[0]=1
        background_yscale[0]=1*(room_height/480)
        background_blend[0]=c_white
     background_y[0]=0
background_x[0]=0
     background_alpha[0]=1

  break;

    }

//以下为旧版代码

//backgraound start

/*if global.background=23 // big cloud
    {
    background_visible[0]=1
    background_visible[1]=1
    background_visible[2]=0
    background_visible[3]=0

    background_y[0]=0
    background_index[0]=background6
    background_yscale[0]=1*(room_height/480)
    background_blend[0]=c_white

    background_index[1]=longzongcloud
    background_htiled[1]=1
    background_vtiled[1]=0
    background_y[1]=room_height-320
    }

if global.background=22 // Zamek, no paralax
    {
    background_visible[0]=1
    background_visible[1]=0
    background_visible[2]=0
    background_index[0]=background17
    background_blend[0]=c_white
    }

if global.background=21 // pyramid
    {
    background_visible[0]=1
    background_visible[1]=0
    background_visible[2]=0
    background_visible[3]=0
    background_xscale[0]=1
    background_yscale[0]=1
    background_index[0]=background_underdesert
    background_blend[0]=c_white
    }

if global.background=20 // snow
    {
    background_visible[0]=1
    background_visible[1]=1
    background_visible[2]=1
    background_visible[3]=1

    background_index[0]=background_snowsky
    background_yscale[0]=1*(room_height/480)
    background_blend[0]=c_white

    background_index[1]=background_snow
    background_htiled[1]=1
    background_vtiled[1]=0
    background_y[1]=room_height-140

    background_index[2]=longzongcloud
    background_htiled[2]=1
    background_vtiled[2]=0
    background_y[2]=room_height-320
    }

if global.background=19 // forest
    {
    background_visible[0]=1
    background_visible[1]=1
    background_visible[2]=0
    background_visible[3]=0

    background_index[0]=background49shaben
    background_yscale[0]=1*(room_height/480)
    background_blend[0]=c_white

    background_index[1]=background49
    background_htiled[1]=1
    background_vtiled[1]=0
    background_y[1]=room_height-480
    }

if global.background=18 // valcano
    {
    background_visible[0]=1
    background_visible[1]=0
    background_visible[2]=0
    background_visible[3]=0
    background_xscale[0]=room_width
    background_yscale[0]=room_height
    background_index[0]=backgroundv2
    background_blend[0]=c_white

    background_index[1]=backgroundv1
    background_visible[1]=1
    background_htiled[1]=1
    background_vtiled[1]=0
    background_yscale[1]=1
    background_blend[1]=c_white
    background_y[1]=0

    background_index[2]=backgroundv3
    background_visible[2]=1
    background_htiled[2]=1
    background_vtiled[2]=0
    background_yscale[2]=1
    background_blend[2]=c_white
    background_y[2]=room_height-168
    }


if global.background=17 // dark
    {
    background_visible[0]=1
    background_visible[1]=0
    background_visible[2]=0
    background_visible[3]=0
    background_index[0]=background47
    background_yscale[0]=1*(room_height/480)
    background_blend[0]=c_white
    }

if global.background=16 // desert
    {
    background_visible[0]=1
    background_visible[1]=1
    background_visible[2]=0
    background_visible[3]=0

    background_index[0]=background466
    background_yscale[0]=1*(room_height/480)
    background_blend[0]=c_white

    background_index[1]=background46
    background_htiled[1]=1
    background_vtiled[1]=0
    background_y[1]=room_height-480
    }

if global.background=15 //dusk
    {
    background_visible[0]=1
    background_visible[1]=0
    background_visible[2]=0
    background_visible[3]=0
    background_index[0]=background45
    background_yscale[0]=1*(room_height/480)
    background_blend[0]=c_white
    }

if global.background=14 // Surprise~
    {
    background_visible[0]=1
    background_visible[1]=0
    background_visible[2]=0
    background_visible[3]=0
    background_index[0]=background6
    background_blend[0]=c_white
    background_yscale[0]=1
    }

if global.background=13 // underground + night
    {
    background_visible[3]=0
    background_index[2]=background19
    background_visible[2]=1
    background_htiled[2]=1
    background_vtiled[2]=0
    background_yscale[2]=1
    background_blend[2]=c_white

    background_index[1]=background20
    background_visible[1]=1
    background_htiled[1]=1
    background_vtiled[1]=0
    background_yscale[1]=1
    background_blend[1]=c_white
    background_y[1]=471

    background_index[0]=background11
    background_visible[0]=1
    background_htiled[0]=1
    background_vtiled[0]=1
    background_yscale[0]=1
background_xscale[0]=1
    background_blend[0]=c_white
    background_y[0]=471
    }

if global.background=12 // Night
    {
    background_visible[0]=1
    background_visible[1]=1
    background_visible[2]=0
    background_visible[3]=0
    background_index[0]=background19
    background_yscale[0]=1*(room_height/480)
    background_blend[0]=c_white


    background_index[1]=background21
    background_htiled[1]=1
    background_vtiled[1]=0
    background_y[1]=room_height-178
    }

if global.background=11 // tylko niebieskie tlo BLUE SKY
    {
    background_visible[0]=1
    background_visible[1]=0
    background_visible[2]=0
    background_visible[3]=0
    background_index[0]=background6
    background_yscale[0]=1*(room_height/480)
    background_blend[0]=c_white
    }

if global.background=10 // You know what it is :P
    {
    background_visible[0]=1
    background_visible[1]=0
    background_visible[2]=0
    background_visible[3]=0
    background_index[0]=background5
    background_blend[0]=c_white
    background_yscale[0]=1
    }


if global.background=9 // Zamek
    {
    background_visible[0]=1
    background_visible[1]=0
    background_visible[2]=0
    background_index[0]=background17
    background_blend[0]=c_white
    background_yscale[0]=1
    background_x[0]=view_xview[0]-global.paralax3*2
    }


if global.background=8 // underwater adv
    {
    background_visible[0]=1
    background_visible[1]=1
    background_visible[2]=1
    background_visible[3]=1


    background_index[0]=background5
    background_yscale[0]=1*(room_height/480)
    background_blend[0]=c_white

    background_index[1]=background16
    background_htiled[1]=1
    background_vtiled[1]=0
    background_y[1]=room_height-180
    background_x[1]=0
    background_alpha[1]=.2
    background_x[1]=view_xview[0]-global.paralax3

    background_index[2]=background16
    background_htiled[2]=1
    background_vtiled[2]=0
    background_y[2]=room_height-160
    background_x[2]=420
    background_alpha[2]=.8
    background_x[2]=view_xview[0]-global.paralax3*2

    background_index[3]=background16
    background_htiled[3]=1
    background_vtiled[3]=0
    background_y[3]=room_height-140
    background_x[3]=30
    background_x[3]=view_xview[0]-global.paralax3*3
    }

if global.background=7 // Underwater light
    {
    background_visible[0]=1
    background_visible[1]=1
    background_visible[2]=0
    background_visible[3]=0

    background_index[0]=background5
    background_yscale[0]=1*(room_height/480)
    background_blend[0]=c_white


    background_index[1]=background16
    background_htiled[1]=1
    background_vtiled[1]=0
    background_y[1]=room_height-163
    }



if global.background=6 // Plain sky + kamienie
    {
    background_visible[0]=1
    background_visible[1]=1
    background_visible[2]=0
    background_visible[3]=0
    background_index[0]=background5
    background_yscale[0]=1*(room_height/480)
    background_blend[0]=c_white


    background_index[1]=background15
    background_htiled[1]=1
    background_vtiled[1]=0
    background_y[1]=room_height-101
    }


if global.background=5 // tylko Underground
    {
    background_visible[0]=1
    background_visible[1]=0
    background_visible[2]=0
    background_visible[3]=0
    background_index[0]=background11
    background_blend[0]=c_white
    background_yscale[0]=1
    background_xscale[0]=1
    }


if global.background=4 // sceneria dwuchmurkowa + grassland + niebieskie tlo
    {
    background_visible[0]=1
    background_visible[1]=1
    background_visible[2]=1
    background_visible[3]=1

    background_y[0]=0
    background_index[0]=background5
    background_yscale[0]=1*(room_height/480)
    background_blend[0]=c_white

    background_index[1]=background13
    background_htiled[1]=1
    background_vtiled[1]=0
    background_y[1]=room_height-140
    background_x[1]=view_xview[0]-global.paralax3

    background_index[2]=background14
    background_htiled[2]=1
    background_vtiled[2]=0
    background_y[2]=view_yview[0]+50
    background_x[2]=view_xview[0]-global.paralax3*2+chmurkir
    background_alpha[2]=woder

    background_index[3]=background14
    background_htiled[3]=1
    background_vtiled[3]=0
    background_y[3]=view_yview[0]
    background_x[3]=view_xview[0]-global.paralax3*3+chmurkir*2
    background_alpha[3]=woder

    chmurkir+=0.2
    if view_yview[0]+100>global.poziomwody && woder>0 {woder-=0.05}
    if view_yview[0]+100<global.poziomwody && woder<1 {woder+=0.05}
    }


if global.background=3 // sceneria jednochmurkowa + grassland + niebieskie tlo
    {
    background_visible[0]=1
    background_visible[1]=1
    background_visible[2]=0
    background_visible[3]=0

    background_index[0]=background5
    background_yscale[0]=1*(room_height/480)
    background_blend[0]=c_white

    background_index[1]=background13
    background_htiled[1]=1
    background_vtiled[1]=0
    background_y[1]=room_height-140
    }


if global.background=2 // underground + niebieskie tlo
    {

    background_index[2]=background5
    background_visible[2]=1
    background_visible[3]=0
    background_htiled[2]=1
    background_vtiled[2]=0
    background_yscale[2]=1
    background_blend[2]=c_white

    background_index[1]=background12
    background_visible[1]=1
    background_htiled[1]=1
    background_vtiled[1]=0
    background_yscale[1]=1
    background_blend[1]=c_white
    background_y[1]=480

    background_index[0]=background11
    background_visible[0]=1
    background_htiled[0]=1
    background_vtiled[0]=1
    background_yscale[0]=1
background_xscale[0]=1
    background_blend[0]=c_white
    background_y[0]=480
    }

if global.background<=1 // tylko niebieskie tlo PLAIN SKY
    {
    background_y[0]=0
    background_visible[0]=1
    background_visible[1]=0
    background_visible[2]=0
    background_visible[3]=0
    background_index[0]=background5
    background_yscale[0]=1*(room_height/480)
    background_blend[0]=c_white
    }
//background end
     */
