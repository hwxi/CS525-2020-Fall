(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
(*
#staload
"./../../mylib/mylib.dats"
*)
(*
#staload
"./../../mylib2/mylib.dats" // for implementing mylib/mylib.sats
*)
(* ****** ****** *)
(*
#staload
"./../../mylib2/mylib2.sats" // your own library for this class
#staload
"./../../mylib2/mylib2.dats" // your own library for this class
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
| T0Mbtf of (bool)
//
| T0Mvar of t0var
| T0Mlam of (t0var, t0erm)
| T0Mapp of (t0erm, t0erm)
//
| T0Mbool of (bool)
| T0Mopr1 of (t0opr, t0erm)
| T0Mopr2 of (t0opr, t0erm, t0erm)
//
| T0Mfix1 of (t0var, t0erm)
//
// (cond ? then : else)
//
| T0Mcond of 
  ( t0erm(*cond*)
  , t0erm(*then*), t0erm(*else*))
//
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

datatype
value =
| VALint of (int)
| VALbtf of (bool)
| VALlam of (t0erm, envir)
| VALfix of (t0var, value)

and
envir =
ENVIR of mylist(@(t0var, value))

(* ****** ****** *)
//
fun
print_value(value): void
fun
fprint_value(FILEref, value): void
//
overload print with print_value
overload fprint with fprint_value
//
(* ****** ****** *)

fun
t0erm_eval0(prog: t0erm): value
fun
t0erm_eval1(t0m: t0erm, env: envir): value

(* ****** ****** *)

(* end of [lambda1.sats] *)
