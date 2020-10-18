(* ****** ****** *)

#define
XANADU_targetloc
"./../../../xanadu-2020-10-18"

(* ****** ****** *)
//
#staload
ERR =
"{$XANADU}/srcgen/xats/SATS/xerrory.sats"
//
(* ****** ****** *)
//
#staload
STM =
"{$XANADU}/srcgen/xats/SATS/stamp0.sats"
#staload
SYM =
"{$XANADU}/srcgen/xats/SATS/symbol.sats"
//
(* ****** ****** *)
//
#staload
FP0 =
"{$XANADU}/srcgen/xats/SATS/filpath.sats"
//
  typedef
  fpath_t = $FP0.filpath
  macdef
  dirbase =
  $FP0.filpath_dirbase
  macdef
  fpath_make = $FP0.filpath_make
//
(* ****** ****** *)
//
#staload
GLO =
"{$XANADU}/srcgen/xats/SATS/global.sats"
#staload
FS0 =
"{$XANADU}/srcgen/xats/SATS/filsrch.sats"
//
(* ****** ****** *)
//
#staload
"{$XANADU}/srcgen/xats/SATS/basics.sats"
//
#staload
"{$XANADU}/srcgen/xats/SATS/lexing.sats"
//
#staload
"{$XANADU}/srcgen/xats/SATS/parsing.sats"
//
#staload
"{$XANADU}/srcgen/xats/SATS/synread.sats"
//
#staload
"{$XANADU}/srcgen/xats/SATS/staexp1.sats"
#staload
"{$XANADU}/srcgen/xats/SATS/dynexp1.sats"
//
#staload
"{$XANADU}/srcgen/xats/SATS/trans01.sats"
#staload
"{$XANADU}/srcgen/xats/SATS/tread01.sats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) =
"{$XANADU}/srcgen/xats/DATS/staexp0_print.dats"
#staload
_(*TMP*) =
"{$XANADU}/srcgen/xats/DATS/dynexp0_print.dats"
//
#staload
_(*TMP*) =
"{$XANADU}/srcgen/xats/DATS/staexp1_print.dats"
#staload
_(*TMP*) =
"{$XANADU}/srcgen/xats/DATS/dynexp1_print.dats"
//
(* ****** ****** *)

(* end of [libxatsopt.hats] *)

