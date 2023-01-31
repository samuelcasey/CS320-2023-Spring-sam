use "./../assign00-lib.sml";
fun revHelper(word: string, i: int): string =
    if i<0 
    then "" 
    else str(strsub(word, i))^revHelper(word, i-1);


fun stringrev(cs: string): string =
    revHelper(cs, strlen(cs)-1);
