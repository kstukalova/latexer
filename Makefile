
x = hi bye
WKSHT = $(MAKECMDGOALS)
TEX = pdflatex

copy: $(addsuffix /foo, $(x))

%/foo: ; $(info ************  TEST VERSION ************)

DIRECTORIES = $(wildcard */)


worksheet%: 
	echo $(DIRECTORIES)
	# $(TEX) latex/$(WKSHT).tex
	$(info ************  $(WKSHT) ************)
