(* ****** ****** *)
#staload "./lambda2.sats"
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
#staload
"./../../mylib/mylib.dats"
(* ****** ****** *)

implement main0() = ((*dummy*))

(* ****** ****** *)

val () =
println!("Hello from [lambda2]!")

(* ****** ****** *)

val T0Pint = T0Pbas("int")

extern
fun
eq_type0_type0
(tp1: type0, tp2: type0): bool
overload = with eq_type0_type0

(*
fun
t0erm_typeck0(prog: t0erm): type0
*)
implement
t0erm_typeck0
  (env?. prog) =
(
case+ prog of
| T0Mint(_) => T0Pint
//
| T0Mvar(x0) =>
//
| T0Mtup(tm1, tm2) =>
  let
  val tp1 = t0erm_typeck0(tm1)
  val tp2 = t0erm_typeck0(tm2)
  in
    T0Ptup(tp1, tp2)
  end
//
| T0Mlam
  (arg, tp1, tm2) =>
  let
  val tp2 = t0erm_typeck0(tm2)
  in
    T0Pfun(tp1, tp2)
  end
//
| T0Mapp(tm1, tm2) =>
  let
  val tp1 = t0erm_typeck0(tm1)
  val tp2 = t0erm_typeck0(tm2)
  val-T0Pfun(targ, tres) = tp1 // tm1 should be a function!
  val-true = (targ = tp2)
  in
    tres
  end
)

(* ****** ****** *)

(* end of [lambda2_typeck.dats] *)
