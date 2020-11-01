(* ****** ****** *)
#staload "./lambda3.sats"
(* ****** ****** *)
#staload
"./../../mylib/mylib.sats"
(* ****** ****** *)
#include "share/atspre_staload.hats"
(* ****** ****** *)

absimpl
stamp_type = int
absimpl
stamper_type = ref(int)

(* ****** ****** *)

implement
print_stamp
(stm) =
fprint_stamp(stdout_ref, stm)
implement
fprint_stamp
(out, stm) = fprint_int(out, stm)

(* ****** ****** *)

implement
stamper_make() = ref<int>(0)

(* ****** ****** *)

implement
stamper_stamp(r0) =
let
val n0 = r0[] in r0[] := n0+1; n0
end // end of [stamper_stamp]

(* ****** ****** *)

(* end of [lambda3_stamp.dats] *)
