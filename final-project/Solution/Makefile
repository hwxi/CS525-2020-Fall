######
#
# target : dependency ; command
#
######

PATSCC=$(PATSHOME)/bin/patscc

######
XANADU=\
"./../../xanadu-2020-10-18"
######
CFLAGS :=
CFLAGS += -DATS_MEMALLOC_GCBDW
######
INCLUDE :=
INCLUDE += -I$(XANADU)/srcgen/xats
######

OBJECTS :=
OBJECTS += \
project_stamp_dats.o
OBJECTS += \
project_type0_dats.o
OBJECTS += \
project_t0erm_dats.o

OBJECTS += \
project_tpext_dats.o
OBJECTS += \
project_type1_dats.o
OBJECTS += \
project_t1var_dats.o
OBJECTS += \
project_t1erm_dats.o
OBJECTS += \
project_s0env_dats.o
OBJECTS += \
project_trans01_dats.o
OBJECTS += \
project_tinfer_dats.o

######

project : \
project_main.dats $(OBJECTS) ; \
patscc -o project \
$(INCLUDE) $(CFLAGS) \
project_main.dats $(OBJECTS) -L$(XANADU)/lib -lxatsopt -lgc

######

project_stamp_dats.o : \
project.sats project_stamp.dats ; $(PATSCC) -o $@ -c project_stamp.dats

project_type0_dats.o : \
project.sats project_type0.dats ; $(PATSCC) -o $@ -c project_type0.dats
project_t0erm_dats.o : \
project.sats project_t0erm.dats ; $(PATSCC) -o $@ -c project_t0erm.dats

project_tpext_dats.o : \
project.sats project_tpext.dats ; $(PATSCC) -o $@ -c project_tpext.dats
project_type1_dats.o : \
project.sats project_type1.dats ; $(PATSCC) -o $@ -c project_type1.dats

project_t1var_dats.o : \
project.sats project_t1var.dats ; $(PATSCC) -o $@ -c project_t1var.dats
project_t1erm_dats.o : \
project.sats project_t1erm.dats ; $(PATSCC) -o $@ -c project_t1erm.dats

project_s0env_dats.o : \
project.sats project_s0env.dats ; $(PATSCC) -o $@ -c project_s0env.dats

project_trans01_dats.o : \
project.sats project_trans01.dats ; $(PATSCC) -o $@ -c project_trans01.dats

project_tinfer_dats.o : \
project.sats project_tinfer.dats ; $(PATSCC) -o $@ -c project_tinfer.dats

######

libxatsopt: ; \
(cd $(XANADU); \
 make -C srcgen/xats libxatsopt)
libxatsopt_clean: ; \
(cd $(XANADU); make -C srcgen/xats clean)
libxatsopt_cleanall: ; \
(cd $(XANADU); make -C srcgen/xats cleanall)

######

test::
test:: ; ./project TEST/fact.lam
test:: ; ./project TEST/fibo.lam
test:: ; ./project TEST/test03.lam
test:: ; ./project TEST/coin_change.lam


######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

######

cleanall:: clean
cleanall:: ; rm -f project

###### end of [Makefile] ######
