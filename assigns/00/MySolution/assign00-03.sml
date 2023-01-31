

fun int2str(i0: int): string =
    if 
    i0<=9 
    then 
    str(chr(i0+48))
    else 
    int2str(i0 div 10) ^ str(chr((i0 mod 10) + 48))


