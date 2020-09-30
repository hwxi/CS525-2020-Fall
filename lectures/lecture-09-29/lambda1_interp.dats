(* ****** ****** *)
#staload "./lambda1.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

val
the_envir_nil =
ENVIR(mylist_nil())

(* ****** ****** *)

implement
t0erm_eval0(prog) =
t0erm_eval1(prog, the_envir_nil)

(* ****** ****** *)

extern
fun
envir_search
(envir, t0var): myoptn(value)
implement
envir_search
(env, x0) =
(
  auxlst(xvs)
) where
{
val+
ENVIR(xvs) = env
fun
auxlst
( xvs
: mylist
  @(t0var, value)
) : myoptn(value) =
(
case+ xvs of
| mylist_nil() => myoptn_nil()
| mylist_cons(xv1, xvs) =>
  if x0 = xv1.0
  then myoptn_cons(xv1.1) else auxlst(xvs)
)
} (*where*) // end of [envir_search]

(* ****** ****** *)

extern
fun
envir_extend
(envir, t0var, value): envir
implement
envir_extend
(env, x0, v0) =
let
val+
ENVIR(xvs) = env
in
ENVIR(mylist_cons((x0, v0), xvs))
end // end of [envir_extend]

(* ****** ****** *)

local

fun
aux_var
( t0m0: t0erm
, env0: envir): value =
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
opt = envir_search(env0, x0)
//
in
case- opt of myoptn_cons(v0) => v0
end // end of [aux_var]

(* ****** ****** *)

fun
aux_app
( t0m0: t0erm
, env0: envir): value =
let
//
val-
T0Mapp
(tfun, targ) = t0m0
//
val vfun =
t0erm_eval1(tfun, env0)
val varg =
t0erm_eval1(targ, env0)
//
in
case- vfun of
|
VALlam(tlam, elam) =>
let
val-
T0Mlam(x0, body) = tlam
in
  t0erm_eval1
  ( body
  , envir_extend(elam, x0, varg))
end
|
VALfix(f0, vlam) =>
let
val-
VALlam(t0, elam) = vlam
val-
T0Mlam(x0, body) = t0
val efix =
envir_extend(elam, f0, vfun)
in
  t0erm_eval1
  ( body
  , envir_extend(efix, x0, varg))
end
  
end // end of [aux_app]

(* ****** ****** *)

fun
aux_cond
( t0m0: t0erm
, env0: envir): value =
let
//
val-
T0Mcond
(t1, t2, t3) = t0m0
//
in
let
val v1 =
t0erm_eval1(t1, env0)
in
case- v1 of
|
VALbtf(b1) =>
(
  if b1
  then t0erm_eval1(t2, env0)
  else t0erm_eval1(t3, env0)
)
end(*let*)
end(*let*) // end of [aux_cond]

(* ****** ****** *)

fun
aux_opr2
( t0m0: t0erm
, env0: envir): value =
let
//
val-
T0Mopr2
(opr, t1, t2) = t0m0
in
//
let
val v1 = t0erm_eval1(t1, env0)
val v2 = t0erm_eval1(t2, env0)
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
    ("t0erm_eval1: aux_opr2: opr = ", opr)
  }
//
end (*let*) end (*let*) // end of [aux_opr2]

in (* in-of-local *)

implement
t0erm_eval1
(t0m0, env0) =
(
case+ t0m0 of
//
| T0Mint(i0) =>
  VALint(i0)
| T0Mbtf(i0) =>
  VALbtf(i0)
| T0Mlam _ =>
  VALlam(t0m0, env0)
//
| T0Mvar _ =>
  aux_var(t0m0, env0)
//
| T0Mapp _ =>
  aux_app(t0m0, env0)
//
| T0Mfix1(f0, t0m1) =>
  (
    VALfix(f0, vlam)
  ) where
  {
    val
    vlam = VALlam(t0m1, env0)
  }
//
| T0Mcond _ =>
  aux_cond(t0m0, env0)
//
| T0Mopr2 _ =>
  aux_opr2(t0m0, env0)
//
| _ (* else *) =>
let
val () =
println!
("t0erm_eval1: t0m0 = ", t0m0)
in
let
val () = assertloc(false) in exit(1)
end
end // end of [ rest-of-t0erm ]
)

end // end of [local]

(* ****** ****** *)

(* end of [lambda1_interp.dats] *)

