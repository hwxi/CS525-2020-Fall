(* ****** ****** *)
#staload "./lambda3.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

implement
print_t0erm(tm) =
fprint_t0erm
(stdout_ref, tm)

(* ****** ****** *)

implement
fprint_t0erm
(out, tm) =
(
case- tm of
| T0Mvar(x0) =>
  fprint!(out, "T0Mvar(", x0, ")")
)

(* ****** ****** *)

(* end of [lambda3_t0erm.dats] *)
