default:minibeispiel lingl benchmarks benchd
cs=$(patsubst %.w,%.c,$(wildcard *.w))
dates=$(patsubst %.w,%.20*,$(wildcard *.w))
pdfs=$(patsubst %.w,%.pdf,$(wildcard *.w))

# doc: $(pdfs) testfunktionen.pdf
doc: benchd.pdf benchmarks.pdf devol.pdf fevol.pdf\
 lingl.pdf minibeispiel.pdf testfunktionen.pdf

%:%.c devol.c fevol.c
	gcc -Wall -g -o $@ $< -lm
%.c:%.w
	ctangle $<

devol.h:
devol.c:devol.w
	date +%Y%m%d.%H%M%S > ...date
	cp $< $*.`cat ...date`.w
	ctangle $<

benchd.c:benchd.w devol.c
	date +%Y%m%d.%H%M%S > ...date
	cp $< $*.`cat ...date`.w
	ctangle $<

benchd:benchd.c Makefile
	gcc -Wall -g -o benchd benchd.c -lm
	cp -p benchd benchd.`cat ...date`

fevol.h:
fevol.c:fevol.w
	date +%Y%m%d.%H%M%S > ...date
	cp $< $*.`cat ...date`.w
	ctangle $<

benchmarks.c:benchmarks.w fevol.c
	date +%Y%m%d.%H%M%S > ...date
	cp $< $*.`cat ...date`.w
	ctangle $<

benchmarks:benchmarks.c Makefile
	gcc -Wall -g -o benchmarks benchmarks.c -lm
	cp -p benchmarks benchmarks.`cat ...date`

%.pdf:%.dvi
	dvipdfm $<
	chmod 644 $@
	if [ -z $(DISPLAY) ]; then fbgs $@;else okular $@;fi
%.dvi:%.ltx
	latex $<
	latex $<
	latex $<
%.dvi:%.tex
	tex $<
	mkdir -p .dvi
	dviselect -i $@ -o .dvi/toc.dvi :0
	dviselect -i $@ -o .dvi/pages.dvi 1:
	dviconcat .dvi/toc.dvi .dvi/pages.dvi > $@
	rm -rf .dvi
%.tex:%.w
	cweave $<

PHONY:$(cs)
clean:
	@./dbf
	@rm -fv *.o *.c *.cc *.h *.log ...date
	@rm -fv .abest* .best* benchd benchmarks h
	@rm -fv lingl minibeispiel
	@rm -fv *.aux *.dvi *.idx *.pdf
	@rm -fv *.scn *.tex *.toc
distclean:
	@make clean
#	@rm -fv benchd.20* benchmarks.20* devol.20* fevol.20*
	@rm -fv $(dates)
