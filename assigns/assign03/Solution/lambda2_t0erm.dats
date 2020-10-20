(* ****** ****** *)
#staload "./lambda2.sats"
(* ****** ****** *)
#staload
"./../../../mylib/mylib.sats"
#staload _ =
"./../../../mylib/mylib.dats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

implement
fprint_val<type0> = fprint_type0
implement
fprint_val<t0erm> = fprint_t0erm

(* ****** ****** *)

implement
print_t0erm(tm) =
fprint_t0erm(stdout_ref, tm)

(* ****** ****** *)

implement
fprint_t0erm
(out, tm) =
(
case+ tm of
| T0Mnil() =>
  fprint!(out, "T0Mnil(", ")")
//
| T0Mint(x0) =>
  fprint!(out, "T0Mint(", x0, ")")
| T0Mstr(x0) =>
  fprint!(out, "T0Mstr(", x0, ")")
//
| T0Mvar(x0) =>
  fprint!(out, "T0Mvar(", x0, ")")
//
| T0Mlam(x0, tp1, tm2) =>
  fprint!
  ( out
  , "T0Mlam(", x0, "; ", tp1, "; ", tm2, ")")
| T0Mapp(tm1, tm2) =>
  fprint!(out, "T0Mapp(", tm1, "; ", tm2, ")")
//
| T0Mlet(x0, tm1, tm2) =>
  fprint!
  ( out
  , "T0Mlet(", x0, "; ", tm1, "; ", tm2, ")")
//
| T0Mfix1(f0, tp1, tm2) =>
  fprint!
  ( out
  , "T0Mfix1(", f0, "; ", tp1, "; ", tm2, ")")
//
| T0Mfst(tup) =>
  fprint!(out, "T0Mfst(", tup, ")")
| T0Msnd(tup) =>
  fprint!(out, "T0Msnd(", tup, ")")
| T0Mtup(tm1, tm2) =>
  fprint!(out, "T0Mtup(", tm1, "; ", tm2, ")")
//
| T0Mopr1(opr, tm1) =>
  fprint!(out, "T0Mopr1(", opr, "; ", tm1, ")")
| T0Mopr2(opr, tm1, tm2) =>
  fprint!
  ( out
  , "T0Mopr2(", opr, "; ", tm1, "; ", tm2, ")")
(*
| T0Moprs(opr, tms) =>
  fprint!(out, "T0Moprs(", opr, "; ", tms, ")")
*)
//
| T0Manno(tm1, tp2) =>
  fprint!(out, "T0Manno(", tm1, "; ", tp2, ")")
//
| T0Mcond(tm1, tm2, tm3) =>
  fprint!
  ( out
  , "T0Mcond(", tm1, "; ", tm2, "; ", tm3, ")")
//
)

(* ****** ****** *)

(* end of [lambda2_t0erm.dats] *)
