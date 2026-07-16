//real_string_length(real,length)
//返回长度为length的string(real)
//别填字符串啊，不然肯定ERROR（
//length必须为正整数，否则不工作
if argument1 <=0 || argument1 != floor(argument1) { return 0; } else {
var result, is_big_num;
result=argument0
is_big_num = false
//先处理最大最小值
if result>0 {
  var m;
  m=power(10,argument1)
  if result>=m { is_big_num=true;}
} else {
  var n;
  n=power(10,argument1-1)*-1
  if result<=n { result=n+1 }
}
result=string(result)

if(is_big_num){
  var a,b,c;
  a = string_copy(string(argument0),3,argument1-1)
  b = string_copy(string(argument0),1,2)
  c = string_copy("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",real(b)-9,1)
  return c+a;
}

if(!is_big_num){
//下面处理小数
if string_length(result) > argument1 {
  if real(result) >= 1 {
    if string_pos('.',result) != argument1 { result=string_copy(result,1,argument1) }
    else { result=string_copy(result,1,argument1-1) }
  } else if real(result) < 1 && real(result) >= 0 {
    result=string_copy(result,2,argument1)
  } else if real(result) < 0 && real(result) >= -1 {
    result='-'+string_copy(result,3,argument1-1)
  } else {
    result=string_copy(result,1,argument1-1)
  }
}
//此处处理补0
if string_length(result) < argument1 {
  if real(result)>=0 {
    repeat(argument1-string_length(result)) {result=string_insert('0',result,0)}
  }
  else{
    result=string_copy(result,2,string_length(result)-1)
    repeat(argument1-1-string_length(result)) {result=string_insert('0',result,0)}
    result=string_insert('-',result,0)
  }
}
}


//return
return result;
}
