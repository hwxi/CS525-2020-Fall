#include "./../project.sats"

(* ****** ****** *)

val T1Pnil: type1
val T1Pint: type1
val T1Pbool: type1
val T1Pstring: type1

(* ****** ****** *)
//
datatype
  s0env =
| S0ENV of
  mylist(@(t0var, t1erm))
//
(* ****** ****** *)
//
fun
s0env_nil(): s0env
fun
s0env_extend
( env0
: s0env
, t0v1: t0var, t1m2: t1erm): s0env
//
fun
s0env_search
( env0
: s0env, t0v1: t0var): myoptn(t1erm)
//
(* ****** ****** *)

(* end of [project.sats] *)
