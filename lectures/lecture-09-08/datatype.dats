(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)

datatype mylist =
| mylist_nil of ()
| mylist_cons of
  (int(*head*), mylist(*tail*))
  
val list0 = mylist_nil() // []
val list1 = mylist_cons(1, list0) // [1]
val list2 = mylist_cons(2, list1) // [2, 1]
val list3 = mylist_cons(1, list2) // [3, 2, 1]

fun
mylist_length
(xs: mylist): int =
(

case xs of
| mylist_nil() => 0 // clause
| mylist_cons(hd, tl) => 1 + mylist_length(tl)

)

implement main0() =
println!
("mylist(list3) = ", mylist_length(list3))