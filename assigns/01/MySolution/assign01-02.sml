use "../assign01.sml";

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
xlist_snoc(xs, x1) => if i0>=xlist_size(xs) then x1 else xlisthelp(xs, i0)
|
xlist_append(xs, ys) => if i0=0 then xlisthelp(xs, i0) else if xlist_size(xs)>i0 then xlisthelp(xs, i0) else xlisthelp(ys, i0-xlist_size(xs))
|
xlist_reverse(xs) => xlisthelp(xs, xlist_size(xs)-(i0+1))

fun xlist_sub(xs: 'a xlist, i0: int): 'a =
if i0 < 0 
then raise XlistSubscript
else if i0 >= xlist_size(xs)
then raise XlistSubscript
else
xlisthelp(xs, i0)

(*
//
If 'i0' is an illegal index, then xlist_sub
should raise the XlistSubscript exception.
//
You should NOT convert xlist into list and
then do subscripting.
//
*)

(* ****** ****** *)


