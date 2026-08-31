// player_camera.gml —— 过关检测 + 相机跟随/滚屏/库巴相位/位置矫正（原 o_marker Step_0 第 2104-2451 行）
// 依赖脚本：test_bound()
// 依赖实例变量：initial_check, view_set, region_count, left_bound, right_bound, top_bound, bottom_bound,
//               xcenter, ycenter, firstscroll, nextscroll, orange_recover, osc_dx, osc_dy, osc_idx,
//               osc_prev, spring_*, prev_*, prev_bowser_phase
// var 声明按 GM8 约束集中在脚本顶部
var rec_dir, warmup_frames, k_safe, k_emergency, margin;
var screen_x, screen_y, danger_x, danger_y, k, d, target, diff;
rec_dir = 0;
warmup_frames = 0;
k_safe = 0;
k_emergency = 0;
margin = 0;
screen_x = 0;
screen_y = 0;
danger_x = 0;
danger_y = 0;
k = 0;
d = 0;
target = 0;
diff = 0;
if global.pauza=0 && pipe_state=0 /*&& prawdziwyczas>0*/ && hit_timer=0 && global.rodzajmaria<>5 {
    if place_meeting(x,y,o_exitar2) && global.level_complete=0 {
        global.level_complete=1
        tmp=instance_place(x,y,o_exitar2)
        endscoring=tmp.vy_offset
        tmp.zabity=1
        if endscoring>=0 && endscoring<10 {
            tmp=instance_create(x,y,o_scorepop)
            tmp.image_index=7
            global.score+=10000
        }
        if endscoring>=10 && endscoring<30 {
            tmp=instance_create(x,y,o_scorepop)
            tmp.image_index=5
        }
        if endscoring>=30 && endscoring<50 {
            tmp=instance_create(x,y,o_scorepop)
            tmp.image_index=4
        }
        if endscoring>=50 && endscoring<70 {
            tmp=instance_create(x,y,o_scorepop)
            tmp.image_index=3
        }
        if endscoring>=70 && endscoring<100 {
            tmp=instance_create(x,y,o_scorepop)
            tmp.image_index=2
        }
        if endscoring>=100 && endscoring<140 {
            tmp=instance_create(x,y,o_scorepop)
            tmp.image_index=1
        }
        if endscoring>=140 && endscoring<=200 {
            tmp=instance_create(x,y,o_scorepop)
            tmp.image_index=0
        }
    }






}

if !initial_check {test_bound(x,y);initial_check=1}

if global.bowser_phase=0 {//普通状态
    view_xview=min(max(0,x-320,left_bound),max(0,right_bound),room_width-640)
    view_yview=min(max(0,y-240,top_bound),max(0,bottom_bound),room_height-480)
    if region_count=1 && view_set=0 {view_set = 1}
    //滚屏状态
    if ds_list_size(global.autoscrolls)>0 && global.scrollPaused = -1 {
        firstscroll=ds_list_find_value(global.autoscrolls,0)
        if x>firstscroll.x+16-320&&x<firstscroll.x+16+320&&y>firstscroll.y+16-240&&y<firstscroll.y+16+240&&checkpointdetect=1 {
            global.bowser_phase=2
            if scrolldetect2=0 {
                xcenter=firstscroll.x+16
                ycenter=firstscroll.y+16
            } else {
                xcenter=view_xview+320
                ycenter=view_yview+240
            }
        }
    }

    //CP后强滚
    if global.checkpoint=0 {scrolldetect=1}
    if global.checkpoint<>0&&checkpointdetect=1 && scrolldetect=0 && ds_list_size(global.autoscrolls)>0 {
        for(i=0;i<ds_list_size(global.autoscrolls);i+=1) {
            tmpscroll=ds_list_find_value(global.autoscrolls,i)
            if x>tmpscroll.x+16-320&&x<tmpscroll.x+16+320&&y>tmpscroll.y+16-240&&y<tmpscroll.y+16+240 {
                global.bowser_phase=2
                firstscroll=tmpscroll
                if scrolldetect2=0 {
                    xcenter=firstscroll.x+16
                    ycenter=firstscroll.y+16
                } else {
                    xcenter=view_xview+320
                    ycenter=view_yview+240
                }
                break;
            }
        }
        scrolldetect=1//本变量负责防止马里奥未传送到CP即停止CP强滚检测
    }
    if checkpointdetect<>0 {scrolldetect2=1}//本变量负责判断是否开场在强滚区域内
}

if global.koopa_scroll_count>0 {global.bowser_phase=1}

if global.scrollPaused = -1 {

    if global.bowser_phase=1//库巴状态，触发库巴见库巴对应object代码
    {
        if instance_exists(o_bowser) {if view_xview<o_bowser.pivot_x-320 && instance_number(o_mariodead)=0 && view_xview<room_width-640 {view_xview+=1;if x<=view_xview[0]+16 {x+=1; if place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock) {hit_timer=1 ; shield=0 ; global.rodzajmaria=0}}}}
        if instance_exists(o_bowser) {if view_xview>o_bowser.pivot_x-320 && instance_number(o_mariodead)=0 && view_xview>0 {view_xview-=1;if x>=view_xview[0]+624 {x-=1; if place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock) {hit_timer=1 ; shield=0 ; global.rodzajmaria=0}}}}
        view_yview=min(max(y-240,0),room_height-480)
    }

    if global.bowser_phase=2 && instance_number(o_mariodead)=0//滚屏至第一个滚屏obj
    {
        //if tttest=0{show_message("bingo");tttest=1}
        xcenter+=cos(point_direction(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)/360*2*pi)*firstscroll.scrollspeed
        ycenter-=sin(point_direction(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)/360*2*pi)*firstscroll.scrollspeed
        view_xview=min(max(xcenter-320,0),room_width-640)
        view_yview=min(max(ycenter-240,0),room_height-480)
        if point_distance(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)<=firstscroll.scrollspeed*1.5 {
            xcenter=firstscroll.x+16;ycenter=firstscroll.y+16
            global.bowser_phase=3}
    }

    if global.bowser_phase=3//好了开始激动人心的滚屏环节了
    {
        if orange_recover=0 && ds_list_find_index(global.autoscrolls,firstscroll) < ds_list_size(global.autoscrolls) - 1 && instance_number(o_mariodead)=0 {
            nextscroll = ds_list_find_value(global.autoscrolls,ds_list_find_index(global.autoscrolls,firstscroll)+1)
            xcenter+=cos(point_direction(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)/360*2*pi)*firstscroll.scrollspeed
            ycenter-=sin(point_direction(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)/360*2*pi)*firstscroll.scrollspeed
            if point_distance(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)<=firstscroll.scrollspeed*1.5 {
                xcenter=nextscroll.x+16;ycenter=nextscroll.y+16
                if firstscroll.is_orange=1 && nextscroll.is_orange=0 {
                    // 橙→绿过渡：xcenter停在绿色节点，镜头平滑追上后再继续
                    orange_recover=1
                }
                firstscroll=nextscroll
            }
        } else {
            nextscroll=firstscroll;
        }
        if instance_number(o_mariodead)=0 {
            if orange_recover=1 {
                // 橙→绿过渡：镜头以滚屏速度平滑移向绿色节点（xcenter已在节点位置等待）
                rec_dir=point_direction(view_xview+320,view_yview+240,xcenter,ycenter)
                view_xview=min(max(view_xview+cos(rec_dir/360*2*pi)*firstscroll.scrollspeed,0),room_width-640)
                view_yview=min(max(view_yview-sin(rec_dir/360*2*pi)*firstscroll.scrollspeed,0),room_height-480)
                // 单轴对齐：某轴接近节点时直接赋值
                if abs(view_xview+320-xcenter)<=firstscroll.scrollspeed {view_xview=xcenter-320}
                if abs(view_yview+240-ycenter)<=firstscroll.scrollspeed {view_yview=ycenter-240}
                if point_distance(view_xview+320,view_yview+240,xcenter,ycenter)<=firstscroll.scrollspeed*1.5 {
                    view_xview=xcenter-320;view_yview=ycenter-240
                    orange_recover=0
                }
            } else {
                // 橙色强滚：镜头X跟随玩家，Y由穿过xcenter的垂线约束（玩家Y不参与计算）
                if firstscroll.is_orange=1 {
                    if nextscroll!=firstscroll {
                        osc_dx=nextscroll.x-firstscroll.x
                        osc_dy=nextscroll.y-firstscroll.y
                    } else {
                        // 末尾节点：方向 = 上一→当前，控件不动但镜头继续锁此方向
                        osc_dx=0;osc_dy=0
                        osc_idx=ds_list_find_index(global.autoscrolls,firstscroll)
                        if osc_idx>0 {
                            osc_prev=ds_list_find_value(global.autoscrolls,osc_idx-1)
                            osc_dx=firstscroll.x-osc_prev.x
                            osc_dy=firstscroll.y-osc_prev.y
                        }
                    }
                    // 自适应阻尼弹簧过渡：仅用于初次追上玩家，收束后切回直接跟随
                    // 非滚屏状态下进入的首个橙色节点 → 不应用阻尼，直接跟踪
                    if prev_bowser_phase!=2 && prev_bowser_phase!=3 {
                        spring_settled_x=1
                        spring_settled_y=1
                        spring_timer_x=0
                        spring_timer_y=0
                        prev_osc_dx=osc_dx
                        prev_osc_dy=osc_dy
                    }
                    // 检测滚屏方向是否改变 → 重置收束状态
                    if osc_dx!=prev_osc_dx or osc_dy!=prev_osc_dy {
                        spring_settled_x=0
                        spring_settled_y=0
                        spring_timer_x=0
                        spring_timer_y=0
                        prev_osc_dx=osc_dx
                        prev_osc_dy=osc_dy
                    }
                    // 两阶段追击：前warmup帧阻尼弹簧（平滑启动），之后匀速强追（不惧运动目标）
                    warmup_frames=15
                    k_safe=0.02
                    k_emergency=0.20
                    margin=80
                    screen_x=x-view_xview
                    screen_y=y-view_yview
                    danger_x=0
                    danger_y=0
                    if screen_x<margin {danger_x=1-screen_x/margin}
                    if screen_x>640-margin {danger_x=max(danger_x,(screen_x-(640-margin))/margin)}
                    if screen_y<margin {danger_y=1-screen_y/margin}
                    if screen_y>480-margin {danger_y=max(danger_y,(screen_y-(480-margin))/margin)}
                    if osc_dx!=0 and osc_dy!=0 {
                        // 一般斜向：X自由（阻尼→匀速），Y由垂线约束
                        if spring_settled_x=0 {
                            spring_timer_x+=1
                            target=clamp(x-320,0,room_width-640)
                            diff=target-view_xview
                            if spring_timer_x>=60 {
                                view_xview=target;spring_vx=0;spring_settled_x=1;spring_timer_x=0
                            } else if spring_timer_x<warmup_frames {
                                k=k_safe+(k_emergency-k_safe)*danger_x
                                d=2*sqrt(k)
                                spring_vx+=k*diff-d*spring_vx
                                view_xview+=spring_vx
                                if abs(diff)<1 && abs(spring_vx)<1 {
                                    view_xview=target;spring_vx=0;spring_settled_x=1;spring_timer_x=0
                                }
                            } else {
                                // 匀速追击：距离比例+20px下限，确保比玩家任何运动都快
                                k=max(abs(diff)*0.15,20)
                                if abs(diff)<=k {
                                    view_xview=target;spring_vx=0;spring_settled_x=1;spring_timer_x=0
                                } else {
                                    view_xview+=sign(diff)*k
                                    spring_vx=sign(diff)*k
                                }
                            }
                        } else {
                            view_xview=clamp(x-320,0,room_width-640)
                        }
                        view_yview=clamp(ycenter-((view_xview+320-xcenter)*osc_dx)/osc_dy-240,0,room_height-480)
                        spring_vy=0
                    } else if osc_dy==0 {
                        // 纯水平：X锁定，Y自由（阻尼→匀速）
                        view_xview=clamp(xcenter-320,0,room_width-640)
                        spring_vx=0
                        if spring_settled_y=0 {
                            spring_timer_y+=1
                            target=clamp(y-240,0,room_height-480)
                            diff=target-view_yview
                            if spring_timer_y>=60 {
                                view_yview=target;spring_vy=0;spring_settled_y=1;spring_timer_y=0
                            } else if spring_timer_y<warmup_frames {
                                k=k_safe+(k_emergency-k_safe)*danger_y
                                d=2*sqrt(k)
                                spring_vy+=k*diff-d*spring_vy
                                view_yview+=spring_vy
                                if abs(diff)<1 && abs(spring_vy)<1 {
                                    view_yview=target;spring_vy=0;spring_settled_y=1;spring_timer_y=0
                                }
                            } else {
                                k=max(abs(diff)*0.15,20)
                                if abs(diff)<=k {
                                    view_yview=target;spring_vy=0;spring_settled_y=1;spring_timer_y=0
                                } else {
                                    view_yview+=sign(diff)*k
                                    spring_vy=sign(diff)*k
                                }
                            }
                        } else {
                            view_yview=clamp(y-240,0,room_height-480)
                        }
                    } else {
                        // 纯垂直(dx==0)：X自由（阻尼→匀速），Y锁定
                        if spring_settled_x=0 {
                            spring_timer_x+=1
                            target=clamp(x-320,0,room_width-640)
                            diff=target-view_xview
                            if spring_timer_x>=60 {
                                view_xview=target;spring_vx=0;spring_settled_x=1;spring_timer_x=0
                            } else if spring_timer_x<warmup_frames {
                                k=k_safe+(k_emergency-k_safe)*danger_x
                                d=2*sqrt(k)
                                spring_vx+=k*diff-d*spring_vx
                                view_xview+=spring_vx
                                if abs(diff)<1 && abs(spring_vx)<1 {
                                    view_xview=target;spring_vx=0;spring_settled_x=1;spring_timer_x=0
                                }
                            } else {
                                k=max(abs(diff)*0.15,20)
                                if abs(diff)<=k {
                                    view_xview=target;spring_vx=0;spring_settled_x=1;spring_timer_x=0
                                } else {
                                    view_xview+=sign(diff)*k
                                    spring_vx=sign(diff)*k
                                }
                            }
                        } else {
                            view_xview=clamp(x-320,0,room_width-640)
                        }
                        view_yview=clamp(ycenter-240,0,room_height-480)
                        spring_vy=0
                    }
                    view_xview=clamp(view_xview,0,room_width-640)
                    view_yview=clamp(view_yview,0,room_height-480)
                } else {
                    view_xview=min(max(xcenter-320,0),room_width-640)
                    view_yview=min(max(ycenter-240,0),room_height-480)
                }
            }
        }
    }

    if (global.bowser_phase=2 && global.rodzajmaria<>5) {//位置矫正1
        if instance_number(o_mariodead)=0 {if x<=view_xview[0] && !(place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock)) {x+=cos(point_direction(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)/360*2*pi)*firstscroll.scrollspeed}
            if x<view_xview[0]-16 && pipe_state=0 {hit_timer=1 ; shield=0 ; global.rodzajmaria=0}}
        if instance_number(o_mariodead)=0 {if x>=view_xview[0]+640 && !(place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock)) {x+=cos(point_direction(xcenter,ycenter,firstscroll.x+16,firstscroll.y+16)/360*2*pi)*firstscroll.scrollspeed}
            if x>view_xview[0]+656 && pipe_state=0 {hit_timer=1 ; shield=0 ; global.rodzajmaria=0}}
        if x>view_xview[0]+624 && !(place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock)) {x=view_xview[0]+624;}
        if x<view_xview[0]+16 && !(place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock)) {x=view_xview[0]+16;}
        if pipe_delay>=31 {global.bowser_phase=0}
    }
    if (global.bowser_phase=3 && global.rodzajmaria<>5) {//位置矫正2
        if instance_number(o_mariodead)=0 {if x<=view_xview[0] && !(place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock)) {x+=cos(point_direction(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)/360*2*pi)*firstscroll.scrollspeed}
            if x<view_xview[0]-16 && pipe_state=0 {hit_timer=1 ; shield=0 ; global.rodzajmaria=0}}
        if instance_number(o_mariodead)=0 {if x>=view_xview[0]+640 && !(place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock)) {x+=cos(point_direction(xcenter,ycenter,nextscroll.x+16,nextscroll.y+16)/360*2*pi)*firstscroll.scrollspeed}
            if x>view_xview[0]+656 && pipe_state=0 {hit_timer=1 ; shield=0 ; global.rodzajmaria=0}}
        //强滚向下分量：上面出界死亡（到最后一个节点 nextscroll==firstscroll 时停止；镜头触底 view_yview==room_height-480 时也停止）
        // 橙→osc_dy>0；绿→nextscroll.y>firstscroll.y
        if global.topdeath=1 && nextscroll!=firstscroll && view_yview[0] < room_height - 480 {
            if (firstscroll.is_orange=1 && osc_dy>0) || (firstscroll.is_orange=0 && nextscroll.y>firstscroll.y) {
                if y<view_yview[0]-16 && pipe_state=0 {
                    hit_timer=1 ; shield=0 ; global.rodzajmaria=0;animator2.visible=0;animator.image_blend=c_white
                }
            }
        }
        if x>view_xview[0]+624 && !(place_meeting(x-3,y,obj_wall) || place_meeting(x-3,y,o_pointblock)) {x=view_xview[0]+624;}
        if x<view_xview[0]+16 && !(place_meeting(x+3,y,obj_wall) || place_meeting(x+3,y,o_pointblock)) {x=view_xview[0]+16;}
        if pipe_delay>=31 {global.bowser_phase=0}
    }

    prev_bowser_phase=global.bowser_phase
}

if global.bowser_phase=4 { //道中库巴战结束后的滚屏修正过程
    centerset=0 {xcenter = view_xview+320;ycenter = view_yview+240;centerset=1}
    xcenter+=cos(point_direction(xcenter,ycenter,x,y)/360*2*pi)*3
    ycenter-=sin(point_direction(xcenter,ycenter,x,y)/360*2*pi)*3
    if point_distance(xcenter,ycenter,x,y)<=3*1.5 {
        xcenter=x;ycenter=y
        global.pauza=0;
        global.bowser_phase=0;
    }
    view_xview=min(max(xcenter-320,0),room_width-640)
    view_yview=min(max(ycenter-240,0),room_height-480)
}
