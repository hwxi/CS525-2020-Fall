#include
"share/atspre_staload.hats"

(*
fun
fact2(n: int) =
let
  fun
  loop(i: int, r: int): int =
  if
  (i < n)
  then
  let
  val i1 = i + 1 in loop(i1, i1*r)
  end
  else r // end-of-if
in
  loop(0, 1)
end
*)

typedef env_t = $rec{n=int}

fun
fact2(n: int) =
let
  fun
  loop(i: int, r: int, env: env_t): int =
  if
  (i < env.n)
  then
  let
  val i1 = i + 1 in loop(i1, i1*r, env)
  end
  else r // end-of-if
in
  loop(0, 1, env) where { val env = $rec{n=n} }
end


implement main0() =
{
val () = println!("fact2(10) = ", fact2(10))
}