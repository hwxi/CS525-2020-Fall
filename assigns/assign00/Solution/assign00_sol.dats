(* ****** ****** *)
//
// How to test
// ./assign00_sol_dats
//
// How to compile:
// myatscc assign00_sol.dats
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

#include "./../assign00.dats"

(* ****** ****** *)
//
// This is some sample code
//
implement
factorial(n) =
if n > 0
then n * factorial(n-1) else 1

(* ****** ****** *)

implement
main0() =
{

val () =
println!
("factorial(10) = ", factorial(10))

} (* end of [main0] *)

(* ****** ****** *)

(* end of [assign00_sol.dats] *)
