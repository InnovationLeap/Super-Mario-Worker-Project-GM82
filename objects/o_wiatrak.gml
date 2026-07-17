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
is_petal=0
max_promien=0
promien_szybkosc=0
petal_current=promien
petal_dir=1
petal_dir_got=0
szybkosci=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if global.pauza=0 && global.etappokonany=0 {
    var use_radius;
    if is_petal && max_promien>0 {
        if !petal_dir_got {
            if promien_szybkosc<0 {petal_dir=-1;promien_szybkosc=-promien_szybkosc}
            petal_dir_got=1
        }
        petal_current+=promien_szybkosc*petal_dir
        if petal_current>max_promien {petal_current=2*max_promien-petal_current;petal_dir=-1}
        if petal_current<0 {petal_current=-petal_current;petal_dir=1}
        use_radius=petal_current
    } else {
        use_radius=promien
    }
    shrock1.x=x+16+use_radius*sin(degtorad(kat+90+szybkosci))
    shrock1.y=y+16+use_radius*cos(degtorad(kat+90+szybkosci))
    szybkosci+=szybkosc
}
