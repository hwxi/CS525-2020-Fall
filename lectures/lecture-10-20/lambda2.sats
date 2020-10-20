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

abstype
tpext_type = ptr
typedef
tpext = tpext_type

(* ****** ****** *)

typedef
tpnam = string

datatype type0 =
| T0Pbas of tpnam
|
T0Pfun of
(type0(*arg*), type0(*res*))
|
T0Ptup of
(type0(*fst*), type0(*snd*))
//
| T0Pext of tpext(*abstract*)
//
(* ****** ****** *)

val T0Pint: type0
val T0Pbool: type0
val T0Pstring: type0

(* ****** ****** *)

fun
tpext_new(): type0

(* ****** ****** *)
typedef
type0opt = myoptn(type0)
(* ****** ****** *)
fun
tpext_get
(X: tpext): type0opt
fun
tpext_set
(X: tpext, tp: type0): void
(* ****** ****** *)

overload .get with tpext_get
overload .set with tpext_set

(* ****** ****** *)

(*
fun
eq_type0_type0
(tp1: type0, tp2: type0): bool
overload = with eq_type0_type0
*)
fun
tunify
(tp1: type0, tp2: type0): bool

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
** (lam (x) => t)
** (lam (x: int) => x + x
** (lam (x: bool) => x || x
*)
//
| T0Mlam of
  (t0var, topt0, t0erm)
| T0Mapp of (t0erm, t0erm)
//
(*
| T0Mfix
  (t0var, topt0, t0erm)
*)
//
| T0Mtup of (t0erm, t0erm)
//
| T0Manno of (t0erm, type0)
//
where topt0 = myoptn(type0)
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
s0env =
S0ENV of
mylist(@(t0var, type0))

(* ****** ****** *)

fun
s0env_extend
(s0env, t0var, type0): s0env
fun
s0env_search
(s0env, t0var): myoptn(type0)

(* ****** ****** *)
//
// If [prog] is ill-typed,
// then TypeErrExn is raised
//
fun
t0erm_tinfer0
(prog: t0erm): type0
fun
t0erm_tinfer1
(t0m: t0erm, env: s0env): type0
//
(* ****** ****** *)

(* end of [lambda1.sats] *)
