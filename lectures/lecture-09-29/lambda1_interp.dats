(* ****** ****** *)
#staload "./lambda1.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

val
the_envir_nil =
ENVIR(mylist_nil())

(* ****** ****** *)

implement
t0erm_eval0(prog) =
t0erm_eval1(prog, the_envir_nil)

(* ****** ****** *)

extern
fun
envir_extend
(envir, t0var, value): envir

local

fun
aux_app
( t0m1: t0erm
, env2: envir): value =
let
//
val-
T0Mapp
(tfun, targ) = t0m1
//
val vfun =
t0erm_eval1(tfun, env2)
val varg =
t0erm_eval1(targ, env2)
//
in
case- vfun of
|
VALclo(tlam, elam) =>
let
val-
T0Mlam(x0, body) = tlam
in
  t0erm_eval1
  ( body
  , envir_extend(elam, x0, varg))
end
  
end // end of [aux_app]

in (* in-of-local *)

implement
t0erm_eval1
(t0m1, env2) =
(
case+ t0m1 of
//
| T0Mint(i0) =>
  VALint(i0)
| T0Mbtf(i0) =>
  VALbtf(i0)
| T0Mlam _ =>
  VALclo(t0m1, env2)
//
| T0Mapp _ =>
  aux_app(t0m1, env2)
//
| _ (* else *) =>
let
val () =
println!
("t0erm_eval1: t0m1 = ", t0m1)
in
  assertloc(false); exit(1)
end
)

end // end of [local]

(* ****** ****** *)

(* end of [lambda1_interp.dats] *)

