(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
#staload "./../../mylib/mylib.dats"
(*
#staload "./../../mylib2/mylib2.sats"
#staload "./../../mylib2/mylib2.dats"
*)
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)

val opt0 = myoptn_none{int}()
val opt1 = myoptn_some{int}(100)

(* ****** ****** *)
implement main0() =
(
println!("opt0 = ", opt0);
println!("opt1 = ", opt1);
)
(* ****** ****** *)

(* end of [myoptn.dats] *)
