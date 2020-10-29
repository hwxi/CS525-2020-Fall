(* ****** ****** *)
#staload "./lambda3.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

implement
print_tpext(X0) =
fprint_tpext(stdout_ref, X0)

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

(* end of [lambda3_tpext.dats] *)
