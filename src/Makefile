
x = $(subst latex/,,$(wildcard latex/*))
ALL = $(subst .tex,,$(x))
ALL_WKSHT = $(filter-out final, $(ALL))
TEX = pdflatex
WKSHT = $(MAKECMDGOALS)

# tbh i have no idea what the following flags do...
DISC_TEX_FLAGS = -halt-on-error -output-directory ../../logs

all: $(ALL_WKSHT) $(addsuffix _sol, $(ALL_WKSHT))

# generate the solutions doc (in ../pdf)
worksheet%_sol:
	cd latex/worksheet$(*) && \
	$(TEX) $(DISC_TEX_FLAGS) -jobname="worksheet$*_sol" "\def\discussionsolutions{}\input{worksheet$*}" 
	cd logs && \
	if [ -d ../pdf/worksheet$(*) ]; then echo "file exists"; else mkdir ../pdf/worksheet$(*); fi && \
	mv *.pdf ../pdf/worksheet$(*) && \
	rm -r *.aux *.log *.out

# generate the actual worksheets
WKSHT = $(MAKECMDGOALS)
worksheet%: 
	cd latex/worksheet$(*) && \
	$(TEX) -output-directory=../../logs worksheet$(*).tex && \
	$(TEX) -output-directory=../../logs meta.tex && \
	cd ../../logs && \
	rm -r *.aux *.log *.out && \
	if [ -d ../pdf/worksheet$(*) ]; then echo "file exists"; else mkdir ../pdf/worksheet$(*); fi && \
	mv worksheet$(*).pdf ../pdf/worksheet$(*)/ && \
	mv meta.pdf ../pdf/worksheet$(*)/

final:
	cd latex/final && \
	$(TEX) -output-directory=../../logs final.tex && \
	cd ../../logs && \
	if [ -d ../pdf/final ]; then mkdir ../pdf/final; fi && \
	rm -r *.aux *.log *.out && \
	mv final.pdf ../pdf/final

