######
#
# target : dependency ; command
#
######

PATSCC=$(PATSHOME)/bin/patscc

######

OBJECTS :=
OBJECTS += \
lambda2_type0_dats.o
OBJECTS += \
lambda2_tpext_dats.o
OBJECTS += \
lambda2_t0erm_dats.o
OBJECTS += \
lambda2_s0env_dats.o
OBJECTS += \
lambda2_tinfer_dats.o

######

lambda2 : \
lambda2_main.dats $(OBJECTS) ; \
patscc -o lambda2 \
-DATS_MEMALLOC_LIBC lambda2_main.dats $(OBJECTS)

######

lambda2_type0_dats.o : \
lambda2.sats lambda2_type0.dats ; $(PATSCC) -o $@ -c lambda2_type0.dats

lambda2_tpext_dats.o : \
lambda2.sats lambda2_tpext.dats ; $(PATSCC) -o $@ -c lambda2_tpext.dats

lambda2_t0erm_dats.o : \
lambda2.sats lambda2_t0erm.dats ; $(PATSCC) -o $@ -c lambda2_t0erm.dats

lambda2_s0env_dats.o : \
lambda2.sats lambda2_s0env.dats ; $(PATSCC) -o $@ -c lambda2_s0env.dats

lambda2_tinfer_dats.o : \
lambda2.sats lambda2_tinfer.dats ; $(PATSCC) -o $@ -c lambda2_tinfer.dats

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

######

cleanall:: clean
cleanall:: ; rm -f lambda2

###### end of [Makefile] ######
