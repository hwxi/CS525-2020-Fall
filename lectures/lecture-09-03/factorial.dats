(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)

fun
factorial
(n: int): int = // [n] is a name!!!
if n = 0 then 1 else n * factorial(n-1)

(* ****** ****** *)

implement main0() =
println!("factorial(10) = ", factorial(10))

(* ****** ****** *)

(* end of [factorial.dats] *)
