(* ****** ****** *)
#staload "./lambda1.sats"
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../../../mylib/mylib.sats"
#staload
"./../../../mylib/mylib.dats"
(* ****** ****** *)

#dynload "./lambda1_print.dats"
#dynload "./lambda1_interp.dats"

(* ****** ****** *)
//
#define nil mylist_nil
//
#define :: mylist_cons
#define cons mylist_cons
//
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

(*
HX-2020-10-12:
The credit for the following term [coin_change]
goes to Qijia Liu. Thanks!
*)

val
coin_change =
T0Mlam("sum",
    T0Mapp(T0Mapp(
        T0Mfix1("aux",
            T0Mlam("sum",
                T0Mlam("n",
                    T0Mcond(T0Mopr2(">", T0Mvar("sum"), T0Mint(0)),
                        T0Mcond(T0Mopr2(">=", T0Mvar("n"), T0Mint(0)),
                            T0Mopr2("+",
                                T0Mapp(T0Mapp(T0Mvar("aux"), T0Mvar("sum")),
                                    T0Mopr2("-", T0Mvar("n"), T0Mint(1))),
                                T0Mapp(T0Mapp(T0Mvar("aux"),
                                    T0Mopr2("-", T0Mvar("sum"), T0Mapp(
                                        T0Mapp(
                                            T0Mlam("theCoins",
                                                T0Mlam("n", T0Mcond(
                                                    T0Mopr2("==", T0Mvar("n"), T0Mint(0)), T0Mprj(T0Mvar("theCoins"), 0), T0Mcond(
                                                    T0Mopr2("==", T0Mvar("n"), T0Mint(1)), T0Mprj(T0Mvar("theCoins"), 1), T0Mcond(
                                                    T0Mopr2("==", T0Mvar("n"), T0Mint(2)), T0Mprj(T0Mvar("theCoins"), 2), T0Mcond(
                                                    T0Mopr2("==", T0Mvar("n"), T0Mint(3)), T0Mprj(T0Mvar("theCoins"), 3),
                                                    T0Mint(~1))))))),
                                            T0Mtup(T0Mint(1)::T0Mint(5)::T0Mint(10)::T0Mint(25)::nil())),
                                        T0Mvar("n")))),
                                    T0Mvar("n"))),
                            T0Mint(0)),
                        T0Mcond(T0Mopr2("<", T0Mvar("sum"), T0Mint(0)),
                            T0Mint(0),
                            T0Mint(1)))))),
    T0Mvar("sum")), T0Mint(3))
)

val () =
println!
( "coin_change(100) = "
, t0erm_eval0(T0Mapp(coin_change, T0Mint(100))))

(* ****** ****** *)

(* end of [lambda1_main.dats] *)
