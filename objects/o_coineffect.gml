#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sekwencja=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0
{
if sekwencja<16 {y-=14-sekwencja; sekwencja+=1; /*instance_create(x+14,y+16,o_stareffect)*/}
if sekwencja>=16 {y+=1; sekwencja+=1; image_alpha-=0.1/*instance_create(x+14,y+16,o_stareffect)*/}
if sekwencja>26 {instance_destroy()}


}
