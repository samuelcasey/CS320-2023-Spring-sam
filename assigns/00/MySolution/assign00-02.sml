use "./../assign00-lib.sml";


fun primeHelper(x: int, y:int): bool =
    if x mod y = 0
    then false
    else if x=y
    then true
    else primeHelper(x, y+1)




fun isPrime(n0: int): bool =
    if n0<2 
    then false
    else if n0=2 
    then true
    else primeHelper(n0, 2)


