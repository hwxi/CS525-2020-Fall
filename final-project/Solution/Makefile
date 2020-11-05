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
cleanall:: ; rm -f project

###### end of [Makefile] ######
