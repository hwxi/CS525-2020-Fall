(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)
(*
This is a polymorphic version
*)
datatype
mylist(a:t@ype) =
| mylist_nil of ()
| mylist_cons of
  (a(*head*), mylist(a)(*tail*))
  
val list0 = mylist_nil{int}() // []
val list1 = mylist_cons{int}(1, list0) // [1]
val list2 = mylist_cons{int}(2, list1) // [2, 1]
val list3 = mylist_cons{int}(3, list2) // [3, 2, 1]

(*
//
// HX: this of POOR style!!!
//
fun
{a:t@ype}
mylist_length
(xs: mylist(a)): int =
(

case xs of
| mylist_nil() => 0 // clause
| mylist_cons(hd, tl) => 1 + mylist_length<a>(tl)

)
*)
fun
{a:t@ype}
mylist_length
(xs: mylist(a)): int =
let
  fun
  length
  (xs: mylist(a), res: int): int =
  case xs of
  | mylist_nil() => res
  | mylist_cons(hd, tl) => length(tl, res+1)
in
  length(xs, 0)
end

implement main0() =
println!
("mylist(list3) = ", mylist_length<int>(list3))
