(* ****** ****** *)
staload "./lambda2.sats"
#staload
"./../../mylib/mylib.sats"
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)

absimpl
tpext_type = ref(myoptn(type0))

(* ****** ****** *)

implement
tpext_get(X) = X[]
implement
tpext_set(X, tp) =
(X[] := myoptn_cons(tp))

(* ****** ****** *)

implement
tpext_new() =
T0Pext(ref<topt0>(myoptn_nil()))

(* ****** ****** *)

(* end of [lambda2_tpext.dats] *)


