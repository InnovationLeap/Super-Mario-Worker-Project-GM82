category=argument0
tokill=argument1
ind=argument2

switch(category){
  //case 2: //enemy

  case 3:{ //scenery
      if(tokill=ind || (tokill<>42 && ind<>42)) {return true;}
      else{return false;}
      /*else{
          temp_stack = ds_stack_create()
          found=0
          while(!found){
              ds_stack_push(temp_stack,tester)
              instance_deactivate_object(tester)
              tester = instance_position(mouse_x,mouse_y,o_edsceneriesblock)
              if(tester && tokill=ind){
                  with(tester){instance_destroy();}
                  found=1/
              }
          }
          while(!ds_stack_empty(temp_stack){
              instance_activate_object(ds_stack_pop(temp_stack);
          }
          ds_stack_destroy(temp_stack);
      }*/
      break;
  }

  case 4:{//marks
      if (ind = tokill+15+max(0,sign(ind-20))+max(0,sign(ind-24))){return true;}
      else{
          if((ind=18 && tokill=6)||(ind=22 && tokill=3)||(ind=29 && tokill=11)||(ind=28 && tokill = 12)||(ind=31 && (tokill=3 || tokill=6))) {return true;}
          else{
              if(tokill>18 && (ind<=16 || ind=21 || ind=25)){return true;}
              else{return false;}
          }
      }
      break;
  }
  //case 5: //bonus
}
