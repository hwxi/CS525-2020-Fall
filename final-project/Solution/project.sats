#include
"./../project.sats"

(* ****** ****** *)

val T1Pnil: type1
val T1Pint: type1
val T1Pbool: type1
val T1Pstring: type1

(* ****** ****** *)
//
fun
t1erm_make1
( node
: t1erm_node): t1erm
fun
t1erm_make2
( type: type1
, node: t1erm_node): t1erm
//
(* ****** ****** *)

fun
t1erm_int(i0: int): t1erm
fun
t1erm_btf(b0: bool): t1erm
fun
t1erm_str(s0: string): t1erm

(* ****** ****** *)

fun
t1erm_var(t1v: t1var): t1erm

(* ****** ****** *)

fun
t1erm_app(t1erm, t1erm): t1erm

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
