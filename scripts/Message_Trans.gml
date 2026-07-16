var result;
result = string_replace_all(argument0,chr(34),chr(34)+"+chr(34)+"+chr(34))
result = string_replace_all(result,"\#",chr(34)+"+chr(35)+"+chr(34))
result = string_replace_all(result,"#",chr(13))
return result;
