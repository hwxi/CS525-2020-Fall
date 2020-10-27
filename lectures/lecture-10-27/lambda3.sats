(* ****** ****** *)
#staload
"./../..\
/mylib/mylib.sats"
(* ****** ****** *)
//
// LEVEL-0 SYNTAX
//
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
val T0Pbool: type0 // bool
//
val T0Pstring: type0 // string
//
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
  ( t0var
  , type0opt, t0erm)
| T0Mfix of
  ( t0var
  , type0opt, t0erm)
//
| T0Mapp of (t0erm, t0erm)
//
| T0Mlet of
  ( t0dclist, t0erm )
//
| T0Mopr1 of
  (t0opr, t0erm)
| T0Mopr2 of
  (t0opr, t0erm, t0erm)
//
| T0Mtup of (t0ermlst)
| T0Mprj of (t0erm, int(*index*))
//
| T0Manno of (t0erm, type0)
//
| T0Mcond of
  ( t0erm(*test*)
  , t0erm(*then*), t0ermopt(*else*))
//
where t0dclist = mylist(t0dcl)
  and t0ermlst = mylist(t0erm)
  and t0ermopt = myoptn(t0erm)
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
//
// LEVEL-1 SYNTAX
// for resolving bindings
//
(* ****** ****** *)
abstype
tpext_type = ptr
typedef
tpext = tpext_type
(* ****** ****** *)
//
datatype type1 =
|
T1Pbas of tpnam
|
T1Pfun of
(type1(*arg*), type1(*res*))
|
T1Ptup of
(type1(*fst*), type1(*snd*))
//
|
T1Pext of tpext(*existential*)
//
where type1lst = mylist(type1)
  and type1opt = myoptn(type1)
//
(* ****** ****** *)

fun tpext_new(): tpext
fun type1_new_ext(): type1

(* ****** ****** *)

abstype
t1var_type = ptr // 1 word
typedef
t1var = t1var_type // alias

(* ****** ****** *)

fun
t1var_new(name: t0var): t1var

(* ****** ****** *)

datatype
t1dcl =
| T1DCL of
  (t1var, t1erm)

and t1erm =
| T1Mnil of ()
//
| T1Mint of (int)
| T1Mstr of string
//
| T1Mvar of (t1var)
//
| T1Mlam of
  ( t1var
  , type1, t1erm)
| T1Mfix of
  ( t1var
  , type1, t1erm)
//
| T1Mapp of (t1erm, t1erm)
//
| T1Mlet of
  ( t1dclist, t1erm )
//
| T1Mopr1 of
  (t0opr, t1erm)
| T1Mopr2 of
  (t0opr, t1erm, t1erm)
//
| T1Mfst of (t1erm)
| T1Msnd of (t1erm)
| T1Mtup of (t1erm, t1erm)
//
| T1Manno of (t1erm, type1)
//
| T1Mcond of
  ( t1erm(*test*)
  , t1erm(*then*), t1erm(*else*))
//
where t1dclist = mylist(t1dcl)
  and t1ermlst = mylist(t1erm)
  and t1ermopt = myoptn(t1erm)

(* ****** ****** *)

(* end of [lambda3.sats] *)
