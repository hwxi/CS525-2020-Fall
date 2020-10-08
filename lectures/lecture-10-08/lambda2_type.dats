(* ****** ****** *)
#staload "./lambda2.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

implement
T0Pint = T0Pbas("int")
implement
T0Pbool = T0Pbas("bool")
implement
T0Pstring = T0Pbas("string")

(* ****** ****** *)

implement
eq_type0_type0
(tp1, tp2) =
(
case+ tp1 of
|
T0Pbas(nm1) =>
(
  case+ tp2 of
  | T0Pbas(nm2) => (nm1 = nm2) | _ => false
)
|
T0Pfun(tp11, tp12) =>
(
  case+ tp2 of
  | T0Pfun(tp21, tp22) => (tp11 = tp21) && (tp12 = tp22) | _ => false
)
|
T0Ptup(tp11, tp12) =>
(
  case+ tp2 of
  | T0Ptup(tp21, tp22) => (tp11 = tp21) && (tp12 = tp22) | _ => false
)
)

(* ****** ****** *)

implement
print_type0(tp) =
fprint_type0
(stdout_ref, tp)
implement
fprint_type0(out, tp) =
(
case+ tp of
| T0Pbas(nm) =>
  fprint!(out, "T0Pbas(", nm, ")")
| T0Pfun(tp1, tp2) =>
  fprint!(out, "T0Pfun(", tp1, ", ", tp2, ")")
| T0Ptup(tp1, tp2) =>
  fprint!(out, "T0Ptup(", tp1, ", ", tp2, ")")
)

(* ****** ****** *)

(* end of [lambda2_type.dats] *)