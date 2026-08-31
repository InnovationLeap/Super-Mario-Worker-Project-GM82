// player_god_slide() —— godmode 切形态前的滑蹲判定（原 player_skin.gml 内联重复 5 次）
if global.modifiedmov=1 && global.rodzajmaria=0 && (place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)) { slide = 1 }
if global.modifiedmov=1 && global.rodzajmaria=0 && !(place_meeting(x,y+8,obj_wall) || place_meeting(x,y+8,o_pointblock) || place_meeting(x,y+8,o_windas)) && (place_meeting(x,y-32,obj_wall) || place_meeting(x,y-32,o_pointblock)){ slide = 2 }
