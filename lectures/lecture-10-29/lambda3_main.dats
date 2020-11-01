(* ****** ****** *)
#staload "./lambda3.sats"
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
#staload
"./../../mylib/mylib.dats"
(* ****** ****** *)

#dynload "./lambda3_stamp.dats"
#dynload "./lambda3_type0.dats"
#dynload "./lambda3_t0erm.dats"
#dynload "./lambda3_tpext.dats"
#dynload "./lambda3_type1.dats"
#dynload "./lambda3_t1var.dats"
#dynload "./lambda3_t1erm.dats"

(* ****** ****** *)

implement main0() = ((*dummy*))

(* ****** ****** *)

val () =
println!("Hello from [lambda3]!")

(* ****** ****** *)

(* end of [lambda3_main.dats] *)
