/*var result,first,remain
if (argument0<=9999) { result = string(argument0) }
else{
    first = chr( floor (argument0/1000)+ 55 )
    remain = string_copy(string(argument0),3,3)
    result = string_insert(remain,first,2)
}
return result*/
if argument0<= 9999 { return string(argument0); }
else {
  var a,b,c;
  a = string_copy(string(argument0),3,3)
  b = string_copy(string(argument0),1,2)
  c = string_copy("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",real(b)-9,1)
  return c+a;
}
