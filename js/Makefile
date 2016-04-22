BABEL_BIN := ../node_modules/babel-cli/bin/babel.js
BABEL_ARGS := -M --presets es2015 --plugins

SRC_FILES := $(shell find src -name '*.js' | sed 's/src\///')

all: app.js app.ie8.js

app.js: polyfills/*.js $(addprefix _build/,$(SRC_FILES))
	cat $^ > $@
	echo 'System.import("app.js");' >> $@

app.ie8.js: polyfills.ie8/*.js $(addprefix _build.ie8/,$(SRC_FILES))
	cat $^ > $@
	echo 'require(["app.js"]);' >> $@

_build/%: src/%
	mkdir -p $(dir $@)
	$(BABEL_BIN) $(BABEL_ARGS) transform-es2015-modules-systemjs --module-id $* $^ > $@

_build.ie8/%: src/%
	mkdir -p $(dir $@)
	$(BABEL_BIN) $(BABEL_ARGS) transform-es2015-modules-amd --module-id $* $^ |\
	$(BABEL_BIN) --plugins transform-es3-member-expression-literals,transform-es3-property-literals > $@

clean:
	rm -rf app.js app.ie8 _build _build.ie8

.PHONY: all clean
