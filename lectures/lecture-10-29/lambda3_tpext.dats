(* ****** ****** *)
#staload "./lambda3.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

local
val
stamper = stamper_make()
in
fun
tpext_stamp() =
(
  stamper_stamp(stamper)
)
end // end of [local]

(* ****** ****** *)

implement
print_tpext(X0) =
fprint_tpext(stdout_ref, X0)

(* ****** ****** *)

absimpl
tpext_type = $rec
{
tpext_stamp= stamp
,
tpext_value= ref(t1opt)
}

(* ****** ****** *)

implement
tpext_get(X) =
let
val r =
X.tpext_value in r[]
end
implement
tpext_set(X, tp) =
let
val r = X.tpext_value
in
(r[] := myoptn_cons(tp))
end

(* ****** ****** *)

implement
tpext_new() = $rec
{
tpext_stamp= stamp
,
tpext_value=
ref<t1opt>(myoptn_nil())
} where
{
  val stamp = tpext_stamp()
}

(* ****** ****** *)

implement
fprint_tpext
(out, X) =
let
val r = X.tpext_value
val s = X.tpext_stamp
in
case+ r[] of
|
myoptn_nil() =>
fprint!(out, "X(", s, ")[", "]")
|
myoptn_cons(def) =>
fprint!(out, "X(", s, ")[", def, "]")
end


(* ****** ****** *)

(* end of [lambda3_tpext.dats] *)
