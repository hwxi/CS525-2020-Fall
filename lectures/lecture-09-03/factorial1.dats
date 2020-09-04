(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
extern
fun factorial: int -> int
(* ****** ****** *)

implement main0() =
println!("factorial(10) = ", factorial(10))

(* ****** ****** *)

implement
factorial(n) = // [n] is a name!!!
if n = 0 then 1 else n * factorial(n-1)

(* ****** ****** *)

(* end of [factorial1.dats] *)
