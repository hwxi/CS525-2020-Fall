######
#
# target : dependency ; command
#
######

PATSCC=$(PATSHOME)/bin/patscc

######

OBJECTS :=
OBJECTS += \
lambda3_stamp_dats.o
OBJECTS += \
lambda3_type0_dats.o
OBJECTS += \
lambda3_t0erm_dats.o
OBJECTS += \
lambda3_type1_dats.o
OBJECTS += \
lambda3_tpext_dats.o
OBJECTS += \
lambda3_t1var_dats.o
OBJECTS += \
lambda3_t1erm_dats.o

######

lambda3 : \
lambda3_main.dats $(OBJECTS) ; \
patscc -o lambda3 \
-DATS_MEMALLOC_GCBDW lambda3_main.dats $(OBJECTS) -lgc

######

lambda3_stamp_dats.o : \
lambda3.sats lambda3_stamp.dats ; $(PATSCC) -o $@ -c lambda3_stamp.dats

lambda3_type0_dats.o : \
lambda3.sats lambda3_type0.dats ; $(PATSCC) -o $@ -c lambda3_type0.dats

lambda3_t0erm_dats.o : \
lambda3.sats lambda3_t0erm.dats ; $(PATSCC) -o $@ -c lambda3_t0erm.dats

lambda3_type1_dats.o : \
lambda3.sats lambda3_type1.dats ; $(PATSCC) -o $@ -c lambda3_type1.dats
lambda3_tpext_dats.o : \
lambda3.sats lambda3_tpext.dats ; $(PATSCC) -o $@ -c lambda3_tpext.dats

lambda3_t1var_dats.o : \
lambda3.sats lambda3_t1var.dats ; $(PATSCC) -o $@ -c lambda3_t1var.dats

lambda3_t1erm_dats.o : \
lambda3.sats lambda3_t1erm.dats ; $(PATSCC) -o $@ -c lambda3_t1erm.dats

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

######

cleanall:: clean
cleanall:: ; rm -f lambda3

###### end of [Makefile] ######
