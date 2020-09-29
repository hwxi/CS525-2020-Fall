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

#dynload "./lambda1_print.dats"
#dynload "./lambda1_interp.dats"

(* ****** ****** *)

implement
main0() =
{
//
val () =
println!("Hello from [lambda1]!")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [lambda1.dats] *)
