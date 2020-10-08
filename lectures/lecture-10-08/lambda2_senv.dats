(* ****** ****** *)
#staload "./lambda2.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

implement
senv_extend
(env, x0, tp) =
let
val+
SENV(xts) = env
in
SENV(mylist_cons((x0, tp), xts))
end // end of [envir_extend]

(* ****** ****** *)

implement
senv_search
(senv, x0) =
(
  auxlst(xts)
) where
{
val+
SENV(xts) = senv
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
} (*where*) // end of [senv_search]

(* ****** ****** *)

(* end of [lambda2_senv.dats] *)
