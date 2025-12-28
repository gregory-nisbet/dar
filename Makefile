OCAMLBUILD := ocamlbuild
OCAMLBUILD := $(OCAMLBUILD) -no-links
OCAMLBUILD := $(OCAMLBUILD) -use-ocamlfind

GARBAGE := _build example red der dar

default: dar

example:
	$(OCAMLBUILD) termlib/example.byte
	ln -sf _build/termlib/example.byte example

dar:
	$(OCAMLBUILD) -I termlib src/main.native
	ln -sf _build/src/main.native der

clean:
	$(RM) -rf $(GARBAGE)

install:
	install -m 755 ./der /usr/local/bin

.PHONY: default example red clean der dar
