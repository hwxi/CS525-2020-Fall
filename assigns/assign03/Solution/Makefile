######
#
# target : dependency ; command
#
######

PATSCC=$(PATSHOME)/bin/patscc

######
XANADU=\
"./../../../xanadu-2020-10-18"
######
CFLAGS :=
CFLAGS += -DATS_MEMALLOC_GCBDW
######
INCLUDE :=
INCLUDE += -I$(XANADU)/srcgen/xats
######

OBJECTS :=
OBJECTS += \
lambda2_type_dats.o
OBJECTS += \
lambda2_term_dats.o
OBJECTS += \
lambda2_senv_dats.o
OBJECTS += \
lambda2_tcheck_dats.o

######

lambda2 : \
lambda2_main.dats $(OBJECTS) ; \
patscc -o lambda2 \
$(INCLUDE) $(CFLAGS) \
lambda2_main.dats $(OBJECTS) -L$(XANADU)/lib -lxatsopt -lgc

######

lambda2_type_dats.o : \
lambda2.sats lambda2_type.dats ; $(PATSCC) -o $@ -c lambda2_type.dats

lambda2_term_dats.o : \
lambda2.sats lambda2_term.dats ; $(PATSCC) -o $@ -c lambda2_term.dats

lambda2_senv_dats.o : \
lambda2.sats lambda2_senv.dats ; $(PATSCC) -o $@ -c lambda2_senv.dats

lambda2_tcheck_dats.o : \
lambda2.sats lambda2_tcheck.dats ; $(PATSCC) -o $@ -c lambda2_tcheck.dats

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

######

cleanall:: clean
cleanall:: ; rm -f lambda2

###### end of [Makefile] ######
