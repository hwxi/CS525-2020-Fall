(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#staload
"./../../mylib/mylib.dats"
//
(* ****** ****** *)
(*
//
(*
please use your own code:
*)
//
#staload
"./../../mylib2/mylib2.sats"
#staload
"./../../mylib2/mylib2.dats"
*)
//
(* ****** ****** *)

typedef vnam = string
typedef opnm = string

(* ****** ****** *)

datatype term = 
//
  | TMint of int
//
  | TMvar of vnam
  | TMlam of (vnam, term)
  | TMapp of (term, term)
  | TMifz of (term, term, term)
  | TMfix of (vnam, vnam, term) // Y(lam f.lam x.<body>)
  | TMopr of (opnm, termlst)
  | TMtup of (termlst) // tuple construction
  | TMprj of (term, int) // tuple projection

where termlst = mylist(term)

(* ****** ****** *)
//
// HX: 10 points
// Please count the number
// of *free* occurrences of x
// in a given term t0:
//
extern
fun
tvar_count
(t0: term, x: vnam): int
//
// For instance, there is
// zero occurrences of x in K;
// there are two free occurrences
// of z in x(z)(y(z)).
//
(* ****** ****** *)
//
// HX: 10 points:
// Please implement a function
// that checks whether a given term
// is closed, that is, containing no
// free variables. For instance, both
// K and S are closed:
// K = lambda x.lambda y.x
// S = lambda x.lambda y.lambda z.x(z)(y(z))
//
extern
fun
term_is_closed(t0: term): bool
//
(* ****** ****** *)
//
// HX: 20 points:
// Please study the implemenation of
// interp2 in lambda0 and then implement
// the following one using your own library
// functions:
//
extern
fun
interp0 : term -> term // call-by-value
//
(* ****** ****** *)
//
// HX: 10 points:
// Please construct a lambda-term that corresponds
// to a function for checking if a given integer is
// a prime number.
//
(* ****** ****** *)

(* end of [assign01.dats] *)
