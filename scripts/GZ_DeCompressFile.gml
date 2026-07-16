/*
  专业偷懒（
*/
 if file_exists(argument0)
  {
  if gz_check(argument0) = 1
  {
       gz_decompress(argument0,argument1)
  }
  else
  {
     file_copy(argument0,argument1)
  }
  return argument1;
  }
