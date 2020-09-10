
myoptn: \
myoptn.dats ; \
patscc -o myoptn -DATS_MEMALLOC_LIBC myoptn.dats

datatype: \
datatype.dats ; \
patscc -o datatype -DATS_MEMALLOC_LIBC datatype.dats

clean:: ; rm -f *~
clean:: ; rm -f *_dats.c

cleanall:: clean
cleanall:: ; rm -f myoptn
cleanall:: ; rm -f datatype
