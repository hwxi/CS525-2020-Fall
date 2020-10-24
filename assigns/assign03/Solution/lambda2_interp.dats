(* ****** ****** *)
#staload "./lambda2.sats"
(* ****** ****** *)
#staload
"./../../../mylib/mylib.sats"
#staload _ =
"./../../../mylib/mylib.dats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

val
the_d0env_nil =
D0ENV(mylist_nil())

(* ****** ****** *)

implement
t0erm_interp0(prog) =
t0erm_interp1
(prog, the_d0env_nil)

(* ****** ****** *)

extern
fun
d0env_search
(d0env, t0var): myoptn(value)
implement
d0env_search
(env, x0) =
(
  auxlst(xvs)
) where
{
val+
D0ENV(xvs) = env
fun
auxlst
( xvs
: mylist
  @(t0var, value)
) : myoptn(value) =
(
case+ xvs of
| mylist_nil() =>
  myoptn_nil()
| mylist_cons(xv1, xvs) =>
  if x0 = xv1.0
  then myoptn_cons(xv1.1) else auxlst(xvs)
)
} (*where*) // end of [d0env_search]

(* ****** ****** *)

extern
fun
d0env_extend
( d0env
, t0var, value): d0env
implement
d0env_extend
(env, x0, v0) =
let
val+
D0ENV(xvs) = env
in
D0ENV
(mylist_cons((x0, v0), xvs))
end // end of [d0env_extend]

(* ****** ****** *)

local

fun
aux_var
( t0m0: t0erm
, env0: d0env): value =
let
//
(*
val () =
println!
("aux_var: t0m0 = ", t0m0)
*)
//
val-T0Mvar(x0) = t0m0
val
opt = d0env_search(env0, x0)
//
in
case- opt of myoptn_cons(v0) => v0
end // end of [aux_var]

(* ****** ****** *)

fun
aux_app
( t0m0: t0erm
, env0: d0env): value =
let
//
val-
T0Mapp
(tfun, targ) = t0m0
//
val vfun =
t0erm_interp1(tfun, env0)
val varg =
t0erm_interp1(targ, env0)
//
in
case- vfun of
|
VALlam(tlam, elam) =>
let
val-
T0Mlam(x0, _, body) = tlam
in
t0erm_interp1
( body
, d0env_extend(elam, x0, varg))
end
|
VALfix(f0, vlam) =>
let
val-
VALlam(t0, elam) = vlam
val-
T0Mlam(x0, _, body) = t0
val efix =
d0env_extend(elam, f0, vfun)
in
t0erm_interp1
( body
, d0env_extend(efix, x0, varg))
end
  
end // end of [aux_app]

(* ****** ****** *)

fun
aux_let
( t0m0: t0erm
, env0: d0env): value =
let
//
val-
T0Mlet
( x0
, t0m1, t0m2) = t0m0
val
vbnd =
t0erm_interp1(t0m1, env0)
in
let
  val
  env1 =
  d0env_extend
  (env0, x0, vbnd)
in
t0erm_interp1(t0m2, env1)
end
end // end of [aux_let]

(* ****** ****** *)

fun
aux_tup
( t0m0: t0erm
, env0: d0env): value =
(
  VALtup(v1, v2)
) where
{
//
val-
T0Mtup
(t0m1, t0m2) = t0m0
//
val v1 =
t0erm_interp1(t0m1, env0)
val v2 =
t0erm_interp1(t0m2, env0)
} (* end of [aux_tup] *)

(* ****** ****** *)

fun
aux_fst
( t0m0: t0erm
, env0: d0env): value =
let
val-
T0Mfst(tup1) = t0m0
val-
VALtup(v1, _) =
t0erm_interp1(tup1, env0) in v1 end
fun
aux_snd
( t0m0: t0erm
, env0: d0env): value =
let
val-
T0Msnd(tup1) = t0m0
val-
VALtup(_, v2) =
t0erm_interp1(tup1, env0) in v2 end

(* ****** ****** *)

fun
aux_cond
( t0m0: t0erm
, env0: d0env): value =
let
//
val-
T0Mcond
(t1, t2, t3) = t0m0
//
in
let
val v1 =
t0erm_interp1(t1, env0)
in
case- v1 of
|
VALbtf(b1) =>
(
  if b1
  then
  t0erm_interp1(t2, env0)
  else
  (
    case+ t3 of
    | myoptn_nil() =>
      VALnil(*void*)
    | myoptn_cons(t3) =>
      t0erm_interp1(t3, env0)
  )
)
end(*let*)
end(*let*) // end of [aux_cond]

(* ****** ****** *)

fun
aux_opr1
( t0m0: t0erm
, env0: d0env): value =
let
//
val-
T0Mopr1
(opr, t1) = t0m0
in
//
let
val v1 =
t0erm_interp1(t1, env0)
in
case+ opr of
| "-" =>
(
case- v1 of
| VALint(i1) => VALint(~i1)
)
| "~" =>
(
case- v1 of
| VALint(i1) => VALint(~i1)
| VALbtf(b1) => VALbtf(~b1)
)
//
| "print" =>
(
case- v1 of
| VALint(i1) =>
  let
  val () = print(i1) in VALnil()
  end
| VALbtf(b1) =>
  let
  val () = print(b1) in VALnil()
  end
| VALstr(s1) =>
  let
  val () = print(s1) in VALnil()
  end
)
//
| _ (* else *) =>
let
val () = assertloc(false) in exit(1)
end where
{
  val () =
  println!
  ("t0erm_interp1: aux_opr1: opr = ", opr)
}
//
end (*let*) end (*let*) // end of [aux_opr1]

fun
aux_opr2
( t0m0: t0erm
, env0: d0env): value =
let
//
val-
T0Mopr2
(opr, t1, t2) = t0m0
in
//
let
val v1 = t0erm_interp1(t1, env0)
val v2 = t0erm_interp1(t2, env0)
in
case+ opr of
| "+" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALint(i1 + i2)
  end
| "-" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALint(i1 - i2)
  end
| "*" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALint(i1 * i2)
  end
//
| ">" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALbtf(i1 > i2)
  end
| "<" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALbtf(i1 < i2)
  end
| "=" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALbtf(i1 = i2)
  end
| "==" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALbtf(i1 = i2)
  end
| "<=" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALbtf(i1 <= i2)
  end
| ">=" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALbtf(i1 >= i2)
  end
| "!=" =>
  let
  val-VALint(i1) = v1
  val-VALint(i2) = v2 in VALbtf(i1 != i2)
  end
//
| _ (* else *) =>
  let
  val () = assertloc(false) in exit(1)
  end where
  {
    val () =
    println!
    ("t0erm_interp1: aux_opr2: opr = ", opr)
  }
//
end (*let*) end (*let*) // end of [aux_opr2]

in (* in-of-local *)

implement
t0erm_interp1
(t0m0, env0) =
let
(*
val () =
println!
("t0erm_interp1: t0m0 = ", t0m0)
*)
in
//
case+ t0m0 of
//
| T0Mnil() =>
  VALnil()
//
| T0Mint(i0) =>
  VALint(i0)
| T0Mstr(s0) =>
  VALstr(s0)
//
| T0Mlam _ =>
  VALlam(t0m0, env0)
//
| T0Mvar _ =>
  aux_var(t0m0, env0)
//
| T0Mapp _ =>
  aux_app(t0m0, env0)
//
| T0Mlet _ =>
  aux_let(t0m0, env0)
//
| T0Mfst _ =>
  aux_fst(t0m0, env0)
| T0Msnd _ =>
  aux_snd(t0m0, env0)
| T0Mtup _ =>
  aux_tup(t0m0, env0)
//
|
T0Mfix1
(f0, _, t0m1) =>
(
  VALfix(f0, vlam)
) where
{
  val
  vlam =
  VALlam(t0m1, env0)
}
//
| T0Mcond _ =>
  aux_cond(t0m0, env0)
//
| T0Mopr1 _ =>
  aux_opr1(t0m0, env0)
| T0Mopr2 _ =>
  aux_opr2(t0m0, env0)
//
| T0Manno(t0m1, _) =>
  t0erm_interp1(t0m1, env0)
//
(*
| _ (* else *) =>
let
val () =
println!
("t0erm_interp1: t0m0 = ", t0m0)
in
let
val () = assertloc(false) in exit(1)
end
end // end of [ rest-of-t0erm ]
*)
end // end of [let]

end // end of [local]

(* ****** ****** *)

implement
print_value(x0) =
fprint_value(stdout_ref, x0)

(* ****** ****** *)

implement
fprint_value(out, x0) =
(
case+ x0 of
|
VALnil() =>
fprint!(out, "VALnil(", ")")
|
VALint(i0) =>
fprint!(out, "VALint(", i0, ")")
|
VALbtf(b0) =>
fprint!(out, "VALbtf(", b0, ")")
|
VALstr(s0) =>
fprint!(out, "VALstr(", s0, ")")
//
|
VALtup(v1, v2) =>
fprint!
(out, "VALtup(", v1, "; ", v2, ")")
|
VALlam _ =>
fprint!(out, "VALlam(", "...", ")")
|
VALfix _ =>
fprint!(out, "VALfix(", "...", ")")
)

(* ****** ****** *)

(* end of [lambda2_interp.dats] *)

