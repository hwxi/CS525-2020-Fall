(* ****** ****** *)
#staload "./lambda2.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

implement
s0env_extend
(env, x0, tp) =
let
val+
S0ENV(xts) = env
in
S0ENV(mylist_cons((x0, tp), xts))
end // end of [envir_extend]

(* ****** ****** *)

implement
s0env_search
(env, x0) =
(
  auxlst(xts)
) where
{
val+
S0ENV(xts) = env
fun
auxlst
( xts
: mylist
  @(t0var, type0)
) : myoptn(type0) =
(
case+ xts of
| mylist_nil() =>
  myoptn_nil()
| mylist_cons(xt1, xts) =>
  if x0 = xt1.0
  then myoptn_cons(xt1.1) else auxlst(xts)
)
} (*where*) // end of [s0env_search]

(* ****** ****** *)

(* end of [lambda2_s0env.dats] *)
