// player_fish.gml —— 游鱼/飞鱼区域生成（原 o_marker Step_0 第 1978-2092 行）
// SMWP 1.6+
// 用于控制鱼的生成
if place_meeting(x,y,o_swimfisharea) {
    fisharea=instance_place(x,y,o_swimfisharea)
    fishcounter+=1
    if fisharea.type=0 {
        if fishcounter = 50 {
            fishcreateY=max(view_yview-60,global.water_level+38)+random(300)
            if instance_number(o_fishred2)<8 {
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_fishred2)
                fish.activated=1; fish.dir=fisharea.fishdir
            }
        }
        if fishcounter >= 100 {
            fishcounter=0
            fishcreateY=max(view_yview-60,global.water_level+38)+300+random(300)
            if instance_number(o_fishred2)<8 {
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_fishred2)
                fish.activated=1; fish.dir=fisharea.fishdir
            }
        }
    }
    if fisharea.type=1 {
        if fishcounter = 38 {
            fishcreateY=max(view_yview-60,global.water_level+38)+random(300)
            if instance_number(o_fishred2)<10 {
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_fishred2)
                fish.activated=1; fish.dir=fisharea.fishdir
            }
        }
        if fishcounter >= 75 {
            fishcounter=0
            fishcreateY=max(view_yview-60,global.water_level+38)+300+random(300)
            if instance_number(o_fishred2)<10 {
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_fishred2)
                fish.activated=1; fish.dir=fisharea.fishdir
            }
        }
    }
    if fisharea.type=2 {
        if fishcounter = 50 {
            fishcreateY=max(view_yview-60,global.water_level+38)+random(300)
            if instance_number(o_fishgreen2)<10 {
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_fishgreen2)
                fish.activated=1; fish.dir=fisharea.fishdir
            }
        }
        if fishcounter >= 100 {
            fishcounter=0
            fishcreateY=max(view_yview-60,global.water_level+38)+300+random(300)
            if instance_number(o_fishgreen2)<10 {
                fish=instance_create(view_xview+320-354*fisharea.fishdir,fishcreateY,o_fishgreen2)
                fish.activated=1; fish.dir=fisharea.fishdir
            }
        }
    }
}
if place_meeting(x,y,o_flyfisharea) {
    fisharea2=instance_place(x,y,o_flyfisharea)
    fishcounter2+=1
    if fisharea2.type=0 {
        if fishcounter2 >= 25 && fisharea2.fishdir*hspd>=0 {
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_fishred3)<3 {
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_fishred3)
                fish.activated=1; fish.dir=fisharea2.fishdir
            }
        }
        if fishcounter2 >= 13 && fisharea2.fishdir*hspd<0 {
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_fishred3)<3 {
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_fishred3)
                fish.activated=1; fish.dir=fisharea2.fishdir
            }
        }
    }
    if fisharea2.type=1 {
        if fishcounter2 >= 10 && fisharea2.fishdir*hspd>=0 {
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_fishred3)<3 {
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_fishred3)
                fish.activated=1; fish.dir=fisharea2.fishdir
            }
        }
        if fishcounter2 >= 4 && fisharea2.fishdir*hspd<0 {
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_fishred3)<3 {
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_fishred3)
                fish.activated=1; fish.dir=fisharea2.fishdir
            }
        }
    }
    if fisharea2.type=2 {
        if fishcounter2 >= 25 && fisharea2.fishdir*hspd>=0 {
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_fishblue3)<3 {
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_fishblue3)
                fish.activated=1; fish.dir=fisharea2.fishdir
            }
        }
        if fishcounter2 >= 13 && fisharea2.fishdir*hspd<0 {
            fishcounter2=0
            fishcreateY=view_yview+464+38+random(300)
            if instance_number(o_fishblue3)<3 {
                fish=instance_create(view_xview+320-354*fisharea2.fishdir,fishcreateY,o_fishblue3)
                fish.activated=1; fish.dir=fisharea2.fishdir
            }
        }
    }
}
