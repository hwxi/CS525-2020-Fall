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

#dynload "./lambda2_type0.dats"
#dynload "./lambda2_tpext.dats"
#dynload "./lambda2_t0erm.dats"
#dynload "./lambda2_s0env.dats"
#dynload "./lambda2_tinfer.dats"

(* ****** ****** *)

implement main0() = ((*dummy*))

(* ****** ****** *)

val () =
println!("Hello from [lambda2]!")

(* ****** ****** *)

val tm1 = T0Mint(0)
val tm2 = T0Manno(tm1, T0Pint)
val tp2 = t0erm_tinfer0(tm2)
val ( ) = println!("tp2 = ", tp2)

(* ****** ****** *)

val tm3 =
T0Mlam("x", myoptn_nil(), T0Manno(T0Mvar("x"), T0Pint))
val tp3 = t0erm_tinfer0(tm3)
val ( ) = println!("tp3 = ", tp3)

(* ****** ****** *)

(* end of [lambda2_main.dats] *)
