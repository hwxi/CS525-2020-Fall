(* ****** ****** *)
#staload "./lambda1.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
implement
print_t0erm(t0) =
fprint_t0erm(stdout_ref, t0)
(* ****** ****** *)
implement
fprint_t0erm(out, t0) =
(
case+ t0 of
| T0Mint(i0) =>
  fprint!(out, "T0Mint(", i0, ")")
| T0Mbtf(b0) =>
  fprint!(out, "T0Mbtf(", b0, ")")
| T0Mvar(x0) =>
  fprint!(out, "T0Mvar(", x0, ")")
| T0Mlam(x0, t0) =>
  fprint!
  (out, "T0Mlam(", x0, "; ", t0, ")")
| T0Mapp(t1, t2) =>
  fprint!
  (out, "T0Mapp(", t1, "; ", t2, ")")
//
| T0Mbool(btf) =>
  fprint!
  ( out
  , "T0Mbool(", btf, ")")
| T0Mopr1(x0, t1) =>
  fprint!
  ( out
  , "T0Mopr1(", x0, "; ", t1, ")")
| T0Mopr2(x0, t1, t2) =>
  fprint!
  ( out
  , "T0Mopr2(", x0, "; ", t1, "; ", t2, ")")
//
| T0Mfix1(x1, t1) =>
  fprint!(out, "T0Mfix1(", x1, "; ", t1, ")")
//
| T0Mcond(t1, t2, t3) =>
  fprint!
  ( out
  , "T0Mcond(", t1, "; ", t2, "; ", t3, ")")
//
)

(* ****** ****** *)
implement
print_value(v0) =
fprint_value(stdout_ref, v0)
(* ****** ****** *)

implement
fprint_value(out, v0) =
(
case+ v0 of
| VALint(i0) =>
  fprint!(out, "VALint(", i0, ")")
| VALbtf(b0) =>
  fprint!(out, "VALbtf(", b0, ")")
| VALlam(t0, env) =>
  fprint!
  (out, "VALlam(", t0, "; ", "...", ")")
| VALfix(f0, vlam) =>
  fprint!(out, "VALfix(", f0, "; ", vlam, ")")
)

(* ****** ****** *)
(*
val () = println!("[lambda1_print] is loaded")
*)
(* ****** ****** *)

(* end of [lambda1_print.dats] *)

