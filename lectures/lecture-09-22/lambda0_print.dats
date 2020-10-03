(* ****** ****** *)
#staload "./lambda0.sats"
(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
#staload
_(*TMP*) =
"./../../mylib/mylib.dats"
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)

implement
fprint_val<t0erm> = fprint_t0erm

(* ****** ****** *)
implement
print_t0erm(t0) =
fprint_t0erm(stdout_ref, t0)
(* ****** ****** *)
implement
fprint_t0erm(out, t0) =
(
case+ t0 of
| T0Mint(i0) =>
  fprint!(out, "T0Mint(", i0, ")")
| T0Mvar(x0) =>
  fprint!(out, "T0Mvar(", x0, ")")
| T0Mlam(x0, t0) =>
  fprint!
  (out, "T0Mlam(", x0, "; ", t0, ")")
| T0Mapp(t1, t2) =>
  fprint!
  (out, "T0Mapp(", t1, "; ", t2, ")")
//
| T0Mbool(btf) =>
  fprint!
  ( out
  , "T0Mbool(", btf, ")")
| T0Mopr1(x0, t1) =>
  fprint!
  ( out
  , "T0Mopr1(", x0, "; ", t1, ")")
| T0Mopr2(x0, t1, t2) =>
  fprint!
  ( out
  , "T0Mopr2(", x0, "; ", t1, "; ", t2, ")")
| T0Moprs(x0, ts) =>
  fprint!
  (out, "T0Mopr2(", x0, "; ", ts, ")")
//
| T0Mcond(t1, t2, t3) =>
  fprint!
  ( out
  , "T0Mcond(", t1, "; ", t2, "; ", t3, ")")
//
)

(* ****** ****** *)
val () = println!("[lambda0_print] is loaded")
(* ****** ****** *)

(* end of [lambda0_print.dats] *)

