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
lambda2_type0_dats.o
OBJECTS += \
lambda2_t0erm_dats.o
OBJECTS += \
lambda2_s0env_dats.o
OBJECTS += \
lambda2_tcheck_dats.o
OBJECTS += \
lambda2_interp_dats.o

######

lambda2 : \
lambda2_main.dats $(OBJECTS) ; \
patscc -o lambda2 \
$(INCLUDE) $(CFLAGS) \
lambda2_main.dats $(OBJECTS) -L$(XANADU)/lib -lxatsopt -lgc

######

lambda2_type0_dats.o : \
lambda2.sats lambda2_type0.dats ; $(PATSCC) -o $@ -c lambda2_type0.dats

lambda2_t0erm_dats.o : \
lambda2.sats lambda2_t0erm.dats ; $(PATSCC) -o $@ -c lambda2_t0erm.dats

lambda2_s0env_dats.o : \
lambda2.sats lambda2_s0env.dats ; $(PATSCC) -o $@ -c lambda2_s0env.dats

lambda2_tcheck_dats.o : \
lambda2.sats lambda2_tcheck.dats ; $(PATSCC) -o $@ -c lambda2_tcheck.dats

lambda2_interp_dats.o : \
lambda2.sats lambda2_interp.dats ; $(PATSCC) -o $@ -c lambda2_interp.dats

######

libxatsopt: ; \
(cd $(XANADU); \
 make -C srcgen/xats libxatsopt)
libxatsopt_clean: ; \
(cd $(XANADU); make -C srcgen/xats clean)
libxatsopt_cleanall: ; \
(cd $(XANADU); make -C srcgen/xats cleanall)

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

######

cleanall:: clean
cleanall:: ; rm -f lambda2

###### end of [Makefile] ######
