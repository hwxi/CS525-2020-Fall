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
(*
#staload "./lambda0_fvset.dats"
*)
(* ****** ****** *)

#dynload "./lambda0_print.dats"
#dynload "./lambda0_interp.dats"

(* ****** ****** *)

(*
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
*)

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

val bt = T0Mbool(true)
val bf = T0Mbool(false)
val neg_bt = T0Mopr1("~", bt)
val neg_bf = T0Mopr1("~", bf)

(*
fneg =
lam(x) =>
if x then false else true
*)
val fneg =
let
val x = T0Mvar("x")
in
T0Mlam("x", T0Mcond(x, bf, bt))
end

val fb2i =
let
val x = T0Mvar("x")
in
T0Mlam
("x", T0Mcond(x, T0Mint(1), T0Mint(0)))
end

(* ****** ****** *)

(*
fdouble = lam x => x + x
*)
val
fdouble =
let
val x = T0Mvar("x")
in
T0Mlam("x", T0Mopr2("+", x, x))
end

(* ****** ****** *)

implement
main0() =
{
val () =
println!
("Hello from [lambda0]!")
//
(*
val () =
println!
("size(K) = ", t0erm_size(K))
val () =
println!
("size(S) = ", t0erm_size(S))
*)
//
val () =
println!
("interp(", neg_bt, ") = ", t0erm_interp(neg_bt))
val () =
println!
("interp(", neg_bf, ") = ", t0erm_interp(neg_bf))
//
val () =
println!
("interp(fneg(", bt, ")) = ", t0erm_interp(T0Mapp(fneg, bt)))
val () =
println!
("interp(fb2i(", bt, ")) = ", t0erm_interp(T0Mapp(fb2i, bt)))
//
val () =
println!
("interp(fdouble(10)) = ", t0erm_interp(T0Mapp(fdouble, T0Mint(10))))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [lambda0.dats] *)
