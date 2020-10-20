(* ****** ****** *)
#staload "./lambda2.sats"
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../../../mylib/mylib.sats"
#staload
"./../../../mylib/mylib.dats"
(* ****** ****** *)

val
s0env_nil =
S0ENV(mylist_nil())

(* ****** ****** *)

implement
t0erm_tcheck0(prog) =
t0erm_tcheck1(prog, s0env_nil)

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
(*
val () =
println!
("t0erm_tcheck1: tm0 = ", tm0)
*)
//
in
case- tm0 of
|
T0Mint(_) => T0Pint
|
T0Mstr(_) => T0Pstr
//
|
T0Mvar(x0) =>
let
val
opt = s0env_search(senv, x0)
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
  s0env_extend
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
T0Mlet
(x0, tm1, tm2) =>
let
  val
  tp1 =
  tcheck1(tm1)
  val
  senv =
  s0env_extend
  (senv, x0, tp1)
in
  t0erm_tcheck1(tm2, senv)
end
//
|
T0Mfix1
(f0, tp1, tm2) =>
let
val-true = (tp1 = tp2) in tp1
end where
{
  val
  senv =
  s0env_extend
  (senv, f0, tp1)
  val tp2 =
  t0erm_tcheck1(tm2, senv)
}
//
|
T0Mopr1
(opr, tm1) =>
let
val tp1 = tcheck1(tm1)
in
case- opr of
|
"!" =>
let
val-true= (T0Pbtf=tp1) in T0Pbtf
end
|
"-" =>
let
val-true= (T0Pint=tp1) in T0Pint
end
end // end of [T0Mopr1]
|
T0Mopr2
(opr, tm1, tm2) =>
let
val tp1 = tcheck1(tm1)
val tp2 = tcheck1(tm2)
in
//
case- opr of
|
"+" =>
let
val-true= (T0Pint=tp1)
val-true= (T0Pint=tp2) in T0Pint
end
|
"-" =>
let
val-true= (T0Pint=tp1)
val-true= (T0Pint=tp2) in T0Pint
end
|
"*" =>
let
val-true= (T0Pint=tp1)
val-true= (T0Pint=tp2) in T0Pint
end
|
"/" =>
let
val-true= (T0Pint=tp1)
val-true= (T0Pint=tp2) in T0Pint
end
|
">" =>
let
val-true= (T0Pint=tp1)
val-true= (T0Pint=tp2) in T0Pbool
end
|
"<" =>
let
val-true= (T0Pint=tp1)
val-true= (T0Pint=tp2) in T0Pbool
end
|
"=" =>
let
val-true= (T0Pint=tp1)
val-true= (T0Pint=tp2) in T0Pbool
end
|
">=" =>
let
val-true= (T0Pint=tp1)
val-true= (T0Pint=tp2) in T0Pbool
end
|
"<=" =>
let
val-true= (T0Pint=tp1)
val-true= (T0Pint=tp2) in T0Pbool
end
|
"==" =>
let
val-true= (T0Pint=tp1)
val-true= (T0Pint=tp2) in T0Pbool
end
|
"!=" =>
let
val-true= (T0Pint=tp1)
val-true= (T0Pint=tp2) in T0Pbool
end
//
end // end of [T0Mopr2]
//
|
T0Mfst(tup) =>
let
val tp0 = tcheck1(tup)
in
case- tp0 of
| T0Ptup(tp1, _) => tp1
end
|
T0Msnd(tup) =>
let
val tp0 = tcheck1(tup)
in
case- tp0 of
| T0Ptup(_, tp2) => tp2
end
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
end // end of [T0Manno]
//
|
T0Mcond
(tm1, tm2, opt) =>
let
val-true =
(T0Pbool = tp1)
val-true = (tp2 = tp3) in tp2
end where
{
  val tp1 = tcheck1(tm1)
  val tp2 = tcheck1(tm2)
  val tp3 =
  (
  case+ opt of
  | myoptn_nil() => T0Pnil
  | myoptn_cons(tm3) => tcheck1(tm3)
  ) : type0 // end-of-val
}
//
end // end of [let]

(* ****** ****** *)

(* end of [lambda2_typeck.dats] *)
