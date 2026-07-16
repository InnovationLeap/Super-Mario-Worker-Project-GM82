var aa,ab;
    aa='4'
    if x>=0{
    ab=transB(min(x,61999))
    repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)}
    else{
    ab=string(min(-x,999))
    repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
    ab=string_insert('-',ab,0)
    aa=string_insert(ab,aa,string_length(aa)+1)
    }
    if floor(wejscie/90)!=1{
    if y>=0{
    ab=transB(min(y,61999))
    repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)}
    else{
    ab=string(min(-y,999))
    repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
    ab=string_insert('-',ab,0)
    aa=string_insert(ab,aa,string_length(aa)+1)
    }}else{
    if y>=-32{
    ab=transB(min(y+32,61967))
    repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)}
    else{
    ab=string(min(-y,1031))
    repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
    ab=string_insert('-',ab,0)
    aa=string_insert(ab,aa,string_length(aa)+1)
    }
    }
    if exitx>=0{
    ab=transB(min(exitx,61999))
    repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)}
    else{
    ab=string(min(-exitx,999))
    repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
    ab=string_insert('-',ab,0)
    aa=string_insert(ab,aa,string_length(aa)+1)
    }
    if exity>=0{
    ab=transB(min(exity,61999))
    repeat(4-string_length(ab)){ab=string_insert('0',ab,0)}
        aa=string_insert(ab,aa,string_length(aa)+1)}
    else{
    ab=string(min(-exity,999))
    repeat(3-string_length(ab)){ab=string_insert('0',ab,0)}
    ab=string_insert('-',ab,0)
    aa=string_insert(ab,aa,string_length(aa)+1)
    }
ab=string(floor(wejscie/90) mod 4)
        aa=string_insert(ab,aa,string_length(aa)+1)
ab=string(floor(wyjscie/90) mod 4)
        aa=string_insert(ab,aa,string_length(aa)+1)
file_text_write_string(global.script_file,aa)
file_text_writeln(global.script_file)
