(*
** For your
** final project
*)
(* ****** ****** *)
#staload
"./../mylib/mylib.sats"
(* ****** ****** *)
//
// LEVEL-0 SYNTAX
//
(* ****** ****** *)
typedef tpnam = string
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
t0pgm =
|
T0PGM of
( t0dclist
, t0erm(*main*))
//
and t0dcl =
| T0DCL of
  ( t0var(*name*)
  , t0erm(*defn*))
//
and t0erm =
//
| T0Mnil of ()
//
| T0Mbtf of bool
| T0Mint of (int)
| T0Mflt of double
| T0Mstr of string
//
| T0Mvar of (t0var)
//
| T0Mlam of
  ( t0var
  , type0opt(*arg*)
  , t0erm
  , type0opt(*res*))
| T0Mfix of
  ( t0var
  , t0erm(*T0Mlam*))
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
| T0Moprs of
  (t0opr, t0ermlst)
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
print_t0pgm
(xs: t0pgm): void
overload print with print_t0pgm
fun
fprint_t0pgm
(out: FILEref, xs: t0pgm): void
overload fprint with fprint_t0pgm
(* ****** ****** *)
fun
print_t0dcl
(xs: t0dcl): void
overload print with print_t0dcl
fun
fprint_t0dcl
(out: FILEref, xs: t0dcl): void
overload fprint with fprint_t0dcl
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
// LEVEL-1 SYNTAX
// for resolving bindings
//
(* ****** ****** *)
abstype
tpext_type = ptr
typedef
tpext = tpext_type
(* ****** ****** *)

fun
print_tpext:
tpext -> void
fun
fprint_tpext:
(FILEref, tpext) -> void

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
fun type1_new_tup(): type1

(* ****** ****** *)
fun
print_type1
(xs: type1): void
overload print with print_type1
fun
fprint_type1
(out: FILEref, xs: type1): void
overload fprint with fprint_type1
(* ****** ****** *)
//
typedef
t1opt = myoptn(type1)
//
fun
tpext_get:
tpext -> t1opt
fun
tpext_set
(tpext, def: type1): void
//
overload .get with tpext_get
overload .set with tpext_set
//
(* ****** ****** *)

abstflt
stamp_type = int
typedef
stamp = stamp_type
abstbox
stamper_type = ptr
typedef
stamper = stamper_type

(* ****** ****** *)
fun
stamper_make(): stamper
fun
stamper_stamp(stamper): stamp
(* ****** ****** *)
//
fun
print_stamp(stamp): void
fun
fprint_stamp(FILEref, stamp): void
//
overload print with print_stamp
overload fprint with fprint_stamp
//
(* ****** ****** *)

abstype
t1var_type = ptr // 1 word
typedef
t1var = t1var_type // alias

(* ****** ****** *)

fun
t1var_new(name: t0var): t1var
(* ****** ****** *)

fun
t1var_get_type1
(t1v0: t1var): type1
overload .type1 with t1var_get_type1

(* ****** ****** *)
//
fun
print_t1var(t1var): void
fun
fprint_t1var(FILEref, t1var): void
//
overload print with print_t1var
overload fprint with fprint_t1var
//
(* ****** ****** *)

datatype
t1pgm =
|
T1PGM of
( t1dclist
, t1erm(*main*))

and t1dcl =
| T1DCL of
  (t1var, t1erm)

and t1erm =
| T1Mnil of ()
//
| T1Mbtf of bool
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
//
fun
print_t1erm(t1erm): void
fun
fprint_t1erm(FILEref, t1erm): void
//
overload print with print_t1erm
overload fprint with fprint_t1erm
//
(* ****** ****** *)
//
fun
trans01_type: type0 -> type1
fun
trans01_term: t0erm -> t1erm
fun
trans01_tdcl: t0dcl -> t1dcl
fun
trans01_tpgm: t0pgm -> t1pgm
//
(* ****** ****** *)

fun
type1_unify
(tp1: type1, tp2: type1): bool

(* ****** ****** *)

fun t1erm_tinfer(t1pgm): void
fun t1erm_tinfer(t1dcl): void
fun t1erm_tinfer(t1erm): void

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
| VALlam of (t1erm, d1env)
| VALfix of (t1var, value(*lam*))
//
and
d1env =
| D1ENV of
  mylist(@(t1var, value))

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
t1pgm_interp(t1pgm): value

(* ****** ****** *)
//
fun
project_main0
{n:int | n >= 1}(int(n), !argv(n)): void
//
(* ****** ****** *)

(* end of [project.sats] *)
