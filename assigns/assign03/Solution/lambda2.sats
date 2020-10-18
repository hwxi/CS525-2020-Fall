(* ****** ****** *)
#staload
"./../../../mylib/mylib.sats"
(* ****** ****** *)
typedef
tpnam = string
(* ****** ****** *)
//
datatype type0 =
|
T0Pbas of tpnam
|
T0Pfun of
(type0(*arg*), type0(*res*))
|
T0Ptup of
(type0(*fst*), type0(*snd*))
//
where type0lst = mylist(type0)
  and type0opt = myoptn(type0)
//
(* ****** ****** *)

val T0Pnil: type0
val T0Pint: type0
val T0Pbool: type0
val T0Pstring: type0

(* ****** ****** *)

fun
eq_type0_type0
(tp1: type0, tp2: type0): bool
overload = with eq_type0_type0

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
datatype
t0dcl =
| T0DCL of
  (t0var, t0erm)
//
and t0erm =
//
| T0Mnil of ()
//
| T0Mint of (int)
| T0Mstr of string
//
| T0Mvar of (t0var)
//
| T0Mlam of
  (t0var, type0, t0erm)
| T0Mapp of (t0erm, t0erm)
//
| T0Mfix1 of
  (t0var, type0, t0erm)
//
| T0Mopr1 of
  (t0opr, t0erm)
| T0Mopr2 of
  (t0opr, t0erm, t0erm)
| T0Moprs of
  (t0opr, t0ermlst)
//
| T0Mtup of (t0erm, t0erm)
//
| T0Manno of (t0erm, type0)
//
| T0Mcond of
  ( t0erm(*test*)
  , t0erm(*then*), t0ermopt(*else*))
//
where
t0dclist = mylist(t0dcl)
and
t0ermlst = mylist(t0erm)
and
t0ermopt = myoptn(t0erm)
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
senv =
SENV of
mylist(@(t0var, type0))

(* ****** ****** *)

fun
senv_extend
(senv, t0var, type0): senv
fun
senv_search
(senv, t0var): myoptn(type0)

(* ****** ****** *)
//
// If [prog] is ill-typed,
// then TypeErrExn is raised
//
fun
t0erm_tcheck0
(prog: t0erm): type0
fun
t0erm_tcheck1
(t0m: t0erm, senv: senv): type0
//
(* ****** ****** *)

(* end of [lambda2.sats] *)
