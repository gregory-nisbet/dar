OCAMLBUILD := ocamlbuild
OCAMLBUILD := $(OCAMLBUILD) -no-links
OCAMLBUILD := $(OCAMLBUILD) -use-ocamlfind

GARBAGE := _build example red der

default: der

example:
	$(OCAMLBUILD) termlib/example.byte
	ln -sf _build/termlib/example.byte example

der:
	$(OCAMLBUILD) -I termlib src/main.native
	ln -sf _build/src/main.native der

clean:
	$(RM) -rf $(GARBAGE)

install:
	install -m 755 ./der /usr/local/bin

.PHONY: default example red clean der
