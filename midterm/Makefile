######
#
# target : dependency ; command
#
######

PATSCC=$(PATSHOME)/bin/patscc

######
XANADU=\
"./../xanadu-2020-10-18"
######
CFLAGS :=
CFLAGS += -DATS_MEMALLOC_GCBDW
######
INCLUDE :=
INCLUDE += -I$(XANADU)/srcgen/xats
######

OBJECTS :=

######

midterm : \
midterm_main.dats $(OBJECTS) ; \
patscc -o midterm \
$(INCLUDE) $(CFLAGS) \
midterm_main.dats $(OBJECTS) -L$(XANADU)/lib -lxatsopt -lgc

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
