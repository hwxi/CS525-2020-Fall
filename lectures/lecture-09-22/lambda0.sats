(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
(*

variables: x, y, z, ... // names
abstractions: lam x.t // functions
applications: t1( t2 ) // function calls

*)
(* ****** ****** *)
//
// creating an alias
//
typedef t0opr = string
typedef t0var = string
//
(* ****** ****** *)
//
// abstract syntax
//
datatype t0erm = // level-0
//
| T0Mint of (int)
//
| T0Mvar of t0var
| T0Mlam of (t0var, t0erm)
| T0Mapp of (t0erm, t0erm)
//
| T0Mbool of (bool)
| T0Mopr1 of (t0opr, t0erm)
| T0Mopr2 of (t0opr, t0erm, t0erm)
//
// (cond ? then : else)
//
| T0Mcond of 
  ( t0erm(*cond*)
  , t0erm(*then*), t0erm(*else*))
//
(* ****** ****** *)
fun
t0erm_size(t0erm): int
(* ****** ****** *)
fun
t0erm_fvset(t0erm): mylist(t0var)
(* ****** ****** *)

fun
print_t0erm
(xs: t0erm): void
overload print with print_t0erm

fun
fprint_t0erm
(out: FILEref, xs: t0erm): void
overload fprint with fprint_t0erm

(* ****** ****** *)

fun
t0erm_interp(t0erm): t0erm

(* ****** ****** *)

(* end of [lambda0.sats] *)
