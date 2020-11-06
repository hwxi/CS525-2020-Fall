(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
(* ****** ****** *)
#staload _ =
"./../../mylib/mylib.dats"
(* ****** ****** *)
#staload "./project.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

implement
fprint_val<t0erm> = fprint_t0erm

(* ****** ****** *)

implement
print_t0erm(tm) =
fprint_t0erm(stdout_ref, tm)
implement
print_t0dcl(tm) =
fprint_t0dcl(stdout_ref, tm)

(* ****** ****** *)

implement
fprint_t0erm
(out, tm0) =
(
case- tm0 of
| T0Mvar(x0) =>
  fprint!(out, "T0Mvar(", x0, ")")
| T0Mtup(tms) =>
  fprint!(out, "T0Mtms(", tms, ")")
)

(* ****** ****** *)

implement
fprint_t0dcl
(out, tdcl) =
(
case+ tdcl of
| T0DCL(x0, def) =>
  fprint!
  (out, "T0DCL(", x0, ", ", def, ")")
)

(* ****** ****** *)

(* end of [project_t0erm.dats] *)
