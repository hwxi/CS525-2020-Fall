(* ****** ****** *)
#staload "./project.sats"
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
#staload
"./../../mylib/mylib.dats"
(* ****** ****** *)

implement
s0env_nil() =
S0ENV(mylist_nil())

implement
s0env_extend
(env, x0, tm) =
let
val+
S0ENV(xts) = env
in
S0ENV(mylist_cons((x0, tm), xts))
end // end of [s0env_extend]

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
  @(t0var, t1erm)
) : myoptn(t1erm) =
(
case+ xts of
|
mylist_nil() =>
myoptn_nil()
|
mylist_cons(xt1, xts) =>
if
(x0 = xt1.0)
then
myoptn_cons(xt1.1) else auxlst(xts)
)
} (*where*) // end of [s0env_search]

(* ****** ****** *)

(* end of [project_s0env.dats] *)
