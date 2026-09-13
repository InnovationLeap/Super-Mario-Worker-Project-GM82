category = argument0
ind = argument1
switch(category) {
case 2: { //enemy
        if !instance_position(mouse_x,mouse_y,o_edenemyblock) {return true;} else {
            tester = instance_position(mouse_x,mouse_y,o_edenemyblock);
            if tester.coto=ind {return false;}
            with(o_edenemyblock) {
                if instance_position(mouse_x,mouse_y,id) && coto=other.ind {return false;}
            }
            return true;
        }
}break;
case 3: {
        if !instance_position(mouse_x,mouse_y,o_edsceneriesblock) {return true;} else {
            tester = instance_position(mouse_x,mouse_y,o_edsceneriesblock);
            if tester.coto=ind {return false;}
            with(o_edsceneriesblock) {
                if instance_position(mouse_x,mouse_y,id) && coto=other.ind {return false;}
            }
            return true;
        }
}break;
case 4: {
        if !instance_position(mouse_x,mouse_y,o_edmarkerblock) {return true;} else {
            tester = instance_position(mouse_x,mouse_y,o_edmarkerblock);
            if tester.coto=ind {return false;}
            with(o_edmarkerblock) {
                if instance_position(mouse_x,mouse_y,id) && coto=other.ind {return false;}
            }
            return true;
        }
}break;
case 5: {
        if !instance_position(mouse_x,mouse_y,o_edbonusesblock) {return true;} else {
            tester = instance_position(mouse_x,mouse_y,o_edbonusesblock);
            if tester.coto=ind {return false;}
            with(o_edbonusesblock) {
                if instance_position(mouse_x,mouse_y,id) && coto=other.ind {return false;}
            }
            return true;
        }
}break;
case 6: { //生成器：同格不允许叠放第二个生成器
        if instance_position(mouse_x,mouse_y,o_edgeneratorblock) {return false;}
        return true;
}break;
}
