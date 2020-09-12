
(*

variables: x, y, z, ...
abstractions: lam x.t
applications: t1( t2 )

*)

(* ****** ****** *)
typedef t0var = string
(* ****** ****** *)

datatype t0erm = // level-0
| T0Mvar of t0var
| T0Mlam of (t0var, t0erm)
| T0Mapp of (t0erm, t0erm)

(* ****** ****** *)

extern
fun
print_t0erm
(xs: t0erm): void
extern
fun
fprint_t0erm
(out: FILEref, xs: t0erm): void
overload fprint with fprint_t0erm

implement
print_t0erm(t0) =
fprint_t0erm(stdout_ref, t0)

implement
fprint_t0erm(out, t0) =
(
case+ t0 of
| T0Mvar(x0) =>
  fprint!(out, "T0Mvar(", x0, ")")
| T0Mlam(x0, t0) =>
  fprint!(out, "T0Mlam(", x0, "; ", t0, ")")
| T0Mapp(t1, t2) =>
  fprint!(out, "T0Mapp(", t1, "; ", t2, ")")
)

(* ****** ****** *)

(* end of [lambda0.dats] *)
