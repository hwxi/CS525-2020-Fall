######
#
# target : dependency ; command
#
######

PATSCC=$(PATSHOME)/bin/patscc

######

OBJECTS :=
OBJECTS += \
lambda0_print_dats.o
OBJECTS += \
lambda0_interp_dats.o

######

lambda0 : \
lambda0_main.dats $(OBJECTS) ; \
patscc -o lambda0 \
-DATS_MEMALLOC_LIBC lambda0_main.dats $(OBJECTS)

######

lambda0_print_dats.o : \
lambda0.sats lambda0_print.dats ; $(PATSCC) -o $@ -c lambda0_print.dats
lambda0_interp_dats.o : \
lambda0.sats lambda0_interp.dats ; $(PATSCC) -o $@ -c lambda0_interp.dats

######

clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

######

cleanall:: clean
cleanall:: ; rm -f lambda0

###### end of [Makefile] ######
