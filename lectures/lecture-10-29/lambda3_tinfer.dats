(* ****** ****** *)
#staload "./lambda3.sats"
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
#staload
"./../../mylib/mylib.dats"
(* ****** ****** *)

val T1Pint = T1Pbas("int")
val T1Pbool = T1Pbas("bool")

(* ****** ****** *)

local

fun
auxvar
( t1m0
: t1erm): type1 =
let
val-
T1Mvar(t1v) = t1m0 in t1v.type1()
end

fun
auxfst
( t1m0
: t1erm): type1 =
let
val-
T1Mfst(tup1) = t1m0
val
t1p1 =
t1erm_tinfer(tup1)
val-true =
type1_unify
(t1p1, type1_new_tup())
in
  let
  val-T1Ptup(tfst, _) = t1p1 in tfst
  end
end

fun
auxsnd
( t1m0
: t1erm): type1 =
let
val-
T1Msnd(tup1) = t1m0
val
t1p1 =
t1erm_tinfer(tup1)
val-true =
type1_unify
(t1p1, type1_new_tup())
in
  let
  val-T1Ptup(_, tsnd) = t1p1 in tsnd
  end
end

in(*in-of-local*)

implement
t1erm_tinfer
  (t1m0) =
(
case- t1m0 of
|
T1Mint _ => T1Pint
|
T1Mvar _ => auxvar(t1m0)
//
|
T1Mfst _ => auxfst(t1m0)
|
T1Msnd _ => auxsnd(t1m0)
//
|
T1Mtup(t1m1, t1m2) =>
(
  T1Ptup(t1p1, t1p2)
) where
{
  val
  t1p1 = t1erm_tinfer(t1m1)
  val
  t1p2 = t1erm_tinfer(t1m2)
}
//
) where
{
(*
val () =
println!
("t0erm_tinfer: t1m0 = ", t1m0)
*)
} (* end of [t0erm_tinfer] *)

end // end of [local]

(* ****** ****** *)

(* end of [lambda3_tinfer.dats] *)
