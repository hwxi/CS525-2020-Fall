######
#
# target : dependency ; command
#
######

PATSCC=$(PATSHOME)/bin/patscc

######
XANADU="./../../xanadu-2020-10-18"
######
CFLAGS :=
CFLAGS += -DATS_MEMALLOC_GCBDW
######
INCLUDE :=
INCLUDE += -I$(XANADU)/srcgen/xats
######

OBJECTS :=
OBJECTS += \
midterm_type0_dats.o
OBJECTS += \
midterm_t0erm_dats.o
# OBJECTS += \
# midterm_s0env_dats.o
# OBJECTS += \
# midterm_tinfer_dats.o
# OBJECTS += \
# midterm_interp_dats.o

######

midterm : \
midterm_main.dats $(OBJECTS) ; \
patscc -o midterm \
$(INCLUDE) $(CFLAGS) \
midterm_main.dats $(OBJECTS) -L$(XANADU)/lib -lxatsopt -lgc

######

midterm_type0_dats.o : \
midterm_type0.dats ; $(PATSCC) -o $@ -c midterm_type0.dats

midterm_t0erm_dats.o : \
midterm_t0erm.dats ; $(PATSCC) -o $@ -c midterm_t0erm.dats

# midterm_s0env_dats.o : \
# midterm_s0env.dats ; $(PATSCC) -o $@ -c midterm_s0env.dats

# midterm_tinfer_dats.o : \
# midterm_tinfer.dats ; $(PATSCC) -o $@ -c midterm_tinfer.dats

# midterm_interp_dats.o : \
# midterm_interp.dats ; $(PATSCC) -o $@ -c midterm_interp.dats

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
cleanall:: ; rm -f midterm

###### end of [Makefile] ######
