#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0 ; i<rotoc ; i+=1) {
a=instance_create(x,y,o_troopaflygold)
a.cx=x+16;a.cy=y+16;
a.radius=rotor
a.angle=rotoa+90+(360/rotoc)*i
a.dir=rotod
}

instance_destroy()
