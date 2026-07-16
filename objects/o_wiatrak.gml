#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
shrock1=instance_create(-1000,-1000,o_wiatrakanim)
/*kat=0
promien=120
szybkosc=1*/
rodzaj=0

szybkosci=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.etappokonany=0 {



shrock1.x=x+16+promien*sin(degtorad(kat+90+szybkosci))
shrock1.y=y+16+promien*cos(degtorad(kat+90+szybkosci))
szybkosci+=szybkosc

}
