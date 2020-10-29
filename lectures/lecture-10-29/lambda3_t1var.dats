(* ****** ****** *)
#staload "./lambda3.sats"
(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

implement
print_t1var(t1v) =
fprint_t1var(stdout_ref, t1v)

(* ****** ****** *)

local

absimpl
t1var_type = $rec
{
  t1var_name= t0var
, t1var_type= type1
}

in(* in-of-local *)

implement
t1var_new(name) =
$rec
{
  t1var_name= name
, t1var_type= type1
} where
{
  val type1 = type1_new_ext()
}

implement
fprint_t1var
( out, t1v ) =
(
  fprint!(out, t1v.t1var_name)
)

end // end of [local]

(* ****** ****** *)

(* end of [lambda3_t1var.dats] *)
