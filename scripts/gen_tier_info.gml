// gen_tier_info(tier, field)
// 生成器四档参数（ObjGenerator.md §5.2）
// 房间帧率 50fps（rooms/Play_Room/room.txt）
// field: 0=生成间隔(帧)  1=感应范围(px)
// 慢=4.0s/96px 中=2.0s/160px 快=1.0s/224px 很快=0.5s/320px
switch (argument0) {
    case 1: if argument1 = 1 { return 96 }  else { return 200 }
    case 2: if argument1 = 1 { return 160 } else { return 100 }
    case 3: if argument1 = 1 { return 224 } else { return 50 }
    case 4: if argument1 = 1 { return 320 } else { return 25 }
}
if argument1 = 1 { return 96 }
return 200;
