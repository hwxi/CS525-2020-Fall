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

val
senv_nil =
SENV(mylist_nil())

(* ****** ****** *)

implement
t0erm_tcheck0(prog) =
t0erm_tcheck1(prog, senv_nil)

(* ****** ****** *)

implement
t0erm_tcheck1
  (tm0, senv) =
let
//
fun
tcheck1
(tm: t0erm): type0 =
t0erm_tcheck1(tm, senv)
//
in
case- tm0 of
|
T0Mint(_) => T0Pint
//
|
T0Mvar(x0) =>
let
val
opt = senv_search(senv, x0)
//
in
case- opt of myoptn_cons(tp) => tp
end // end of [T0Mvar]
//
|
T0Mtup(tm1, tm2) =>
(
T0Ptup(tp1, tp2)
) where
{
  val tp1 = tcheck1(tm1)
  val tp2 = tcheck1(tm2)
}
//
|
T0Mlam
(x0, tp1, tm2) =>
let
  val
  senv =
  senv_extend
  (senv, x0, tp1)
  val tp2 =
  t0erm_tcheck1(tm2, senv)
in
  T0Pfun(tp1, tp2)
end
//
|
T0Mapp(tm1, tm2) =>
let
  val tp1 = tcheck1(tm1)
  val tp2 = tcheck1(tm2)
  val-T0Pfun(targ, tres) = tp1 // tm1 should be a function!
  val-true = eq_type0_type0(targ, tp2)
  in
    tres
  end
//
|
T0Manno(tm1, tp2) =>
let
  val tp1 = tcheck1(tm1)
(*
  val ( ) = println!("tp1 = ", tp1)
  val ( ) = println!("tp2 = ", tp2)
*)
  val-true = eq_type0_type0(tp1, tp2)
in
  tp2
end
//
end // end of [let]

(* ****** ****** *)
////

implement
t0erm_typeck0
  (env?. prog) =
(
case+ prog of
| T0Mint(_) => T0Pint
//
| T0Mvar(x0) =>
//
//
)

(* ****** ****** *)

(* end of [lambda2_typeck.dats] *)
