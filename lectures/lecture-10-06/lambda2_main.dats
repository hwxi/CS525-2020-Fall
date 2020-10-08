(* ****** ****** *)
#staload "./lambda1.sats"
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

(* ****** ****** *)

implement main0() = ((*dummy*))

(* ****** ****** *)

val () =
println!("Hello from [lambda2]!")

(* ****** ****** *)

(* end of [lambda2_main.dats] *)
