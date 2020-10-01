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

implement main0() = ((*dummy*))

(* ****** ****** *)

val () =
println!("Hello from [lambda1]!")

(* ****** ****** *)

val
fact =
let
val f = T0Mvar("f")
val x = T0Mvar("x")
in
T0Mfix1
(
"f"
,
T0Mlam("x",
T0Mcond(
T0Mopr2(">", x, T0Mint(0))
,
T0Mopr2("*", x, T0Mapp(f, T0Mopr2("-", x, T0Mint(1))))
,
T0Mint(1)
)
)
)
end // end of [let] // end of [val]

(* ****** ****** *)

val
fibo =
let
val f = T0Mvar("f")
val x = T0Mvar("x")
in
T0Mfix1
( "f",
T0Mlam("x",
T0Mcond(
T0Mopr2(">=", x, T0Mint(2))
,
T0Mopr2( "+"
       , T0Mapp(f, T0Mopr2("-", x, T0Mint(1)))
       , T0Mapp(f, T0Mopr2("-", x, T0Mint(2)))
       )
,
x // else-return
)
)
)
end // end of [let] // end of [val]

(* ****** ****** *)

val fact10 =
t0erm_eval0(T0Mapp(fact, T0Mint(10)))
val () = println!("fact(10) = ", fact10)

(* ****** ****** *)

val fibo10 =
t0erm_eval0(T0Mapp(fibo, T0Mint(10)))
val () = println!("fibo(10) = ", fibo10)

(* ****** ****** *)

(* end of [lambda1_main.dats] *)
