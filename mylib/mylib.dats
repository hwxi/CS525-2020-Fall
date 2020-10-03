(* ****** ****** *)

#staload "./mylib.sats"

(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
implement
{a}
print_myoptn(xs) = 
fprint_myoptn<a>(stdout_ref, xs)
implement
{a}
prerr_myoptn(xs) = 
fprint_myoptn<a>(stderr_ref, xs)
(* ****** ****** *)
implement
{a}
fprint_myoptn
  (out, xs) =
(
case+ xs of
|
myoptn_nil() => 
fprint(out, "nil()")
|
myoptn_cons(x0) =>
( fprint(out, "cons(")
; fprint_val<a>(out, x0); fprint(out, ")"))
) (* end of [fprint_myoptn] *)
(* ****** ****** *)
implement
{a}
print_mylist(xs) = 
fprint_mylist<a>(stdout_ref, xs)
implement
{a}
prerr_mylist(xs) = 
fprint_mylist<a>(stderr_ref, xs)
(* ****** ****** *)
implement
{a}
fprint_mylist
  (out, xs) =
(
  auxlst(0, xs)
) where
{
fun
auxlst
( i0: int
, xs: mylist(a)): void =
(
case+ xs of
|
mylist_nil() => ()
|
mylist_cons(x0, xs) =>
(
  if
  i0 > 0
  then fprint(out, ", ");
  fprint_val<a>(out, x0); auxlst(i0+1, xs)
)
) (* end of [auxlst] *)
} (* end of [fprint_mylist] *)
(* ****** ****** *)

implement
{a}
mylist_sing(x0) =
mylist_cons(x0, mylist_nil())

(* ****** ****** *)

implement
{a}
mylist_append
(xs, ys) =
auxlst(xs) where
{
fun
auxlst
(xs: mylist(a)): mylist(a) =
(
case+ xs of
| mylist_nil() => ys
| mylist_cons(x0, xs) => mylist_cons(x0, auxlst(xs))
)
} (* end of [mylist_append] *)

(* ****** ****** *)

implement
{a}
mylist_get_at
( xs, i0 ) =
(
  auxlst(xs, i0)
) where
{
fun
auxlst
(xs: mylist(a), i0: int): myoptn(a) =
(
case+ xs of
| mylist_nil() =>
  myoptn_nil()
| mylist_cons(x0, xs) =>
  if
  (i0 > 0)
  then auxlst(xs, i0-1) else myoptn_cons(x0)
)
} (* end of [mylist_get_at] *)

implement
{a}
mylist_nth_opt = mylist_get_at<a>

(* ****** ****** *)

implement
{a}{b}
mylist_map
(xs, f0) =
auxlst(xs) where
{
fun
auxlst
( xs
: mylist(a)): mylist(b) =
(
case+ xs of
| mylist_nil() =>
  mylist_nil()
| mylist_cons(x0, xs) =>
  mylist_cons(f0(x0), auxlst(xs))
)
}

(* ****** ****** *)

(* end of [mylib.dats] *)
