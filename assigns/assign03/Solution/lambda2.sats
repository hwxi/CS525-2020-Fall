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
//
val T0Pnil: type0 // nil
//
val T0Pint: type0 // int
//
val T0Pbtf: type0 // bool
val T0Pbool: type0 // bool
//
val T0Pstr: type0 // string
val T0Pstring: type0 // string
//
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
| T0Mlet of
  (t0var, t0erm, t0erm)
//
| T0Mfix1 of
  (t0var, type0, t0erm)
//
| T0Mopr1 of
  (t0opr, t0erm)
| T0Mopr2 of
  (t0opr, t0erm, t0erm)
(*
| T0Moprs of
  (t0opr, t0ermlst)
*)
//
| T0Mfst of (t0erm)
| T0Msnd of (t0erm)
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
t0erm_tcheck0
(prog: t0erm): type0
fun
t0erm_tcheck1
(t0m0: t0erm, senv: s0env): type0
//
(* ****** ****** *)

datatype
value =
//
| VALnil of ()
//
| VALint of (int)
| VALbtf of (bool)
| VALstr of string
//
| VALtup of (value, value)
| VALlam of (t0erm, d0env)
| VALfix of (t0var, value(*lam*))
//
and
d0env =
| D0ENV of
  mylist(@(t0var, value))

where valuelst = mylist(value)

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
t0erm_interp0(prog: t0erm): value
fun
t0erm_interp1(t0m: t0erm, env: d0env): value

(* ****** ****** *)

(* end of [lambda2.sats] *)
