(* ****** ****** *)
(*
Assign01: Onward!
*)
(* ****** ****** *)
(*
use "./assign01-lib.sml";
*)
(* ****** ****** *)
val list_append = op@
val list_reverse = List.rev
(* ****** ****** *)

exception XlistConsMatch
exception XlistSubscript

(* ****** ****** *)

datatype 'a xlist =
xlist_nil
|
xlist_cons of ('a * 'a xlist)
|
xlist_snoc of ('a xlist * 'a)
|
xlist_append of ('a xlist * 'a xlist)
|
xlist_reverse of ('a xlist)

(* ****** ****** *)

fun
list_of_xlist(xs: 'a xlist): 'a list =
(
case xs of
xlist_nil => []
|
xlist_cons(x1, xs) => x1 :: list_of_xlist(xs)
|
xlist_snoc(xs, x1) => list_of_xlist(xs) @ [x1]
|
xlist_append(xs, ys) => list_of_xlist(xs) @ list_of_xlist(ys)
|
xlist_reverse(xs) => list_reverse(list_of_xlist(xs))
)

(* ****** ****** *)

(*
//
Assign01-01: 10 points
//
Please implement a function
that computes the size of an xlist DIRECTLY:
//
*)
fun xlist_size(xs: 'a xlist): int =
case xs of
xlist_nil => 0
|
xlist_cons(x1, xs) => xlist_size(xs)+1
|
xlist_snoc(xs, x1) => xlist_size(xs)+1
|
xlist_append(xs, ys) => xlist_size(xs) + xlist_size(ys)
|
xlist_reverse(xs) => xlist_size(xs)

(*
//
That is, you should NOT convert xlist into list
and then compute the size of the converted list
//
*)

(* ****** ****** *)

(*
//
Assign01-02: 10 points
//
Please implement a function
that does subscripting on xlist DIRECTLY:
// *)

fun xlisthelp(xs: 'a xlist, i0: int): 'a =
case xs of
xlist_nil => raise XlistSubscript
|
xlist_cons(x1, xs) => if i0 = 0 then x1 else xlisthelp(xs, i0-1)
|
xlist_snoc(xs, x1) => if i0 < xlist_size(xs) then xlisthelp(xs, i0) else x1
|
xlist_append(xs, ys) => if i0=0 then xlisthelp(xs, i0) else if xlist_size(xs)>i0 then xlisthelp(xs, i0) else xlisthelp(ys, i0-xlist_size(xs))
|
xlist_reverse(xs) => xlisthelp(xs, xlist_size(xs)-i0-1)

fun xlist_sub(xs: 'a xlist, i0: int): 'a =
if i0 < 0 
then raise XlistSubscript
else if i0 >= xlist_size(xs)
then raise XlistSubscript
else
xlisthelp(xs, i0)


(*//
If 'i0' is an illegal index, then xlist_sub
should raise the XlistSubscript exception.
//
You should NOT convert xlist into list and
then do subscripting.
//
*)

(* ****** ****** *)

(*
//
Assign01-03: 10 points
//
Please implement a function that converts a given
xlist 'xs' into another xlist 'ys' by removing the
constructor 'mylist_reverse':
//
fun xlist_remove_reverse(xs: 'a xlist): 'a xlist
//
In particular, your implementation should guarantee:
1. 'xs' and 'ys' represent the same list
2. 'ys' does NOT make any use of 'xlist_reverse'
3. 'xs' and 'ys' use the same number of 'xlist_append'
//
*)
  
(* ****** ****** *)

(*
//
Assign01-04: 10 points
//
Please recall the following question in Assign00:
Assign00-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x
//
This time you are asked to implement the following
function that only turns a legal representation of an integer
into an integer. By a legal representation of an integer, we
mean a string consisting of a non-empty sequence of digits (where
the digit '0' can be a leading digit).
//
fun str2int_opt(cs: string): int option
//
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign01.sml] *)
