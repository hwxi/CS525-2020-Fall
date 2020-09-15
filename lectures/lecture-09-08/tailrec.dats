(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
(*
#include
share/HATS/atspre_staload_libats_ML.hats
*)
(* ****** ****** *)
//
// ATS is typed!!!
//
fun // recursive
factorial // (int) -> int
(n: int): int = // [n] is a name!!!
if n = 0 then 1 else n * factorial(n-1)
//
(* ****** ****** *)
//
// A loop in FP is just a [tail-recursive] function
//
(* ****** ****** *)
(*
(*
//
// tail-recursion
//
*)
fun
factorial2
(n: int, r: int): int =
if n = 0 then r else factorial2(n-1, n * r)
fun
factorial(n: int): int = factorial2(n, 1)
//
*)
(* ****** ****** *)

fun
factorial(n: int): int =
let
(*

int
factorial2
(int n, int r)
{

while(n > 0)
{
  r = n * r; n = n - 1
}

return r;

}

*)
  fun
  factorial2
  (n: int, r: int): int =
  if n = 0 then r else factorial2(n-1, n * r)
in
  factorial2(n, 1) 
end

(* ****** ****** *)
//
(*
MacCarthy's 91-function:
The outer recursive call is a tail-call
The inner recursive call is NOT a tail-call
*)
fun
f91(n: int): int =
if n > 100 then n - 10 else f91(f91(n+11))
//
(* ****** ****** *)

#define N 10
#define N 12

implement main0() =
println!("f91(", N, ") = ", f91(N))
(*
println!("factorial(", N, ") = ", factorial(N))
*)

(* ****** ****** *)

(* end of [factorial.dats] *)
