
CC=gcc

all:: \
fact_dats
fact_dats: \
fact_dats.c ; $(CC) -o $@ $<

test:: fact_dats ; ./fact_dats

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
cleanall:: clean
cleanall:: ; rm -f fact_dats
