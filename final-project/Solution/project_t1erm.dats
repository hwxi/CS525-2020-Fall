(* ****** ****** *)
#staload "./project.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

implement
print_t1erm(tm) =
fprint_t1erm
(stdout_ref, tm)

(* ****** ****** *)

implement
fprint_t1erm
(out, tm) =
(
case- tm of
| T1Mvar(x0) =>
  fprint!(out, "T1Mvar(", x0, ")")
)

(* ****** ****** *)

(* end of [project_t1erm.dats] *)
