(* ****** ****** *)
(*
HX: Option type
*)
datatype
myoptn(a:t0ype) =
| myoptn_nil of () // none
| myoptn_cons of (a) // some

(* ****** ****** *)
//
fun
{a:t0ype}
print_myoptn: myoptn(a) -> void // print onto STDOUT
fun
{a:t0ype}
prerr_myoptn: myoptn(a) -> void // print onto STDERR
//
fun
{a:t0ype}
fprint_myoptn
(out: FILEref, xs: myoptn(a)): void
//
overload print with print_myoptn
overload prerr with prerr_myoptn
overload fprint with fprint_myoptn
//
(* ****** ****** *)

datatype
mylist(a:t0ype) =
| mylist_nil of ()
| mylist_cons of (a, mylist(a))

(* ****** ****** *)
//
fun
{a:t@ype}
mylist_sing(x0: a): mylist(a)
//
(* ****** ****** *)
//
fun
{a:t@ype}
mylist_append
( xs: mylist(a)
, ys: mylist(a)): mylist(a)
//
(* ****** ****** *)
//
fun
{a:t0ype}
print_mylist: mylist(a) -> void
fun
{a:t0ype}
prerr_mylist: mylist(a) -> void
//
fun
{a:t0ype}
fprint_mylist
(out: FILEref, xs: mylist(a)): void
fun{}
fprint_mylist$sep(out: FILEref): void
//
overload print with print_mylist
overload prerr with prerr_mylist
overload fprint with fprint_mylist
//
(* ****** ****** *)

(* end of [mylib.sats] *)
