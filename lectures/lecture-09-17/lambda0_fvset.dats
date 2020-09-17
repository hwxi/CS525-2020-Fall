(* ****** ****** *)
#staload "./lambda0.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)

extern
fun
{a:t@ype}
mylist_remove
(xs: mylist(a), x0: a): mylist(a)

(* ****** ****** *)

implement
t0erm_fvset(t0) =
(
case+ t0 of
| T0Mint _ =>
  mylist_nil()
| T0Mvar(x0) =>
  mylist_sing(x0)
| T0Mapp(t1, t2) =>
  mylist_append
  (t0erm_fvset(t1), t0erm_fvset(t2))
| T0Mlam(x0, t1) =>
  mylist_remove(t0erm_fvset(t1), x0)
)

(* ****** ****** *)

(* end of [lambda0_fvset.dats] *)

