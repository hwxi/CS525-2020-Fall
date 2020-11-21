#include <stdio.h>
#include <stdlib.h>

#include "./../runtime.h"

/*
fun
fact2(n, r) =
if n > 0 then fact2(n-1, n*r) else r
*/

#if(0)
lamval
fact2
( lamval n
, lamval r)
{
  lamval tmp0;
  lamval tmp1;
  lamval tmp2;
  lamval tmp3;
  tmp0 =
  LAMOPR_igt(n, LAMVAL_int(0));
  if (((lamval_int)tmp0)->data) {
    tmp1 = LAMOPR_isub(n, LAMVAL_int(1));
    tmp2 = LAMOPR_imul(n, r);
    tmp3 = fact2(tmp1, tmp2);
  } else {
    tmp3 = r;
  }
  return tmp3;
}
#endif // #if(0)

#if(1)
lamval
fact2
( lamval n
, lamval r)
{
  lamval n2;
  lamval r2;
  lamval tmp0;
  lamval tmp1;
  lamval tmp2;
  lamval tmp3;

  do {
  opt = 0;
  tmp0 =
  LAMOPR_igt(n, LAMVAL_int(0));
  if (((lamval_int)tmp0)->data) {
    tmp1 = LAMOPR_isub(n, LAMVAL_int(1));
    tmp2 = LAMOPR_imul(n, r);
    // tmp3 = fact2(tmp1, tmp2);
    // tmp3 = fact2(r, n);
    n2 = tmp1; r2 = tmp2; n = n2; r = r2; continue;
  } else {
    tmp3 = r;
  }
  break; // return;
  } // cotinue
  while (true); // break;
  
  return tmp3;
}
#endif

int main() {
  lamval i01 = LAMVAL_int(01);
  lamval i1M = LAMVAL_int(1000000);
  LAMVAL_print(i01); printf("\n");
  LAMVAL_print(i1M); printf("\n");
  printf("fact2(10, 01) = "); LAMVAL_print(fact2(i1M, i01)); printf("\n");
  return 0 ;
}
