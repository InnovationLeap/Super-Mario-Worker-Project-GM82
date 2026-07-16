/*var asc,first_number,result;
if real(argument0) >= 0 {
asc = ord(argument0);
if (asc >= 65) {first_number = asc - 55}
else {first_number = asc - 48}
result = real(first_number * 1000 + real((string_copy(argument0,2,3))))
return result; } else { return max(real(argument0),-999) }*/

var a,b,c;
a = string_pos(string_copy(argument0,1,1),"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");
if a>0 {
  b = string_delete(argument0,1,1)
  c = string(a+9)+b
  return real(c);
} else { return real(argument0) }
