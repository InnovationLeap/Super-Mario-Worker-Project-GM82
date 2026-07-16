if argument0>=0
    {
        cout=transB(min(argument0,61999))
        repeat(4-string_length(cout)){cout=string_insert('0',cout,0)}
    }
    else{
        cout=string(min(-argument0,999))
        repeat(3-string_length(cout)){cout=string_insert('0',cout,0)}
        cout=string_insert('-',cout,0)
    }
return cout;
