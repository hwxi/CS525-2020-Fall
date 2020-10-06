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

typedef
tpnam = string

datatype type0 =
| T0Pbas of tpnam
| T0Pfun of (type0, type0)
| T0Ptup of (type0, type0)

(* ****** ****** *)
fun
print_type0
(xs: type0): void
overload print with print_type0
fun
fprint_type0
(out: FILEref, xs: type0): void
overload fprint with fprint_type0
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
//
(*
** (lam (x: T) => t)
** (lam (x: int) => x + x
** (lam (x: bool) => x || x
*)
//
| T0Mlam of
  (t0var, type0, t0erm)
| T0Mapp of (t0erm, t0erm)
//
| T0Mtup of (t0erm, t0erm)
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
//
// If [prog] is ill-typed,
// then TypeErrExn is raised
//
fun
t0erm_typeck0(prog: t0erm): type0
//
(* ****** ****** *)

(* end of [lambda1.sats] *)
