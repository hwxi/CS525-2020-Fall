######
#
# target : dependency ; command
#
######

PATSCC=$(PATSHOME)/bin/patscc

######

OBJECTS :=
OBJECTS += \
lambda1_print_dats.o
OBJECTS += \
lambda1_interp_dats.o

######

lambda1 : \
lambda1_main.dats $(OBJECTS) ; \
patscc -o lambda1 \
-DATS_MEMALLOC_LIBC lambda1_main.dats $(OBJECTS)

######

lambda1_print_dats.o : \
lambda1.sats lambda1_print.dats ; $(PATSCC) -o $@ -c lambda1_print.dats
lambda1_interp_dats.o : \
lambda1.sats lambda1_interp.dats ; $(PATSCC) -o $@ -c lambda1_interp.dats

######

clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

######

cleanall:: clean
cleanall:: ; rm -f lambda1

###### end of [Makefile] ######
