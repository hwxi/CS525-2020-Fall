
(*

variables: x, y, z, ...
abstractions: lam x.t
applications: t1( t2 )

*)


typedef t0var = string

datatype t0erm = // level-0
| TM0var of t0var
| TM0lam of (t0var, t0erm)
| TM0app of (t0erm, t0erm)

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
| TM0var(x0) =>
  fprint!(out, "TM0var(", x0, ")")
| TM0lam(x0, t0) =>
  fprint!(out, "TM0lam(", x0, "; ", t0, ")")
| TM0app(t1, t2) =>
  fprint!(out, "TM0app(", t1, "; ", t2, ")")
)

