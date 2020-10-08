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

#dynload "./lambda2_type.dats"
#dynload "./lambda2_term.dats"
#dynload "./lambda2_senv.dats"
#dynload "./lambda2_tcheck.dats"

(* ****** ****** *)

implement main0() = ((*dummy*))

(* ****** ****** *)

val () =
println!("Hello from [lambda2]!")

(* ****** ****** *)

val tm1 = T0Mint(0)
val tm2 = T0Manno(tm1, T0Pstring)
val tp2 = t0erm_tcheck0(tm2)
val ( ) = println!("tp2 = ", tp2)

(* ****** ****** *)

(* end of [lambda2_main.dats] *)
