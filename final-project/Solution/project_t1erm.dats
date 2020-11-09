(* ****** ****** *)
#staload "./project.sats"
(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
#staload
"./../../mylib/mylib.dats"
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)

implement
fprint_val<t1erm> = fprint_t1erm
implement
fprint_val<t1dcl> = fprint_t1dcl

(* ****** ****** *)

implement
print_t1erm
(t1m) =
fprint_t1erm(stdout_ref, t1m)

implement
fprint_t1erm
(out, t1m) =
(
case- t1m of
| T1Mvar(t1v) =>
  fprint!(out, "T1Mvar(", t1v, ")")
)

(* ****** ****** *)

implement
print_t1dcl
(dcl) =
fprint_t1dcl(stdout_ref, dcl)

implement
fprint_t1dcl
(out, dcl) =
(
case- dcl of
|
T1DCL(t1v, t1m) =>
fprint!
(out, "T1DCL(", t1v, "; ", t1m, ")")
) (* end of [fprint_t1dcl] *)

(* ****** ****** *)

implement
print_t1pgm(pgm) =
fprint_t1pgm(stdout_ref, pgm)

implement
fprint_t1pgm
(out, pgm) =
(
case+ pgm of
|
T1PGM(dcls, t1m1) =>
fprint!
(out, "T1PGM(", dcls, "; ", t1m1, ")")
)

(* ****** ****** *)

(* end of [project_t1erm.dats] *)
