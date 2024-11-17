MAKE=@make
DUNE=@dune
LN=@ln -sf
RM=@rm

.PHONY: clean

all: fmt
	$(DUNE) build
fmt:
	- $(DUNE) fmt
