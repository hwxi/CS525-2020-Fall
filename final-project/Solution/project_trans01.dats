(* ****** ****** *)
#staload "./project.sats"
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
#staload
"./../../mylib/mylib.dats"
(* ****** ****** *)
extern
fun
trans01_type: type0 -> type1
(* ****** ****** *)

extern
fun
trans01_term(s0env, t0erm): t1erm
extern
fun
trans01_tdcl(s0env, t0dcl): t1dcl

(* ****** ****** *)

implement
trans01_term
  (env0, tm0) =
let
//
fun
trans01
(tm: t0erm): t1erm =
trans01_term(env0, tm)
//
in
//
case- tm0 of
|
T0Mint(i0) =>
t1erm_int(i0)
|
T0Mstr(s0) =>
t1erm_str(s0)
//
|
T0Mvar(t0v) =>
let
val
opt =
s0env_search(env0, t0v)
in
case- opt of
| myoptn_cons(t1m) => t1m
end
//
end // end of [trans01_term]

(* ****** ****** *)

(* end of [project_trans01.dats] *)
