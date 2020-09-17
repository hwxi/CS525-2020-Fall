(* ****** ****** *)
#staload "./lambda0.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)
(*
//
(*
subst(t0, x0, sub) returns the
term obtained from replacing with
'sub' each free occurrence of x0 in t0
*)
(*
For instance,
subst(app(x, x), x, 5+5) = app(5+5, 5+5)
subst(lam x => app(x, x), x, 5+5) = lam x => app(x, x)
*)
//
*)
(* ****** ****** *)
extern
fun
t0erm_subst
( t0: t0erm
, x0: t0var
, sub: t0erm): t0erm
(* ****** ****** *)

implement
t0erm_subst
(t0, x0, sub) =
( // not-tail-recursive
case+ t0 of
//
| T0Mint _ => t0
//
| T0Mvar(x1) =>
  if
  (x0 = x1)
  then sub else t0
//
| T0Mlam(x1, t1) =>
  if (x0 = x1)
  then t0
  else
  T0Mlam
  ( x1
  , t0erm_subst(t1, x0, sub))
//
| T0Mapp(t1, t2) =>
  T0Mapp
  ( t0erm_subst(t1, x0, sub)
  , t0erm_subst(t2, x0, sub))
//
| T0Mopr2(opr, t1, t2) =>
  T0Mopr2
  ( opr
  , t0erm_subst(t1, x0, sub)
  , t0erm_subst(t2, x0, sub))
)

(* ****** ****** *)

implement
t0erm_interp(t0) =
(
case+ t0 of
| T0Mint _ => t0
| T0Mlam _ => t0
| T0Mapp(t1, t2) =>
  let
    val t1 = t0erm_interp(t1)
    val t2 = t0erm_interp(t2)
  in
    case+ t1 of
    | T0Mlam(x0, t1) =>
      t0erm_interp
      (t0erm_subst(t1, x0, t2))
    | _ (* non-T0Mlam *) => T0Mapp(t1, t2)
  end
| T0Mvar _ => t0 // ERROR!!! // to be dealt with later
//
|
T0Mopr2(opr, t1, t2) =>
let
  val t1 = t0erm_interp(t1)
  val t2 = t0erm_interp(t2)
in
  case+ opr of
  | "+" =>
    let
    val-T0Mint(i1) = t1
    val-T0Mint(i2) = t2 in T0Mint(i1 + i2)
    end
  | "-" =>
    let
    val-T0Mint(i1) = t1
    val-T0Mint(i2) = t2 in T0Mint(i1 - i2)
    end
  | "*" =>
    let
    val-T0Mint(i1) = t1
    val-T0Mint(i2) = t2 in T0Mint(i1 * i2)
    end
  | _ (* else *) =>
    let
      val () =
      println!
      ("t0erm_interp: opr = ", opr)
      val () = assertloc(false) in exit(1)
    end
end
//
)

(* ****** ****** *)
val () = println!("[lambda0_interp] is loaded")
(* ****** ****** *)

(* end of [lambda0_interp.dats] *)

