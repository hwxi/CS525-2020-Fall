(* ****** ****** *)
#staload "./lambda3.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
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

(* end of [lambda3_type1.dats] *)
