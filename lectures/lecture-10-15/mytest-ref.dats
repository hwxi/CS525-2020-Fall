(* ****** ****** *)
#include
"share/atspre_staload.hats"
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

val r1 = ref<int>(0)
val () = println!("r1[] = ", r1[])
val () = r1[] := r1[] + 1
val () = println!("r1[] = ", r1[])
val () = r1[] := 2 * r1[] + 1
val () = println!("r1[] = ", r1[])

(* ****** ****** *)

(* end of [mytest-ref.dats] *)
