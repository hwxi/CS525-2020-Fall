//
%{^
//
extern
void
libxatsopt_dynloadall();
//
%} (* %{^ *)
val () =
$extfcall
(void, "libxatsopt_dynloadall")
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include "./libxatsopt.hats"
//
overload
.name with $SYM.symbol_get_name
//
(* ****** ****** *)
//
#staload
"./../../mylib/mylib.sats"
#staload
"./../../mylib/mylib.dats"
//
(* ****** ****** *)

#staload "./../midterm.sats"
#dynload "./midterm_type0.dats"
#dynload "./midterm_t0erm.dats"
(*
#dynload "./midterm_s0env.dats"
#dynload "./midterm_tinfer.dats"
#dynload "./midterm_interp.dats"
*)

(* ****** ****** *)
//
extern
fun
xatsopt_strunq
( source
: string
)
: string =
"ext#xatsopt_strunq"
//
//
extern
fun
strunqize
(source: string): string
//
implement
strunqize(cs) = let
//
val cs =
xatsopt_strunq(cs)
val cs =
streamize_string_char<>(cs)
//
vtypedef
cstream = stream_vt(charNZ)
//
fun
auxmain
(cs: cstream): cstream = $ldelay
(
case+ !cs of
| ~
stream_vt_nil() =>
stream_vt_nil()
| ~
stream_vt_cons(c0, cs) =>
(
if
(c0 != '\\')
then
stream_vt_cons(c0, auxmain(cs))
else
(
case- !cs of
| ~
stream_vt_cons(c1, cs) =>
let
val c1 =
(
case+ c1 of
| '"' => '"'
| 'n' => '\n'
| 'r' => '\r'
| 't' => '\t'
| 'b' => '\b'
| 'f' => '\f'
| 'v' => '\v'
| '\\' => '\\'
| _ (* else *) => c1
) : charNZ // end-of-val
in
stream_vt_cons(c1, auxmain(cs))
end
)
)
, lazy_vt_free(cs)
)
//
in
strptr2string
(string_make_stream_vt(auxmain(cs)))
end // end of [strunqize]
//
(* ****** ****** *)
//
extern
fun
the_fixity_load
(
XATSHOME: string
) : void =
"ext#libxatsopt_the_fixity_load"
//
(* ****** ****** *)
//
extern
fun
s1exp2type0: s1exp -> type0
extern
fun
s1exp2type0_lst: s1explst -> type0lst
extern
fun
s1exp2type0_opt: s1expopt -> type0opt
//
(* ****** ****** *)
//
extern
fun
d1exp2t0erm: d1exp -> t0erm
//
extern
fun
d1exp2t0erm_lst: d1explst -> t0ermlst
extern
fun
d1exp2t0erm_opt: d1expopt -> t0ermopt
//
extern
fun
d1ecl2t0dcl_lst: d1eclist -> t0dclist
extern
fun
d1ecl2t0erm_main: d1eclist -> t0ermopt
//
(* ****** ****** *)

local

typedef
tpcnm = string

val
the_tpcon_lst =
$list{string}
( "*"
, "->"
) (* the tpcon_list *)

fun
istpc
(nm0: string): bool =
(
auxlst(nm0, the_tpcon_lst)
) where
{
fun
auxlst
( nm0: string
, nms: List0(string)): bool =
(
case+ nms of
| list_nil() => false
| list_cons(nm1, nms) =>
  if (nm0 = nm1) then true else auxlst(nm0, nms)
)
} (* end of [istpc] *)

fun
auxtpc
( s1e0
: s1exp)
: Option(tpcnm) =
(
case+
s1e0.node() of
|
S1Eid0(sym) =>
let
val nm0 = sym.name()
in
if
istpc(nm0)
then Some(nm0) else None()
end // end of [S1Eid]
|
_ (*non-S1Eid*) => None((*void*))
)

fun
auxid0
(s1e0: s1exp): type0 =
(
case-
s1e0.node() of
|
S1Eid0(sym) => T0Pbas(sym.name())
)

fun
auxapp2
(s1e0: s1exp): type0 =
let
val-
S1Eapp2
( s1e1
, s1e2
, s1e3) = s1e0.node()
//
val-
Some(tpc) = auxtpc(s1e1)
//
in
//
(
case- tpc of
| "*" =>
  T0Ptup(t0p2, t0p3)
| "->" =>
  T0Pfun(t0p2, t0p3)
) where
{
  val t0p2 = s1exp2type0(s1e2)
  val t0p3 = s1exp2type0(s1e3)
}
//
end // end of [auxapp2]

fun
auxlist
(s1e0: s1exp): type0 =
let
val-
S1Elist
 (s1es) = s1e0.node()
in
//
case+ s1es of
| list_nil
  ((*void*)) => T0Pnil
| list_cons
  (s1e1, s1es) =>
  auxs1es( s1e1, s1es )
//
end // end of [auxlist]
and
auxs1es
( s1e1: s1exp
, s1es: s1explst): type0 =
let
val
t0p1 = s1exp2type0(s1e1)
in
case+ s1es of
| list_nil
  ((*void*)) => t0p1
| list_cons
  (s1e2, s1es) =>
  T0Ptup(t0p1, auxs1es(s1e2, s1es))
end // end of [auxs1es]

in (*in-of-local*)

implement
s1exp2type0
  (s1e0) =
let
//
(*
val () =
println!
("s1exp2type0: s1e0 = ", s1e0)
*)
//
in
//
case-
s1e0.node() of
//
| S1Eid0 _ => auxid0(s1e0)
//
| S1Elist
   (s1es) => auxlist(s1e0)
//
| S1Eapp2 _ => auxapp2(s1e0)
//
end // end of [s1exp2type0]

end // end of [local]

(* ****** ****** *)

implement
s1exp2type0_lst
  (s1es) =
(
case+ s1es of
|
list_nil() =>
mylist_nil()
|
list_cons(s1e0, s1es) =>
mylist_cons
(s1exp2type0(s1e0), s1exp2type0_lst(s1es))
)

implement
s1exp2type0_opt
  (opt0) =
(
case+ opt0 of
| None() => myoptn_nil()
| Some(s1e) => myoptn_cons(s1exp2type0(s1e))
)

(* ****** ****** *)

local

fun
auxarg
( f1as
: f1arglst): t0var =
let
val-
list_cons
(f1a0, _) = f1as
in
case-
f1a0.node() of
|
F1ARGsome_dyn(d1p) => auxd1p(d1p)
end // end of [auxarg]
and
auxd1p
(d1p0: d1pat): t0var =
(
case-
d1p0.node() of
|
D1Pid0(tok) =>
(
case-
tok.node() of
| T_IDENT_alp(nam) => nam
| T_IDENT_sym(nam) => nam
)
| D1Plist(d1ps) =>
  (
    auxd1p(d1p1)
  ) where
  {
    val-
    list_cons(d1p1, _) = d1ps
  }
| D1Panno(d1p1, _) => auxd1p(d1p1)
)
fun
auxanno
( f1as
: f1arglst
)
: type0opt =
let
val-
list_cons
(f1a0, _) = f1as
in
case-
f1a0.node() of
|
F1ARGsome_dyn(d1p) => auxd1p(d1p)
end // end of [auxarg]
and
auxd1p
( d1p0
: d1pat)
: type0opt =
(
case-
d1p0.node() of
| D1Plist(d1ps) =>
  (
    auxd1p(d1p1)
  ) where
  {
    val-
    list_cons(d1p1, _) = d1ps
  }
|
D1Panno(_, s1e2) =>
myoptn_cons(s1exp2type0(s1e2))
|
_(*non-D1Panno*) => myoptn_nil()
)

in

fun
f1as2t0var
( f1as
: f1arglst): t0var = auxarg(f1as)
fun
f1as2type0
( f1as
: f1arglst): type0opt = auxanno(f1as)

end // end of [local]

(* ****** ****** *)

local

val
the_oprnm_lst =
$list{string}
(
  "+"
, "-"
, "*"
, "/"
, "%"
, ">"
, "<"
, "="
, "<="
, ">="
, "!="
, "fst"
, "snd"
, "print"
) (* the_oprnm_list *)

fun
isopr
(nm0: string): bool =
(
auxlst(nm0, the_oprnm_lst)
) where
{
fun
auxlst
( nm0: string
, nms: List0(string)): bool =
(
case+ nms of
| list_nil() => false
| list_cons(nm1, nms) =>
  if (nm0 = nm1) then true else auxlst(nm0, nms)
)
} (* end of [isopr] *)

fun
auxopr
( d1e0
: d1exp)
: Option(t0opr) =
(
case+
d1e0.node() of
|
D1Eid0(tok) =>
(
case-
tok.node() of
| T_IDENT_alp(nm0) =>
  if
  isopr(nm0)
  then Some(nm0) else None()
| T_IDENT_sym(nm0) =>
  if
  isopr(nm0)
  then Some(nm0) else None()
)
|
_ (*non-D1Eid*) => None((*void*))
)

fun
auxid0
( d1e0
: d1exp): t0erm =
(
case-
d1e0.node() of
|
D1Eid0(tok) =>
(
case-
tok.node() of
| T_IDENT_alp(nam) => T0Mvar(nam)
| T_IDENT_sym(nam) => T0Mvar(nam)
)
)

fun
auxint
( d1e0
: d1exp): t0erm =
(
case-
d1e0.node() of
|
D1Eint(tok) =>
(
case-
tok.node() of
|
T_INT1(rep) => T0Mint(g0string2int(rep))
)
)

fun
auxstr
( d1e0
: d1exp): t0erm =
(
case-
d1e0.node() of
|
D1Estr(tok) =>
(
case-
tok.node() of
|
T_STRING_closed(rep) => T0Mstr(strunqize(rep))
)
)

fun
auxlist
( d1e0
: d1exp): t0erm =
(
  auxd1es(d1es)
) where
{
//
val-
D1Elist
( d1es ) = d1e0.node()
//
fun
auxd1es
(d1es: d1explst): t0erm =
(
case+ d1es of
| list_nil() =>
  (
    T0Mnil()
  )
| list_cons
  (d1e1, d1es) =>
  let
  val t0m1 = d1exp2t0erm(d1e1)
  in
    if
    iseqz(d1es)
    then t0m1 else T0Mtup(t0m1, auxd1es(d1es))
  end // end of [list_cons]
)
//
} (* end of [auxlist] *)

(* ****** ****** *)

fun
auxif0
( d1e0
: d1exp): t0erm =
let
//
val-
D1Eif0
( d1e1
, d1e2
, opt3) = d1e0.node()
//
in
(
T0Mcond(t0m1, t0m2, opt3)
) where
{
  val
  t0m1 = d1exp2t0erm(d1e1)
  val
  t0m2 = d1exp2t0erm(d1e2)
  val
  opt3 = d1exp2t0erm_opt(opt3)
}
end // end of [auxif0]

(* ****** ****** *)

fun
auxlet
( d1e0
: d1exp): t0erm =
let
//
val-
D1Elet
( d1cs
, body) = d1e0.node()
//
val d1c1 =
( case- d1cs of
| list_cons(d1c1, _) => d1c1
) : d1ecl // end of [val]
//
val v1d1 =
let
val v1ds =
(
case-
d1c1.node() of
|
D1Cvaldecl
(_, _, v1ds) => v1ds
) : v1aldeclist
in
case- v1ds of
| list_cons(v1d1, _) => v1d1
end : v1aldecl // end-of-val
//
val+
V1ALDECL(rcd) = v1d1
//
val x0 =
let
val
d1p = rcd.pat
in
case-
d1p.node() of
|
D1Pid0(tok) =>
(
case-
tok.node() of
|
T_IDENT_alp(nam) => nam
)
end : t0var // end-of-val
//
val def =
(
case-
rcd.def of
| None() =>
  T0Mnil()
| Some(d1e) =>
  d1exp2t0erm(d1e)): t0erm
//
in
let
val
body =
(
case-
body of
|
list_cons
(d1e, _) =>
d1exp2t0erm(d1e)
) : t0erm // end-of-val
in
  T0Mlet(x0, def, body)
end
end // end of [aux_let]

(* ****** ****** *)

fun
auxlam
( d1e0
: d1exp): t0erm =
let
//
(*
val () =
println!
("auxlam: d1e0 = ", d1e0)
*)
//
val-
D1Elam
( tlam
, f1as
, res0
, arrw
, body) = d1e0.node()
//
val farg = f1as2t0var(f1as)
val topt = f1as2type0(f1as)
val body = d1exp2t0erm(body)
//
in
case+ res0 of
| EFFS1EXPnone() =>
  (
    T0Mlam(farg, topt, body)
  )
| EFFS1EXPsome(s1e0) =>
  (
    T0Mlam(farg, topt, body)
  ) where
  {
    val tres = s1exp2type0(s1e0)
    val body = T0Manno(body, tres)
  }
end // end of [auxlam]

fun
auxfix
( d1e0
: d1exp): t0erm =
let
val-
D1Efix
( tok0
, fid0
, f1as
, res0
, arrw
, body) = d1e0.node()
val idf =
(
case-
fid0.node() of
| T_IDENT_alp(nam) => nam
| T_IDENT_sym(nam) => nam
) : t0var // end-of-val
//
val farg = f1as2t0var(f1as)
val topt = f1as2type0(f1as)
val body = d1exp2t0erm(body)
//
in
case- res0 of
|
EFFS1EXPsome(s1e0) =>
(
T0Mfix1
( idf
, tfix
, T0Mlam(farg, topt, body))
) where
{
  val tres =
  s1exp2type0(s1e0)
  val tfix =
  (
  case+ topt of
  | myoptn_nil() =>
    myoptn_nil()
  | myoptn_cons(targ) =>
    myoptn_cons(T0Pfun(targ, tres))
  ) : type0opt // end-of-val
  val body =
  (
    case+ topt of
    | myoptn_nil() => body
    | myoptn_cons _ => T0Manno(body, tres)
  )
}
end // end of [auxfix]

fun
auxapp1
(d1e0: d1exp): t0erm =
let
//
val-
D1Eapp1
( d1e1
, d1e2) = d1e0.node()
//
in
case+
d1e1.node() of
|
D1Edtsel
(lab, _) => let
//
val nsel =
let
val opt =
$LAB.label_get_int(lab)
in
case+ opt of
| ~None_vt() => 0
| ~Some_vt(n) => n
end : int // end-of-val
in
if nsel <= 0
then
T0Mfst(d1exp2t0erm(d1e2))
else
T0Msnd(d1exp2t0erm(d1e2))
end
|
_ (*else*) => auxapp1_else(d1e0)
end

and
auxapp1_else
(d1e0: d1exp): t0erm =
let
//
val-
D1Eapp1
( d1e1
, d1e2) = d1e0.node()
//
val opt1 = auxopr(d1e1)
//
in
//
case+ opt1 of
|
None() =>
(
  T0Mapp(t0m1, t0m2)
) where
{
val
t0m1 = d1exp2t0erm(d1e1)
val
t0m2 = d1exp2t0erm(d1e2)
}
|
Some(opnm) =>
(
case+
d1e2.node() of
(*
|
D1Elist(d1es) =>
T0Moprs
( opnm
, d1exp2t0erm_lst(d1es))
*)
| _(*non-D1Elist*) =>
  T0Mopr1
  (opnm, d1exp2t0erm(d1e2))
)
//
end // end of [auxapp1]

fun
auxapp2
( d1e0
: d1exp): t0erm =
let
val-
D1Eapp2
( d1e1
, d1e2
, d1e3) = d1e0.node()
//
val opt1 = auxopr(d1e1)
val t0m2 = d1exp2t0erm(d1e2)
val t0m3 = d1exp2t0erm(d1e3)
in
//
case+ opt1 of
|
None() =>
let
val
t0f1 = d1exp2t0erm(d1e1)
in
  T0Mapp
  ( t0f1
  , T0Mtup(t0m2, t0m3))
end
|
Some(opr1) =>
(
  T0Mopr2(opr1, t0m2, t0m3)
)
//
end // end of [auxapp2]

fun
auxanno
( d1e0
: d1exp): t0erm =
let
val-
D1Eanno
( d1e1
, s1e2) = d1e0.node()
//
in
(
  T0Manno(t0m1, t0p2)
) where
{
  val t0m1 = d1exp2t0erm(d1e1)
  val t0p2 = s1exp2type0(s1e2)
}
end

in(*in-of-local*)

implement
d1exp2t0erm
  (d1e0) =
let
//
(*
val () =
println!
("d1exp2t0erm: d1e0 = ", d1e0)
*)
//
in
//
case-
d1e0.node() of
//
|
D1Eid0 _ => auxid0(d1e0)
|
D1Eint _ => auxint(d1e0)
|
D1Estr _ => auxstr(d1e0)
//
|
D1Elist
( d1es ) => auxlist(d1e0)
//
|
D1Eif0 _ => auxif0(d1e0)
|
D1Elet _ => auxlet(d1e0)
//
|
D1Elam _ => auxlam(d1e0)
|
D1Efix _ => auxfix(d1e0)
//
|
D1Eapp1 _ => auxapp1(d1e0)
|
D1Eapp2 _ => auxapp2(d1e0)
//
|
D1Eanno _ => auxanno(d1e0)
//
| _ =>
(
  exit(1)
) where
{
val () =
println!
("d1exp2t0erm: d1e0 = ", d1e0)
val ((*crash*)) = assertloc(false)
}
//
end // end of [d1exp2t0erm]

end // end of [local]

(* ****** ****** *)

implement
d1exp2t0erm_lst
  (d1es) =
(
case+ d1es of
|
list_nil() =>
mylist_nil()
|
list_cons(d1e0, d1es) =>
mylist_cons
(d1exp2t0erm(d1e0), d1exp2t0erm_lst(d1es))
)

implement
d1exp2t0erm_opt
  (opt0) =
(
case+ opt0 of
| None() => myoptn_nil()
| Some(d1e) => myoptn_cons(d1exp2t0erm(d1e))
)

(* ****** ****** *)

local

fun
ismain
( f1d0
: f1undecl): bool =
let
val+
F1UNDECL
(rcd) = f1d0
//
val nam = rcd.nam
//
in
case+
nam.node() of
| T_IDENT_alp
  (nam) =>
  (nam = "main") | _ => false
end

fun
auxf1d0
( f1d0
: f1undecl
) : t0dcl =
let
val+
F1UNDECL(rcd) = f1d0
//
val
nam = rcd.nam
val
idf =
(
case-
nam.node() of
| T_IDENT_alp(nam) => nam
| T_IDENT_sym(nam) => nam
) : t0var // end of [val]
//
val farg = f1as2t0var(rcd.arg)
val topt = f1as2type0(rcd.arg)
//
val body =
(
case-
rcd.def of
| Some(d1e) => d1exp2t0erm(d1e)
) : t0erm // end of [val]
//
in
(
  T0DCL(idf, fdef)
) where
{
val fdef =
(
case- rcd.res of
|
EFFS1EXPsome(s1e0) =>
(
T0Mfix1
( idf
, tfix
, T0Mlam(farg, topt, body))
) where
{
  val tres = s1exp2type0(s1e0)
  val tfix =
  (
  case+ topt of
  | myoptn_nil() =>
    myoptn_nil()
  | myoptn_cons(targ) =>
    myoptn_cons(T0Pfun(targ, tres))
  ) : type0opt // end-of-val
  val body =
  (
    case+ topt of
    | myoptn_nil() => body
    | myoptn_cons _ => T0Manno(body, tres)
  )
}
) : t0erm // end-of-val
}
end // end of [auxf1d0]
and
auxf1ds
( f1ds
: f1undeclist
) : t0dclist =
(
case+ f1ds of
| list_nil() =>
  mylist_nil()
| list_cons(f1d0, f1ds) =>
  if
  ismain(f1d0)
  then
  mylist_nil(*void*)
  else
  mylist_cons
  (auxf1d0(f1d0), mylist_nil(*void*))
)

in(*in-of-local*)

implement
d1ecl2t0dcl_lst
  (d1cs) =
(
case+ d1cs of
|
list_nil() =>
mylist_nil()
|
list_cons(d1c0, d1cs) =>
(
case+
d1c0.node() of
| D1Cfundecl(_, _, _, f1ds) =>
  let
    val f1ds = auxf1ds(f1ds)
  in
    mylist_append
    (f1ds, d1ecl2t0dcl_lst(d1cs))
  end
| _(*rest-of-d1ecl*) => d1ecl2t0dcl_lst(d1cs)
)
)

implement
d1ecl2t0erm_main
  (d1cs) =
(
case+ d1cs of
|
list_nil() =>
myoptn_nil()
|
list_cons(d1c0, d1cs) =>
(
case+
d1c0.node() of
| D1Cfundecl
  (_, _, _, f1ds) =>
  (
    auxf1ds(f1ds)
  ) where
  {
    fun
    auxf1d0
    ( f1d0
    : f1undecl): t0ermopt =
    let
    val+
    F1UNDECL(rcd) = f1d0
    in
    case+ rcd.def of
    | None() =>
      myoptn_nil()
    | Some(d1e) =>
      myoptn_cons(d1exp2t0erm(d1e))
    end
    and
    auxf1ds
    ( f1ds
    : f1undeclist): t0ermopt =
    (
    case+ f1ds of
    | list_nil() =>
      d1ecl2t0erm_main(d1cs)
    | list_cons(f1d0, f1ds) =>
      if
      ismain(f1d0)
      then auxf1d0(f1d0) else auxf1ds(f1ds)
    )
  }
| _ (*non-D1Cfundecl*) => d1ecl2t0erm_main(d1cs)
)
) (* end of [d1ecl2t0erm_main] *)

end // end of [local]

(* ****** ****** *)
extern
fun
project_main0
{n:int|n >= 1}
(argc: int(n), argv: !argv(n)): void
(* ****** ****** *)
//
implement
main0(argc, argv) =
(
//
if
(argc >= 2)
then project_main0(argc, argv)
else prerrln! ("Hello from CS525(project)!")
// end of [if]
) (* end of [main] *)
//
(* ****** ****** *)
local
(* ****** ****** *)
//
static
fun
process_stdin(): void
static
fun
process_fpath(fp0: fpath_t): void
static
fun
process_given(given: string): void
//
(* ****** ****** *)

implement
process_stdin() =
(
  process_fpath(fp0)
) where
{
  val
  fp0 = $FP0.the_filpath_stdin
}
implement
process_fpath(fp0) =
let
//
val
stadyn = 1 // dynamic
//
in
//
if
(
stadyn >= 0
)
then
{
val
d0cs =
let
val opt =
parse_from_filpath_toplevel
  (stadyn, fp0)
in
case+ opt of
| ~Some_vt(d0cs) => d0cs
| ~None_vt((*void*)) => list_nil()
end : d0eclist // end-of-val
//
val () =
synread_program(d0cs)
//
val
d1cs = trans01_declist(d0cs)
(*
val () =
println!
("process_fpath: d1cs = ", d1cs)
*)
val () =
tread01_program(d1cs)
//
val
mopt =
d1ecl2t0erm_main(d1cs)
//
val-
myoptn_cons(t0m0) = mopt
//
val () =
println!("input: t0m0 = ", t0m0)
//
(*
val
t0p0 = t0erm_tinfer0(t0m0)
val () =
println!("result: t0p0 = ", t0p0)
*)
(*
val
val0 = t0erm_interp0(t0m0)
val () =
println!("result: val0 = ", val0)
*)
//
} (* end of [then] *)
else
{
// ~(stadyn >= 0) // not for loading code
} (* end of [else] *)
//
end // end of [process_fpath]

implement
process_given
  (arg0) = let
//
val fp0 =
let
val given = arg0
val fname = arg0
in
fpath_make(given, fname)
end
//
(*
val () =
println!
("process_given: arg0 = ", arg0)
*)
//
in
  process_fpath(fp0)
end // end of [process_given]

in(*in-of-local*)

implement
project_main0
(argc, argv) =
let
//
val
XATSHOME =
"./../../xanadu-2020-10-18"
//
val
((*void*)) = the_fixity_load(XATSHOME)
//
in
if
(argc = 1)
then process_stdin() else process_given(argv[1])
end // project_main0

end // end of [local]

(* ****** ****** *)

(* end of [midterm_main.dats] *)
