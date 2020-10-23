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
// print onto STDOUT
fun
{a:t0ype}
print_myoptn: myoptn(a) -> void
//
// print onto STDERR
fun
{a:t0ype}
prerr_myoptn: myoptn(a) -> void
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
// For list concatenation
//
fun
{a:t@ype}
mylist_append
( xs: mylist(a)
, ys: mylist(a)): mylist(a)
//
(* ****** ****** *)
//
// For finding element [i0]
// in a given list. For instance,
// mylist_get_at(xs, 0) returns
// the head of [xs] (if [xs] is
// not empty)
//
fun
{a:t@ype}
mylist_get_at
( xs
: mylist(a), i0: int): myoptn(a)
fun
{a:t@ype}
mylist_nth_opt
( xs
: mylist(a), i0: int): myoptn(a)
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

fun
{a:t@ype}
{b:t@ype}
mylist_map
( xs
: mylist(a)
, f0: (a) -<cloref1> b): mylist(b)

(* ****** ****** *)

fun
{a:t@ype}
ref_equal
(ref1: ref(a), ref2: ref(a)): bool

(* ****** ****** *)

(* end of [mylib.sats] *)
