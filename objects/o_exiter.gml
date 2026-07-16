#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*exitx=32 //- pozycja x exita
exity=32 //- pozycja y exita
wejscie=3 //- k箃 pod jakim sie wchodzi
wyjscie=3 //- k箃 pod jakim si?wychodzi
*/test233=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.checkpassage=0{test233=1}//这些用于自动校正水管位置。
if test233=0{
place_meeting(x,y,obj_wall){y+=32;test233=1}
}
