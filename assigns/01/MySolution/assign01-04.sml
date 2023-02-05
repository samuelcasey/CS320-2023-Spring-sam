(*
//
Assign01-04: 10 points
//
Please recall the following question in Assign00:
Assign00-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int =

In particular, it is expected that str2int(int2str(x)) = x
//
This time you are asked to implement the following
function that only turns a legal representation of an integer
into an integer. By a legal representation of an integer, we
mean a string consisting of a non-empty sequence of digits (where
the digit '0' can be a leading digit).
//
*)


use "/Users/samuelcasey/Desktop/CS320-2023-Spring-sam/assigns/00/assign00-lib.sml";

fun andhelp(st: string, i: int): bool =
    if 
    strsub(st, i)<>
    then
    andhelp2(st, i)
    else
    false

fun andhelp2(st: string, i: int): bool =
    if 
    i=strlen(st)-1
    then
    true
    else 
    false

fun tensPlace(N: int, x: int): int =
    if x=0 
    then 1 
    else N * tensPlace(N, x-1);

fun helper(st: string, i: int, length: int): int option =
    if 
    andhelp(st, i)
    then 
    ord(strsub(st, i))-48
    else if 
    strsub(st, i)<>'0'
    then
    tensPlace(10, length)*(ord(strsub(st, i))-48) + helper(st, i+1, length-1)
    else
    helper(st, i+1, length-1)

fun str2int_opt(cs: string): int option =
    helper(cs, 0, strlen(cs)-1);


(* ****** ****** *)
