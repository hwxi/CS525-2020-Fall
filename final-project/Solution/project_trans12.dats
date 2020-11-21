(* ****** ****** *)
#staload "./project.sats"
(* ****** ****** *)
#staload "./../../mylib/mylib.sats"
(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)

abstype
t2tmp_type = ptr
typedef
t2tmp = t2tmp_type

(* ****** ****** *)

extern
fun
t2tmp_new(): t2tmp

(* ****** ****** *)
//
(*
abstype t2val_type = ptr
typedef t2val = t2val_type
*)
datatype t2val =
| T2Vint of int
| T2Vstr of string
| T2Vtmp of t2tmp
| T2Vfun of t2fnm
//
where t2fnm = string
//
(* ****** ****** *)
//
(*
abstype t2ins_type = ptr
typedef t2ins = t2ins_type
*)
//
datatype t2ins = 
|
T2INSmov of
(t2tmp, t2val) // t2tmp <- t2val
|
T2INStup of
(t2tmp, t2val, t2val)
|
T2INScall of
( t2tmp
, t2val(*fun*), t2val(*arg*))
//
T2INScond of
( t2val(*cond*)
, t2inslst(*then*), t2inslst(*else*))
//
where t2inslst = mylist(t2ins)
//
(* ****** ****** *)
//
extern
fun
t2inslst_extend
(t2inslst, t2ins): t2inslst
extern
fun
t2inslst_append
(t2inslst, t2inslst): t2inslst
//
overload + with t2inslst_extend
overload + with t2inslst_append
//
(* ****** ****** *)

abstype t2dcl_type = ptr
typedef t2dcl = t2dcl_type

(* ****** ****** *)

extern
fun
trans12_term
(t1m0: t1erm): (t2inslst, t2val)

(*
extern
fun
trans12_tdcl
(tdcl: t1dcl): (t2inslst, t2dcl)
extern
fun
trans12_tpgm
(tpgm: t1pgm): (t2inslst, t2pgm)
*)

(* ****** ****** *)

implement
trans12_term
  (t1m0) =
(
case-
t1m0.node() of
//
| T1Mint(i0) =>
  (inss, T2Vint(i0)) where
  {
    val inss = mylist_nil()
  }
| T1Mstr(s0) =>
  (inss, T2Vstr(s0)) where
  {
    val inss = mylist_nil()
  }
| T1Mapp(t1m1, t1m2) =>
  let
  val
  tres = t2tmp_new()
  val
  (inss1, t1v1) =
  trans12_term(t1m1)
  val
  (inss2, t1v2) =
  trans12_term(t1m2)
  val
  ins3 =
  T2INScall(tres, t1v1, t1v2)
  in
    (inss1+inss2+ins3, T2Vtmp(tres))
  end
) where
{
(*
val () =
println!
("trans12_term: t1m0 = ", t1m0)
*)
}

(* ****** ****** *)

(* end of [project_trans12.dats] *)
