(* ****** ****** *)
#staload "./lambda2.sats"
(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
#staload _ =
"./../../mylib/mylib.dats"
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

local

fun
auxtype
( tp1: type0
, tp2: type0): bool =
(
case- tp1 of
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
  | T0Pfun(tp21, tp22) =>
    tunify(tp11, tp21) && tunify(tp12, tp22) | _ => false
)
|
T0Ptup(tp11, tp12) =>
(
  case+ tp2 of
  | T0Ptup(tp21, tp22) =>
    tunify(tp11, tp21) && tunify(tp12, tp22) | _ => false
)
) (* end of [auxtype] *)

in

implement
tunify(tp1, tp2) =
(
case+ tp1 of
|
T0Pext(X1) =>
(
case
X1.get() of
| myoptn_nil() => 
  true where
  {
    val () = X1.set(tp2)
  }
| myoptn_cons(tp1) => tunify(tp1, tp2)
)
| _(*non-T0Pext*) =>
(
case+ tp2 of
|
T0Pext(X2) =>
(
case
X2.get() of
| myoptn_nil() => 
  true where
  {
    val () = X2.set(tp1)
  }
| myoptn_cons(tp2) => tunify(tp1, tp2)
)
| _(* non-T0Pext *) => auxtype(tp1, tp2)
)
) (* end of [tunify] *)

end // end of [local]

(* ****** ****** *)

(*
implement
eq_type0_type0
(tp1, tp2) =
(
case- tp1 of
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
*)

(* ****** ****** *)

implement
fprint_val<type0> =  fprint_type0

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
  fprint!
  (out, "T0Pfun(", tp1, ", ", tp2, ")")
| T0Ptup(tp1, tp2) =>
  fprint!
  (out, "T0Ptup(", tp1, ", ", tp2, ")")
| T0Pext(X0) =>
  fprint!(out, "T0Pext(", X0.get(), ")")
)

(* ****** ****** *)

(* end of [lambda2_type0.dats] *)