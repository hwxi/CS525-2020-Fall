(* ****** ****** *)
#staload "./project.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

implement
T1Pnil = T1Pbas("nil")
implement
T1Pint = T1Pbas("int")
implement
T1Pbool = T1Pbas("bool")
implement
T1Pstring = T1Pbas("string")

(* ****** ****** *)

implement
type1_new_ext() =
T1Pext(tpext_new())

(* ****** ****** *)

implement
print_type1(tm) =
fprint_type1(stdout_ref, tm)

(* ****** ****** *)

implement
fprint_type1
(out, tm) =
(
case- tm of
| T1Pbas(nam) =>
  fprint!
  (out, "T1Pbas(", nam, ")")
)

(* ****** ****** *)

(* end of [project_type1.dats] *)
