(* ****** ****** *)
#staload "./lambda3.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

implement
print_type0(tm) =
fprint_type0
(stdout_ref, tm)

(* ****** ****** *)

implement
fprint_type0
(out, tm) =
(
case- tm of
| T0Pbas(nam) =>
  fprint!
  (out, "T0Pbas(", nam, ")")
)

(* ****** ****** *)

(* end of [lambda3_type0.dats] *)
