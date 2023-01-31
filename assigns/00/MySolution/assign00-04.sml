use "./../assign00-lib.sml";

fun tensPlace(N: int, x: int): int =
    if x=0 
    then 1 
    else N * tensPlace(N, x-1);

fun helper(st: string, i: int, length: int): int =
    if 
    i=strlen(st)-1
    then 
    ord(strsub(st, i))-48
    else 
    tensPlace(10, length)*(ord(strsub(st, i))-48) + helper(st, i+1, length-1);


fun str2int(cs: string): int = 
    helper(cs, 0, strlen(cs)-1);
