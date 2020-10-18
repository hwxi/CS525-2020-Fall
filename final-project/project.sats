(*
** For your
** final project
*)

(* ****** ****** *)

#staload
"./../mylib/mylib.sats"

(* ****** ****** *)
typedef tpnam = string
(* ****** ****** *)
typedef opnam = string
(* ****** ****** *)
typedef f0nam = string
typedef x0nam = string
(* ****** ****** *)

abstype tpext_type = ptr
typedef tpext = tpext_type

(* ****** ****** *)
//
datatype
type0 =
//
  | T0Pbas of tpnam // base
//
  | T0Pext of tpext // unify
//
  | T0Ptup of // tuples
    (type0(*fst*), type0(*snd*))
//
  | T0Pfun of // functions
    (type0(*arg*), type0(*res*))
//
typedef type0opt = myoptn(type0)
typedef type0lst = mylist(type0)
//
(* ****** ****** *)
//
datatype
ctype0 = CT0P of (type0lst, type0)
//
(* ****** ****** *)
//
fun
print_type0: print_type(type0)
fun
fprint_type0: fprint_type(type0)
//
overload print with print_type0
overload fprint with fprint_type0
//
fun
print_ctype0: print_type(ctype0)
fun
fprint_ctype0: fprint_type(ctype0)
//
overload print with print_ctype0
overload fprint with fprint_ctype0
//
(* ****** ****** *)

datatype
t0dcl =
| T0DCL of
  (x0nam, t0erm)
//
and t0erm =
//
  | T0Mnil of ()
//
  | T0Mint of int
  | T0Mbtf of bool
(*
  | T0Mflt of double
*)
  | T0Mstr of string
//
  | T0Mvar of x0nam
  | T0Mlam of
    (x0nam, type0opt, t0erm)
  | T0Mapp of (t0erm, t0erm)
//
  | T0Mift of (t0erm, t0erm, t0ermopt)
//
  | T0Mtup of (t0erm, t0erm)
  | T0Mfst of t0erm | T0Msnd of t0erm
//
  | T0Moprs of (opnam, t0ermlst)
//
  | T0Manno of (t0erm, type0) // type-annotation
//
  | T0Mlets of
    (t0dclist(*local*), t0erm(*scope*)) // local bindings
//
  | T0Mfix1 of
    ( f0nam(*f*)
    , x0nam(*x*)
    , type0opt(*arg*)
    , type0opt(*res*), t0erm) // Y(lam f.lam x.<body>)
//
where
t0dclist = mylist(t0dcl)
and
t0ermlst = mylist(t0erm)
and
t0ermopt = myoptn(t0erm)

(* ****** ****** *)

datatype p0grm =
| P0GRM of (t0dclist, t0erm)

(* ****** ****** *)
//
fun
print_t0erm: print_type(t0erm)
fun
fprint_t0erm: fprint_type(t0erm)
//
overload print with print_t0erm
overload fprint with fprint_t0erm
//
fun
print_t0dcl: print_type(t0dcl)
fun
fprint_t0dcl: fprint_type(t0dcl)
//
overload print with print_t0dcl
overload fprint with fprint_t0dcl
//
fun
print_p0grm: print_type(p0grm)
fun
fprint_p0grm: fprint_type(p0grm)
//
overload print with print_p0grm
overload fprint with fprint_p0grm
//
(* ****** ****** *)
//
// Resolving binding/scoping issues
//
(* ****** ****** *)

abstype f1nam_type = ptr
typedef f1nam = f1nam_type
abstype x1nam_type = ptr
typedef x1nam = x1nam_type

(* ****** ****** *)

datatype
t1dcl =
  | T1DCL of (x1nam, t1erm)
and t1erm =
//
  | T1Mint of int
  | T1Mbool of bool
(*
  | T1Mfloat of double
*)
  | T1Mstring of string
//
  | T1Mvar of x1nam
  | T1Mlam of
    (x1nam, type0opt, t1erm)
  | T1Mapp of (t1erm, t1erm)
//
  | T1Mift of (t1erm, t1erm, t1ermopt)
//
  | T1Mopr of (opnam, t1ermlst)
//
  | T1Mtup of (t1erm, t1erm)
  | T1Mfst of t1erm | T1Msnd of t1erm
//
  | T1Mann of (t1erm, type0) // type-annotation
//
  | T1Mlet of
    (t1dclist(*local*), t1erm(*scope*)) // local bindings
//
  | T1Mfix of
    ( f1nam(*f*)
    , x1nam(*x*)
    , type0opt(*arg*)
    , type0opt(*res*), t1erm) // Y(lam f.lam x.<body>)
//
where
t1dclist = mylist(t1dcl)
and
t1ermlst = mylist(t1erm)
and
t1ermopt = myoptn(t1erm)

(* ****** ****** *)
datatype p1grm =
| P1GRM of (t1dclist, t1erm)
(* ****** ****** *)
//
fun
print_t1erm: print_type(t1erm)
fun
fprint_t1erm: fprint_type(t1erm)
//
overload print with print_t1erm
overload fprint with fprint_t1erm
//
fun
print_t1dcl: print_type(t1dcl)
fun
fprint_t1dcl: fprint_type(t1dcl)
//
overload print with print_t1dcl
overload fprint with fprint_t1dcl
//
fun
print_p1grm: print_type(p1grm)
fun
fprint_p1grm: fprint_type(p1grm)
//
overload print with print_p1grm
overload fprint with fprint_p1grm
//
(* ****** ****** *)

fun trans01_decl : t0dcl -> t1dcl
fun trans01_term : t0erm -> t1erm
fun trans01_pgrm : p0grm -> p1grm

(* ****** ****** *)

abstype t2erm_type = ptr
typedef t2erm = t2erm_type

(*
absimpl
t2erm_type =
$rec{
  t2erm_type= type
, t2erm_node= t2erm_node
}
*)

(* ****** ****** *)

datatype
t2dcl =
  | T2DCL of (x1nam, t2erm)
and t2erm_node =
//
  | T2Mint of int
  | T2Mbool of bool
(*
  | T2Mfloat of double
*)
  | T2Mstring of string
//
  | T2Mvar of x1nam
  | T2Mlam of
    (x1nam, type0opt, t2erm)
  | T2Mapp of (t2erm, t2erm)
//
  | T2Mift of (t2erm, t2erm, t2ermopt)
//
  | T2Mopr1 of (opnam, t2erm)
  | T2Mopr2 of (opnam, t2erm, t2erm)
//
  | T2Mtup of (t2erm, t2erm)
  | T2Mfst of t2erm | T2Msnd of t2erm
//
  | T2Mann of (t2erm, type0) // type-annotation
//
  | T2Mlet of
    (t2dclist(*local*), t2erm(*scope*)) // local bindings
//
  | T2Mfix of
    ( f1nam(*f*)
    , x1nam(*x*)
    , type0opt(*arg*)
    , type0opt(*res*), t2erm) // Y(lam f.lam x.<body>)
//
  | T2Mcast of (t2erm, type0) // for internalization of type-errors
//
where
t2dclist = mylist(t2dcl)
and
t2ermlst = mylist(t2erm)
and
t2ermopt = myoptn(t2erm)

(* ****** ****** *)
datatype p2grm =
| P2GRM of (t2dclist, t2erm)
(* ****** ****** *)
//
fun
project_main0
{n:int | n >= 1}(int(n), !argv(n)): void
//
(* ****** ****** *)

(* end of [project.sats] *)
