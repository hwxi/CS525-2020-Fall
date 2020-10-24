(* ****** ****** *)
#staload
"./../midterm.sats"
(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)
//
implement
T0Pnil = T0Pbas("nil")
implement
T0Pint = T0Pbas("int")
//
implement
T0Pbool = T0Pbas("bool")
//
implement
T0Pstring = T0Pbas("string")
//
(* ****** ****** *)

implement
print_type0(tp) =
fprint_type0
(stdout_ref, tp)
implement
fprint_type0(out, tp) =
(
case- tp of
| T0Pbas(nm) =>
  fprint!(out, "T0Pbas(", nm, ")")
| T0Pfun(tp1, tp2) =>
  fprint!(out, "T0Pfun(", tp1, ", ", tp2, ")")
| T0Ptup(tp1, tp2) =>
  fprint!(out, "T0Ptup(", tp1, ", ", tp2, ")")
)

(* ****** ****** *)

(* end of [midterm_type0.dats] *)