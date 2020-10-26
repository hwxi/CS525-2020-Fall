(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
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
| T0Mint of int // integers
| T0Mbtf of bool // booleans
| T0Mvar of t0var
| T0Mlam of (t0var, t0erm)
| T0Mapp of (t0erm, t0erm)
//
| T0Mtup of (t0ermlst)
| T0Mprj of (t0erm, int)
//
| T0Mopr1 of (t0opr, t0erm)
| T0Mopr2 of (t0opr, t0erm, t0erm)
//
| T0Mfix1 of (t0var, type0, t0erm)
//
// HX-2020-09:
// conditional:
// (cond ? then : else)
//
| T0Mcond of 
  ( t0erm(*cond*)
  , t0erm(*then*), t0erm(*else*))
//
where t0ermlst = mylist(t0erm)
//
(* ****** ****** *)

fun
print_t0erm
(t0: t0erm): void
overload print with print_t0erm
fun
fprint_t0erm
(out: FILEref, t0: t0erm): void
overload fprint with fprint_t0erm

(* ****** ****** *)

fun
t0erm_interp(prog: t0erm): t0erm

(* ****** ****** *)

(* end of [lambda0.sats] *)
