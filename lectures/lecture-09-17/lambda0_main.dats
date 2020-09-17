(* ****** ****** *)
#staload "./lambda0.sats"
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
#staload
"./../../mylib/mylib.dats"
(* ****** ****** *)

#dynload "./lambda0_print.dats"
#dynload "./lambda0_interp.dats"

(* ****** ****** *)

implement
t0erm_size(t0) =
( // not-tail-recursive
case+ t0 of
| T0Mint _ => 1
| T0Mvar _ => 1
| T0Mlam(_, t1) =>
  1 + t0erm_size(t1)
| T0Mapp(t1, t2) =>
  1 + t0erm_size(t1) + t0erm_size(t2)
| T0Mopr2(opr, t1, t2) =>
  1 + t0erm_size(t1) + t0erm_size(t2)
)

(* ****** ****** *)

(*
// concrete syntax
K == lam x => lam y => y
*)
val K =
T0Mlam("x", T0Mlam("y", T0Mvar("x")))

(* ****** ****** *)

(*
// concrete syntax
S ==
lam x =>
lam y => lam z => (x(z))(y(z))
*)
val S =
T0Mlam("x",
T0Mlam("y", 
T0Mlam("z",
T0Mapp(
T0Mapp(T0Mvar("x"), T0Mvar("z"))
,
T0Mapp(T0Mvar("y"), T0Mvar("z"))
)
)
)
)

(* ****** ****** *)

implement
main0() =
{
val () =
println!
("Hello from [lambda0]!")
//
val () =
println!
("size(K) = ", t0erm_size(K))
//
val () =
println!
("size(S) = ", t0erm_size(S))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [lambda0.dats] *)
