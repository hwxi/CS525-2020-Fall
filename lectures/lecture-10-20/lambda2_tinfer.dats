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
s0env_nil =
S0ENV(mylist_nil())

(* ****** ****** *)

implement
t0erm_tinfer0(prog) =
t0erm_tinfer1(prog, s0env_nil)

(* ****** ****** *)

implement
t0erm_tinfer1
  (tm0, env) =
let
//
fun
tinfer1
(tm: t0erm): type0 =
t0erm_tinfer1(tm, env)
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
opt = s0env_search(env, x0)
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
  val tp1 = tinfer1(tm1)
  val tp2 = tinfer1(tm2)
}
//
|
T0Mlam
(x0, to1, tm2) =>
let
  val
  tp1 =
  (
  case+ to1 of
  | myoptn_nil() =>
    tpext_new()
  | myoptn_cons(tp1) => tp1
  ) : type0 // end-of-val
  val
  env = s0env_extend(env, x0, tp1)
  val tp2 = t0erm_tinfer1(tm2, env)
in
  T0Pfun(tp1, tp2)
end
//
|
T0Mapp(tm1, tm2) =>
let
  val tp1 = tinfer1(tm1)
  val tp2 = tinfer1(tm2)
//
// tm1 should be a function!
//
  val-true = tunify
  ( tp1
  , T0Pfun
    (tpext_new(), tpext_new())
  )
  val-T0Pfun(targ, tres) = tp1
  val-true = tunify(targ, tp2)
  in
    tres
  end
//
|
T0Manno(tm1, tp2) =>
let
  val tp1 = tinfer1(tm1)
(*
  val ( ) = println!("tp1 = ", tp1)
  val ( ) = println!("tp2 = ", tp2)
*)
  val-true = tunify(tp1, tp2)
in
  tp2
end
//
end // end of [let]

(* ****** ****** *)

(* end of [lambda2_tinfer.dats] *)
