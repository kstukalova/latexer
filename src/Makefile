
x = $(subst latex/,,$(wildcard latex/*))
ALL_WKSHT = $(subst .tex,,$(x))
TEX = pdflatex
WKSHT = $(MAKECMDGOALS)

# tbh i have no idea what the following flags do...
DISC_TEX_FLAGS = -halt-on-error -output-directory ../pdf

all: $(ALL_WKSHT) $(addsuffix _sol, $(ALL_WKSHT))

# generate the solutions doc (in ../pdf)
worksheet%_sol: 
	cd latex && \
	$(TEX) $(DISC_TEX_FLAGS) -jobname="worksheet$*_sol" "\def\discussionsolutions{}\input{worksheet$*}"
	cd pdf && \
	rm -r *.aux *.log *.out

# generate the actual worksheets (in ../pdf)
WKSHT = $(MAKECMDGOALS)
worksheet%: 
	cd latex && \
	$(TEX) worksheet$(*).tex && \
	rm -r *.aux *.log *.out && \
	mv worksheet$(*).pdf ../pdf
