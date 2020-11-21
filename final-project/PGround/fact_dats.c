#include <stdio.h>
#include <stdlib.h>

#include "./../runtime.h"

/*
fun
fact(n) =
if n > 0 then n * fact(n-1) else 1
*/

lamval
fact(lamval n)
{
  lamval tmp0;
  lamval tmp1;
  lamval tmp2;
  lamval tmp3;
  tmp0 =
  LAMOPR_igt(n, LAMVAL_int(0));
  if (((lamval_int)tmp0)->data) {
    tmp1 = LAMOPR_isub(n, LAMVAL_int(1));
    tmp2 = fact(tmp1);
    tmp3 = LAMOPR_imul(n, tmp2);
  } else {
    tmp3 = LAMVAL_int(1);
  }
  return tmp3;
}

int main() {
  lamval i10 = LAMVAL_int(10);
  LAMVAL_print(i10); printf("\n");
  printf("fact(10) = "); LAMVAL_print(fact(i10)); printf("\n");
  return 0 ;
}
