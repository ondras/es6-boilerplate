SRC_FILES = $(shell find src -name '*.js' | sed 's/src\///')
MAIN = app.js

all: polyfills app

polyfills: polyfills.js

polyfills.js: polyfills/*.js
	cat $^ > $@

app: $(MAIN)

$(MAIN): $(addprefix _build/,$(SRC_FILES))
	cat $^ > $@

_build/%: src/%
	mkdir -p $(dir $@)
	cd src && babel -M -k --modules system $* > ../$@

clean:
	rm -rf polyfills.js $(MAIN) _build

.PHONY: all polyfills app clean
